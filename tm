#!/bin/bash
hasDefault() {
    default_window=`tmux ls|grep "^default:"`
    if [[ "$default_window" == "" ]]; then
        echo false
    else
        echo true
    fi
}
isInt() {
    # 使用 declare 来检查是否为整数
    declare -i intVar="$1"

    if [ $intVar -eq $1 ]; then
        echo "变量不是一个整数。"
        exit 1
    fi
}
loadMenu() {
    count=0
    prev_lines=""

    while true; do
        # 执行 tmux ls 命令并将结果存储到变量 lines 中
        lines=$(tmux ls)
        # 清屏
        clear
        # 显示 tmux ls 的输出
        echo "$lines"
        # 如果连续三次返回的行数都一样，就退出循环
        if [ "$lines" == "$prev_lines" ]; then
            count=$((count+1))
            if [ $count -eq 2 ]; then
                # 连续三次返回的行数都一样，退出循环。
                clear
                break
            fi
        else
            count=0
        fi
        # 更新 prev_lines 以进行下一次比较
        prev_lines="$lines"
        # 暂停一秒钟
        sleep 1
    done
}
while true; do
    clear
    if ! tmux has-session -t default 2>/dev/null; then
        # 如果不存在，则启动 tmux 会话
        echo "has no default session"
        tmux new-session -d -s default
        loadMenu
    fi
    #if [[ `hasDefault` == "true" ]];then
    command="tmux ls | sort | grep -i \"$1\" | awk '!(\$0 in X) { X[\$0]; print }' | head -n 50"
    #else
    #    command="(echo \"default:(attach or new)\" && tmux ls) | sort | grep -i \"$1\" | awk '!(\$0 in X) { X[\$0]; print }' | head -n 50"
    #fi
    unset map
    declare map
    i=1
    while read line; do
        map[$i]="${line%%:*}"
        #map[$i]="${line}"
        i=$((i+1))
    done <<< "$(eval "$command")"
    map[0]="退出"

    # 打印整个数组，但跳过键为 0 的元素
    for key in "${!map[@]}"; do
        if [ "$key" -eq 0 ]; then
            continue
        fi
        value="${map[$key]}"
        echo "$key: $value"
    done
    # 输出键为 0 的元素
    if [ -n "${map[0]}" ]; then
        echo "0: ${map[0]}"
    fi

    echo -n "请输入数字选择: "
    read choice

    if [[ "$choice" =~ ^[0-9]+$ ]]; then
        for key in "${!map[@]}"; do
            if [ "$key" -eq "$choice" ]; then
                if [ "$key" -eq 0 ]; then
                    echo "感谢使用，再见！"
                    exit 0
                else
                    tmux attach -t "${map["$choice"]}"
                    # 使用 "continue 2" 来跳出第二层循环并继续第一层循环
                    continue 2
                fi
            fi
        done
        echo "请输入有效选项！"
    else
        # 声明一个空数组来存储匹配的结果
        matches=()
        for key in "${!map[@]}"; do
            if [[ "${map[$key]}" == *"$choice"* ]]; then
                matches+=("${map[$key]}")
            fi
        done
        # 检查匹配结果
        if [ ${#matches[@]} -eq 0 ]; then
            echo "未找到匹配项。"
        elif [ ${#matches[@]} -eq 1 ]; then
            tmux attach -t "${matches[0]}"
            continue
        else
            echo "多个匹配项:${matches[@]}"
            #for match in "${matches[@]}"; do
            #    echo "$match"
            #done
        fi
    fi

    read
done


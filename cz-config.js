'use strict';
// https://github.com/leoforfree/cz-customizable/blob/master/cz-config-EXAMPLE.js
module.exports = {

  types: [
    {name: '1. 🔗 WIP:      Work in progress',                   value: '🔗 WIP'},
    {name: '2. ✨ feat:     一个新的特性',                       value: '✨ feat'},
    {name: '3. 📡 tech:     一个新的技术特性',                   value: '📡 tech'},
    {name: '4. 🐛 fix:      修复一个Bug',                        value: '🐛 fix'},
    {name: '5. 📄 docs:     仅文档变更',                         value: '📄 docs'},
    {name: '6. 💄 style:    空格, 分号等格式变更',               value: '💄 style'},
    {name: '7. 🔧 refactor: 代码重构，注意：和特性、修复区分开', value: '🔧 refactor'},
    {name: '8. ⚡️ perf:     提升性能',                           value: '⚡️ perf'},
    {name: '9. ✅ test:     添加测试',                           value: '✅ test'},
    {name: '10. 🎉 init:     初始化',                            value: '🎉 init'},
    {name: '11. 🚀 chore:    开发工具变动(构建、脚手架工具等)',  value: '🚀 chore'},
    {name: '12. ⏪️ revert:   代码回退',                          value: '⏪️ revert'},
    {name: "13. 🧩 update:   第三方库升级" ,                     value: "🧩 update"},
  ],

  scopes: [
    {name: '1. specStyle', value: 'specStyle'},
    {name: '2. spec',      value: 'spec'     },
    {name: '3. skill',     value: 'skill'    },
    {name: '4. code',      value: 'code'     },
    {name: '5. config',    value: 'config'   },
    {name: '6. framework', value: 'framework'},
  ],

  // it needs to match the value for field type. Eg.: 'fix'
  /*
  scopeOverrides: {
    fix: [
      {name: 'merge'},
      {name: 'style'},
      {name: 'e2eTest'},
      {name: 'unitTest'}
    ]
  },
  */

  // 如果要使用前面的提交信息则设置为true，但是会造成type重复，如果不要则全部注释而不能是设置false,false会有一个false的提示
  // usePreparedCommit: false, // to re-use commit from ./.git/COMMIT_EDITMSG
  allowTicketNumber: true,
  prependTicketToHead: true,
  isTicketNumberRequired: false,
  ticketNumberPrefix: 'SPDBP-',
  ticketNumberRegExp: '\\d{1,6}',
  // Jira 单号默认从当前分支提取，输入框仍可手工修改。
  branchTicketNumberRegExp: '(?:^|/)SPDBP-(\\d{1,6})(?:$|[-_/])',
  branchTicketNumberCaptureGroup: 1,

  // override the messages, defaults are as follows
  messages: {
    type: '选择一种你的提交类型:',
    scope: '\n选择一个scope (可选):',
    // used if allowCustomScopes is true
    customScope: 'Denote the SCOPE of this change:',
    subject: '短说明:\n',
    body: '长说明，使用"|"换行(可选):\n',
    breaking: '非兼容性说明 (可选):\n',
    footer: '关联关闭的tasks，例如：#31, #34(可选):\n',
    confirmCommit: '确定提交说明?'
  },

  allowCustomScopes: true,
  skipEmptyScopes: true,
  allowBreakingChanges: ['✨ feat', '📡 tech', '🐛 fix'],
  // skip any questions you want
  // skipQuestions: ['scope','body'],

  // limit subject length
  subjectLimit: 1000,
  breaklineChar: '|', // It is supported for fields body and footer.
  // default: 'ISSUES CLOSED:'
  footerPrefix : 'TASKS CLOSED:',
  // askForBreakingChangeFirst : true, // default is false

};

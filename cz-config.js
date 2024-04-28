'use strict';
// https://github.com/leoforfree/cz-customizable/blob/master/cz-config-EXAMPLE.js
module.exports = {

  types: [
    {value: '🔗 WIP',      name: '🔗 WIP:      Work in progress'},
    {value: '✨ feat',     name: '✨ feat:     一个新的特性'},
    {value: '🐛 fix',      name: '🐛 fix:      修复一个Bug'},
    {value: '📄 docs',     name: '📄 docs:     仅文档变更'},
    {value: '💄 style',    name: '💄 style:    空格, 分号等格式变更'},
    {value: '♻️  refactor', name: '♻️ refactor: 代码重构，注意：和特性、修复区分开'},
    {value: '⚡️ perf',     name: '⚡️ perf:     提升性能'},
    {value: '✅ test',     name: '✅ test:     添加测试'},
    {value: '🎉 init',     name: '🎉 init:     初始化'},
    {value: '🚀 chore',    name: '🚀 chore:    开发工具变动(构建、脚手架工具等)'},
    {value: '⏪️ revert',   name: '⏪️ revert:   代码回退'},
    {value: "🧩 update",   name: "🧩 update:   第三方库升级" },
  ],

/*
  scopes: [
     {name: 'accounts'},
     {name: 'admin'},
     {name: 'exampleScope'},
     {name: 'changeMe'}
  ],
*/

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

  allowTicketNumber: false,
  isTicketNumberRequired: false,
  ticketNumberPrefix: 'TICKET-',
  ticketNumberRegExp: '\\d{1,5}',

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
  allowBreakingChanges: ['✨ feat', '🐛 fix'],
  // skip any questions you want
  // skipQuestions: ['scope','body'],

  // limit subject length
  subjectLimit: 1000,
  // breaklineChar: '|', // It is supported for fields body and footer.
  // default: 'ISSUES CLOSED:'
  footerPrefix : 'TASKS CLOSED:',
  // askForBreakingChangeFirst : true, // default is false
};

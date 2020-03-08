const pkg = require('./package.json');
module.exports = {
  // docker 名称
  repository: 'yyd-base',
  // tag
  tag: pkg.version,
  // 推送的
  pushHost: '',
  pushPrefix: 'jackness1208',
  // 自动 更新 history
  rewriteHistory: true

  // port 映射
  // portMap: {
  //   80:80
  // },

  // 挂载设置 [本地目录:docker 目录]
  // volume: {
  //   './autorun': '/autorun'
  // },
};

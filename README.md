# yyd-base

## 构建信息
* 本项目使用 `yyd` 进行构建

## 安装 yyd
```
npm install yyd -g
```

## 相关命令
```
# 启动 本地 yyd-base 镜像
yyd run
yyd r

# 关闭所有正在运行的 docker
yyd stop

# 开始打包 yyd-base 镜像
yyd build
yyd b

# 开始打包 yyd-base 镜像 并且禁用缓存
yyd build --no-cache
yyd b --no-cache

# 发布 yyd-base 镜像 同时 发布 yyd-base:latest
yyd push
yyd p

# 发布 yyd-base 镜像 同时 发布 yyd-base:beta
yyd push --tag beta
yyd p --tag beta

# 清除除了当前 config.tag 外的 yyd-base 镜像 和匿名镜像
yyd clean

# 帮助
yyd --help

# 常用 docker 命令查询
yyd man
```


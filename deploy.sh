#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# Set CNAME for "gh-pages" branch
echo 'blog.lizhenzhen.xyz' > CNAME  # 改成你要绑定的域名

msg='deploy'
git init
git add -A
git commit -m "${msg}"
# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:kennek123321/vuepress-theme-vdoing.git master:gh-pages
cd - # 退回开始所在目录
rm -rf docs/.vuepress/dist
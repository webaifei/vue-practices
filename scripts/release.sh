#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e
# 执行外层项目构建
cd ..
if [ ! -e dist ]
then
  mkdir dist
fi

file=`find dist/ -name app*.css`
echo $file
if [[ ! -f $file || -z $file ]]
then 
  npm run build
fi
file=`find dist/ -name app*.css`
cp $file site/docs/assets/css/app.css

cd site
# 生成静态文件
yarn run docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME
git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:webaifei/vue-practices.git master:gh-pages

cd -
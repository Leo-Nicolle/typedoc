#!/bin/sh
# npm pack
file=$(find . -name "typedoc*.tgz")
echo "found $file"
tar zxf $file
rm -rf /tmp/typedoc
mkdir /tmp/typedoc
cp -r package/* /tmp/typedoc
cp -r . /tmp/save-typedoc
git checkout dist
rm -rf ./* .eslintrc .config .vscode .gitignore .editorconfig .npmrc
cp -r /tmp/typedoc/* .
rm -rf package
git add .
git commit -m "release"
git push
git checkout -
cp -r /tmp/save-typedoc/* .
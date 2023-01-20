#!/bin/sh
npm pack
file=$(find . -name "typedoc*.tgz")
echo "found $file"
tar zxf $file
cp -r package/* /tmp/typedoc
git checkout dist
rm -rf ./* .eslintrc .config .vscode .gitignore .editorconfig .npmrc
cp -r /tmp/typedoc/* .
rm -rf package

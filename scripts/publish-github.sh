#!/bin/sh
npm pack
file=$(find . -name "typedoc*.tgz")
echo "found $file"
tar zxf $file
cp -r package/* /tmp/typedoc
rm -rf pack
git checkout dist
rm -rf ./* .eslintrc .config .vscode .gitignore .editorconfig .npmrc
cp -r /tmp/typedoc/* .

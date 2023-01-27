#!/bin/sh

#prepare
# npm pack
file=$(find . -name "typedoc*.tgz")
echo "found $file"
tar zxf $file
mkdir /tmp/typedoc
mkdir /tmp/save-typedoc
#copy
cp -r package/* /tmp/typedoc
cp -r ./* /tmp/save-typedoc/
#publish
git checkout dist
rm -rf ./* .eslintrc .config .vscode .gitignore .editorconfig .npmrc
cp -r /tmp/typedoc/* .
rm -rf package
git add .
git commit -m "release"
git push
#restore
git checkout -
cp -r /tmp/save-typedoc/* .
#cleanup
rm -rf /tmp/typedoc /tmp/save-typedoc
rm -rf package
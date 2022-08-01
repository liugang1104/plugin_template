#!/bin/bash

#1.新建DSL工作区
cd ../
PLUGIN_DIR=`pwd`
echo $PLUGIN_DIR

PLUGIN_NAME=`basename $(pwd)`
echo $PLUGIN_NAME

WORKSPACE_DIR="$PLUGIN_DIR/.workspace"
mkdir $WORKSPACE_DIR

#2.将dsl复制到工作区
git clone git@github.com:liugang1104/ab_dsl_interpreter.git $WORKSPACE_DIR

#3.dsl生成代码
FLUTTER_DIR=`which flutter`
FLUTTER_BIN="${FLUTTER_DIR%/*}"
DARTSDK="${FLUTTER_BIN}/cache/dart-sdk/bin/dart"
$DARTSDK "$WORKSPACE_DIR/ab_dsl_interpreter/ab_dsl_interpreter.dart"
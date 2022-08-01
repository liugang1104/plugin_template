#!/bin/bash

#1.新建DSL工作区
cd ../
PLUGIN_DIR=$(pwd)
echo "$PLUGIN_DIR"

PLUGIN_NAME=$(basename $(pwd))
echo "$PLUGIN_NAME"

WORKSPACE_DIR="$PLUGIN_DIR/workspace"
mkdir "$WORKSPACE_DIR"

#2.将dsl复制到工作区
git clone git@github.com:liugang1104/ab_dsl_interpreter.git "$WORKSPACE_DIR/ab_dsl_interpreter"

#3.dsl生成代码
FLUTTER_DIR=$(which flutter)
FLUTTER_BIN="${FLUTTER_DIR%/*}"
DART_SDK="${FLUTTER_BIN}/cache/dart-sdk/bin/dart"
$DART_SDK pub get -C "$WORKSPACE_DIR/ab_dsl_interpreter"
$DART_SDK "$WORKSPACE_DIR/ab_dsl_interpreter/lib/ab_dsl_interpreter.dart"
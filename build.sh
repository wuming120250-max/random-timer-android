#!/bin/bash

echo "🚀 开始构建 Android APK..."

# 检查依赖
if ! command -v npm &> /dev/null; then
    echo "❌ 未找到 npm，请先安装 Node.js"
    exit 1
fi

if ! command -v npx &> /dev/null; then
    echo "❌ 未找到 npx，请升级 Node.js"
    exit 1
fi

# 安装依赖
echo "📦 安装依赖..."
npm install

# 安装 Capacitor CLI
echo "🔧 安装 Capacitor CLI..."
npm install -g @capacitor/cli

# 确保 dist 目录存在
echo "📁 准备构建目录..."
mkdir -p dist
cp random-timer.html dist/index.html
if [ -f "dist/manifest.json" ]; then
    echo "✅ manifest.json 已存在"
else
    echo "⚠️  manifest.json 不存在，跳过"
fi

# 初始化 Capacitor（如果需要）
if [ ! -f "capacitor.config.json" ]; then
    echo "🔧 初始化 Capacitor..."
    npx cap init "随机提示音" "com.randomtimer.app" --web-dir="dist"
fi

# 添加 Android 平台（如果需要）
if [ ! -d "android/app/src" ]; then
    echo "📱 添加 Android 平台..."
    npx cap add android
fi

# 同步到 Android
echo "🔄 同步到 Android 平台..."
npx cap sync android

# 构建 APK
echo "🏗️ 构建 Android APK..."
cd android
chmod +x ./gradlew
./gradlew assembleDebug

if [ $? -eq 0 ]; then
    echo "✅ APK 构建成功！"
    echo "📱 APK 文件位置: android/app/build/outputs/apk/debug/app-debug.apk"
else
    echo "❌ APK 构建失败！"
    exit 1
fi
# 🔔 随机提示音播放器 - Android 版本

一个支持后台运行、息屏提醒的随机提示音播放器 Android 应用，使用 Capacitor 技术打包。

## ✨ 主要功能

- 🕒 **自定义时间间隔**：设置最小和最大时间范围，系统随机选择间隔时间
- 🎵 **多种提示音**：支持自定义音频文件 + 内置提示音（哔哔声、叮声、钟声、通知音）
- 📱 **Android 原生支持**：
  - ✅ 后台运行，息屏不受影响
  - ✅ 本地推送通知
  - ✅ 震动反馈
  - ✅ 屏幕唤醒
  - ✅ 保持屏幕常亮
- 🎨 **精美界面**：渐变背景、毛玻璃效果、响应式设计
- 🚀 **PWA 支持**：可作为 Web 应用或原生应用使用

## 📦 安装方式

### 方式一：下载预编译 APK
1. 前往 [Releases](../../releases) 页面
2. 下载最新版本的 APK 文件
3. 在 Android 设备上安装

### 方式二：自动构建（推荐）
本项目配置了 GitHub Actions，每次推送代码都会自动构建 APK：

1. Fork 本仓库
2. 推送到 main 分支
3. 等待 GitHub Actions 完成构建
4. 在 Actions 页面下载构建产物或在 Releases 中获取

## 🛠️ 本地开发

### 环境要求
- Node.js 18+
- Android SDK
- Java 17+

### 构建步骤

```bash
# 1. 安装依赖
npm install

# 2. 安装 Capacitor CLI（如果尚未安装）
npm install -g @capacitor/cli

# 3. 构建 Web 应用
npm run build

# 4. 同步到 Android 平台
npx cap sync android

# 5. 构建 Android APK
cd android
./gradlew assembleDebug
```

构建完成后，APK 文件位于 `android/app/build/outputs/apk/debug/app-debug.apk`

## 📋 使用说明

### 首次使用
1. 安装 APK 后打开应用
2. 应用会自动请求必要权限：
   - 通知权限
   - 后台运行权限
   - 忽略电池优化
3. 设置时间间隔（分钟）
4. 选择或上传提示音文件
5. 点击"开始计时"

### 后台运行设置
为确保应用在息屏后正常工作，请进行以下设置：

#### 通用设置
1. **通知权限**：允许应用发送通知
2. **后台运行**：允许应用在后台运行
3. **电池优化**：将应用添加到电池优化白名单

#### 品牌特定设置
- **小米/红米**：安全中心 → 应用管理 → 应用权限 → 自启动管理
- **华为**：手机管家 → 应用启动管理 → 手动管理
- **OPPO/OnePlus**：设置 → 电池 → 耗电保护 → 睡眠待机优化
- **Vivo**：设置 → 电池 → 后台耗电管理 → 高耗电
- **三星**：设置 → 设备维护 → 电池 → 应用电源管理

## 🏗️ 项目结构

```
.
├── random-timer.html          # 原始网页版本
├── dist/                      # 构建输出目录
│   ├── index.html            # 应用主页面
│   └── manifest.json         # PWA 配置
├── android/                   # Android 项目文件
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── AndroidManifest.xml  # Android 权限配置
│   │   │   └── res/          # Android 资源文件
│   │   └── build.gradle      # 应用构建配置
│   ├── build.gradle          # 项目构建配置
│   └── settings.gradle       # 项目设置
├── .github/workflows/         # GitHub Actions 配置
│   └── build-android.yml     # 自动构建工作流
├── package.json              # Node.js 依赖配置
├── capacitor.config.json     # Capacitor 配置
└── README.md                 # 项目文档
```

## 🔧 技术栈

- **前端**：HTML5 + CSS3 + JavaScript（ES6+）
- **跨平台框架**：Capacitor 5.x
- **Android**：Android SDK API 22+（支持 Android 5.1+）
- **构建工具**：Gradle、GitHub Actions
- **插件**：
  - `@capacitor/keep-awake`：屏幕常亮
  - `@capacitor/background-task`：后台任务
  - `@capacitor/local-notifications`：本地通知
  - `@capacitor/haptics`：震动反馈

## ⚠️ 注意事项

1. **权限授予**：首次使用务必授予所有请求的权限
2. **电池优化**：各品牌手机的电池优化设置方法不同，请根据实际情况调整
3. **音频格式**：支持常见音频格式（MP3、WAV、AAC 等）
4. **文件大小**：建议单个音频文件不超过 10MB

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🆕 更新日志

### v1.0.0
- ✅ 初始版本发布
- ✅ 支持后台运行和息屏提醒
- ✅ Android 原生功能集成
- ✅ 自动化构建流程

## 💡 常见问题

**Q: 为什么息屏后没有提示音？**
A: 请检查是否已授予通知权限和后台运行权限，并将应用添加到电池优化白名单。

**Q: 能否支持 iOS？**
A: 目前仅支持 Android 平台，iOS 版本在规划中。

**Q: 如何自定义提示音？**
A: 点击"选择提示音文件"按钮，选择本地音频文件即可。

---

🔔 **享受无干扰的专注时光！**
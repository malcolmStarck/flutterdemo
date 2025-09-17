# Flutter Demo 项目

[![Flutter](https://img.shields.io/badge/Flutter-3.35.3-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

这是一个完整的Flutter演示项目，包含了各种常用功能的示例代码和详细注释，适合Flutter初学者学习和参考。项目支持多平台开发，包括Web、Android、iOS和macOS。

## 📱 支持平台

- ✅ **Web** - Chrome浏览器
- ✅ **Android** - 支持Android 5.0+
- ✅ **iOS** - 支持iOS 11.0+
- ✅ **macOS** - 支持macOS 10.14+

## 🚀 项目特色

- **详细注释**: 每个组件和功能都有详细的中文注释，便于学习理解
- **完整示例**: 涵盖了Flutter开发中的常用功能
- **多平台支持**: 一套代码，多平台运行
- **最佳实践**: 遵循Flutter官方开发规范和最佳实践
- **渐进式学习**: 从基础到高级，循序渐进

## 📁 项目结构

```
flutterdemo/
├── lib/                          # 源代码目录
│   ├── main.dart                 # 应用入口文件
│   ├── screens/                  # 页面文件
│   │   ├── home_screen.dart     # 主页
│   │   ├── demo_list_screen.dart # 演示列表页面
│   │   ├── basic_widgets_demo.dart # 基础组件演示
│   │   ├── navigation_demo.dart  # 导航演示
│   │   ├── state_management_demo.dart # 状态管理演示
│   │   ├── network_demo.dart     # 网络请求演示
│   │   ├── storage_demo.dart     # 本地存储演示
│   │   ├── camera_demo.dart      # 相机功能演示
│   │   └── location_demo.dart    # 定位功能演示
│   ├── widgets/                  # 自定义组件
│   ├── models/                   # 数据模型
│   ├── services/                 # 服务类
│   └── utils/                    # 工具类
├── android/                      # Android平台配置
├── ios/                          # iOS平台配置
├── macos/                        # macOS平台配置
├── web/                          # Web平台配置
├── assets/                       # 资源文件
│   ├── images/                   # 图片资源
│   ├── icons/                    # 图标资源
│   └── fonts/                    # 字体资源
├── test/                         # 测试文件
├── pubspec.yaml                  # 项目配置文件
├── analysis_options.yaml         # 代码分析配置
├── .gitignore                    # Git忽略文件
└── README.md                     # 项目说明文档
```

## 🎯 功能演示

### 1. 基础组件演示
- **文本组件** - 各种文本样式和格式化
- **按钮组件** - ElevatedButton、OutlinedButton、TextButton
- **输入框组件** - TextField的各种配置和验证
- **开关组件** - Switch和SwitchListTile的使用
- **滑块组件** - Slider的数值选择
- **下拉选择框** - DropdownButton的使用
- **卡片组件** - Card的布局和样式

### 2. 导航演示
- **普通页面跳转** - Navigator.push的基本使用
- **数据传递** - 页面间传递参数
- **返回数据** - 页面返回时的数据处理
- **命名路由** - 路由名称管理
- **对话框** - AlertDialog和showDialog
- **底部弹窗** - showModalBottomSheet

### 3. 状态管理演示
- **Provider状态管理** - 使用Provider进行状态管理
- **计数器示例** - 简单的状态管理实例
- **状态监听和更新** - Consumer和ChangeNotifier的使用

### 4. 网络请求演示
- **GET请求** - 获取数据的基本请求
- **POST请求** - 提交数据的请求
- **JSON数据解析** - 处理服务器返回的JSON数据
- **错误处理** - 网络请求的错误处理机制
- **加载状态** - 请求过程中的UI反馈

### 5. 本地存储演示
- **SharedPreferences** - 键值对存储
- **文本存储** - 字符串数据的持久化
- **计数器存储** - 数值数据的存储
- **设置存储** - 应用设置的保存
- **数据清除** - 存储数据的清理

### 6. 相机功能演示
- **拍照功能** - 使用相机拍摄照片
- **相册选择** - 从相册中选择图片
- **单张图片选择** - 选择单张图片
- **多张图片选择** - 批量选择图片

### 7. 定位功能演示
- **获取当前位置** - GPS定位功能
- **权限检查** - 定位权限的检查和请求
- **位置服务状态** - 检查位置服务是否开启

## 📦 依赖包

| 包名 | 版本 | 用途 |
|------|------|------|
| `http` | ^1.1.0 | 网络请求 |
| `shared_preferences` | ^2.2.2 | 本地存储 |
| `provider` | ^6.1.1 | 状态管理 |
| `image_picker` | ^1.0.4 | 图片选择 |
| `camera` | ^0.10.5+5 | 相机功能 |
| `geolocator` | ^10.1.0 | 定位功能 |
| `permission_handler` | ^11.1.0 | 权限管理 |

## 🛠️ 开发环境要求

### 必需工具
- **Flutter SDK**: 3.0.0 或更高版本
- **Dart SDK**: 3.0.0 或更高版本

### 平台特定要求

#### Android开发
- **Android Studio**: 2023.1 或更高版本
- **Android SDK**: API 21 (Android 5.0) 或更高版本
- **Java**: JDK 11 或更高版本

#### iOS开发
- **Xcode**: 14.0 或更高版本
- **macOS**: 12.0 或更高版本
- **CocoaPods**: 1.11.0 或更高版本

#### Web开发
- **Chrome**: 88 或更高版本（推荐）

## 🚀 快速开始

### 1. 克隆项目
```bash
git clone <repository-url>
cd flutterdemo
```

### 2. 安装依赖
```bash
flutter pub get
```

### 3. 运行项目

#### Web平台
```bash
flutter run -d chrome
```

#### Android平台
```bash
flutter run -d android
```

#### iOS平台
```bash
flutter run -d ios
```

#### macOS平台
```bash
flutter run -d macos
```

### 4. 构建发布版本

#### Android APK
```bash
flutter build apk --release
```

#### iOS应用
```bash
flutter build ios --release
```

#### Web应用
```bash
flutter build web --release
```

#### macOS应用
```bash
flutter build macos --release
```

## 📱 平台特定配置

### Android配置
项目已配置以下权限：
- 网络权限 (`INTERNET`)
- 相机权限 (`CAMERA`)
- 存储权限 (`READ_EXTERNAL_STORAGE`, `WRITE_EXTERNAL_STORAGE`)
- 位置权限 (`ACCESS_FINE_LOCATION`, `ACCESS_COARSE_LOCATION`)

### iOS配置
项目已配置以下权限：
- 相机权限 (`NSCameraUsageDescription`)
- 相册权限 (`NSPhotoLibraryUsageDescription`)
- 位置权限 (`NSLocationWhenInUseUsageDescription`)

### Web配置
- 支持HTTPS部署
- 响应式设计，适配不同屏幕尺寸

## ⚠️ 注意事项

### 权限配置
1. **相机权限**: 在真机上测试时请确保授予相机权限
2. **存储权限**: Android 6.0+需要运行时权限请求
3. **位置权限**: 定位功能需要在真机上测试，模拟器可能返回默认位置

### 网络请求
- 网络演示使用公共API（httpbin.org, jsonplaceholder.typicode.com）
- 请确保网络连接正常
- 某些功能可能需要HTTPS连接

### 平台兼容性
- **相机功能**: 仅支持真机，模拟器无法使用
- **定位功能**: 建议在真机上测试
- **文件存储**: 不同平台的存储路径可能不同

## 📚 学习建议

### 初学者路径
1. **基础组件** → 了解Flutter的基本组件和布局
2. **导航管理** → 学习页面跳转和路由管理
3. **状态管理** → 掌握数据状态的管理方式
4. **网络请求** → 学习与服务器交互
5. **本地存储** → 了解数据持久化
6. **设备功能** → 集成相机、定位等设备功能

### 进阶学习
- 学习Flutter的架构模式（BLoC, Riverpod等）
- 掌握Flutter的性能优化技巧
- 了解Flutter的测试框架
- 学习Flutter的动画和手势处理

## 🔧 开发工具推荐

- **IDE**: VS Code 或 Android Studio
- **调试工具**: Flutter DevTools
- **版本控制**: Git
- **API测试**: Postman 或 Insomnia
- **设计工具**: Figma 或 Sketch

## 🤝 贡献指南

欢迎提交Issue和Pull Request来改进这个项目！

1. Fork 这个项目
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个Pull Request

## 📄 许可证

这个项目使用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

- Flutter团队提供的优秀框架
- 所有开源贡献者的无私奉献
- 社区提供的学习资源和最佳实践

## 📞 联系方式

如果你有任何问题或建议，欢迎通过以下方式联系：

- 提交Issue: [GitHub Issues](https://github.com/yourusername/flutterdemo/issues)
- 邮箱: your.email@example.com

---

**祝学习愉快！🎉**

如果这个项目对你有帮助，请给个⭐️支持一下！
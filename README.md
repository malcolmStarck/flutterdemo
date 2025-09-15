# Flutter Demo 项目

这是一个Flutter演示项目，包含了各种常用功能的示例代码，适合Flutter初学者学习和参考。

## 项目结构

```
lib/
├── main.dart                 # 应用入口
├── screens/                  # 页面文件
│   ├── home_screen.dart     # 主页
│   ├── demo_list_screen.dart # 演示列表
│   ├── basic_widgets_demo.dart # 基础组件演示
│   ├── navigation_demo.dart  # 导航演示
│   ├── state_management_demo.dart # 状态管理演示
│   ├── network_demo.dart     # 网络请求演示
│   ├── storage_demo.dart     # 本地存储演示
│   ├── camera_demo.dart      # 相机功能演示
│   └── location_demo.dart    # 定位功能演示
├── widgets/                  # 自定义组件
├── models/                   # 数据模型
├── services/                 # 服务类
└── utils/                    # 工具类
```

## 功能演示

### 1. 基础组件演示
- 文本组件
- 按钮组件
- 输入框组件
- 开关组件
- 滑块组件
- 下拉选择框
- 卡片组件

### 2. 导航演示
- 普通页面跳转
- 数据传递
- 返回数据
- 命名路由
- 对话框
- 底部弹窗

### 3. 状态管理演示
- 使用Provider进行状态管理
- 计数器示例
- 状态监听和更新

### 4. 网络请求演示
- GET请求
- POST请求
- JSON数据解析
- 错误处理
- 加载状态

### 5. 本地存储演示
- SharedPreferences使用
- 文本存储
- 计数器存储
- 设置存储
- 数据清除

### 6. 相机功能演示
- 拍照功能
- 相册选择
- 单张图片选择
- 多张图片选择

### 7. 定位功能演示
- 获取当前位置
- 权限检查
- 位置服务状态检查

## 依赖包

- `http`: 网络请求
- `shared_preferences`: 本地存储
- `provider`: 状态管理
- `image_picker`: 图片选择
- `camera`: 相机功能
- `geolocator`: 定位功能
- `permission_handler`: 权限管理

## 运行项目

1. 确保已安装Flutter SDK
2. 在项目根目录运行：
   ```bash
   flutter pub get
   ```
3. 运行项目：
   ```bash
   flutter run
   ```

## 注意事项

1. **权限配置**: 项目已配置了相机、存储、位置等权限，在真机上测试时请确保权限已授予
2. **网络请求**: 网络演示使用的是公共API，请确保网络连接正常
3. **定位功能**: 定位功能需要在真机上测试，模拟器可能返回默认位置
4. **相机功能**: 相机功能需要在真机上测试

## 学习建议

1. 从基础组件演示开始，了解Flutter的基本组件
2. 学习导航和状态管理，这是Flutter应用的核心
3. 实践网络请求和本地存储，这些是实际开发中常用的功能
4. 尝试相机和定位功能，了解设备功能的集成

## 扩展功能

你可以基于这个项目继续添加更多功能：
- 数据库操作（SQLite）
- 文件操作
- 推送通知
- 地图集成
- 二维码扫描
- 音视频播放
- 等等...

祝学习愉快！🎉

// 导入Flutter Material Design组件库
import 'package:flutter/material.dart';
// 导入各个演示页面的组件
import 'basic_widgets_demo.dart';
import 'navigation_demo.dart';
import 'state_management_demo.dart';
import 'network_demo.dart';
import 'storage_demo.dart';
import 'camera_demo.dart';
import 'location_demo.dart';

/**
 * DemoListScreen类 - 演示列表页面
 * 
 * 这个页面展示了所有可用的功能演示，用户可以点击不同的项目来查看相应的演示
 * 使用了ListView.builder来动态构建列表，这是Flutter中处理长列表的推荐方式
 */
class DemoListScreen extends StatelessWidget {
  // 构造函数
  const DemoListScreen({super.key});

  /**
   * build方法 - 构建演示列表UI
   * 
   * 这个方法创建了一个包含所有演示项目的列表
   * 每个列表项都是一个Card，包含图标、标题、描述和点击事件
   */
  @override
  Widget build(BuildContext context) {
    // 定义所有演示项目的数据
    // 使用final关键字表示这个变量在初始化后不能被重新赋值
    final demos = [
      // 基础组件演示
      DemoItem(
        title: '基础组件演示',
        description: '展示Flutter常用基础组件的使用方法',
        icon: Icons.widgets, // Material Design图标
        screen: const BasicWidgetsDemo(), // 对应的演示页面
      ),
      // 导航演示
      DemoItem(
        title: '导航演示',
        description: '页面跳转、路由传参等导航功能',
        icon: Icons.navigation,
        screen: const NavigationDemo(),
      ),
      // 状态管理演示
      DemoItem(
        title: '状态管理演示',
        description: '使用Provider进行状态管理',
        icon: Icons.settings,
        screen: const StateManagementDemo(),
      ),
      // 网络请求演示
      DemoItem(
        title: '网络请求演示',
        description: 'HTTP请求、JSON解析等网络功能',
        icon: Icons.network_check,
        screen: const NetworkDemo(),
      ),
      // 本地存储演示
      DemoItem(
        title: '本地存储演示',
        description: 'SharedPreferences数据持久化',
        icon: Icons.storage,
        screen: const StorageDemo(),
      ),
      // 相机功能演示
      DemoItem(
        title: '相机功能演示',
        description: '拍照、选择图片等功能',
        icon: Icons.camera_alt,
        screen: const CameraDemo(),
      ),
      // 定位功能演示
      DemoItem(
        title: '定位功能演示',
        description: '获取设备位置信息',
        icon: Icons.location_on,
        screen: const LocationDemo(),
      ),
    ];

    // 使用ListView.builder构建列表
    // ListView.builder是Flutter中处理长列表的高效方式
    // 它只构建可见的列表项，提高了性能
    return ListView.builder(
      // 设置列表的内边距
      padding: const EdgeInsets.all(16),
      // 列表项的数量
      itemCount: demos.length,
      // 构建每个列表项的函数
      // context: 构建上下文
      // index: 当前项的索引
      itemBuilder: (context, index) {
        // 获取当前演示项目的数据
        final demo = demos[index];
        
        // 返回一个Card组件，包含ListTile
        return Card(
          // 设置卡片的外边距，只在底部留出间距
          margin: const EdgeInsets.only(bottom: 12),
          // ListTile是Material Design中的列表项组件
          child: ListTile(
            // 左侧图标
            leading: Icon(demo.icon, size: 32),
            // 主标题
            title: Text(
              demo.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // 副标题/描述
            subtitle: Text(demo.description),
            // 右侧箭头图标
            trailing: const Icon(Icons.arrow_forward_ios),
            // 点击事件处理
            onTap: () {
              // 使用Navigator.push进行页面导航
              // 这是Flutter中页面跳转的标准方式
              Navigator.push(
                context,
                // MaterialPageRoute创建页面路由
                // builder函数返回要跳转到的页面
                MaterialPageRoute(builder: (context) => demo.screen),
              );
            },
          ),
        );
      },
    );
  }
}

/**
 * DemoItem类 - 演示项目数据模型
 * 
 * 这是一个简单的数据类，用于存储演示项目的信息
 * 包含了标题、描述、图标和对应的页面组件
 * 
 * 在Flutter中，这种数据类通常被称为"Model"或"Data Class"
 */
class DemoItem {
  // 演示项目的标题
  final String title;
  // 演示项目的描述
  final String description;
  // 演示项目的图标
  final IconData icon;
  // 演示项目对应的页面组件
  final Widget screen;

  /**
   * 构造函数
   * 
   * 使用required关键字表示这些参数是必需的
   * 这确保了在创建DemoItem时必须提供所有必要的信息
   */
  DemoItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.screen,
  });
}

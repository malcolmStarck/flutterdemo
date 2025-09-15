import 'package:flutter/material.dart';
import 'basic_widgets_demo.dart';
import 'navigation_demo.dart';
import 'state_management_demo.dart';
import 'network_demo.dart';
import 'storage_demo.dart';
import 'camera_demo.dart';
import 'location_demo.dart';

class DemoListScreen extends StatelessWidget {
  const DemoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = [
      DemoItem(
        title: '基础组件演示',
        description: '展示Flutter常用基础组件的使用方法',
        icon: Icons.widgets,
        screen: const BasicWidgetsDemo(),
      ),
      DemoItem(
        title: '导航演示',
        description: '页面跳转、路由传参等导航功能',
        icon: Icons.navigation,
        screen: const NavigationDemo(),
      ),
      DemoItem(
        title: '状态管理演示',
        description: '使用Provider进行状态管理',
        icon: Icons.settings,
        screen: const StateManagementDemo(),
      ),
      DemoItem(
        title: '网络请求演示',
        description: 'HTTP请求、JSON解析等网络功能',
        icon: Icons.network_check,
        screen: const NetworkDemo(),
      ),
      DemoItem(
        title: '本地存储演示',
        description: 'SharedPreferences数据持久化',
        icon: Icons.storage,
        screen: const StorageDemo(),
      ),
      DemoItem(
        title: '相机功能演示',
        description: '拍照、选择图片等功能',
        icon: Icons.camera_alt,
        screen: const CameraDemo(),
      ),
      DemoItem(
        title: '定位功能演示',
        description: '获取设备位置信息',
        icon: Icons.location_on,
        screen: const LocationDemo(),
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: demos.length,
      itemBuilder: (context, index) {
        final demo = demos[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Icon(demo.icon, size: 32),
            title: Text(
              demo.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(demo.description),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => demo.screen),
              );
            },
          ),
        );
      },
    );
  }
}

class DemoItem {
  final String title;
  final String description;
  final IconData icon;
  final Widget screen;

  DemoItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.screen,
  });
}

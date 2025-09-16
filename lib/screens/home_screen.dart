// 导入Flutter Material Design组件库
import 'package:flutter/material.dart';
// 导入演示列表页面组件
import 'demo_list_screen.dart';

/**
 * HomeScreen类 - 应用程序的主页面
 * 
 * 这是一个StatelessWidget，表示无状态组件
 * 作为应用程序的首页，它提供了一个标准的Material Design页面结构
 * 
 * 页面结构：
 * - AppBar: 顶部应用栏，显示标题和可能的操作按钮
 * - Body: 页面主体内容，这里显示演示列表
 */
class HomeScreen extends StatelessWidget {
  // 构造函数，使用const关键字表示这是一个编译时常量
  // super.key用于在Widget树中唯一标识这个组件
  const HomeScreen({super.key});

  /**
   * build方法 - 构建页面UI
   * 
   * 返回一个Scaffold组件，这是Material Design页面的基本结构
   * Scaffold提供了标准的页面布局，包括AppBar、Body、FloatingActionButton等
   */
  @override
  Widget build(BuildContext context) {
    // Scaffold是Material Design页面的基本结构组件
    // 它提供了标准的页面布局框架
    return Scaffold(
      // AppBar是页面顶部的应用栏
      appBar: AppBar(
        // 应用栏的标题文本
        title: const Text('Flutter Demo 集合'),
        // 应用栏的背景颜色
        // Theme.of(context).colorScheme.inversePrimary 获取主题中的反向主色
        // 这确保了应用栏颜色与主题保持一致
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // 页面的主体内容
      // 这里显示演示列表页面，包含了所有的功能演示入口
      body: const DemoListScreen(),
    );
  }
}

// 导入Flutter Material Design组件库
// Material Design是Google设计的一套视觉设计语言，Flutter提供了完整的Material组件
import 'package:flutter/material.dart';
// 导入自定义的主页面组件
import 'screens/home_screen.dart';

/**
 * Flutter应用程序的入口点
 * 
 * main()函数是Dart程序的入口点，类似于其他编程语言中的main函数
 * 在Flutter中，main()函数必须调用runApp()来启动应用程序
 */
void main() {
  // runApp()函数启动Flutter应用程序
  // 它接受一个Widget作为参数，这个Widget将成为应用程序的根组件
  runApp(const MyApp());
}

/**
 * MyApp类 - 应用程序的根组件
 * 
 * 继承自StatelessWidget，表示这是一个无状态的组件
 * StatelessWidget vs StatefulWidget:
 * - StatelessWidget: 无状态组件，一旦创建后不会改变
 * - StatefulWidget: 有状态组件，可以在运行时改变状态
 * 
 * 在Flutter中，一切都是Widget（组件），包括页面、按钮、文本等
 */
class MyApp extends StatelessWidget {
  // 构造函数，super.key是Flutter中用于标识Widget的键值
  // 在const构造函数中，所有参数都必须是final的
  const MyApp({super.key});

  /**
   * build方法 - 构建Widget的UI
   * 
   * 这是StatelessWidget必须实现的方法
   * 它返回一个Widget，描述了这个组件应该如何显示
   * 
   * @param context: BuildContext对象，提供了Widget在树中的位置信息
   * @return Widget: 返回要显示的UI组件
   */
  @override
  Widget build(BuildContext context) {
    // MaterialApp是Flutter应用程序的根组件
    // 它提供了Material Design主题、路由、本地化等功能
    return MaterialApp(
      // 应用程序的标题，通常用于系统任务管理器等地方
      title: 'Flutter Demo',
      
      // 应用程序的主题配置
      theme: ThemeData(
        // 从种子颜色生成完整的颜色方案
        // 种子颜色会生成一套协调的颜色（主色、辅助色、错误色等）
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // 使用Material 3设计规范（最新版本）
        useMaterial3: true,
      ),
      
      // 应用程序的首页，即启动时显示的第一个页面
      home: const HomeScreen(),
      
      // 隐藏右上角的"DEBUG"横幅
      // 在开发模式下，Flutter会在右上角显示一个"DEBUG"标识
      debugShowCheckedModeBanner: false,
    );
  }
}

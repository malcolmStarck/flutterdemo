// 导入Flutter Material Design组件库
import 'package:flutter/material.dart';

/**
 * BasicWidgetsDemo类 - 基础组件演示页面
 * 
 * 这是一个StatefulWidget，表示有状态组件
 * 与StatelessWidget不同，StatefulWidget可以在运行时改变状态
 * 当状态改变时，Flutter会重新构建UI来反映新的状态
 * 
 * 这个页面展示了Flutter中常用的基础组件，包括：
 * - 文本组件 (Text)
 * - 按钮组件 (ElevatedButton, OutlinedButton, TextButton)
 * - 输入框组件 (TextField)
 * - 开关组件 (Switch)
 * - 滑块组件 (Slider)
 * - 下拉选择框 (DropdownButton)
 * - 卡片组件 (Card)
 */
class BasicWidgetsDemo extends StatefulWidget {
  // 构造函数
  const BasicWidgetsDemo({super.key});

  /**
   * createState方法 - 创建状态对象
   * 
   * 这是StatefulWidget必须实现的方法
   * 它返回一个State对象，用于管理组件的状态
   * 
   * 注意：State对象的类名通常以下划线开头，表示这是一个私有类
   */
  @override
  State<BasicWidgetsDemo> createState() => _BasicWidgetsDemoState();
}

/**
 * _BasicWidgetsDemoState类 - 基础组件演示页面的状态管理类
 * 
 * 这个类继承自State<BasicWidgetsDemo>，负责管理BasicWidgetsDemo的状态
 * 包含了所有需要在运行时改变的数据
 */
class _BasicWidgetsDemoState extends State<BasicWidgetsDemo> {
  // 开关组件的状态值
  // 使用bool类型表示开关的开启/关闭状态
  bool _switchValue = false;
  
  // 滑块组件的状态值
  // 使用double类型表示滑块的位置，范围通常是0.0到1.0
  double _sliderValue = 0.5;
  
  // 下拉选择框的当前选中值
  // 使用String类型存储选中的选项
  String _selectedItem = '选项1';
  
  // 下拉选择框的选项列表
  // 使用final关键字表示这个列表在初始化后不能被重新赋值
  // 但列表的内容是可以修改的
  final List<String> _items = ['选项1', '选项2', '选项3'];

  /**
   * build方法 - 构建页面UI
   * 
   * 这是State类必须实现的方法，用于构建组件的UI
   * 当状态改变时，Flutter会调用这个方法重新构建UI
   * 
   * @param context: 构建上下文，提供Widget在树中的位置信息
   * @return Widget: 返回要显示的UI组件
   */
  @override
  Widget build(BuildContext context) {
    // 返回Scaffold作为页面的基本结构
    return Scaffold(
      // 页面顶部的应用栏
      appBar: AppBar(
        title: const Text('基础组件演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // 页面主体内容
      body: SingleChildScrollView(
        // 设置内边距
        padding: const EdgeInsets.all(16),
        // 使用Column垂直排列子组件
        child: Column(
          // 设置子组件的水平对齐方式为左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          // 子组件列表
          children: [
            // ==================== 文本组件演示 ====================
            // 文本组件是Flutter中最基础的组件，用于显示文字内容
            const Text(
              '文本组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // 间距组件，用于在组件之间添加空白
            
            // 普通文本 - 使用默认样式
            const Text('普通文本'),
            
            // 粗体文本 - 通过TextStyle设置字体粗细
            const Text(
              '粗体文本',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            // 彩色文本 - 通过TextStyle设置颜色和字体大小
            const Text(
              '彩色文本',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(height: 20),

            // ==================== 按钮组件演示 ====================
            // Flutter提供了三种主要的按钮组件，每种都有不同的视觉风格
            const Text(
              '按钮组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // 使用Row水平排列按钮
            Row(
              children: [
                // ElevatedButton - 凸起按钮，有阴影效果，用于主要操作
                ElevatedButton(
                  onPressed: () => _showSnackBar('ElevatedButton点击'),
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(width: 8), // 按钮之间的间距
                
                // OutlinedButton - 轮廓按钮，只有边框，用于次要操作
                OutlinedButton(
                  onPressed: () => _showSnackBar('OutlinedButton点击'),
                  child: const Text('OutlinedButton'),
                ),
                const SizedBox(width: 8),
                
                // TextButton - 文本按钮，最简洁的样式，用于文本链接等
                TextButton(
                  onPressed: () => _showSnackBar('TextButton点击'),
                  child: const Text('TextButton'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ==================== 输入框组件演示 ====================
            // TextField是Flutter中的文本输入组件，用于用户输入文本
            const Text(
              '输入框组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // TextField - 文本输入框
            const TextField(
              decoration: InputDecoration(
                labelText: '请输入内容', // 标签文本，当输入框获得焦点时会向上移动
                border: OutlineInputBorder(), // 边框样式，这里使用轮廓边框
                prefixIcon: Icon(Icons.edit), // 前缀图标，显示在输入框左侧
              ),
            ),
            const SizedBox(height: 20),

            // ==================== 开关组件演示 ====================
            // Switch组件用于表示开启/关闭状态，通常用于设置选项
            const Text(
              '开关组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // SwitchListTile - 带标题的开关组件
            SwitchListTile(
              title: const Text('开关状态'), // 开关的标题
              value: _switchValue, // 开关的当前状态值
              onChanged: (value) {
                // 当开关状态改变时调用setState更新UI
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // ==================== 滑块组件演示 ====================
            // Slider组件用于选择一个范围内的数值
            const Text(
              '滑块组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // 显示当前滑块的值（转换为百分比）
            Text('当前值: ${(_sliderValue * 100).round()}'),
            
            // Slider - 滑块组件
            Slider(
              value: _sliderValue, // 滑块的当前值
              onChanged: (value) {
                // 当滑块值改变时调用setState更新UI
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // ==================== 下拉选择框演示 ====================
            // DropdownButton组件用于从多个选项中选择一个
            const Text(
              '下拉选择框',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // DropdownButton - 下拉选择框
            DropdownButton<String>(
              value: _selectedItem, // 当前选中的值
              isExpanded: true, // 让下拉框占满可用宽度
              // 构建下拉选项列表
              items: _items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item, // 选项的值
                  child: Text(item), // 选项显示的文本
                );
              }).toList(),
              // 当选择改变时的回调函数
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!; // 更新选中的值
                });
              },
            ),
            const SizedBox(height: 20),

            // ==================== 卡片组件演示 ====================
            // Card组件用于将相关内容组织在一起，提供视觉上的分组
            const Text(
              '卡片组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Card - 卡片组件
            Card(
              child: Padding(
                // 设置卡片内部的内边距
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 卡片标题
                    const Text(
                      '卡片标题',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    
                    // 卡片内容
                    const Text('这是一个卡片组件的内容，可以包含各种子组件。'),
                    const SizedBox(height: 12),
                    
                    // 卡片底部的按钮组
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // 右对齐
                      children: [
                        // 取消按钮
                        TextButton(
                          onPressed: () {}, // 空函数，实际应用中会有具体逻辑
                          child: const Text('取消'),
                        ),
                        // 确定按钮
                        ElevatedButton(
                          onPressed: () {}, // 空函数，实际应用中会有具体逻辑
                          child: const Text('确定'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * _showSnackBar方法 - 显示底部提示消息
   * 
   * SnackBar是Material Design中的一种轻量级反馈组件
   * 通常显示在屏幕底部，用于向用户提供简短的操作反馈
   * 
   * @param message: 要显示的消息文本
   */
  void _showSnackBar(String message) {
    // 使用ScaffoldMessenger来显示SnackBar
    // ScaffoldMessenger是Flutter中管理SnackBar的推荐方式
    ScaffoldMessenger.of(context).showSnackBar(
      // 创建SnackBar组件
      SnackBar(content: Text(message)),
    );
  }
}

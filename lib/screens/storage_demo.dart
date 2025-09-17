// 导入Flutter Material Design组件库
import 'package:flutter/material.dart';
// 导入SharedPreferences本地存储库
import 'package:shared_preferences/shared_preferences.dart';

/**
 * StorageDemo类 - 本地存储演示页面
 *
 * 这个页面演示了Flutter中使用SharedPreferences进行本地数据存储的方法
 * SharedPreferences是Flutter中最常用的轻量级本地存储解决方案
 *
 * 主要功能：
 * - 文本数据存储和读取
 * - 数值数据存储和读取
 * - 布尔值数据存储和读取
 * - 数据的清除和重置
 * - 异步操作处理
 */
class StorageDemo extends StatefulWidget {
  // 构造函数
  const StorageDemo({super.key});

  /**
   * createState方法 - 创建状态对象
   * 
   * 返回_StorageDemoState实例来管理页面的状态
   */
  @override
  State<StorageDemo> createState() => _StorageDemoState();
}

/**
 * _StorageDemoState类 - 本地存储演示页面的状态管理类
 *
 * 这个类管理页面的状态，包括：
 * - 文本输入控制
 * - 存储的数据状态
 * - 本地存储操作
 */
class _StorageDemoState extends State<StorageDemo> {
  // 文本输入控制器，用于管理文本输入框
  final TextEditingController _textController = TextEditingController();
  
  // 存储的文本数据
  String _storedText = '';
  
  // 计数器值
  int _counter = 0;
  
  // 暗黑模式开关状态
  bool _isDarkMode = false;

  /**
   * initState方法 - 初始化状态
   * 
   * 在Widget首次插入到Widget树时调用
   * 这里加载本地存储的数据
   */
  @override
  void initState() {
    super.initState();
    _loadData(); // 加载本地存储的数据
  }

  /**
   * dispose方法 - 清理资源
   * 
   * 在Widget从Widget树中移除时调用
   * 这里释放TextEditingController资源
   */
  @override
  void dispose() {
    _textController.dispose(); // 释放文本控制器资源
    super.dispose();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedText = prefs.getString('stored_text') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
      _isDarkMode = prefs.getBool('dark_mode') ?? false;
    });
  }

  Future<void> _saveText() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('stored_text', _textController.text);
    setState(() {
      _storedText = _textController.text;
    });
    _textController.clear();
    _showSnackBar('文本已保存');
  }

  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    _counter++;
    await prefs.setInt('counter', _counter);
    setState(() {});
    _showSnackBar('计数器已更新');
  }

  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    _counter = 0;
    await prefs.setInt('counter', _counter);
    setState(() {});
    _showSnackBar('计数器已重置');
  }

  Future<void> _toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    await prefs.setBool('dark_mode', _isDarkMode);
    setState(() {});
    _showSnackBar('主题模式已切换');
  }

  Future<void> _clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _storedText = '';
      _counter = 0;
      _isDarkMode = false;
    });
    _textController.clear();
    _showSnackBar('所有数据已清除');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('本地存储演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 文本存储
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '文本存储',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: '输入要保存的文本',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _saveText,
                      child: const Text('保存文本'),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '已保存的文本: $_storedText',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 计数器存储
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '计数器存储',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '当前计数: $_counter',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: _incrementCounter,
                          child: const Text('增加'),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: _resetCounter,
                          child: const Text('重置'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 设置存储
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '设置存储',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    SwitchListTile(
                      title: const Text('深色模式'),
                      subtitle: Text(_isDarkMode ? '已启用' : '已禁用'),
                      value: _isDarkMode,
                      onChanged: (value) => _toggleDarkMode(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 清除数据
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '数据管理',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _clearAllData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('清除所有数据'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 说明
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '说明',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'SharedPreferences是Flutter中用于本地数据持久化的简单方案：\n'
                      '1. 支持基本数据类型（String、int、bool、double等）\n'
                      '2. 数据存储在设备本地，应用重启后仍然保留\n'
                      '3. 适合存储用户设置、简单的应用状态等\n'
                      '4. 不适合存储大量数据或复杂对象',
                      style: TextStyle(fontSize: 14),
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
}

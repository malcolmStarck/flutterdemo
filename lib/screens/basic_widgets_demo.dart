import 'package:flutter/material.dart';

class BasicWidgetsDemo extends StatefulWidget {
  const BasicWidgetsDemo({super.key});

  @override
  State<BasicWidgetsDemo> createState() => _BasicWidgetsDemoState();
}

class _BasicWidgetsDemoState extends State<BasicWidgetsDemo> {
  bool _switchValue = false;
  double _sliderValue = 0.5;
  String _selectedItem = '选项1';
  final List<String> _items = ['选项1', '选项2', '选项3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础组件演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 文本组件
            const Text(
              '文本组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('普通文本'),
            const Text(
              '粗体文本',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '彩色文本',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(height: 20),

            // 按钮组件
            const Text(
              '按钮组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _showSnackBar('ElevatedButton点击'),
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => _showSnackBar('OutlinedButton点击'),
                  child: const Text('OutlinedButton'),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () => _showSnackBar('TextButton点击'),
                  child: const Text('TextButton'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 输入框组件
            const Text(
              '输入框组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: '请输入内容',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 20),

            // 开关组件
            const Text(
              '开关组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('开关状态'),
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // 滑块组件
            const Text(
              '滑块组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('当前值: ${(_sliderValue * 100).round()}'),
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // 下拉选择框
            const Text(
              '下拉选择框',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedItem,
              isExpanded: true,
              items: _items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),

            // 卡片组件
            const Text(
              '卡片组件',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '卡片标题',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('这是一个卡片组件的内容，可以包含各种子组件。'),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('取消'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

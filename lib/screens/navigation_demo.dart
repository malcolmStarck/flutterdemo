import 'package:flutter/material.dart';

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('导航演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(title: '普通页面跳转'),
                  ),
                );
              },
              child: const Text('普通页面跳转'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataPassingPage(
                      title: '数据传递演示',
                      data: '这是从上一页传递过来的数据',
                    ),
                  ),
                );
              },
              child: const Text('数据传递演示'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReturnDataPage(),
                  ),
                );
                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('返回的数据: $result')),
                  );
                }
              },
              child: const Text('返回数据演示'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/named-route');
              },
              child: const Text('命名路由演示'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('对话框'),
                      content: const Text('这是一个对话框演示'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('取消'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('确定'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('对话框演示'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            '底部弹窗',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          const Text('这是一个底部弹窗演示'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('关闭'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('底部弹窗演示'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String title;

  const SecondPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '这是第二个页面',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('返回上一页'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPassingPage extends StatelessWidget {
  final String title;
  final String data;

  const DataPassingPage({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '接收到的数据:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              data,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnDataPage extends StatelessWidget {
  const ReturnDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('返回数据演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '选择要返回的数据',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, '选项A'),
              child: const Text('返回选项A'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, '选项B'),
              child: const Text('返回选项B'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, '选项C'),
              child: const Text('返回选项C'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
          ],
        ),
      ),
    );
  }
}

class NamedRoutePage extends StatelessWidget {
  const NamedRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('命名路由页面'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          '这是通过命名路由打开的页面',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

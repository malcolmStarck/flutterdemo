import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateManagementDemo extends StatelessWidget {
  const StateManagementDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const StateManagementScreen(),
    );
  }
}

class StateManagementScreen extends StatelessWidget {
  const StateManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('状态管理演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Provider状态管理演示',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          '计数器',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${counter.count}',
                          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => counter.decrement(),
                              child: const Text('-'),
                            ),
                            ElevatedButton(
                              onPressed: () => counter.increment(),
                              child: const Text('+'),
                            ),
                            ElevatedButton(
                              onPressed: () => counter.reset(),
                              child: const Text('重置'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '状态信息',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text('当前计数: ${counter.count}'),
                        Text('是否为偶数: ${counter.isEven ? "是" : "否"}'),
                        Text('是否为奇数: ${counter.isOdd ? "是" : "否"}'),
                        Text('计数平方: ${counter.squared}'),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              '说明',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '这个演示展示了如何使用Provider进行状态管理：\n'
              '1. 使用ChangeNotifierProvider包装应用\n'
              '2. 创建继承ChangeNotifier的模型类\n'
              '3. 使用Consumer监听状态变化\n'
              '4. 调用notifyListeners()通知UI更新',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;
  bool get isEven => _count % 2 == 0;
  bool get isOdd => _count % 2 != 0;
  int get squared => _count * _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// 导入Flutter Material Design组件库
import 'package:flutter/material.dart';
// 导入Provider状态管理库
import 'package:provider/provider.dart';

/**
 * StateManagementDemo类 - 状态管理演示页面
 *
 * 这个页面演示了Flutter中使用Provider进行状态管理的方法
 * Provider是Flutter官方推荐的状态管理解决方案之一
 *
 * 主要概念：
 * - ChangeNotifierProvider: 提供状态管理服务
 * - Consumer: 监听状态变化并重建UI
 * - ChangeNotifier: 状态管理模型基类
 */
class StateManagementDemo extends StatelessWidget {
  // 构造函数
  const StateManagementDemo({super.key});

  /**
   * build方法 - 构建状态管理演示页面
   *
   * 使用ChangeNotifierProvider包装整个页面，提供状态管理服务
   * create函数创建CounterModel实例，这个实例将在整个页面中共享
   */
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider提供状态管理服务
    // create函数在需要时创建CounterModel实例
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

/**
 * CounterModel类 - 计数器状态管理模型
 *
 * 这个类继承自ChangeNotifier，是Provider状态管理的核心
 * ChangeNotifier提供了通知监听者的能力，当状态改变时会自动更新UI
 *
 * 主要功能：
 * - 管理计数器的状态
 * - 提供计算属性（如是否为偶数、平方值等）
 * - 提供修改状态的方法
 * - 通过notifyListeners()通知UI更新
 */
class CounterModel extends ChangeNotifier {
  // 私有变量，存储计数器的值
  int _count = 0;

  // 获取当前计数值的getter方法
  int get count => _count;
  
  // 计算属性：判断当前计数是否为偶数
  bool get isEven => _count % 2 == 0;
  
  // 计算属性：判断当前计数是否为奇数
  bool get isOdd => _count % 2 != 0;
  
  // 计算属性：当前计数的平方值
  int get squared => _count * _count;

  /**
   * increment方法 - 增加计数器
   * 
   * 将计数器值加1，并通知所有监听者UI需要更新
   * notifyListeners()会触发所有Consumer重新构建
   */
  void increment() {
    _count++;
    notifyListeners(); // 通知监听者状态已改变
  }

  /**
   * decrement方法 - 减少计数器
   * 
   * 将计数器值减1，并通知所有监听者UI需要更新
   */
  void decrement() {
    _count--;
    notifyListeners(); // 通知监听者状态已改变
  }

  /**
   * reset方法 - 重置计数器
   * 
   * 将计数器值重置为0，并通知所有监听者UI需要更新
   */
  void reset() {
    _count = 0;
    notifyListeners(); // 通知监听者状态已改变
  }
}

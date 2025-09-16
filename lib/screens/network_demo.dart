// 导入Flutter Material Design组件库
import 'package:flutter/material.dart';
// 导入HTTP请求库，用于发送网络请求
// 使用as关键字创建别名，避免命名冲突
import 'package:http/http.dart' as http;
// 导入Dart的JSON转换库，用于处理JSON数据
import 'dart:convert';

/**
 * NetworkDemo类 - 网络请求演示页面
 * 
 * 这个页面演示了Flutter中的网络请求功能，包括：
 * - HTTP GET请求
 * - HTTP POST请求
 * - JSON数据解析
 * - 异步操作处理
 * - 错误处理
 * - 加载状态管理
 * 
 * 使用StatefulWidget是因为需要管理网络请求的状态
 */
class NetworkDemo extends StatefulWidget {
  // 构造函数
  const NetworkDemo({super.key});

  /**
   * createState方法 - 创建状态对象
   */
  @override
  State<NetworkDemo> createState() => _NetworkDemoState();
}

/**
 * _NetworkDemoState类 - 网络演示页面的状态管理类
 * 
 * 管理网络请求的状态，包括响应数据、加载状态等
 */
class _NetworkDemoState extends State<NetworkDemo> {
  // 存储网络请求的响应数据
  String _response = '点击按钮发送请求';
  
  // 标识是否正在加载中，用于显示加载指示器
  bool _isLoading = false;

  /**
   * build方法 - 构建网络演示页面UI
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面顶部的应用栏
      appBar: AppBar(
        title: const Text('网络请求演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // 页面主体内容
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          // 让子组件占满可用宽度
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ==================== 网络请求按钮 ====================
            
            // GET请求按钮
            ElevatedButton(
              // 当正在加载时禁用按钮，防止重复请求
              onPressed: _isLoading ? null : _fetchData,
              child: _isLoading
                  ? // 加载中时显示加载指示器和文本
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 8),
                        Text('请求中...'),
                      ],
                    )
                  : // 正常状态显示按钮文本
                  const Text('发送GET请求'),
            ),
            const SizedBox(height: 12),
            
            // POST请求按钮
            ElevatedButton(
              onPressed: _isLoading ? null : _postData,
              child: const Text('发送POST请求'),
            ),
            const SizedBox(height: 12),
            
            // JSON数据请求按钮
            ElevatedButton(
              onPressed: _isLoading ? null : _fetchJsonPlaceholder,
              child: const Text('获取JSON数据'),
            ),
            const SizedBox(height: 20),
            
            // ==================== 响应结果显示区域 ====================
            
            // 响应结果标题
            const Text(
              '响应结果:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // 响应结果容器
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                // 设置容器的装饰样式
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // 灰色边框
                  borderRadius: BorderRadius.circular(8), // 圆角
                ),
                // 使用SingleChildScrollView使内容可滚动
                child: SingleChildScrollView(
                  child: Text(
                    _response, // 显示响应数据
                    style: const TextStyle(fontFamily: 'monospace'), // 等宽字体，便于阅读代码
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // ==================== 功能说明 ====================
            
            // 说明标题
            const Text(
              '说明',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // 功能说明文本
            const Text(
              '这个演示展示了Flutter中的网络请求功能：\n'
              '1. 使用http包发送HTTP请求\n'
              '2. 处理异步请求和响应\n'
              '3. 解析JSON数据\n'
              '4. 错误处理和加载状态',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * _fetchData方法 - 发送GET请求
   * 
   * 演示如何发送HTTP GET请求并处理响应
   * 使用async/await语法处理异步操作
   * 
   * 关键概念：
   * - async: 标记函数为异步函数
   * - await: 等待异步操作完成
   * - try-catch-finally: 错误处理机制
   * - setState: 更新UI状态
   */
  Future<void> _fetchData() async {
    // 开始请求前设置加载状态
    setState(() {
      _isLoading = true;
    });

    try {
      // 发送GET请求
      // httpbin.org是一个用于测试HTTP请求的在线服务
      final response = await http.get(
        Uri.parse('https://httpbin.org/get'), // 请求URL
        headers: {'Content-Type': 'application/json'}, // 请求头
      );

      // 检查响应状态码
      if (response.statusCode == 200) {
        // 请求成功，更新响应数据
        setState(() {
          _response = 'GET请求成功:\n${response.body}';
        });
      } else {
        // 请求失败，显示错误信息
        setState(() {
          _response = '请求失败，状态码: ${response.statusCode}';
        });
      }
    } catch (e) {
      // 捕获异常（网络错误、解析错误等）
      setState(() {
        _response = '请求出错: $e';
      });
    } finally {
      // 无论成功还是失败，都要结束加载状态
      setState(() {
        _isLoading = false;
      });
    }
  }

  /**
   * _postData方法 - 发送POST请求
   * 
   * 演示如何发送HTTP POST请求并传递JSON数据
   * POST请求通常用于提交数据到服务器
   * 
   * 关键概念：
   * - POST请求: 用于提交数据
   * - JSON编码: 将Dart对象转换为JSON字符串
   * - 请求体: POST请求的数据部分
   */
  Future<void> _postData() async {
    // 开始请求前设置加载状态
    setState(() {
      _isLoading = true;
    });

    try {
      // 发送POST请求
      final response = await http.post(
        Uri.parse('https://httpbin.org/post'), // POST请求URL
        headers: {'Content-Type': 'application/json'}, // 指定内容类型为JSON
        // 请求体：要发送的JSON数据
        body: jsonEncode({
          'name': 'Flutter Demo',
          'message': 'Hello from Flutter!',
          'timestamp': DateTime.now().toIso8601String(), // 当前时间戳
        }),
      );

      // 检查响应状态码
      if (response.statusCode == 200) {
        setState(() {
          _response = 'POST请求成功:\n${response.body}';
        });
      } else {
        setState(() {
          _response = '请求失败，状态码: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = '请求出错: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /**
   * _fetchJsonPlaceholder方法 - 获取并解析JSON数据
   * 
   * 演示如何从API获取JSON数据并进行解析
   * JSONPlaceholder是一个免费的在线REST API，用于测试和原型开发
   * 
   * 关键概念：
   * - JSON解析: 将JSON字符串转换为Dart对象
   * - 动态类型: 使用dynamic类型处理未知结构的JSON数据
   * - 数据访问: 通过键名访问JSON对象的属性
   */
  Future<void> _fetchJsonPlaceholder() async {
    // 开始请求前设置加载状态
    setState(() {
      _isLoading = true;
    });

    try {
      // 发送GET请求获取JSON数据
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'), // 获取ID为1的文章
      );

      // 检查响应状态码
      if (response.statusCode == 200) {
        // 解析JSON响应数据
        // jsonDecode将JSON字符串转换为Dart的Map对象
        final jsonData = jsonDecode(response.body);
        
        // 更新UI显示解析后的数据
        setState(() {
          _response = 'JSON数据:\n'
              'ID: ${jsonData['id']}\n'           // 文章ID
              '标题: ${jsonData['title']}\n'       // 文章标题
              '内容: ${jsonData['body']}\n'        // 文章内容
              '用户ID: ${jsonData['userId']}';     // 作者用户ID
        });
      } else {
        setState(() {
          _response = '请求失败，状态码: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = '请求出错: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

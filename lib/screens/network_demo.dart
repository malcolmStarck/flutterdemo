import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkDemo extends StatefulWidget {
  const NetworkDemo({super.key});

  @override
  State<NetworkDemo> createState() => _NetworkDemoState();
}

class _NetworkDemoState extends State<NetworkDemo> {
  String _response = '点击按钮发送请求';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络请求演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _fetchData,
              child: _isLoading
                  ? const Row(
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
                  : const Text('发送GET请求'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isLoading ? null : _postData,
              child: const Text('发送POST请求'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isLoading ? null : _fetchJsonPlaceholder,
              child: const Text('获取JSON数据'),
            ),
            const SizedBox(height: 20),
            const Text(
              '响应结果:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _response,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '说明',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
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

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://httpbin.org/get'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        setState(() {
          _response = 'GET请求成功:\n${response.body}';
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

  Future<void> _postData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://httpbin.org/post'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': 'Flutter Demo',
          'message': 'Hello from Flutter!',
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

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

  Future<void> _fetchJsonPlaceholder() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          _response = 'JSON数据:\n'
              'ID: ${jsonData['id']}\n'
              '标题: ${jsonData['title']}\n'
              '内容: ${jsonData['body']}\n'
              '用户ID: ${jsonData['userId']}';
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

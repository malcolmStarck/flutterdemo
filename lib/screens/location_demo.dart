import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationDemo extends StatefulWidget {
  const LocationDemo({super.key});

  @override
  State<LocationDemo> createState() => _LocationDemoState();
}

class _LocationDemoState extends State<LocationDemo> {
  Position? _currentPosition;
  bool _isLoading = false;
  String _permissionStatus = '未检查';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('定位功能演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 权限状态
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '权限状态',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text('定位权限: $_permissionStatus'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _checkPermission,
                      child: const Text('检查权限'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 获取位置
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '获取当前位置',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _getCurrentLocation,
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
                                Text('获取中...'),
                              ],
                            )
                          : const Text('获取当前位置'),
                    ),
                    const SizedBox(height: 12),
                    if (_currentPosition != null) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('纬度: ${_currentPosition!.latitude}'),
                            Text('经度: ${_currentPosition!.longitude}'),
                            Text('精度: ${_currentPosition!.accuracy} 米'),
                            Text('海拔: ${_currentPosition!.altitude} 米'),
                            Text('速度: ${_currentPosition!.speed} m/s'),
                            Text('时间: ${_currentPosition!.timestamp}'),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 位置服务状态
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '位置服务状态',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _checkLocationService,
                      child: const Text('检查位置服务'),
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
                      'geolocator包提供了定位功能：\n'
                      '1. 获取设备当前位置\n'
                      '2. 检查位置服务是否启用\n'
                      '3. 请求位置权限\n'
                      '4. 监听位置变化\n'
                      '5. 计算两点间距离\n\n'
                      '注意：\n'
                      '• 需要在Android和iOS中配置位置权限\n'
                      '• 真机测试才能获取真实位置\n'
                      '• 模拟器可能返回默认位置',
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

  Future<void> _checkPermission() async {
    try {
      final status = await Permission.location.status;
      setState(() {
        _permissionStatus = status.toString();
      });
      
      if (status.isDenied) {
        final result = await Permission.location.request();
        setState(() {
          _permissionStatus = result.toString();
        });
      }
    } catch (e) {
      _showSnackBar('检查权限失败: $e');
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 检查位置服务是否启用
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showSnackBar('位置服务未启用，请在设置中开启');
        return;
      }

      // 检查权限
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showSnackBar('位置权限被拒绝');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _showSnackBar('位置权限被永久拒绝，请在设置中手动开启');
        return;
      }

      // 获取当前位置
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });

      _showSnackBar('位置获取成功');
    } catch (e) {
      _showSnackBar('获取位置失败: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _checkLocationService() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      _showSnackBar(serviceEnabled ? '位置服务已启用' : '位置服务未启用');
    } catch (e) {
      _showSnackBar('检查位置服务失败: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

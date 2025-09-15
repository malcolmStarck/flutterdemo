import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraDemo extends StatefulWidget {
  const CameraDemo({super.key});

  @override
  State<CameraDemo> createState() => _CameraDemoState();
}

class _CameraDemoState extends State<CameraDemo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  List<XFile> _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('相机功能演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 单张图片选择
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '单张图片选择',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _pickImage(ImageSource.camera),
                            icon: const Icon(Icons.camera_alt),
                            label: const Text('拍照'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _pickImage(ImageSource.gallery),
                            icon: const Icon(Icons.photo_library),
                            label: const Text('相册'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_selectedImage != null) ...[
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_selectedImage!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '文件路径: ${_selectedImage!.path}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 多张图片选择
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '多张图片选择',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _pickMultipleImages,
                      icon: const Icon(Icons.photo_library),
                      label: const Text('选择多张图片'),
                    ),
                    const SizedBox(height: 12),
                    if (_selectedImages.isNotEmpty) ...[
                      Text('已选择 ${_selectedImages.length} 张图片'),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _selectedImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(_selectedImages[index].path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 清除选择
            if (_selectedImage != null || _selectedImages.isNotEmpty)
              ElevatedButton(
                onPressed: _clearSelection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('清除选择'),
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
                      'image_picker包提供了图片选择功能：\n'
                      '1. 支持从相机拍照\n'
                      '2. 支持从相册选择图片\n'
                      '3. 支持单张和多张图片选择\n'
                      '4. 需要添加相机和存储权限\n'
                      '5. 返回XFile对象，包含图片路径和元数据',
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

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
        _showSnackBar('图片选择成功');
      }
    } catch (e) {
      _showSnackBar('选择图片失败: $e');
    }
  }

  Future<void> _pickMultipleImages() async {
    try {
      // 注意：当前版本的image_picker可能不支持pickMultipleImages
      // 这里使用单张图片选择作为替代方案
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImages.add(image);
        });
        _showSnackBar('已添加图片，当前共 ${_selectedImages.length} 张');
      }
    } catch (e) {
      _showSnackBar('选择图片失败: $e');
    }
  }

  void _clearSelection() {
    setState(() {
      _selectedImage = null;
      _selectedImages.clear();
    });
    _showSnackBar('选择已清除');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

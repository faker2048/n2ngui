import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 新添加，用于更现代化的UI元素

class ConnectToN2nPage extends StatefulWidget {
  const ConnectToN2nPage({Key? key}) : super(key: key);

  @override
  _ConnectToN2nPageState createState() => _ConnectToN2nPageState();
}

class _ConnectToN2nPageState extends State<ConnectToN2nPage> {
  final _supernodeController = TextEditingController();
  final _communityNameController = TextEditingController();
  final _communityPasswordController = TextEditingController();
  double scarl = 0.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 新添加，提供更现代化的导航栏
        title: Text('Supernode'),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 800 * scarl,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0 * scarl),
              children: <Widget>[
                SizedBox(height: 80.0 * scarl),
                Icon(Icons.cloud_queue, size: 120.0 * scarl), // 更现代化的图标
                SizedBox(height: 60.0),
                TextField(
                  controller: _supernodeController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.language),
                    labelText: 'Supernode Address',
                    border: OutlineInputBorder(),
                    // 新添加，现代化的输入框样式
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 12.0 * scarl),
                TextField(
                  controller: _communityNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    labelText: 'Community Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 12.0 * scarl),
                TextField(
                  controller: _communityPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Community Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24.0 * scarl),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 实现连接到n2n supernode的逻辑
                    // 暂时以mock的形式实现
                    // 我需要知道：
                    // 1. 启动成功与否？
                    // 2. 同步与 supernode 的连接状态 (Good to have)
                    // 3. 查看日志 
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Connecting...'),
                        content: Text('Connecting to n2n supernode ...'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('CONNECT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

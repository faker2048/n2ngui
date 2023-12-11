import 'dart:io';
import 'dart:isolate';

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

  void _HandleConnectButtonPressed() {
    // TODO: 实现连接到n2n supernode的逻辑
    // 暂时以mock的形式实现
    // 我需要知道：
    // 1. 启动成功与否？
    // 2. 同步与 supernode 的连接状态 (Good to have)
    // 3. 查看日志
    String address = _supernodeController.text;
    String communityName = _communityNameController.text;
    String communityPassword = _communityPasswordController.text;
    print('address: $address');
    print('communityName: $communityName');
    print('communityPassword: $communityPassword');

    // 创建一个 ReceivePort 以接收来自 Isolate 的消息
    var receivePort = ReceivePort();

    runCommand(SendPort sendPort) async {
      // 示例：执行一个命令行操作
      // TODO: 用 n2n 的命令行工具代替
      var result;
      if (Platform.isWindows) {
        result = await Process.run('cmd', ['/c', 'dir']);
      } else {
        result = await Process.run('ls', []);
      }
      sendPort.send(result.stdout);
    }

    // 启动新的 Isolate
    Isolate.spawn(runCommand, receivePort.sendPort);

    // 监听来自新 Isolate 的消息
    receivePort.listen((data) {
      // 处理从 Isolate 接收到的数据
      print('Received from Isolate: $data');

      // 这里可以更新 UI 或状态
      // setState(() {
      //   // 更新状态或 UI
      // });

      // 关闭 ReceivePort
      receivePort.close();
    });

    // TODO: 使用 address, communityName, communityPassword 执行其他操作
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Icon(Icons.cloud_queue, size: 120.0 * scarl),
                SizedBox(height: 60.0),
                TextField(
                  controller: _supernodeController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.language),
                    labelText: 'Supernode Address',
                    border: OutlineInputBorder(),
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
                  onPressed: _HandleConnectButtonPressed,
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

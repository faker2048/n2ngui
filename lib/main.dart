import 'package:flutter/material.dart';
import 'package:namer_app/n2n_node_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: const MyApp(),
    ),
  );
}

class MyAppState extends ChangeNotifier {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("N2N Client"),
      ),
      body: Center(
        child: buildN2NNodeCard(),
      ),
    );
  }

  N2NNodeCard buildN2NNodeCard() {
    return N2NNodeCard(
      alias: "Host Name",
      ipAddress: "192.168.8.8",
      latency: double.infinity,
    );
  }
}

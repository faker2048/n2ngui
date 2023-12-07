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

class MyAppState extends ChangeNotifier {
  bool darkMode = false;

  void toggleTheme() {
    darkMode = !darkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<MyAppState>(context);
    var darkMode = appState.darkMode;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: darkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'N2N Client'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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

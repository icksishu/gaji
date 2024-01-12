import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  debugPrint("some Print");
  runApp(const GajiApp());
}

class GajiApp extends StatelessWidget {
  const GajiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaji',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationDrawerPage(),//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavigationDrawerPage extends StatefulWidget {
  const NavigationDrawerPage({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerPage> createState() => _NavigationDrawerPageState();
}

class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  void fileWrite() async {
    Directory appDocumentDirectory = await getApplicationDocumentsDirectory();
    var today = DateTime.now();
    var dateString = DateFormat("yyyyMMddhhmmss").format(today);

    String appDocumentPath = appDocumentDirectory.path;
    var file = File("$appDocumentPath/$dateString.txt");
    file.writeAsString("$dateString: test1");
    debugPrint("file.path: $file.path");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Navigation Drawer',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _key.currentState!.openDrawer(); //<-- SEE HERE
              },
              child: const Text(
                '메뉴 보이기',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("onPressed fileWrite");
                fileWrite();
              },
              child: const Text(
                '파일 생성',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
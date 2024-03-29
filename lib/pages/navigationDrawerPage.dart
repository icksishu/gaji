import 'package:flutter/material.dart';
import 'package:gaji/pages/gajiHomePage.dart';
import 'package:gaji/pages/welcomePage.dart';
import '../file/file_handler.dart';
import "dart:developer" as developer;

/**
 * 샘플 개발용. NavigationPage 가 최종 목표
 */
class NavigationDrawerPage extends StatefulWidget {
  const NavigationDrawerPage({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerPage> createState() => _NavigationDrawerPageState();
}

class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final FileHandler _fileHandler = FileHandler();
  final Widget gajiHomePage = const GajiHomePage(title: "temporary title");
  final Widget welcomePage = const WelcomePage();


  void fileWrite() async {
    _fileHandler.write();
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
                //Navigator.pop(context);

              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                //Navigator.pop(context);
                developer.log("ontab setState");
                setState(() => {gajiHomePage});
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
                developer.log("onPressed fileWrite");
                _fileHandler.write();
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
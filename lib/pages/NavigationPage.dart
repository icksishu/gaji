import "package:flutter/material.dart";
import "package:gaji/pages/connectionPage.dart";
import "package:gaji/pages/summaryPage.dart";
import "dart:developer" as developer;

import "package:gaji/pages/welcomePage.dart";

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});


  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Map pageMap = {
    "welcome": const WelcomePage(),
    "summary": const SummaryPage(),
    "connection": const ConnectionPage(),
  };
  String currentTitle = "init";
  String currentPageName = "welcome";

  Widget _getPage() {
    return pageMap[currentPageName];
  }

  void _changePage(String pageName) {
    setState(() {
      currentPageName = pageName;
      Widget currentPage = _getPage();
      if(pageName == "welcome") {
        currentTitle = (currentPage as WelcomePage).title;
      }
      else if(pageName == "summary") {
        currentTitle = (currentPage as SummaryPage).title;
      }
      else if(pageName == "connection") {
        currentTitle = (currentPage as ConnectionPage).title;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      currentTitle = "gaji";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(currentTitle),
        centerTitle: true,
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Welcome'),
              onTap: () {
                Navigator.pop(context);
                _changePage("welcome");
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Summary'),
              onTap: () {
                Navigator.pop(context);
                _changePage("summary");
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Connection'),
              onTap: () {
                Navigator.pop(context);
                _changePage("connection");
              },
            ),
          ]
        ),
      ),
      body: Center(
        child: _getPage(),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});
  final String _title = "Welcome Page";
  String get title => _title;
  @override
  State<StatefulWidget> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Connection", style: TextStyle(fontSize: 24)),
      ),
    );
  }

}

import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});
  final String _title = "Summary Page";
  String get title => _title;

  @override
  State<StatefulWidget> createState() {
    return _SummaryPageState();
  }

}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Summary", style: TextStyle(fontSize: 24),),
      ),
    );
  }

}


import 'package:flutter/material.dart';

class InsertChartScreen extends StatefulWidget {
  const InsertChartScreen({super.key});

  @override
  State<InsertChartScreen> createState() => _InsertChartScreenState();
}

class _InsertChartScreenState extends State<InsertChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Icon(Icons.insert_chart)));
  }
}

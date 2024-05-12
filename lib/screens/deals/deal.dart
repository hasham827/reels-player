import 'package:flutter/material.dart';
class DealPage extends StatefulWidget {
  const DealPage({super.key});

  @override
  State<DealPage> createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Deal PAGE"),
      ),
    );
  }
}

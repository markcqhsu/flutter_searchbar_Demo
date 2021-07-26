import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test2"),
      ),
      body: const Text("Test Page 2"),
    );
  }
}

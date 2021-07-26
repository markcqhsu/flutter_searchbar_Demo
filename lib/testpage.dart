import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test1"),
      ),
      body: const Text("Test Page 1"),
    );
  }
}

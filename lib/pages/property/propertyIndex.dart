import 'package:flutter/material.dart';

class PropertyIndex extends StatefulWidget {
  const PropertyIndex({Key? key}) : super(key: key);

  @override
  State<PropertyIndex> createState() => _PropertyIndexState();
}

class _PropertyIndexState extends State<PropertyIndex> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text(
            "资产",
          ),
          centerTitle: true
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
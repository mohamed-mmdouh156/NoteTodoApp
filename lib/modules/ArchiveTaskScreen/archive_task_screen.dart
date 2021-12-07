import 'package:flutter/material.dart';

class ArchiveTaskScreen extends StatelessWidget {
  const ArchiveTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Archive Tasks Screen',
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
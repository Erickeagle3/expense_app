import 'package:flutter/material.dart';

// ignore: camel_case_types
class mediaQuery extends StatelessWidget {
  const mediaQuery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
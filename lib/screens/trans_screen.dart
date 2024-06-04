import 'package:flutter/material.dart';

import '../widget/time_line.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansivo"),

      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TimeLineMonth(),
          ],
        ),
      ),
    );
  }
}

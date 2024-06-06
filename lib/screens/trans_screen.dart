import 'package:flutter/material.dart';

import '../widget/category_list.dart';
import '../widget/time_line.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansivo"),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TimeLineMonth(onChanged: (
                String? value) {  },),
            CategoryList(onChanged: (
                String? value) {  },)
          ],
        ),
      ),
    );
  }
}

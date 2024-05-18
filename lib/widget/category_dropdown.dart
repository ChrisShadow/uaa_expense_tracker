import 'package:expense_tracker/utils/icon_lists.dart';
import 'package:flutter/material.dart';

class CategoryDropDown extends StatelessWidget {
  CategoryDropDown({super.key, this.cattype, required this.onChanged});
  final String? cattype;
  final ValueChanged<String?> onChanged;
  final appIcons=AppIcons();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: cattype,
        isExpanded: true,
        hint: const Text("Selecciona la categoría"),
        items: appIcons.homeExpensesCategories.map((e) =>
            DropdownMenuItem<String>(
                value: e['name'],
                child: Row(
                  children: [
                    Icon(
                      e['icon'],
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(e['name'],
                    style: const TextStyle(
                      color: Colors.black45
                    ),),
                  ],
                ))).toList(),


        onChanged: onChanged);
  }
}

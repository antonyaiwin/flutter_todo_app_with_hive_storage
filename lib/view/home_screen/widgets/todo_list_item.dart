import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import '../../../model/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.item,
    this.onDeletePressed,
    this.onCheckStateChanged,
  });
  final TodoModel item;
  final void Function()? onDeletePressed;
  final void Function(bool? value)? onCheckStateChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.titleHeight,
      leading: Checkbox(
        value: item.isCompleted,
        onChanged: onCheckStateChanged,
      ),
      title: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            item.title,
            style: TextStyle(
                decorationStyle: TextDecorationStyle.solid,
                decoration:
                    item.isCompleted ? TextDecoration.lineThrough : null),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                color: ColorConstants.primaryWhite.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              item.category,
              style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  decoration:
                      item.isCompleted ? TextDecoration.lineThrough : null),
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onDeletePressed,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(
          bottom: 15,
          left: 20,
          right: 20,
          top: 5,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 5, 39, 66),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
            ),
            Expanded(
              child: Text(
                'Add a Task',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const CircleAvatar(
              radius: 30,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

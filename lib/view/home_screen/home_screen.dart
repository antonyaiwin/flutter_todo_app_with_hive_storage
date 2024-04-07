import 'package:flutter/material.dart';
import 'package:flutter_todo_app_with_hive_storage/controller/todo_controller.dart';
import 'package:flutter_todo_app_with_hive_storage/view/home_screen/widgets/add_task_button.dart';
import 'package:flutter_todo_app_with_hive_storage/view/home_screen/widgets/add_todo_form.dart';
import 'package:flutter_todo_app_with_hive_storage/view/home_screen/widgets/todo_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    TodoController.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TODO'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TodoController.isListEmpty
                ? const Center(
                    child: Text(
                      'No Data Yet!.\nClick on below botton to add one.',
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      var item = TodoController.getData(
                          TodoController.todoKeyList[index])!;
                      return TodoListItem(
                        item: item,
                        onCheckStateChanged: (value) async {
                          item.isCompleted = value!;
                          await TodoController.updateDate(
                              TodoController.todoKeyList[index], item);
                          setState(() {});
                        },
                        onDeletePressed: () async {
                          await TodoController.deleteData(
                              TodoController.todoKeyList[index]);
                          setState(() {});
                        },
                      );
                    },
                    itemCount: TodoController.todoKeyList.length,
                  ),
          ),
          AddTaskButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return AddTodoForm(
                    onComplete: () {
                      setState(() {});
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

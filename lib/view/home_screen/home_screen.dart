import 'package:flutter/material.dart';
import 'package:flutter_todo_app_with_hive_storage/controller/todo_controller.dart';
import 'package:flutter_todo_app_with_hive_storage/core/constants/color_constants.dart';
import 'package:flutter_todo_app_with_hive_storage/view/home_screen/widgets/add_todo_form.dart';

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
            child: ListView.builder(
              itemBuilder: (context, index) {
                var item =
                    TodoController.getData(TodoController.todoKeyList[index])!;
                return ListTile(
                  titleAlignment: ListTileTitleAlignment.titleHeight,
                  leading: Checkbox(
                    value: item.isCompleted,
                    onChanged: (value) {
                      item.isCompleted = value!;
                      TodoController.updateDate(
                          TodoController.todoKeyList[index], item);
                      setState(() {});
                    },
                  ),
                  title: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: item.isCompleted
                                ? TextDecoration.lineThrough
                                : null),
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
                              decoration: item.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      TodoController.deleteData(
                          TodoController.todoKeyList[index]);
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
              itemCount: TodoController.todoKeyList.length,
            ),
          ),
          GestureDetector(
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
          ),
        ],
      ),
    );
  }
}

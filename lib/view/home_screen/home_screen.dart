import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                return ListTile(
                  leading: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  title: const Text('data'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
          Container(
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

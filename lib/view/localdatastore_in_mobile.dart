///2
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   ///  path set in document
//   Directory document = await getApplicationDocumentsDirectory();
//
//   ///mobile path set
//   Hive.init(document.path);
//
//   /// aek box che jema data store karaviye te todos
//   Hive.openBox<String>("todo");
//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  State<MyHomePage1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  final taskName = TextEditingController();
  //final keyName = TextEditingController();

  Box<String>? todoBox;

  @override
  void initState() {
    todoBox = Hive.box<String>("todo");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children: [
                    Text("Add Task"),
                    TextFormField(
                      controller: taskName,
                      decoration: InputDecoration(hintText: "Task Name"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        await todoBox!
                            .put("${Random().nextInt(1000)}", taskName.text);
                        Navigator.pop(context);

                        taskName.clear();
                      },
                      child: const Text("Add")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: todoBox!.listenable(),
        builder: (context, Box<String> todos, _) {
          return ListView.builder(
            itemCount: todos.keys.length,
            itemBuilder: (context, index) {
              final key = todos.keys.toList()[index];
              final value = todos.get(key);
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Column(
                                children: [
                                  Text("Update Task"),
                                  TextFormField(
                                    controller: taskName,
                                    decoration:
                                        InputDecoration(hintText: "Task Name"),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      await todoBox!.put("$key", taskName.text);
                                      Navigator.pop(context);

                                      taskName.clear();
                                    },
                                    child: const Text("Update")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                        onPressed: () async {
                          await todoBox!.delete(key);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
                title: Text(value!),
                //subtitle: Text(key!),
              );
            },
          );
        },
      ),
    );
  }
}

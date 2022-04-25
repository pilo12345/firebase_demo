// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//
// import 'package:flutter/material.dart';
//
// class TodoScreen extends StatefulWidget {
//   const TodoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TodoScreen> createState() => _TodoScreenState();
// }
//
// class _TodoScreenState extends State<TodoScreen> {
//   final _taskTitle = TextEditingController();
//   final _taskName = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Column(
//                   children: [
//                     const Text("ADD TASK"),
//                     TextFormField(
//                       controller: _taskTitle,
//                       decoration:
//                           const InputDecoration(hintText: "Enter task title"),
//                     ),
//                     TextFormField(
//                       controller: _taskName,
//                       decoration:
//                           const InputDecoration(hintText: "Enter task name"),
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   MaterialButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     color: Colors.red,
//                     child: const Text("Cancel"),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       FirebaseFirestore.instance.collection("todos").add({
//                         "taskTitle": _taskTitle.text,
//                         "taskName": _taskName.text,
//                       });
//                       Navigator.pop(context);
//                       _taskTitle.clear();
//                       _taskName.clear();
//                     },
//                     color: Colors.green,
//                     child: const Text("Add"),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("todos").snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<DocumentSnapshot> info = snapshot.data!.docs;
//             return ListView.builder(
//               itemCount: info.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   title: Column(
//                                     children: [
//                                       const Text("UPDATE TASK"),
//                                       TextFormField(
//                                         controller: _taskTitle,
//                                         decoration: const InputDecoration(
//                                             hintText: "Enter task title"),
//                                       ),
//                                       TextFormField(
//                                         controller: _taskName,
//                                         decoration: const InputDecoration(
//                                             hintText: "Enter task name"),
//                                       ),
//                                     ],
//                                   ),
//                                   actions: [
//                                     MaterialButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       color: Colors.red,
//                                       child: const Text("Cancel"),
//                                     ),
//                                     MaterialButton(
//                                       onPressed: () {
//                                         FirebaseFirestore.instance
//                                             .collection("todos")
//                                             .doc(info[index].id)
//                                             .update({
//                                           "taskTitle": _taskTitle.text,
//                                           "taskName": _taskName.text,
//                                         });
//                                         Navigator.pop(context);
//                                         _taskTitle.clear();
//                                         _taskName.clear();
//                                       },
//                                       color: Colors.green,
//                                       child: const Text("Update"),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           icon: const Icon(Icons.edit)),
//                       IconButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   title: const Text(
//                                       "Do you want to delete this task?"),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: const Text("NO"),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         FirebaseFirestore.instance
//                                             .collection("todos")
//                                             .doc(info[index].id)
//                                             .delete();
//
//                                         Navigator.pop(context);
//                                         _taskTitle.clear();
//                                         _taskName.clear();
//                                       },
//                                       child: const Text("YES"),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           icon: const Icon(Icons.delete))
//                     ],
//                   ),
//                   subtitle: Text("${info[index].get("taskTitle")}"),
//                   title: Text("${info[index].get("taskName")}"),
//                 );
//               },
//             );
//           } else {
//             return SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }

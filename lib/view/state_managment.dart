// /// package add
//    ///  provider: ^6.0.0
//
//
// /// controler
//
// import 'package:flutter/foundation.dart';
//
// class CounterController extends ChangeNotifier {
//   int counter = 0;
//
//   incrementCounter() {
//     counter++;
//     notifyListeners();
//   }
//
//   decrementCounter() {
//     counter--;
//     notifyListeners();
//   }
//
//   resetCounter() {
//     counter = 0;
//     notifyListeners();
//   }
// }
//
// /// mainscreen
// //import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:provider_demo/controller/counter_controller.dart';
// // import 'package:provider_demo/view/home_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => CounterController(),
//         ),
//       ],
//       child: MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'Provider Demo'),
//       ),
//     );
//   }
// }
//
// ///homescreen
//
//  import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'package:provider/provider.dart';
// // import 'package:provider_demo/controller/counter_controller.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     print("Build Called");
//
//     final provider = Provider.of<CounterController>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Consumer<CounterController>(
//               builder: (context, value, child) => Text(
//                 '${value.counter}',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               provider.incrementCounter();
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               provider.decrementCounter();
//             },
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               provider.resetCounter();
//             },
//             tooltip: 'Reset',
//             child: const Icon(Icons.refresh),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
//

/// homepage
///
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    print("Build Refreshed");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${counterController.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(NextPage());
              },
              child: const Text("Go to Next Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Hii",
                  "Hello",
                  backgroundColor: Colors.blue,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text("Get Snackbar"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: Text("Hiii"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("OK"))
                  ],
                ));
              },
              child: const Text("Get Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                if (Theme.of(context).brightness == Brightness.dark) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
              child: const Text("Dark Mode"),
            ),
            Container(
              height: Get.height * 0.08,
              width: Get.height * 0.08,
              color: Colors.red,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //counterController.incrementCounter();
          counterController.counter.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// nextpage
///
//import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next Page",
              textScaleFactor: 3,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Go Back"),
            )
          ],
        ),
      ),
    );
  }
}

/// controller
///
//import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;

  incrementCounter() {
    counter++;
    update();
  }
}

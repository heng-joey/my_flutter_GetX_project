import 'package:flutter/material.dart';
import 'package:flutter_getx/counter_app/counter_controller.dart';
import 'package:flutter_getx/main.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: GetBuilder<CounterController>(
          init: CounterController(),
          builder: (controller) {
            return Column(
              children: [
                const SizedBox(height: 100,),
                Center(
                  child: Column(
                    children: [
                      Text(controller.counter.toString(), style:const TextStyle(fontSize: 30),),
                      FlatButton(
                          onPressed: () {
                            controller.onIncrement();
                          },
                          child: const Text('Increase')),
                      FlatButton(
                          onPressed: () {
                            controller.onDecrement();
                          }, child: const Text('Increase')),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

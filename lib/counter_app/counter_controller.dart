// We have controller to handle Business Logic in our project
// All business logic to put in controller

import 'package:get/get.dart';

class CounterController extends GetxController {
  // OnInit when our page loading onInit is going to first
  int counter = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onIncrement() {
    counter++;
    // For setState
    update();
    print (counter);
  }

  onDecrement() {
    counter--;
    update();
//    print(counter);
  }
}

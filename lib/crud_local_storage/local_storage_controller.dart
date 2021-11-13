// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  final box = GetStorage();
  List lstDevelopers = []; // List(); -> got error

// On time to use GetX
  @override
  void onInit() {
//    box.remove('developer');
    onFetchData();
    super.onInit();
  }

// Key => Need control what you are keeping
  // value =>
  onSaveData() {
    List lstDp = [];
    lstDp.addAll(lstDevelopers);
    Map<String, dynamic> developer = {
      'name': nameController.text,
      'position': positionController.text
    };
    lstDp.add(developer); // developer => is map
    box.write('developer', lstDp);
    onFetchData();
  }
// async + await => use to wait if not use it's okay but need to protect
  onFetchData() async
  {
    lstDevelopers = await box.read ('developer');
    print(lstDevelopers);
    // update use to rebuild ui = setState in stateful
    update();
  }

onDeleteData (int index)
{
  lstDevelopers.removeAt(index);

box.remove('developer');
  box.write('developer', lstDevelopers);
onFetchData();
}

}

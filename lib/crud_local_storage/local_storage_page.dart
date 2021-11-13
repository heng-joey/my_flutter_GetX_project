import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'local_storage_controller.dart';

class LocalStoragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Local Storage App'),
      ),
      body: Column(
        children: [
          // Label Text and Button save -> On UI
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              // LocalStorageController -> is our controller have ability to handle our UI
              child: GetBuilder <LocalStorageController>(
                init: LocalStorageController(),
                builder: (controller) {
                  return Column(
                    children: <Widget>[
                       SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controller.nameController,
                        maxLength: 25,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Name",
//                          hintStyle: TextStyle(color: Colors.grey),
//                          labelText: "Name",
//                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                       SizedBox(
                        height: 20,
                      ),
                       TextField(
                        controller: controller.positionController,
                        decoration: InputDecoration(
                          hintText: "Position",
                        ),
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      ElevatedButton(onPressed: () {
                      controller.onSaveData();
                      }, child:  Text('Save')),
                    ],
                  );
                }
              ),
            ),
          ),

          Container(
            height: 400,
            child: GetBuilder<LocalStorageController>(
              init: LocalStorageController(),
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.lstDevelopers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Card(
                    child: ListTile(
                      onTap: (){
                      controller.nameController.text = controller.lstDevelopers[index]['name'];
                      controller.positionController.text = controller.lstDevelopers[index]['position'];
                      },
                      title: Text(controller.lstDevelopers[index]['name']),
                      subtitle: Text(controller.lstDevelopers[index]['position']),
                      trailing: IconButton(onPressed: (){
                        controller.onDeleteData(index);
                      }, icon:  Icon(Icons.delete,color: Colors.red,)),
                    ),
                    );
                  },
                );
              }
            ),
          ),

        ],
      ),
    );
  }
}

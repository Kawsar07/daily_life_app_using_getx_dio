import 'package:daily_to_do/controller/controller_todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleView extends StatelessWidget {
  const SingleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Api Get'),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) {
            return ListTile(
              title: Text("${controller.alldata['title']}"),
              subtitle: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
    controller.delateData(controller.alldata['id'].toString());
     print(controller.alldata['id'].toString());
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  controller.updateData(controller.alldata['title'].toString());
                  print(controller.alldata['title'].toString());
                },
              ),
              leading: Text(
                "${controller.alldata['id']} ",
                style: const TextStyle(
                  fontSize: 35.0,
                ),
              ),
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text(error.toString())),
          onEmpty: const Center(child: Text("No Data")),
        ));
  }
}

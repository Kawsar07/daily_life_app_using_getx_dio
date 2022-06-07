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
          title: Text('Api Get'),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) {
            return ListTile(
              title: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
              // title: Text("${state?.userId}"),
              subtitle: Text("${controller.alldata['title']}"),
              leading: IconButton(
                icon: Icon(Icons.update),
                onPressed: () {},
              ),

              // leading: Text("${state?.id}"),
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text(error.toString())),
          onEmpty: const Center(child: Text("No Data")),
        ));
  }
}

import 'package:daily_to_do/controller/controller_todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
appBar: AppBar(
  title: const Text('My Saved Todo'),
),
        body: controller.obx(
              (state) {
            return ListView(
              children: List.generate(state?.length ?? 0, (index) {
                final item = state![index];
                return ListTile(
                  title: Text("${item.title}"),
                  leading: Text("${item.id}"),
                  subtitle: Text("${item.completed}"),

                );
              }),
            );
          },
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text(error.toString())),
          onEmpty: const Center(child: Text("No Data")),

        )
    );
  }
}

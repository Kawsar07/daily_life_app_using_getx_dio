import 'package:daily_to_do/home_page/todo_get_page.dart';
import 'package:daily_to_do/home_page/todo_post_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Daily Todo App')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const HomeView());
                },
                child: const Text('Show Your Todo'),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(PostViewPage());
                  }, child: const Text('Add My ToDo')),
            ),
          ],
        ),
      ),
    );
  }
}

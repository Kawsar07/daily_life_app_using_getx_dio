import 'package:daily_to_do/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostViewPage extends StatefulWidget {
  const PostViewPage({Key? key}) : super(key: key);

  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  final _controller = Get.put(PostController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Post ToDo'
        ),
      ),
      body: _controller.obx((state){
        return SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child:Column(
                children: <Widget> [
                  const SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      _controller.addDataDoc["userId"] = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        labelText: 'Enter User Id',
                        hintText: 'Enter User Id'
                    ),
                  ),
                  const SizedBox(height: 20,),
                   TextField(
                    onChanged: (value) {
                      _controller.addDataDoc["id"] = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        labelText: 'Enter Your Id',
                        hintText: 'Enter Your Id'
                    ),
                  ),
                  const SizedBox(height: 20,),
                   TextField(
                    onChanged: (value) {
                      _controller.addDataDoc["title"] = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        labelText: 'Enter Your Todo',
                        hintText: 'Enter Your Todo'
                    ),
                  ),
                  const SizedBox(height: 20,),

                  MaterialButton(
                    color: Colors.blue,
                    child: const Text(
                      'Submit Todo',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _controller.getIn();
                      print(_controller.value);
                    },
                  ),

                  // MaterialButton(onPressed: (){
                  //   onPressed: () {
                  //     _controller.getIn();
                  //     print(_controller.value);
                  //   };
                  // },
                  //     child: const Text('Submit ToDo')),

                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '${_controller.addDataDoc['userId']}',
                  ),
                  Text(
                    '${_controller.addDataDoc['title']}',
                  ),
                  Text(
                    '${_controller.addDataDoc['id']}',
                  ),

                ],
              ),


            ),
          ),
        );
      }

      ),
    );
  }
}

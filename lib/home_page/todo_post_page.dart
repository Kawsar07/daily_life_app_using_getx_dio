import 'package:flutter/material.dart';

class PostViewPage extends StatefulWidget {
  const PostViewPage({Key? key}) : super(key: key);

  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Post ToDo'
        ),
      ),
      body: Form(
          child:Column(
            children: <Widget> [
              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    labelText: 'Enter User Id',
                    hintText: 'Enter User Id'
                ),
              ),
              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    labelText: 'Enter Your Id',
                    hintText: 'Enter Your Id'
                ),
              ),
              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    labelText: 'Enter Your Todo',
                    hintText: 'Enter Your Todo'
                ),
              ),
              const SizedBox(height: 20,),

              ElevatedButton(onPressed: (){}, child: const Text('Submit ToDo'))
            ],
          ),


      ),
    );
  }
}

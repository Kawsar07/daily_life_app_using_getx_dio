import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoteServicePost {
  final Dio dio;
  static const String url = "https://jsonplaceholder.typicode.com/todos";

  RemoteServicePost(this.dio);

  Future<dynamic> postData(data) async {
    final response = await dio.post(
      url,
      data: data,

      options: Options(
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      ),
    );
    if (response.statusCode == 201) {
      Get.snackbar("Hey", "successfully Your Post Data",
          backgroundColor: Colors.teal);
      return response.data;
    } else {
      Get.snackbar("Hey", "Data Put Failed", backgroundColor: Colors.red);
    }
  }
}
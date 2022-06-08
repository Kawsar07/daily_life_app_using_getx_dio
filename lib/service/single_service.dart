import 'package:daily_to_do/model/listTodo.dart';
import 'package:daily_to_do/model/singleTo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleRemoteService {
  final Dio _dio = Dio();
  final Dio dio;
  static const String url = "https://jsonplaceholder.typicode.com/posts";
  SingleRemoteService(this.dio);
  Future<SingleTo?> getSinglePost(int id) async {

    final url = 'https://jsonplaceholder.typicode.com/posts/' +id.toString() ;

    // final url = baseUrl + '/posts/' + id.toString();
    try {
      final receive = await _dio.get(url);
      if (receive.statusCode == 200) {
        return SingleTo.fromJson(receive.data);
      } else {
        // print('${receive.statusCode} : ${receive.data.toString()}');
        throw receive.statusCode!;
      }
    } catch (error) {
      // print(reactive);
    }
    return null;
  }






}
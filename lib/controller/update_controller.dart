import 'dart:collection';
import 'package:daily_to_do/model/listTodo.dart';
import 'package:daily_to_do/service/to_do_update_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController with StateMixin<ListTodo> {

  final Dio _dio = Dio();
  final UpDateRemoteService _remoteService = UpDateRemoteService(Dio());
  var addDataDoc = <String, dynamic>{};
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }


  final newMap = <String, dynamic>{};

  Future<void> getIn() async {

    change(null, status: RxStatus.loading());
    try {
      var map = addDataDoc;

      final res = await _remoteService.postData(map);

      debugPrint(res.toString());
      change(null, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error());
      print(error);
    }
  }
  void addData(key, value) {
    addDataDoc[key] = value;
  }
}

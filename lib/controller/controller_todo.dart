import 'package:daily_to_do/model/singleTo.dart';
import 'package:daily_to_do/service/to_do_get_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../model/listTodo.dart';
import '../service/single_service.dart';

class HomeController extends GetxController with StateMixin<List<ListTodo>> {
  final Dio _dio = Dio();
  final RemoteService _remoteService = RemoteService(Dio());
  // final RemoteService _remoteService2 = SingleRemoteService(Dio()) as RemoteService;

  List<ListTodo> dataList = <ListTodo>[];

  var alldata={};

  static const String url = "https://jsonplaceholder.typicode.com/posts/";

  @override
  void onInit() {
    getData();
    super.onInit();

  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    try {
      final res = await _remoteService.getAllPost();
      change(res, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }
  Future<dynamic> gettodos(id) async {
    var fullurl=url+id;

    final response = await _dio.get(fullurl);
    if (response.statusCode == 200) {
      print(response);

     alldata=response.data;
     // alldata.map((e) =>ListTodo.fromJson(e) ).toList();

      // alldata.map((e)=>SingleTo.fromJson(e)).toList();
      update();



    }
    print(alldata);

    return alldata;
  }
  // Future<void> getIn() async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final dis = await _remoteService.getSinglePost();
  //     change(dis, status:RxStatus.success());
  //   } catch (error) {
  //     change(null, status: RxStatus.error());
  //   }
  // }


}

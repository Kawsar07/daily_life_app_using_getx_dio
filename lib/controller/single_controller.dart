import 'dart:ffi';
import 'package:daily_to_do/model/singleTo.dart';
import 'package:daily_to_do/service/single_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';




class SingleController extends GetxController with StateMixin<SingleTo> {

  static const String url = "https://jsonplaceholder.typicode.com/posts/";

  // UpDateRemoteService(this.dio);
  final Dio _dio = Dio();
  var dis ;
  final SingleRemoteService _remoteService = SingleRemoteService (Dio());

  var addDataDoc = <String, dynamic>{};
  List<SingleTo> dataList = <SingleTo>[];

  @override
  void onInit() {
    super.onInit();
    getIn();
  }

  Future<dynamic> postData(data) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
      );
      print(response);
      return response.data;
    } catch (error) {
      return error;
    }
  }
  Future<dynamic> delateData(id) async {
    var fullurl=url+id;
    try {
      final response1 = await _dio.delete(
        fullurl,

        // data: data,
      );
      print(response1);
      return response1.data;
    } catch (error) {
      return error;
    }
  }




  Future<void> getIn() async {
    change(null, status: RxStatus.loading());
    try {


      final  dis = await _remoteService.getSinglePost(1);
      change(dis, status:RxStatus.success());

    } catch (error) {
      change(null, status: RxStatus.error());
    }
  }






}



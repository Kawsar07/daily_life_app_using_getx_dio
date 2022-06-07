import 'package:daily_to_do/service/to_do_post_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PostController extends GetxController with StateMixin {
  final Dio _dio = Dio();
  final RemoteServicePost _remoteService = RemoteServicePost(Dio());
  var addDataDoc = <String, dynamic>{};
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  final newMap = <String, dynamic>{};

  Future<void> getIn() async {
    final map = addDataDoc;
    change(null, status: RxStatus.loading());
    try {
      var map = addDataDoc;
      final res = await _remoteService.postData(map);
      debugPrint(res.toString());
      change(null, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error());
    }
  }

  void addData(key, value) {
    addDataDoc[key] = value;
  }
}

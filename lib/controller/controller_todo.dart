import 'package:daily_to_do/service/to_do_get_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/listTodo.dart';

class HomeController extends GetxController with StateMixin<List<ListTodo>> {
  final Dio _dio = Dio();
  final RemoteService _remoteService = RemoteService(Dio());
  List<ListTodo> dataList = <ListTodo>[];

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
}

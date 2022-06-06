import 'package:daily_to_do/model/listTodo.dart';
import 'package:dio/dio.dart';

class RemoteService {
  Dio _dio = Dio();
  final Dio dio;
  static const String url = "https://jsonplaceholder.typicode.com/todos";

  RemoteService(this.dio);
  Future<List<ListTodo>> getAllPost() async {
    List<ListTodo> data = [];
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      for (var i = 0; i < response.data.length; i++) {
        data.add(ListTodo.fromJson(response.data[i]));
      }
    }
    return data;
  }
}
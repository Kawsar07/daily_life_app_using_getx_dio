import 'package:dio/dio.dart';

class UpDateRemoteService {
  final Dio dio;
  static const String url = "https://jsonplaceholder.typicode.com/posts/2";

  UpDateRemoteService(this.dio);

  Future<dynamic> postData(data) async {

    try{
      final response = await dio.put(
        url,
        data: data,
        // options: Options(
        //   headers: {'Content-type': 'application/json; charset=UTF-8'},
        // ),
      );
      return response.data ;

    }
    catch(error) {
      return error;

    }
  }
}

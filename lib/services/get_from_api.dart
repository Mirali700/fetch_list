

import 'package:dio/dio.dart';
import 'package:fetch_list/models/comments_model.dart';

Future<List<Comments>> getComments() async {
  try {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/photos');
    if (response.statusCode == 200) {
      final result = response.data as List;

      return result.map((e) => Comments.fromMap(e)).toList();
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
  return [];
}
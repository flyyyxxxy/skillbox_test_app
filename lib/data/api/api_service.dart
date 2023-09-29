import 'package:dio/dio.dart';
import 'package:skillbox_app/data/model/todo_model.dart';
import 'package:skillbox_app/data/model/user_model.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await dio.get('/todos');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => TodoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get('/users');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

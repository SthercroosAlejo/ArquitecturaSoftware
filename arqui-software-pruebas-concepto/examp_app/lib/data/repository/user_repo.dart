import 'dart:async';
import 'package:examp_app/data/api/api_client.dart';
import 'package:examp_app/data/model/user.dart';
import 'package:examp_app/util/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;
  
  UserRepo({required this.apiClient});

  Future<Response> registration(User userBody) async {
    return await apiClient.postData(AppConstants.REGISTER, userBody.toJson());
  }

  Future<Response> login({required String email, required String password}) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email": email, "password": password});
  }
}
import 'package:flutter_fic10/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic10/data/models/request/login_request_model.dart';
import 'package:flutter_fic10/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/constants/variables.dart';
import '../models/request/register_request_model.dart';

class AuthRemoteDatasource {
  //Register
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('register gagal');
    }
  }

  //function for logout
  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData?.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return right("Logout Success");
    } else {
      return left("Logout Gagal");
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: data.toJson(),
    );
    if (response.statusCode == 200) {
      return Right(
        AuthResponseModel.fromJson(response.body),
      );
    } else {
      return const Left("Login Gagal");
    }
    // final reponse = await http.post(
    //   Uri.parse('${Variables.baseUrl}/api/register'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: data.toJson(),
    // );
  }
}

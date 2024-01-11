import 'package:dartz/dartz.dart';
import 'package:flutter_fic10/core/constants/variables.dart';

import 'package:http/http.dart' as http;

import '../models/responses/materi_response_model.dart';
import 'auth_local_datasource.dart';

class MateriRemoteDatasource {
  //get content by id
  Future<Either<String, MateriResponseModel>> getAllMateri() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/materis'),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData?.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return right(MateriResponseModel.fromJson(response.body));
    } else {
      return left('get content gagal');
    }
  }
}

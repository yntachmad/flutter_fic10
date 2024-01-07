import 'package:dartz/dartz.dart';
import 'package:flutter_fic10/core/constants/variables.dart';
import 'package:flutter_fic10/data/models/responses/content_response_model.dart';
import 'package:http/http.dart' as http;

import 'auth_local_datasource.dart';

class ContentRemoteDatasource {
  //get content by id
  Future<Either<String, ContentResponeModel>> getContentById(String id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/contents?id=$id'),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData?.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return right(ContentResponeModel.fromJson(response.body));
    } else {
      return left('get content gagal');
    }
  }
}

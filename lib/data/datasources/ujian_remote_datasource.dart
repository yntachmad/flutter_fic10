import 'package:dartz/dartz.dart';
import 'package:flutter_fic10/core/constants/variables.dart';
import 'package:flutter_fic10/data/models/responses/ujian_response_model.dart';
import 'package:http/http.dart' as http;

import 'auth_local_datasource.dart';

class UjianRemoteDatasource {
  Future<Either<String, UjianResponeModel>> getUjianByKategori(
      String kategori) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/get-soal-ujian?kategori=$kategori'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${authData?.accessToken}',
        });

    if (response.statusCode == 200) {
      return Right(UjianResponeModel.fromJson(response.body));
    } else {
      return const Left('Get Ujian gagal');
    }
  }
}

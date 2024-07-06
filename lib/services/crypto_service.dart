import 'dart:convert';
import 'package:crypto/models/crypto_model.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class CryptoService {
  final Dio _dio = Dio();

  Future<Either<String, CryptoModel>> GETCrypto() async {
    try {
      var response = await _dio.get(
        "https://api.coinlore.net/api/tickers/",
      );
      var result = CryptoModel.fromJson(response.data);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
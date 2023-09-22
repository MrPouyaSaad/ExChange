// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:coin_ex/api/entity/coin_entity.dart';
import 'package:dio/dio.dart';

import 'package:coin_ex/api/api_helper/validator.dart';

abstract class ICoinListDataSource {
  Future<List<dynamic>> getAll();
}

class CoinListRemoteDataSource with Validator implements ICoinListDataSource {
  final Dio httpClient;
  CoinListRemoteDataSource({
    required this.httpClient,
  });
  @override
  Future<List> getAll() async {
    final response = await httpClient.get('top/mktcapfull?limit=10&tsym=USD');
    validaor(response);
    Map<String, dynamic> responseData = response.data;
    List coinList = responseData['Data'];
    final coins = coinList.map((e) => CoinList.fromJson(e)).toList();
    return coins;
  }
}

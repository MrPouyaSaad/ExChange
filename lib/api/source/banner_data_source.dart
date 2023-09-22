// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ExChange/api/api_helper/validator.dart';
import 'package:ExChange/api/entity/banner_entity.dart';

import 'package:dio/dio.dart';

abstract class IBannerDataSource {
  Future<List<BannerEntity>> getAll();
}

class BannerRemoteDataSource with Validator implements IBannerDataSource {
  final Dio httpClient;
  BannerRemoteDataSource({
    required this.httpClient,
  });
  @override
  Future<List<BannerEntity>> getAll() async {
    final response =
        await httpClient.get('https://www.coinex.com/res/activity/banners');
    validaor(response);
    final Map<String, dynamic> responseData = response.data;
    final List<dynamic> bannerList = responseData['data'];
    final banners =
        bannerList.map((json) => BannerEntity.fromJson(json)).toList();
    return banners;
  }
}

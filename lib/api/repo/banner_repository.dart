// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_ex/api/api_helper/const.dart';
import 'package:coin_ex/api/entity/banner_entity.dart';
import 'package:coin_ex/api/source/banner_data_source.dart';

final bannerRepository = BannerRepositiry(
  dataSource: BannerRemoteDataSource(httpClient: httpClient),
);

abstract class IBaneerRepository {
  Future<List<BannerEntity>> getAll();
}

class BannerRepositiry implements IBaneerRepository {
  final BannerRemoteDataSource dataSource;
  BannerRepositiry({
    required this.dataSource,
  });
  @override
  Future<List<BannerEntity>> getAll() => dataSource.getAll();
}

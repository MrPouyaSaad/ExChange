// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ExChange/api/api_helper/const.dart';
import 'package:ExChange/api/entity/banner_entity.dart';
import 'package:ExChange/api/source/banner_data_source.dart';

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

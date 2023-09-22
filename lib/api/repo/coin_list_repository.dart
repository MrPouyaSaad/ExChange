import 'package:ExChange/api/api_helper/const.dart';
import 'package:ExChange/api/source/coin_list_data_source.dart';

final coinListRepository = CoinListRepository(
  CoinListRemoteDataSource(httpClient: httpClient),
);

abstract class ICoinListRepository {
  Future<List<dynamic>> getAll();
}

class CoinListRepository implements ICoinListRepository {
  final CoinListRemoteDataSource dataSource;

  CoinListRepository(this.dataSource);
  @override
  Future<List> getAll() => dataSource.getAll();
}

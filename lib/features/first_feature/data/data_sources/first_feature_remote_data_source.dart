import 'package:bid_ride/core/api/api_consumer.dart';
import 'package:bid_ride/features/first_feature/data/models/cat_fact_model.dart';

abstract class FirstFeatureRemoteDataSource {
  Future<CatFactModel> getCatFact();
}

class FirstFeatureRemoteDataSourceImpl implements FirstFeatureRemoteDataSource {
  final ApiConsumer client;

  FirstFeatureRemoteDataSourceImpl({required this.client});

  @override
  Future<CatFactModel> getCatFact() async {
    var res = await client.get('EndPoints.getCatFact');
    return CatFactModel.fromJson(res);
  }
}

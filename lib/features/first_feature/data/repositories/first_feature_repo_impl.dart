import 'package:dartz/dartz.dart';
import 'package:flutter_helper/core/error/failures.dart';
import 'package:flutter_helper/core/network/netwok_info.dart';
import 'package:flutter_helper/features/first_feature/data/data_sources/first_feature_remote_data_source.dart';
import 'package:flutter_helper/features/first_feature/domain/entities/cat_fact_entity.dart';
import 'package:flutter_helper/features/first_feature/domain/repositories/first_feature_repo.dart';

class FirstFeatureRepositoryImpl implements FirstFeatureRepository {
  final NetworkInfo networkInfo;
  final FirstFeatureRemoteDataSource firstFeatureRemoteDataSource;

  FirstFeatureRepositoryImpl(
      {required this.networkInfo, required this.firstFeatureRemoteDataSource});

  @override
  Future<Either<Failure, CatFactEntity>> getCatFact() async {
    try {
      final response = await firstFeatureRemoteDataSource.getCatFact();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}

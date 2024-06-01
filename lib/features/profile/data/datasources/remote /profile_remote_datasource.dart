import 'package:dio/dio.dart';
import 'package:vangram/core/constants/endpoints.dart';
import 'package:vangram/features/profile/data/models/profile/profile_model.dart';

part 'profile_remote_datasource_impl.dart';

abstract interface class ProfileRemoteDatasource {
  Future<ProfileModel> getProfile();
}

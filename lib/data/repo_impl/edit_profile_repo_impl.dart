import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/datasource_contract/edit_profile_datasource.dart';
import 'package:flora_mart/data/model/get_logged_user_data_model.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';
import 'package:flora_mart/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDatasource editProfileDatasource;

  EditProfileRepoImpl(this.editProfileDatasource);

  @override
  Future<ApiResult<GetLoggedUserDataEntity>> editProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String gender,
  }) async {
    final result = await editProfileDatasource.editProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      gender: gender,
    );

    if (result is SuccessApiResult<GetLoggedUserDataModel>) {
      final model = result.data;
      if (model != null) {
        final userEntity = model.user != null
            ? UserEntity(
                id: model.user!.id,
                firstName: model.user!.firstName,
                lastName: model.user!.lastName,
                email: model.user!.email,
                phone: model.user!.phone,
                gender: model.user!.gender,
              )
            : null;

        final entity = GetLoggedUserDataEntity(
          user: userEntity,
          message: model.message,
        );
        return SuccessApiResult(entity);
      }
      return SuccessApiResult(null);
    } else if (result is ErrorApiResult) {
      final error = (result as ErrorApiResult).exception;
      return ErrorApiResult(error);
    }

    return ErrorApiResult(Exception("Unknown error occurred"));
  }

  @override
  Future<ApiResult<String>> uploadPhoto({required String photoPath}) async {
    return await editProfileDatasource.uploadPhoto(photoPath: photoPath);
  }
}

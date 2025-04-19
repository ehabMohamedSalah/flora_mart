// lib/domain/usecase/upload_photo_usecase.dart
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/repo_contract/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UploadPhotoUsecase {
  final EditProfileRepo repo;

  UploadPhotoUsecase(this.repo);

  Future<ApiResult<String>> call({required String photoPath}) async {
    return await repo.uploadPhoto(photoPath: photoPath);
  }
}

import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/repo_contract/guest_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckGuestUseCase {
  final GuestRepo authRepo;
  @factoryMethod
  CheckGuestUseCase(this.authRepo);
  Future<Result<bool>> call() async {
    return await authRepo.checkGuest();
  }
}

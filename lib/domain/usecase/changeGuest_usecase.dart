import 'package:flora_mart/domain/repo_contract/guest_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeguestUsecase {
  final GuestRepo authRepo;
  ChangeguestUsecase(this.authRepo);

  Future<bool> call({required bool isGuest}) async {
    return await authRepo.changeGuest(isGuest: isGuest);
  }
}

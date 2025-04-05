import 'package:flora_mart/domain/repo_contract/guest_repo.dart';
import 'package:flora_mart/domain/usecase/changeGuest_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_guest_usecase_test.mocks.dart';

@GenerateMocks([GuestRepo])
void main() {
  group("changeGuest_usecase", () {
    late ChangeguestUsecase useCase;
    late GuestRepo repo;
    setUp(() {
      repo = MockGuestRepo();
      useCase = ChangeguestUsecase(repo);
    });

    test(
        'when calling call function from changeGuestUseCase should call changeGuest function from GuestRepo',
        () async {
      var result = true;
      when(repo.changeGuest(isGuest: result)).thenAnswer((_) async => result);
      var actual = await useCase.call(isGuest: result);

      verify(repo.changeGuest(isGuest: result)).called(1);
      expect(actual, equals(result));
    });
  });
}

import 'package:flora_mart/domain/common/result.dart';
import 'package:flora_mart/domain/repo_contract/guest_repo.dart';
import 'package:flora_mart/domain/usecase/check_guest_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_guest_usecase_test.mocks.dart';

@GenerateMocks([GuestRepo])
void main() {
  group(
    'CheckGuestUseCase',
    () {
      late CheckGuestUseCase useCase;
      late GuestRepo repo;
      setUp(() {
        repo = MockGuestRepo();
        useCase = CheckGuestUseCase(repo);
      }); //run before every test
      setUpAll(() {}); //runs once for all tests
      test(
        'when calling call function from checkGuestUseCase should call checkGuest function from GuestRepo',
        () async {
          var result = Success<bool>(false);
          // var repo = MockGuestRepo();
          provideDummy<Result<bool>>(result);
          when(repo.checkGuest()).thenAnswer((_) async => result);
          // CheckGuestUseCase useCase = CheckGuestUseCase(repo);
          var actual = await useCase.call();
          verify(repo.checkGuest()).called(1); // call verification
          expect(actual, equals(result)); // check result
        },
      );
    },
  );
}

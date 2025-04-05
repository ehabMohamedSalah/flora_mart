import 'package:flora_mart/data/datasource_contract/guest_datasource.dart';
import 'package:flora_mart/data/repo_impl/guest_repo_impl.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'guest_repo_impl_test.mocks.dart';

@GenerateMocks([GuestDatasource])
void main() {
  group(
    "guest repo",
    () {
      late GuestRepoImpl repo;
      late GuestDatasource datasource;
      setUp(() {
        datasource = MockGuestDatasource();
        repo = GuestRepoImpl(datasource);
      });

      test(
          "when checkGuest then should calling checkGuest function from datasource",
          () async {
        var result = Success<bool>(false);
        provideDummy<Result<bool>>(result);

        when(datasource.checkGuest()).thenAnswer((_) async => result);
        var actual = await repo.checkGuest();

        expect(actual, equals(result));
        verify(datasource.checkGuest()).called(1);
      });

      test(
          "when changeGuest then should calling changeGuest function from datasource",
          () async {
        var result = false;
        when(datasource.changeGuest(isGuest: result))
            .thenAnswer((_) async => result);
        var actual = await repo.changeGuest(isGuest: result);

        expect(actual, equals(result));
        // verify(datasource.changeGuest(isGuest: false)).called(1);
      });
    },
  );
}

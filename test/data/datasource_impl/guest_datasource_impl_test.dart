import 'package:flora_mart/core/cache/shared_pref.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/data/datasource_contract/guest_datasource.dart';
import 'package:flora_mart/data/datasource_impl/guest_datasource_impl.dart';
import 'package:flora_mart/domain/common/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'guest_datasource_impl_test.mocks.dart';

@GenerateMocks([CacheHelper])
void main() {
  group(
    "checkGuest in Datasource Impl",
    () {
      late GuestDatasource datasource;
      late CacheHelper cacheHelper;

      setUp(() {
        cacheHelper = MockCacheHelper();

        datasource = GuestDatasourceImpl(cacheHelper);
      });

      test(
          "when calling checkGuest, it should return Success if CacheHelper.checkGuest() succeeds",
          () async {
        var result = Success<bool>(true);
        // provideDummy<Result<bool>>(result);
        when(cacheHelper.checkGuest()).thenAnswer((_) async => false);
        var actual = await datasource.checkGuest();
        // expect(actual, isA<Success<bool>>()); //check type
        expect((actual as Success<bool>).data, equals(false));
        verify(cacheHelper.checkGuest()).called(1);
      });

      test(
          "when calling checkGuest, it should return Error if CacheHelper.checkGuest() throws an exception",
          () async {
        when(cacheHelper.checkGuest()).thenThrow(Exception("Error"));
        var result = await datasource.checkGuest();

        // التحقق من النتيجة
        expect(result, isA<Error>());
        // التحقق من استدعاء CacheHelper
        verify(cacheHelper.checkGuest()).called(1);
      });
    },
  );
  group(
    "changeGuest in Datasource Impl",
    () {
      late GuestDatasource datasource;
      late CacheHelper cacheHelper;

      setUp(() {
        cacheHelper = MockCacheHelper();

        datasource = GuestDatasourceImpl(cacheHelper);
      });

      test(
          "when calling changeGuest, it should calling setData function from CacheHelper",
          () async {
        var value = true;
        var result = true;
        when(cacheHelper.setData(Constant.questCacheKey, value))
            .thenAnswer((_) async => result);
        var actual = await datasource.changeGuest(isGuest: value);
        // expect(actual, isA<Success<bool>>()); //check type
        expect(actual, equals(result));
        verify(cacheHelper.setData(Constant.questCacheKey, value)).called(1);
      });
    },
  );
}

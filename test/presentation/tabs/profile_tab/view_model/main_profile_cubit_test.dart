import 'package:bloc_test/bloc_test.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:flora_mart/domain/usecase/get_profile_details_usecase.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view_model/main_profile_intent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/presentation/tabs/profile_tab/view_model/main_profile_cubit.dart';
import 'package:flora_mart/domain/entity/get_logged_user_data_entity.dart';

import 'main_profile_cubit_test.mocks.dart';

@GenerateMocks([GetProfileDetailsUsecase])
void main() {
  group('MainProfileCubit', () {
    late MainProfileCubit mainProfileCubit;
    late MockGetProfileDetailsUsecase mockUpdateProfileUsecase;

    setUp(() {
      mockUpdateProfileUsecase = MockGetProfileDetailsUsecase();
      mainProfileCubit = MainProfileCubit(mockUpdateProfileUsecase);
    });

    final userDataEntity = GetLoggedUserDataEntity();

    provideDummy<ApiResult<GetLoggedUserDataEntity>>(
      SuccessApiResult<GetLoggedUserDataEntity>(GetLoggedUserDataEntity(
          user: UserEntity(firstName: "test", email: "test@example.com"))),
    );

    blocTest<MainProfileCubit, MainProfileState>(
      'emits [MainProfileLoading, MainProfileSuccess] when profile update is successful',
      build: () {
        when(mockUpdateProfileUsecase.call()).thenAnswer((_) async {
          final result =
              SuccessApiResult<GetLoggedUserDataEntity>(userDataEntity);
          return result;
        });
        return mainProfileCubit;
      },
      act: (cubit) => cubit.onIntent(
          DataProfileCubitIntent()),
      expect: () => [
        isA<MainProfileLoading>(),
        isA<MainProfileSuccess>(),
      ],
    );

    blocTest<MainProfileCubit, MainProfileState>(
      'emits [MainProfileLoading, MainProfileFailure] when profile update fails',
      build: () {
        when(mockUpdateProfileUsecase.call()).thenAnswer((_) async {
          final result = ErrorApiResult<GetLoggedUserDataEntity>(
              Exception('Profile update failed'));
          return result;
        });
        return mainProfileCubit;
      },
      act: (cubit) => cubit.onIntent(
          DataProfileCubitIntent()),
      expect: () => [
        isA<MainProfileLoading>(),
        isA<MainProfileFailure>(),
      ],
    );
  });
}

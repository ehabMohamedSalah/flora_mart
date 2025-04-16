import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/domain/usecase/reset_password_Usecase.dart';
import 'package:flora_mart/presentation/reset_password/view_model/reset_password_cubit.dart';
import 'package:flora_mart/presentation/reset_password/view_model/reset_password_intent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Generate mocks
@GenerateMocks([ResetPasswordUsecase])
import 'reset_password_cubit_test.mocks.dart';

// Provide dummy builders for ApiResult<bool>
void provideDummyApiResult() {
  provideDummy<ApiResult<bool>>(SuccessApiResult<bool>(true));
  provideDummy<SuccessApiResult<bool>>(SuccessApiResult<bool>(true));
  provideDummy<ErrorApiResult<bool>>(
      ErrorApiResult<bool>(Exception('Dummy error')));
}

void main() {
  late ResetPasswordCubit cubit;
  late MockResetPasswordUsecase mockUsecase;

  setUpAll(() {
    // Setup dummy values before any tests run
    provideDummyApiResult();
  });

  setUp(() {
    mockUsecase = MockResetPasswordUsecase();
    cubit = ResetPasswordCubit(mockUsecase);
  });

  tearDown(() {
    cubit.close();
  });

  group('ResetPasswordCubit', () {
    const oldPassword = 'oldPassword123';
    const newPassword = 'newPassword123';
    final intent = ResetPasswordIntent(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );

    test('initial state is ResetPasswordInitial', () {
      expect(cubit.state, isA<ResetPasswordInitial>());
    });

    group('resetPassword', () {
      test('emits [Loading, Success] when reset is successful', () async {
        // Arrange
        when(mockUsecase.invoke(
          oldPassword: anyNamed('oldPassword'),
          newPassword: anyNamed('newPassword'),
        )).thenAnswer((_) async => SuccessApiResult<bool>(true));

        // Assert later
        expectLater(
          cubit.stream,
          emitsInOrder([
            isA<ResetPasswordLoadingState>(),
            isA<ResetPasswordSuccessState>(),
          ]),
        );

        // Act
        cubit.doIntent(intent);
      });

      test('emits [Loading, Error] when reset fails', () async {
        // Arrange
        final exception = Exception('Reset failed');
        when(mockUsecase.invoke(
          oldPassword: anyNamed('oldPassword'),
          newPassword: anyNamed('newPassword'),
        )).thenAnswer((_) async => ErrorApiResult<bool>(exception));

        // Assert later
        expectLater(
          cubit.stream,
          emitsInOrder([
            isA<ResetPasswordLoadingState>(),
            isA<ResetPasswordErrorState>(),
          ]),
        );

        // Act
        cubit.doIntent(intent);
      });

      test('calls usecase with correct parameters', () async {
        // Arrange
        when(mockUsecase.invoke(
          oldPassword: oldPassword,
          newPassword: newPassword,
        )).thenAnswer((_) async => SuccessApiResult<bool>(true));

        // Act
        cubit.doIntent(intent);

        // Assert
        verify(mockUsecase.invoke(
          oldPassword: oldPassword,
          newPassword: newPassword,
        )).called(1);
      });
    });
  });
}

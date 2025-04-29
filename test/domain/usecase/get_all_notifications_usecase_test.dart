import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/notifications/notifications.dart';
import 'package:flora_mart/domain/repo_contract/get_all_notifications_repo.dart';
import 'package:flora_mart/domain/usecase/get_all_notifications_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_notifications_usecase_test.mocks.dart';

@GenerateMocks([GetAllNotificationsRepo])
void main() {
  provideDummy<ApiResult<List<Notifications>>>(SuccessApiResult([]));
  provideDummy<ApiResult<List<Notifications>>>(
    ErrorApiResult(Exception("Dummy error")),
  );

  late GetAllNotificationsUsecase getAllNotificationsUsecase;
  late MockGetAllNotificationsRepo mockGetAllNotificationsRepo;

  setUp(() {
    mockGetAllNotificationsRepo = MockGetAllNotificationsRepo();
    getAllNotificationsUsecase = GetAllNotificationsUsecase(mockGetAllNotificationsRepo);
  });

  group('GetAllNotificationsUsecase Tests', () {
    test('should return SuccessApiResult when notifications are retrieved successfully', () async {
      // Arrange
      final List<Notifications> notificationList = [
        Notifications(
          id: "1",
          title: "New Offer",
          body: "You have a new discount available!",
          createdAt: DateTime.parse("2025-04-28T10:00:00.000Z"),
          updatedAt: DateTime.parse("2025-04-28T10:00:00.000Z"),
          v: 0,
        ),
        Notifications(
          id: "2",
          title: "Reminder",
          body: "Don't miss out on our spring sale!",
          createdAt: DateTime.parse("2025-04-27T15:30:00.000Z"),
          updatedAt: DateTime.parse("2025-04-27T15:30:00.000Z"),
          v: 0,
        ),
      ];
      when(mockGetAllNotificationsRepo.getAllNotifications())
          .thenAnswer((_) async => SuccessApiResult(notificationList));

      // Act
      final result = await getAllNotificationsUsecase.execute();

      // Assert
      expect(result, isA<SuccessApiResult<List<Notifications>>>());
      expect((result as SuccessApiResult).data, isNotEmpty);
      verify(mockGetAllNotificationsRepo.getAllNotifications()).called(1);
      verifyNoMoreInteractions(mockGetAllNotificationsRepo);
    });

    test('should return ErrorApiResult when an error occurs while retrieving notifications', () async {
      // Arrange
      final error = Exception('Failed to load notifications');
      when(mockGetAllNotificationsRepo.getAllNotifications())
          .thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await getAllNotificationsUsecase.execute();

      // Assert
      expect(result, isA<ErrorApiResult<List<Notifications>>>());
      expect((result as ErrorApiResult).exception.toString(),
          contains('Failed to load notifications'));
      verify(mockGetAllNotificationsRepo.getAllNotifications()).called(1);
      verifyNoMoreInteractions(mockGetAllNotificationsRepo);
    });
  });
}

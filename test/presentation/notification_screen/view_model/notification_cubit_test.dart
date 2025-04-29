import 'package:bloc_test/bloc_test.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/notifications/notifications.dart';
import 'package:flora_mart/domain/usecase/get_all_notifications_usecase.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_cubit.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_intent.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'notification_cubit_test.mocks.dart';

@GenerateMocks([GetAllNotificationsUsecase])
void main() {
  group('NotificationCubit', () {
    late GetAllNotificationsUsecase getAllNotificationsUsecase;
    late NotificationCubit notificationCubit;

    setUp(() {
      getAllNotificationsUsecase = MockGetAllNotificationsUsecase();
      notificationCubit = NotificationCubit(getAllNotificationsUsecase);

      provideDummy<ApiResult<List<Notifications>>>(
        SuccessApiResult([
          Notifications(
            id: "1",
            title: "Welcome",
            body: "Thanks for joining us!",
            createdAt: DateTime.parse("2025-04-28T10:00:00.000Z"),
            updatedAt: DateTime.parse("2025-04-28T10:00:00.000Z"),
            v: 0,
          ),
        ]),
      );
    });

    blocTest<NotificationCubit, NotificationState>(
      'emits [NotificationLoadingState, NotificationLoadedState] when getNotifications is successful',
      build: () {
        when(getAllNotificationsUsecase.execute())
            .thenAnswer((_) async => SuccessApiResult([
          Notifications(
            id: "1",
            title: "Welcome",
            body: "Thanks for joining us!",
            createdAt: DateTime.parse("2025-04-28T10:00:00.000Z"),
            updatedAt: DateTime.parse("2025-04-28T10:00:00.000Z"),
            v: 0,
          ),
          Notifications(
            id: "2",
            title: "Update",
            body: "We have updated our terms.",
            createdAt: DateTime.parse("2025-04-27T12:00:00.000Z"),
            updatedAt: DateTime.parse("2025-04-27T12:00:00.000Z"),
            v: 0,
          ),
        ]));
        return notificationCubit;
      },
      act: (cubit) => cubit.doIntent(GetNotificationIntent()),
      expect: () => [
        NotificationLoadingState(),
        isA<NotificationLoadedState>(),
      ],
    );

    blocTest<NotificationCubit, NotificationState>(
      'emits [NotificationLoadingState, NotificationErrorState] when getNotifications fails',
      build: () {
        when(getAllNotificationsUsecase.execute())
            .thenAnswer((_) async => ErrorApiResult(Exception('Failed to load notifications')));
        return notificationCubit;
      },
      act: (cubit) => cubit.doIntent(GetNotificationIntent()),
      expect: () => [
        NotificationLoadingState(),
        isA<NotificationErrorState>(),
      ],
    );
  });
}

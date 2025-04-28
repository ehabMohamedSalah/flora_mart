import 'package:flora_mart/presentation/notification_screen/view/widgets/notificatio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_cubit.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_intent.dart';
import 'package:flora_mart/presentation/notification_screen/view_model/notification_state.dart';

import '../../../core/utils/string_manager.dart'; // الـ Widget اللي انتي عملتيه

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<NotificationCubit>()..doIntent(GetNotificationIntent()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            AppStrings.changePassword,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is NotificationLoadedState) {
              if (state.notifications.isEmpty) {
                return const Center(child: Text('No notifications found.'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return NotificatioItem(
                    icon: Icons.notifications,
                    title: notification.title,
                    description: notification.body,
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}





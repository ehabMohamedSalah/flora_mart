import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

class Dialogs {
//========USAGE=========\\
//   if (isGuestUser) {
//   Dialogs.showGuestRestrictionDialog(context);
// } else {
  // تابع تنفيذ العملية المسموحة
// } or in widgets        isGuestUser ? Dialogs.showGuestRestrictionDialog(context) : performAllowedOperation();

  static void restrictedAccess(BuildContext context, VoidCallback backButton) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            title: Row(
              children: [
                Icon(Icons.lock_outline, color: Colors.redAccent),
                SizedBox(width: 10),
                Text(AppStrings.restrictedAccess,
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            content: Text(
              AppStrings.guestRestrictionMessage,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            actions: [
              TextButton(
                onPressed: backButton,
                child:
                    Text(AppStrings.back, style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteManager.loginScreen, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(AppStrings.login,
                    style: Theme.of(context).textTheme.labelLarge),
              ),
            ]),
      ),
    );
  }
}

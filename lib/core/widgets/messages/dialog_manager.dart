import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';

class DialogManager {
  static Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmButtonText,
    required VoidCallback onConfirm,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return ConfirmActionDialog(
            title: title,
            content: content,
            actionButtonText: confirmButtonText,
            actionButtonAction: onConfirm,
          );
        });
  }

  static Future<void> showInfoDialog({
    required BuildContext context,
    required String title,
    required String content,
    String buttonText = "OK",
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return CustomAlertDialog(
          title: title,
          content: content,
          buttonText: buttonText,
          onButtonPressed: () => Navigator.of(dialogContext).pop(),
          titleStyle: TextStyle(color: Colors.black),
          contentStyle: TextStyle(color: Colors.black),
        );
      },
    );
  }

  static Future<void> showErrorDialog({
    required BuildContext context,
    required String title,
    required String errorMessage,
    String buttonText = "OK",
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return CustomAlertDialog(
          title: title,
          content: errorMessage,
          buttonText: buttonText,
          onButtonPressed: () => Navigator.of(dialogContext).pop(),
          titleStyle: TextStyle(color: Colors.red),
          contentStyle: TextStyle(color: Colors.red),
        );
      },
    );
  }

  //todo -refactor- integrate in the class see above implementation
  static Widget showNotAuthenticatedDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Not Authenticated'),
      content: const Text('Please log in to continue.'),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            context.pushNamed(AuthRouterNames.authRouteName);
          },
        ),
      ],
    );
  }
}

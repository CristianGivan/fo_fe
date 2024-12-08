import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/core/widgets/core_widget_exports.dart';

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
          return ConfirmActionPage(
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
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text(buttonText),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
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
        return AlertDialog(
          title: Text(title, style: TextStyle(color: Colors.red)),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text(buttonText),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }
}

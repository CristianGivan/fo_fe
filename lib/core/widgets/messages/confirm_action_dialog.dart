import 'package:fo_fe/core/utils/exports/external_exports.dart';

class ConfirmActionDialog extends StatelessWidget {
  final String title;
  final String content;
  final String actionButtonText;
  final VoidCallback actionButtonAction;
  final String? cancelButtonText;
  final VoidCallback? cancelButtonAction;

  const ConfirmActionDialog({
    required this.title,
    required this.content,
    required this.actionButtonText,
    required this.actionButtonAction,
    this.cancelButtonText,
    this.cancelButtonAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(actionButtonText),
          onPressed: () {
            actionButtonAction();
            context.pop();
          },
        ),
        TextButton(
          child: Text(cancelButtonText ?? "Cancel"),
          onPressed: cancelButtonAction ?? () => context.pop(),
        ),
      ],
    );
  }
}

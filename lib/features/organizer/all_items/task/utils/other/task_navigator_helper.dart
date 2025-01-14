import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskNavigatorHelper {
  static Future<void> handleNavigation<T extends DtoEntity>(
    BuildContext context,
    String routeName,
    int taskId,
    OrganizerItems<T> items,
  ) async {
    try {
      final navigator = NavigatorFactory.getNavigator<T>(routeName: routeName);
      await navigator.navigateAndUpdateItems(context, taskId, items);
    } on UnsupportedError catch (e) {
      _showErrorPage(context, e.message ?? 'An unsupported operation error occurred.');
    } catch (e) {
      _showErrorPage(context, 'An unexpected error occurred.');
    }
  }

  static void _showErrorPage(BuildContext context, String message) =>
      context.pushNamed('error', extra: message);
}

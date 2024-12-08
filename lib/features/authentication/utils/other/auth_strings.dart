import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AuthStrings extends ItemStrings {
  final String itemName;

  AuthStrings()
      : itemName = 'task',
        super('task');

  String get authenticationRequired => "Authentication Required";

  String get authenticationRequiredContent => "Do you want to sign up or log in?";

  String get authenticateButtonText => "Authenticate";

  String get notAuthenticatedNoItems => "You are not authenticated so no items will be displayed";
}

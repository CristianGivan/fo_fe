import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class UserTypeDropdown extends StatelessWidget {
  final UserTypeEnum selectedUserType;
  final ValueChanged<UserTypeEnum?> onChanged;

  const UserTypeDropdown({
    Key? key,
    required this.selectedUserType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<UserTypeEnum>(
      value: selectedUserType,
      decoration: InputDecoration(labelText: 'User Type'),
      items: UserTypeEnum.values.map((UserTypeEnum type) {
        return DropdownMenuItem<UserTypeEnum>(
          value: type,
          child: Text(type.toString().split('.').last),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/user_exports.dart';

class PasswordRequirements extends StatelessWidget {
  final PasswordValidationBlocState state;

  const PasswordRequirements({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPasswordRequirement(context, "1 uppercase", state.containsUpperCase),
        _buildPasswordRequirement(context, "1 lowercase", state.containsLowerCase),
        _buildPasswordRequirement(context, "1 number", state.containsNumber),
        _buildPasswordRequirement(context, "1 special character", state.containsSpecialChar),
        _buildPasswordRequirement(context, "9 minimum characters", state.contains9Length),
      ],
    );
  }

  Widget _buildPasswordRequirement(BuildContext context, String requirement, bool isMet) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.circle_outlined,
            color: isMet ? Colors.green : Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            requirement,
            style: TextStyle(
              color: isMet ? Colors.green : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

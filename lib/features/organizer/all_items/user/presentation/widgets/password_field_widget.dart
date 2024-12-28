import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const PasswordFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      context.read<UserValidationBloc>().add(ValidatePasswordBlocEvent(widget.controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: widget.controller,
      focusNode: _focusNode,
      hintText: 'Password',
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(CupertinoIcons.lock_fill),
      onChanged: (val) {
        context.read<UserValidationBloc>().add(ValidatePasswordBlocEvent(val));
      },
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
            iconPassword =
                obscurePassword ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill;
          });
        },
        icon: Icon(iconPassword),
      ),
    );
  }
}

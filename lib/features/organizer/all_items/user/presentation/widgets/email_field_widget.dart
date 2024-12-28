import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';

class EmailFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const EmailFieldWidget({
    super.key,
    required this.controller,
  });

  @override
  _EmailFieldWidgetState createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
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
      context.read<UserValidationBloc>().add(ValidateEmailBlocEvent(widget.controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: widget.controller,
      focusNode: _focusNode,
      hintText: 'Email',
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(CupertinoIcons.mail_solid),
      onChanged: (val) {
        context.read<UserValidationBloc>().add(ValidateEmailBlocEvent(val));
      },
    );
  }
}

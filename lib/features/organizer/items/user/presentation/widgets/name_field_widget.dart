import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class NameFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const NameFieldWidget({
    Key? key,
    required this.controller,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  _NameFieldWidgetState createState() => _NameFieldWidgetState();
}

class _NameFieldWidgetState extends State<NameFieldWidget> {
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
      context.read<UserValidationBloc>().add(ValidateNameBlocEvent(widget.controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: widget.controller,
      focusNode: _focusNode,
      hintText: 'Name',
      obscureText: false,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(CupertinoIcons.person_fill),
      onChanged: (val) {
        context.read<UserValidationBloc>().add(ValidateNameBlocEvent(val));
      },
      // validator: (val) {
      //   if (val!.isEmpty) {
      //     return 'Please fill in this field';
      //   } else if (val.length > 30) {
      //     return 'Name too long';
      //   }
      //   return null;
      // },
    );
  }
}

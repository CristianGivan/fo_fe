import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class NameFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const NameFieldWidget({
    super.key,
    required this.controller,
  });

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
    );
  }
}

import 'package:flutter/material.dart';

class ScreenBodyPage extends StatelessWidget {
  final dynamic body;
  final BuildContext context;
  final int userId;

  const ScreenBodyPage({
    super.key,
    required this.body,
    required this.context,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    if (body is Widget) {
      bodyWidget = body;
    } else if (body is Widget Function(int)) {
      bodyWidget = body(userId);
    } else {
      throw Exception('Invalid body type');
    }

    return Column(
      children: [
        Expanded(
          child: bodyWidget,
        ),
      ],
    );
  }
}

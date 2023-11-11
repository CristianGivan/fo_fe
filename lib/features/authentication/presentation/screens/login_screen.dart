import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes/app_route_constants.dart';
import '../../../organizer/router/organizer_router_names.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(OrganizerRouterNames.organizerRoute),
                child: const Text('Go to the fo screen'),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context
                    .push(RouteCoreConstants.authenticationRegisterRoute),
                child: const Text('Go to the register screen'),
              ),
            ),
            Center(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

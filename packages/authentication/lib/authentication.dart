library authentication;

import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_repository/user_repository.dart';

part 'src/constants/strings.dart';
part 'src/logic/authentication_bloc/authentication_bloc.dart';
part 'src/logic/authentication_bloc/authentication_event.dart';
part 'src/logic/authentication_bloc/authentication_state.dart';
part 'src/logic/sign_in_bloc/sign_in_bloc.dart';
part 'src/logic/sign_in_bloc/sign_in_event.dart';
part 'src/logic/sign_in_bloc/sign_in_state.dart';
part 'src/logic/sign_up_bloc/sign_up_bloc.dart';
part 'src/logic/sign_up_bloc/sign_up_event.dart';
part 'src/logic/sign_up_bloc/sign_up_state.dart';
part 'src/presentation/screens/sign_in_screen.dart';
part 'src/presentation/screens/sign_up_screen.dart';
part 'src/presentation/screens/welcome_screen.dart';
part 'src/presentation/widgets/text_field.dart';
part 'src/router/authentication_router.dart';
part 'src/router/authentication_router_names.dart';

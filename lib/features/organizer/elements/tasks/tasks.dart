library tasks;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/elements/tasks/presentation/pages/delete_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

import 'package:fo_fe/main.dart';

import '../../organizer.dart';
import '../task/task.dart';

part 'data/models/objectBox/tasks_entity.dart';
part 'domain/entities/tasks.dart';
part 'presentation/logic/tasks_bloc/tasks_bloc.dart';
part 'presentation/logic/tasks_bloc/tasks_event.dart';
part 'presentation/logic/tasks_bloc/tasks_state.dart';
part 'presentation/pages/tasks_add.dart';
part 'presentation/pages/tasks_card.dart';
part 'presentation/pages/tasks_home.dart';
part 'presentation/pages/tasks_page.dart';
part 'presentation/pages/tasks_menu.dart';

library tasks;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/tasks/presentation/logic/tag_bloc/tag_bloc_bloc.dart';
import 'package:fo_fe/features/tasks/presentation/logic/task_bloc/task_bloc.dart';
import 'package:fo_fe/features/tasks/presentation/logic/tasks_bloc/tasks_bloc.dart';
import 'package:fo_fe/features/tasks/domain/entities/tag.dart';
import 'package:fo_fe/features/tasks/domain/entities/task.dart';
import 'package:fo_fe/features/tasks/presentation/pages/task_update_page.dart';
import 'package:fo_fe/features/tasks/domain/entities/tasks.dart';
import 'package:fo_fe/main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../Organizer/organizer.dart';
import 'presentation/pages/delete_menu.dart';

part 'presentation/pages/tasks_card.dart';
part 'presentation/pages/tag_select.dart';
part 'presentation/pages/task_add.dart';
part 'presentation/pages/task_card.dart';
// part 'presentation/pages/task_list_view.dart';
part 'presentation/pages/tasks_page.dart';
part 'presentation/pages/tasks_add.dart';
part 'presentation/pages/tasks_home.dart';
// part 'presentation/pages/tasks_list_view.dart';

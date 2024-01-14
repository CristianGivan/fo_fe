library tasks;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/tasks/logic/tag_bloc/tag_bloc_bloc.dart';
import 'package:fo_fe/features/tasks/logic/task_bloc/task_bloc.dart';
import 'package:fo_fe/features/tasks/model/tag.dart';
import 'package:fo_fe/features/tasks/model/task.dart';
import 'package:fo_fe/features/tasks/ui/task_update_page.dart';
import 'package:fo_fe/features/tasks/logic/tasks_bloc/tasks_bloc.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';
import 'package:fo_fe/main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../Organizer/organizer.dart';
import 'ui/delete_menu.dart';

part 'ui/tasks_card.dart';
part 'ui/tag_select.dart';
part 'ui/task_add.dart';
part 'ui/task_card.dart';
// part 'ui/task_list_view.dart';
part 'ui/tasks_page.dart';
part 'ui/tasks_add.dart';
part 'ui/tasks_home.dart';
// part 'ui/tasks_list_view.dart';

library tasks;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/tasks/ui/task_update.dart';
import 'package:fo_fe/features/tasks/entity/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/features/tasks/logic/tasks_bloc/tasks_bloc.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';
import 'package:fo_fe/main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../Organizer/organizer.dart';
import 'ui/delete_menu.dart';

part 'ui/tasks_card.dart';
part 'ui/owner_select.dart';
part 'ui/task_add.dart';
part 'ui/task_card.dart';
part 'ui/task_list_view.dart';
part 'ui/task_page.dart';
part 'ui/tasks_add.dart';
part 'ui/tasks_home.dart';
part 'ui/tasks_list_view.dart';

library tasks;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/tasks/components/task_update.dart';
import 'package:fo_fe/features/tasks/entity/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/features/tasks/logic/tasks_bloc/tasks_bloc.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';
import 'package:fo_fe/main.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../Organizer/organizer.dart';
import 'components/delete_menu.dart';

part 'components/event_add.dart';
part 'components/event_card.dart';
part 'components/owner_select.dart';
part 'components/task_add.dart';
part 'components/task_card.dart';
part 'components/task_list_view.dart';
part 'components/task_page.dart';
part 'components/tasks_home.dart';
part 'components/tasks_list_view.dart';

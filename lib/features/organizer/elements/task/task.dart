library task;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectbox/objectbox.dart';

import 'package:fo_fe/features/organizer/elements/tag/tag.dart';

import '../../../../main.dart';
import '../tasks/presentation/pages/delete_menu.dart';
import '../tasks/tasks.dart';

part 'data/models/task_entity.dart';
part 'domain/entities/task.dart';
part 'presentation/logic/task_bloc/task_bloc.dart';
part 'presentation/logic/task_bloc/task_event.dart';
part 'presentation/logic/task_bloc/task_state.dart';
part 'presentation/pages/task_add.dart';
part 'presentation/pages/task_card.dart';
part 'presentation/pages/task_update_page.dart';

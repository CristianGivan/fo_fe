library task_lib;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/entities/user.dart';
import 'package:fo_fe/core/util/elements/params.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../core/const/error_message.dart';
import '../../../../core/util/input_converter.dart';
import '../../../../main.dart';
import '../../organizer.dart';
import '../../util/organizer_enums.dart';
import '../tag/tag_lib.dart';
import '../tasks/presentation/pages/delete_menu.dart';
import '../tasks/tasks_lib.dart';
import 'domain/entities/topic.dart';
import 'domain/entities/work.dart';
import 'domain/usecases/get_task_by_id.dart';

part 'data/models/task_model.dart';
part 'data/models/task_model_objectbox.dart';
part 'domain/entities/task_entity.dart';
part 'presentation/logic/task_bloc/task_bloc.dart';
part 'presentation/logic/task_bloc/task_event.dart';
part 'presentation/logic/task_bloc/task_state.dart';
part 'presentation/logic/task_bloc_old/task_bloc_old.dart';
part 'presentation/logic/task_bloc_old/task_event_old.dart';
part 'presentation/logic/task_bloc_old/task_state_old.dart';
part 'presentation/pages/task_add.dart';
part 'presentation/pages/task_card.dart';
part 'presentation/pages/task_update_page.dart';

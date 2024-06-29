library task_lib;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/const/constants.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';
import 'package:fo_fe/features/organizer/items/task/domain/entities/user.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/load_task_items_all.dart';
import 'package:objectbox/objectbox.dart';

import '../../organizer.dart';
import '../../util/organizer_enums.dart';
import '../tag/tag_lib.dart';
import '../tasks/tasks_lib.dart';
import 'domain/entities/topic.dart';
import 'domain/entities/work.dart';
import 'domain/usecases/add_reminder_to_task.dart';
import 'domain/usecases/add_tag_to_task.dart';
import 'domain/usecases/add_task.dart';
import 'domain/usecases/add_user_to_task.dart';
import 'domain/usecases/delete_task.dart';
import 'domain/usecases/load_task_items_by_id_set.dart';
import 'domain/usecases/update_task.dart';

part 'data/other/models/task_model.dart';
part 'data/other/models/task_model_objectbox.dart';
part 'domain/entities/task_entity.dart';
part 'presentation/logic/task_bloc/task_bloc.dart';
part 'presentation/logic/task_bloc/task_event.dart';
part 'presentation/logic/task_bloc/task_state.dart';

// part 'presentation/pages/task_add.dart';
// part 'presentation/pages/task_card.dart';
// part 'presentation/pages/task_update_page.dart';

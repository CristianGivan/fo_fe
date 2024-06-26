import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/failures_message.dart';
import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';

import '../../../../core/const/constants.dart';
import '../../../../core/error/failures.dart';
import '../../organizer.dart';
import '../tag/tag_lib.dart';
import '../task/domain/entities/user.dart';

part 'data/datasources/organizer_item_local_data_source.dart';
part 'data/datasources/organizer_item_remote_data_source.dart';
part 'data/datasources/organizer_item_sync_data_source.dart';
part 'data/repositories/organizer_item_repositories_impl.dart';
part 'domain/entities/organizer_item_entity.dart';
part 'domain/repositories/organizer_item_repository.dart';

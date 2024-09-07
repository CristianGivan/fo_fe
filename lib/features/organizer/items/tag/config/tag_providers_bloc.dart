import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getTagBlocProviders() {
  return [
    BlocProvider<TagBlocTag>(
      create: (_) => GetIt.instance<TagBlocTag>(),
    ),
  ];
}

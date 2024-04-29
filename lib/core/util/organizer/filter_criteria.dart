part of 'core_util_organizer.dart';

abstract class FilterCriteria {
  const FilterCriteria();
}

//todo to be updated is only created

class FilterByName extends FilterCriteria {
  final String name;

  const FilterByName(this.name);
}

class FilterByCreatedDate extends FilterCriteria {
  final int year;

  const FilterByCreatedDate(this.year);
}

class NoFilter extends FilterCriteria {
  const NoFilter();
}

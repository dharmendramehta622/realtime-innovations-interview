part of common_widget;

extension DateTimeFormatter on DateTime {
  String get formatToReadableDate => DateFormat('d MMM y').format(this);
}

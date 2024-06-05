
/// Расширения [num]
extension NumExtension on num {

  /// Приведение числового значения к формату "1 500 000"
  /// TODO изменить название
  String toCost() {
    String costString = toStringAsFixed(0);
    costString = costString.replaceAllMapped(RegExp(r"(\d)(?=(\d{3})+(?!\d))"), (match) => "${match.group(0)} ");
    return costString;
  }
}

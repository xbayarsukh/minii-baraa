import 'package:intl/intl.dart';

String unit(num m) {
  var formatter = NumberFormat('#,###,###.#');
  return formatter.format(m).replaceAll(".0", "");
}

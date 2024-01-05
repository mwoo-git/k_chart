import 'package:intl/intl.dart';

extension NumExt on num? {
  bool get notNullOrZero {
    if (this == null || this == 0) {
      return false;
    }
    return this!.abs().toStringAsFixed(4) != "0.0000";
  }

  String get formattedString {

  return NumberFormat("#,###").format(this!);
}
}

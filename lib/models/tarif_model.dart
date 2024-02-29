import 'package:visiteo/models/visitor_model.dart';

class Tarif {
  int tarifMin;
  int tarifMax;
  int tarifTotal;
  final Visitor visitor;
  Tarif(
      {required this.tarifMin,
      required this.tarifMax,
      required this.tarifTotal,
      required this.visitor});

  factory Tarif.fromJson(Map<String, dynamic> json) {
    return Tarif(
      tarifMin: json['tarifMin'],
      tarifMax: json['tarifMax'],
      tarifTotal: json['tarifTotal'],
      visitor: json['visitor'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tarifMin'] = tarifMin;
    data['tarifMax'] = tarifMax;
    data['tarifTotal'] = tarifTotal;
    data['visitor'] = visitor;
    return data;
  }
}

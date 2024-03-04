import 'package:visiteo/models/visitor_model.dart';

class Tarif {
  final int minTarif;
  final int maxTarif;
  final int totalTarif;
  final Visitor minVisitor;
  final Visitor maxVisitor;

  Tarif({
    required this.minTarif,
    required this.maxTarif,
    required this.totalTarif,
    required this.minVisitor,
    required this.maxVisitor,
  });

  String get getMinTarif => minTarif.toString();
  String get getMaxTarif => maxTarif.toString();
  String get getTotalTarif => totalTarif.toString();

  factory Tarif.fromJson(Map<String, dynamic> json) {
    return Tarif(
      minTarif: json['min_tarif'],
      maxTarif: json['max_tarif'],
      totalTarif: json['total_tarif'],
      minVisitor: Visitor.fromJson(json['min_visitor']),
      maxVisitor: Visitor.fromJson(json['max_visitor']),
    );
  }
}

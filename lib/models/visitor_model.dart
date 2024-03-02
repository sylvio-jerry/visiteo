class Visitor {
  final int? id;
  final String numero;
  final String nom;
  final int tarifJournalier;
  final int nombreJour;
  final DateTime date;

  Visitor({
    required this.nom,
    required this.tarifJournalier,
    required this.nombreJour,
    required this.date,
    this.numero = "default",
    this.id,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json['id'],
      nom: json['nom'],
      tarifJournalier: json['tarifJournalier'],
      nombreJour: json['nombreJour'],
      date: DateTime.parse(json['date']),
      numero: json['numero'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'numero': numero,
        'nom': nom,
        'tarifJournalier': tarifJournalier,
        'nombreJour': nombreJour,
        'date': date.toIso8601String(),
      };

}

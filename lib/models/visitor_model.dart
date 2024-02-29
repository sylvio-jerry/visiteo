class Visitor {
  String? numero;
  String nom;
  int tarifJournalier;
  int nombreJour;
  String date;

  Visitor(
      {required this.nom,
      required this.tarifJournalier,
      required this.nombreJour,
      required this.date,
      this.numero});

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      nom: json['nom'],
      tarifJournalier: json['tarifJournalier'],
      nombreJour: json['nombreJour'],
      date: json['date'],
      numero: json['numero'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nom'] = nom;
    data['tarifJournalier'] = tarifJournalier;
    data['nombreJour'] = nombreJour;
    data['date'] = date;
    return data;
  }
}

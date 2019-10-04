import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String name;
  final DateTime time;
  final String id;

  Person(
    this.name, {
    this.id,
    DateTime time,
  }) : this.time = time ?? DateTime.now();

  Map<String, dynamic> get toJson => {
        "name": name,
        "time": time,
      };

  factory Person.fromJson(dynamic json) => Person(
        json["name"],
        id: json["id"],
        time: (json["time"] as Timestamp).toDate(),
      );
}

const NAMES = [
  "Louetta Reddish",
  "Mellissa Afanador",
  "Clorinda Dupuy",
  "Kellye Polzin",
  "Rufus Salyers",
  "Lester Piotrowski",
  "Kizzie Gentry",
  "Babette Quaid",
  "Elda Sandford",
  "Kena Heiney",
  "Lasonya Leanos",
  "Mathilde Seybert",
  "Page Ottesen",
  "Dorian Valente",
  "Carolann Rieves",
  "Lynda Tippetts",
  "Calvin Giusti",
  "Rich Meas",
  "Merissa Malinowski",
  "Eric Irvin",
  "Leighann Marlin",
  "Jaclyn Plude",
  "Jesse Schroder",
  "Krissy Blanche",
  "Crista Loveland",
  "Lilia Goucher",
  "Marvella Coach",
  "Shala Turrentine",
  "Alysha Fenimore",
  "Ardella Rodriguz",
  "Crysta Kroll",
  "Austin Round",
  "Cecille Wareham",
  "Pasquale Verges",
  "Francis Balentine",
  "Lashunda Mattix",
  "Jere Mckeever",
  "Adrienne Harbaugh",
  "Neida Ranallo",
  "Franklin Hodak",
  "Herma Rawles",
  "Tyree Gassaway",
  "Sarai Quinby",
  "Lang Marmol",
  "Stephanie Kincannon",
  "Neva Monteleone",
  "Benton Kennerly",
  "Evelia Rosenzweig",
  "Jarrett Uyehara",
  "Roxie Locklin",
];

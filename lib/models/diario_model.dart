import 'package:cloud_firestore/cloud_firestore.dart';

class Diario {
  String? id;
  String title;
  String description;
  DateTime date;
  String userId; 
  
  Diario({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.userId,
  });

  factory Diario.fromMap(Map<String, dynamic> map, [String? id]) {
    return Diario(
      id: id,
      title: map['title'],
      description: map['description'],
      date: map['date'] is Timestamp
          ? (map['date'] as Timestamp).toDate()
          : map['date'] as DateTime,
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': Timestamp.fromDate(date),
      'userId': userId,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderStatus {
  final DateTime? date;
  final bool? isDone;
  final String? statusName;

  OrderStatus({
    this.date,
    this.isDone,
    this.statusName,
  });

  factory OrderStatus.fromjson(Map<String, dynamic> data) {
    final rawDate = data['date'];
    DateTime? parsedDate;

    if (rawDate is Timestamp) {
      parsedDate = rawDate.toDate();
    } else if (rawDate is String) {
      parsedDate = DateTime.tryParse(rawDate);
    }

    return OrderStatus(
      date: parsedDate,
      isDone: data['is done'] ?? false,
      statusName: data['status name'] ?? '',
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'date': date != null ? Timestamp.fromDate(date!) : null,
      'is done': isDone,
      'status name': statusName,
    };
  }
}

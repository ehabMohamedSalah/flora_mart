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
    final timestamp = data['date'];
    return OrderStatus(
      date: timestamp != null ? (timestamp as Timestamp).toDate() : null,
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

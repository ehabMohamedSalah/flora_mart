// ignore_for_file: file_names

import '../../../data/model/occasions/Metadata.dart';
import '../../../data/model/occasions/Occasions.dart';

/// message : "success"
/// metadata : {"currentPage":1,"limit":10,"totalPages":2,"totalItems":15}
/// occasions : [{"_id":"673b34c21159920171827ae0","name":"Wedding","slug":"wedding","image":"da6919e9-6d7b-4e1e-9578-1c5b6fd098b2-sofia-hernandez-8cCfjxR8KTw-unsplash.jpg","createdAt":"2024-11-18T12:36:18.366Z","updatedAt":"2024-11-18T12:36:18.366Z","productsCount":4},{"_id":"673b351e1159920171827ae5","name":"Graduation","slug":"graduation","image":"33f50c5b-2f99-4a64-90d3-e50cbf1d8727-vasily-koloda-8CqDvPuo_kI-unsplash.jpg","createdAt":"2024-11-18T12:37:50.433Z","updatedAt":"2024-11-18T12:37:50.433Z","productsCount":3},{"_id":"673b354b1159920171827ae8","name":"Birthday","slug":"birthday","image":"fb2a0878-d236-4954-9720-9668d2ee5d30-ana-tavares-4Lmzh6vVLJ8-unsplash.jpg","createdAt":"2024-11-18T12:38:35.254Z","updatedAt":"2024-11-18T12:38:35.254Z","productsCount":0},{"_id":"673b35c01159920171827aed","name":"Anniversary","slug":"anniversary","image":"d6971db8-4fdc-4d4d-b87e-c997d79e8f1b-Rectangle 3862.png","createdAt":"2024-11-18T12:40:32.912Z","updatedAt":"2024-11-18T12:40:32.912Z","productsCount":1},{"_id":"673b364e1159920171827af9","name":"New Year","slug":"new-year","image":"dad03ac6-87ea-4467-aaea-0ef5fe9b0076-flower_image.png","createdAt":"2024-11-18T12:42:54.617Z","updatedAt":"2024-11-18T12:42:54.617Z","productsCount":0},{"_id":"673b368c1159920171827afc","name":"Valentine's Day","slug":"valentine's-day","image":"a6ecd2f0-85ca-412e-bb08-3693b00dbc1f-flower_image.png","createdAt":"2024-11-18T12:43:56.070Z","updatedAt":"2024-11-18T12:43:56.070Z","productsCount":0},{"_id":"673b36e71159920171827b05","name":"Mother's Day","slug":"mother's-day","image":"f2be4ed7-de98-42d1-9958-0aa7039c0ec3-flower_image.png","createdAt":"2024-11-18T12:45:27.841Z","updatedAt":"2024-11-18T12:45:27.841Z","productsCount":0},{"_id":"673b37511159920171827b0e","name":"Father's Day","slug":"father's-day","image":"6f60ae3d-bc4f-4d57-bf87-63e91bcb7d50-flower_image.png","createdAt":"2024-11-18T12:47:13.101Z","updatedAt":"2024-11-18T12:47:13.101Z","productsCount":0},{"_id":"673b37a31159920171827b13","name":"Christmas","slug":"christmas","image":"cc63221c-acd9-4eeb-a2b3-b9ff9c28e2ba-flower_image.png","createdAt":"2024-11-18T12:48:35.694Z","updatedAt":"2024-11-18T12:48:35.694Z","productsCount":0},{"_id":"673b37c41159920171827b16","name":"Easter","slug":"easter","image":"7b9318b5-5c7f-4cb5-a9aa-b02590e57fbc-flower_image.png","createdAt":"2024-11-18T12:49:08.850Z","updatedAt":"2024-11-18T12:49:08.850Z","productsCount":0}]

class OccasiosnResponseEntity {
  OccasiosnResponseEntity({
    this.message,
    this.metadata,
    this.occasions,
  });

  String? message;
  Metadata? metadata;
  List<Occasions>? occasions;
}

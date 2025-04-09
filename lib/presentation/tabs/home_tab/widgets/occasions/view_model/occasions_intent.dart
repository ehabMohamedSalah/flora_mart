sealed class OccasionsIntent {}


class GetProductIntent extends OccasionsIntent {
  final String typeId;
  final String type;
  GetProductIntent({required this.typeId, required this.type});
}
class GetOccaisonIntent extends OccasionsIntent {}

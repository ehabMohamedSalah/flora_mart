sealed class SavedAddressIntent {}

class DeleteSavedAddressIntent extends SavedAddressIntent {
  final String id;

  DeleteSavedAddressIntent({
    required this.id,
  });
}

class GetSavedAddressIntent extends SavedAddressIntent {}

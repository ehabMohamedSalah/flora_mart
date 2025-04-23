abstract class AddressIntent {}

class UpdateAddressIntent extends AddressIntent {
  final String addressId;
  final String street;
  final String phone;
  final String city;
  final double latitude;
  final double longitude;
  final String recipientName;

  UpdateAddressIntent({
    required this.addressId,
    required this.street,
    required this.phone,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.recipientName,
  });
}

class AddAddressIntent extends AddressIntent {
  final String street;
  final String phone;
  final String city;
  final double latitude;
  final double longitude;
  final String recipientName;

  AddAddressIntent({
    required this.street,
    required this.phone,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.recipientName,
  });
}

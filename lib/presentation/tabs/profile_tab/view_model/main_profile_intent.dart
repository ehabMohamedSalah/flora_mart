sealed class MainProfileIntent {}

class DataProfileCubitIntent extends MainProfileIntent {
  final String firstName;
  final String email;

  DataProfileCubitIntent({required this.firstName, required this.email});
}

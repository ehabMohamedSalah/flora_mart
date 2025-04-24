// ignore_for_file: camel_case_types

abstract class AddressState {
  bool isLoading;
  String? error;
  bool isSuccess;

  AddressState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  });
}

class AddressInitialState extends AddressState {
  AddressInitialState() : super();

  @override
  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return AddressInitialState()
      ..isLoading = isLoading ?? this.isLoading
      ..error = error ?? this.error
      ..isSuccess = isSuccess ?? this.isSuccess;
  }
}

class UpdateAddressLoadingState extends AddressState {
  UpdateAddressLoadingState() : super(isLoading: true);

  @override
  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return UpdateAddressLoadingState()
      ..isLoading = isLoading ?? this.isLoading
      ..error = error ?? this.error
      ..isSuccess = isSuccess ?? this.isSuccess;
  }
}

class UpdateAddressSuccessState extends AddressState {
  UpdateAddressSuccessState() : super(isSuccess: true);

  @override
  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return UpdateAddressSuccessState()
      ..isLoading = isLoading ?? this.isLoading
      ..error = error ?? this.error
      ..isSuccess = isSuccess ?? this.isSuccess;
  }
}

class UpdateAddressErrorState extends AddressState {
  String message;

  UpdateAddressErrorState(this.message)
      : super(error: message, isSuccess: false);

  @override
  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return UpdateAddressErrorState(error ?? message)
      ..isLoading = isLoading ?? this.isLoading
      ..isSuccess = isSuccess ?? this.isSuccess;
  }
}

class addAddressLoadingState extends AddressState {
  addAddressLoadingState() : super(isLoading: true);

  @override
  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return UpdateAddressLoadingState()
      ..isLoading = isLoading ?? this.isLoading
      ..error = error ?? this.error
      ..isSuccess = isSuccess ?? this.isSuccess;
  }
}

class addAddressSuccessState extends AddressState {
  addAddressSuccessState() : super(isSuccess: true);

  @override
  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return UpdateAddressSuccessState()
      ..isLoading = isLoading ?? this.isLoading
      ..error = error ?? this.error
      ..isSuccess = isSuccess ?? this.isSuccess;
  }
}

class addAddressErrorState extends AddressState {

  String message;

  addAddressErrorState(this.message) : super(error: message, isSuccess: false);

  @override
  AddressState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return UpdateAddressErrorState(error ?? message)
      ..isLoading = isLoading ?? this.isLoading
      ..isSuccess = isSuccess ?? this.isSuccess;
  }
}

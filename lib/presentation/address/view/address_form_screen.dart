// ignore_for_file: deprecated_member_use

import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/address_custom_text_field.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/data/model/address_model.dart';
import 'package:flora_mart/presentation/address/view_model/address_cubit.dart';
import 'package:flora_mart/presentation/address/view_model/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class AddressFormScreen extends StatefulWidget {
  final String? addressId;
  final AddressModel? address;
  final String submitButtonText;
  final Function(String street, String phone, String city, double latitude,
      double longitude, String recipientName) onSubmit;

  const AddressFormScreen({
    super.key,
    this.addressId,
    this.address,
    required this.submitButtonText,
    required this.onSubmit,
  });

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _recipientNameController =
      TextEditingController();
  String _selectedCity = '';
  String _selectedArea = '';
  LatLng _selectedLocation = const LatLng(0, 0);
  GoogleMapController? _mapController;

  void _moveCamera(LatLng location) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 15,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setInitialLocation();
    // Initialize fields if address is provided
    if (widget.address != null) {
      _streetController.text = widget.address!.street;
      _phoneController.text = widget.address!.phone;
      _recipientNameController.text = widget.address!.username;
      _selectedCity = widget.address!.city;
      _selectedLocation = LatLng(
        double.parse(widget.address!.lat),
        double.parse(widget.address!.long),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddressCubit>(),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.submitButtonText),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _selectedLocation,
                        zoom: 15,
                      ),
                      onMapCreated: (controller) {
                        _mapController = controller;
                      },
                      onTap: (LatLng location) {
                        setState(() {
                          _selectedLocation = location;
                          _moveCamera(location);
                        });
                      },
                      markers: {
                        Marker(
                          markerId: const MarkerId('selected_location'),
                          position: _selectedLocation,
                        ),
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GooglePlaceAutoCompleteTextField(
                          textEditingController: _streetController,
                          googleAPIKey:
                              'AIzaSyAxJRTgg0zZK4skdhqdmlrIymFGOympPZg',
                          countries: const ['eg'],
                          inputDecoration: InputDecoration(
                            labelText: AppStrings.address,
                            hintText: _streetController.text.isEmpty
                                ? AppStrings.enterAddress
                                : _streetController.text,
                            labelStyle: const TextStyle(color: Colors.black),
                            hintStyle: const TextStyle(color: Colors.black54),

                            // Make sure the text is black when typing
                          ),
                          debounceTime: 800,
                          isLatLngRequired: true,
                          getPlaceDetailWithLatLng:
                              (Prediction prediction) async {
                            _streetController.text =
                                prediction.description ?? '';

                            if (prediction.lat != null &&
                                prediction.lng != null) {
                              final lat =
                                  double.tryParse(prediction.lat!) ?? 0.0;
                              final lng =
                                  double.tryParse(prediction.lng!) ?? 0.0;

                              setState(() {
                                _selectedLocation = LatLng(lat, lng);
                                _moveCamera(_selectedLocation);
                              });

                              try {
                                List<Placemark> placemarks =
                                    await placemarkFromCoordinates(lat, lng);
                                if (placemarks.isNotEmpty) {
                                  final placemark = placemarks.first;
                                  setState(() {
                                    _selectedCity =
                                        placemark.locality?.isNotEmpty == true
                                            ? placemark.locality!
                                            : placemark.administrativeArea ??
                                                '';

                                    _selectedArea = placemark
                                                .subLocality?.isNotEmpty ==
                                            true
                                        ? placemark.subLocality!
                                        : placemark.subAdministrativeArea ?? '';
                                  });
                                }
                              } catch (e) {
                                debugPrint('Error getting address details: $e');
                              }
                            }
                          },
                          itemClick: (Prediction prediction) {
                            setState(() {
                              _streetController.text =
                                  prediction.description ?? '';
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        AddressCustomTextField(
                          controller: _phoneController,
                          labelText: AppStrings.phoneNumber,
                          hintText: AppStrings.enterPhoneNumber,
                          keyboard: TextInputType.phone,
                        ),
                        const SizedBox(height: 16),
                        AddressCustomTextField(
                          controller: _recipientNameController,
                          labelText: AppStrings.recipientName,
                          hintText: AppStrings.enterRecipientName,
                          keyboard: TextInputType.name,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: AddressCustomTextField(
                                controller:
                                    TextEditingController(text: _selectedCity),
                                labelText: AppStrings.city,
                                hintText: _selectedCity.isEmpty
                                    ? 'Cairo'
                                    : _selectedCity,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: AddressCustomTextField(
                                controller:
                                    TextEditingController(text: _selectedArea),
                                labelText: AppStrings.area,
                                hintText: _selectedArea.isEmpty
                                    ? 'October'
                                    : _selectedArea,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              widget.onSubmit(
                                _streetController.text,
                                _phoneController.text,
                                _selectedCity,
                                _selectedLocation.latitude,
                                _selectedLocation.longitude,
                                _recipientNameController.text,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            child: Text(
                              widget.submitButtonText,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: ColorManager.backgroundColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _setInitialLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _selectedLocation = LatLng(position.latitude, position.longitude);
    });

    _moveCamera(_selectedLocation);
  }
}

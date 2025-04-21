import 'dart:io';

import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/presentation/edit_profile_screen/view_model/edit_profile_state.dart';
import 'package:flora_mart/presentation/edit_profile_screen/view_model/edit_profile_cubit.dart';
import 'package:flora_mart/presentation/edit_profile_screen/view_model/edit_profile_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/resuable_comp/custom_text_field.dart';
import 'package:flora_mart/domain/entity/auth/user_entity.dart';
import 'package:badges/badges.dart' as badges;

class EditProfileScreen extends StatefulWidget {
  final UserEntity user;

  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late String selectedGender;
  String? profileImagePath;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);

    // Capitalize first letter and make rest lowercase to match Radio button values
    selectedGender = widget.user.gender != null
        ? widget.user.gender![0].toUpperCase() +
            widget.user.gender!.substring(1).toLowerCase()
        : 'Female';
    debugPrint('Initializing gender with formatting: $selectedGender');
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null && mounted) {
        image.path.toLowerCase().endsWith('.png');

        setState(() {
          profileImagePath = image.path;
        });

        context.read<EditProfileCubit>().onIntent(
              UploadPhotoIntent(photoPath: image.path),
            );
      }
    } catch (e) {
      toastMessage(
        message: "Failed to select image. Please try again.",
        tybeMessage: TybeMessage.negative,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          toastMessage(
            message: "Profile updated successfully",
            tybeMessage: TybeMessage.positive,
          );
          Navigator.pop(context, true);
        } else if (state is EditProfileFailure) {
          toastMessage(
            message: state.message,
            tybeMessage: TybeMessage.negative,
          );
        } else if (state is PhotoUploadSuccess) {
          Navigator.pop(context, true);

          toastMessage(
            message: "Photo uploaded successfully",
            tybeMessage: TybeMessage.positive,
          );
        } else if (state is PhotoUploadFailure) {
          toastMessage(
            message: state.message,
            tybeMessage: TybeMessage.negative,
          );
        }
      },
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Edit profile',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                IconButton(
                  icon: const badges.Badge(
                    badgeContent:
                        Text('1', style: TextStyle(color: Colors.white)),
                    child:
                        Icon(Icons.notifications_outlined, color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Image Section
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: profileImagePath != null
                                ? FileImage(File(profileImagePath!))
                                : (widget.user.photo?.isNotEmpty ?? false)
                                    ? NetworkImage(widget.user.photo!)
                                    : const AssetImage(
                                            'assets/images/default_profile.png')
                                        as ImageProvider,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: state is EditProfileLoading
                                  ? null
                                  : _pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.grey.shade200),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Form Fields Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: firstNameController,
                              labelText: 'First name',
                              hintText: 'Enter first name',
                              validator: (value) =>
                                  value?.isEmpty == true ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomTextField(
                              controller: lastNameController,
                              labelText: 'Last name',
                              hintText: 'Enter last name',
                              validator: (value) =>
                                  value?.isEmpty == true ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextField(
                        controller: emailController,
                        labelText: 'Email',
                        hintText: 'Enter email',
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value?.isEmpty == true) return 'Required';
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value!)) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextField(
                        controller: phoneController,
                        labelText: 'Phone number',
                        hintText: 'Enter phone number',
                        keyboard: TextInputType.phone,
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password Field (readonly/disabled)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextField(
                        controller: TextEditingController(text: '********'),
                        labelText: 'Password',
                        suffixIcon: // In the password field's change button:
                            TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteManager.changePasswordScreen);
                          },
                          child: const Text(
                            'Change',
                            style: TextStyle(
                              color: Color(0xFFE91E63),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Gender Selection
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Female',
                                groupValue: selectedGender,
                                activeColor: const Color(0xFFE91E63),
                                onChanged: (value) {
                                  debugPrint('Changing gender to: $value');
                                  setState(() => selectedGender = value!);
                                },
                              ),
                              const Text('Female'),
                              const SizedBox(width: 24),
                              Radio<String>(
                                value: 'Male',
                                groupValue: selectedGender,
                                activeColor: const Color(0xFFE91E63),
                                onChanged: (value) {
                                  debugPrint('Changing gender to: $value');
                                  setState(() => selectedGender = value!);
                                },
                              ),
                              const Text('Male'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Update Button
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: state is EditProfileLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<EditProfileCubit>().onIntent(
                                          UpdateProfileIntent(
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            gender: selectedGender,
                                          ),
                                        );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE91E63),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: state is EditProfileLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

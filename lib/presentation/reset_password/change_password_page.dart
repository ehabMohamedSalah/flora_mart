import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flora_mart/core/resuable_comp/custom_text_field.dart';
import 'package:flora_mart/core/resuable_comp/validator.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';

import 'view_model/reset_password_cubit.dart';
import 'view_model/reset_password_intent.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    oldPasswordController.addListener(_updateButtonState);
    newPasswordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = oldPasswordController.text.isNotEmpty &&
          newPasswordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ResetPasswordCubit>(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            toastMessage(
              message: AppStrings.passwordChangedSuccessfully,
              tybeMessage: TybeMessage.positive,
            );
            Navigator.pop(context);
          } else if (state is ResetPasswordErrorState) {
            toastMessage(
              message: state.message.toString(),
              tybeMessage: TybeMessage.negative,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                AppStrings.changePassword,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: AppStrings.currentPassword,
                      hintText: AppStrings.enterPassword,
                      controller: oldPasswordController,
                      keyboard: TextInputType.text,
                      obscureText: true,
                      validator: (value) => Validator.password(value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: AppStrings.newPassword,
                      hintText: AppStrings.enterPassword,
                      controller: newPasswordController,
                      keyboard: TextInputType.text,
                      obscureText: true,
                      validator: (value) => Validator.password(value),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.enterPassword,
                      controller: confirmPasswordController,
                      keyboard: TextInputType.text,
                      obscureText: true,
                      validator: (value) => Validator.confirmPassword(
                        value,
                        newPasswordController.text,
                      ),
                    ),
                    const SizedBox(height: 30),
                    FilledButton(
                      onPressed: isButtonEnabled &&
                              state is! ResetPasswordLoadingState
                          ? () {
                              if (formKey.currentState!.validate()) {
                                context.read<ResetPasswordCubit>().doIntent(
                                      ResetPasswordIntent(
                                        oldPassword: oldPasswordController.text,
                                        newPassword: newPasswordController.text,
                                      ),
                                    );
                              }
                            }
                          : null,
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: state is ResetPasswordLoadingState
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  AppStrings.update,
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

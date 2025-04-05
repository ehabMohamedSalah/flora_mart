import 'package:flora_mart/config/theme/app_theme.dart';
import 'package:flora_mart/core/constant.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/resuable_comp/custom_text_field.dart';
import 'package:flora_mart/core/resuable_comp/text_button.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _isPasswordVisible = false;

  final GlobalKey<FormState> formKey = GlobalKey();
  String? selectedGender;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.signUp),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: AppStrings.firstName,
                          hintText: AppStrings.enterFirstName,
                          controller: firstNameController,
                          keyboard: TextInputType.text,
                          validator: (data) => (data?.isEmpty ?? true)
                              ? 'Invalid first name'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          labelText: AppStrings.lastName,
                          hintText: AppStrings.enterLastName,
                          controller: lastNameController,
                          keyboard: TextInputType.text,
                          validator: (data) => (data?.isEmpty ?? true)
                              ? 'Invalid last name'
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                    controller: emailController,
                    keyboard: TextInputType.emailAddress,
                    validator: (data) {
                      if (data == null || data.isEmpty || !data.contains('@')) {
                        return AppStrings.invalidEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: AppStrings.password,
                          hintText: AppStrings.enterPassword,
                          controller: passwordController,
                          keyboard: TextInputType.text,
                          obscureText: !_isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return AppStrings.pleaseEnterAPassword;
                            }
                            if (data.length < 6) {
                              return AppStrings
                                  .passwordMustBeAtLeast6Characters;
                            }
                            final passwordPattern = Constant.regexPass;
                            if (!passwordPattern.hasMatch(data)) {
                              return AppStrings.pleaseEnterACorrectPassword;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          labelText: AppStrings.confirmPassword,
                          hintText: AppStrings.confirmPassword,
                          controller: rePasswordController,
                          keyboard: TextInputType.text,
                          obscureText: !_isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return AppStrings
                                  .pleaseEnterYourPasswordConfirmation;
                            }
                            if (data.length < 6) {
                              return AppStrings
                                  .passwordMustBeAtLeast6Characters;
                            }
                            if (data != passwordController.text) {
                              return AppStrings.passwordsDoNotMatch;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    labelText: AppStrings.phoneNumber,
                    hintText: AppStrings.enterPhoneNumber,
                    controller: phoneController,
                    keyboard: TextInputType.phone,
                    validator: (data) => (data?.isEmpty ?? true)
                        ? AppStrings.invalidPhoneNumber
                        : null,
                  ),
                  const SizedBox(height: 30),
                  FormField<String>(
                    validator: (value) {
                      if (selectedGender == null) {
                        return AppStrings.pleaseSelectAGender;
                      }
                      return null;
                    },
                    builder: (FormFieldState<String> state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(AppStrings.gender,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54)),
                              const SizedBox(width: 40),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: AppStrings.male,
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                        state.didChange(value);
                                      });
                                    },
                                  ),
                                  Text(AppStrings.male),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Row(
                                children: [
                                  Radio<String>(
                                    value: AppStrings.female,
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                        state.didChange(value);
                                      });
                                    },
                                  ),
                                  Text(AppStrings.female),
                                ],
                              ),
                            ],
                          ),
                          if (state.hasError)
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                state.errorText!,
                                style: AppTheme.lightTheme.textTheme.bodySmall
                                    ?.copyWith(color: Color(0xFFB3261E)),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.bySigningUpYouAgreeToOur,
                          style: TextStyle(fontSize: 12)),
                      GestureDetector(
                        onTap: () {},
                        child: Text(AppStrings.termsandConditions,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterViewModelSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Registration Successful!")));
                        () {
                          // هيروح للLogin
                        };
                      } else if (state is RegisterViewModelFailure) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      return CustomTextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().doIntent(
                                  RegisterUserIntent(
                                    firstName: firstNameController.text.trim(),
                                    lastName: lastNameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                    rePassword: rePasswordController.text,
                                    phone: phoneController.text.trim(),
                                    gender: selectedGender!,
                                  ),
                                );
                          }
                        },
                        borderColor: ColorManager.pinkBase,
                        text: AppStrings.signUp,
                        color: ColorManager.primaryColor,
                        textColor: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.alreadyHaveAnAccount,
                          style: TextStyle(fontSize: 17)),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RouteManager.loginScreen);
                        },
                        child: Text(AppStrings.login,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.pinkBase,
                                decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

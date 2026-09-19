import 'package:docdoc_app/core/Navigation/Routes.dart';
import 'package:docdoc_app/core/Share/Custome_main_bottun.dart';
import 'package:docdoc_app/core/Share/TextInputField.dart';
import 'package:docdoc_app/core/Share/gender.dart';
import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/AssetsManager.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/Custome_txt_btn.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:docdoc_app/core/style/fontWeight.dart';
import 'package:docdoc_app/feature/Signup/manager/Signup_cubit.dart';
import 'package:docdoc_app/feature/Signup/manager/Signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool rememberMe = false;
  String? selectedGender;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _numberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmpasswordController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _numberController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SuccessSignupState) {
          context.go(Routes.kHome);
        } else if (state is FailureSignupState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Units.getWidth(context: context, value: 24),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Units.getHeight(context: context, value: 30),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Units.getWidth(context: context, value: 31),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyleManager.textStylePrimaryColor100B24(
                                context,
                              ),
                            ),
                            SizedBox(
                              height: Units.getHeight(context: context, value: 8),
                            ),
                            Text(
                              "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                              style: TextStyleManager.textStyleBodyBackgroundR14(
                                context,
                              ),
                            ),
                            SizedBox(
                              height: Units.getHeight(context: context, value: 5),
                            ),
                          ],
                        ),
                      ),
                      CustomTextFormField(
                        controller: _nameController,
                        label: '',
                        hint: 'Name',
                        hintTextStyle: TextStyleManager.textStyleGreyColor50M14(
                          context,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Name is required';
                          }
                          if (value.trim().length < 3) {
                            return 'Name must be at least 3 characters';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        label: '',
                        hint: 'Email',
                        hintTextStyle: TextStyleManager.textStyleGreyColor50M14(
                          context,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          if (!value.contains('@')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: _numberController,
                        label: '',
                        hint: 'Your number',
                        hintTextStyle: TextStyleManager.textStyleGreyColor50M14(
                          context,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Number is required';
                          }
                          if (value.length != 11 || int.tryParse(value) == null) {
                            return 'Phone number must contain 11 digits';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        label: '',
                        hint: 'Password',
                        hintTextStyle: TextStyleManager.textStyleGreyColor50M14(
                          context,
                        ),
                        isPasswordField: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: _confirmpasswordController,
                        label: '',
                        hint: 'Confirm Password',
                        hintTextStyle: TextStyleManager.textStyleGreyColor50M14(
                          context,
                        ),
                        isPasswordField: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Confirm Password is required';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 16),
                      ),
                      GenderDropdownField(
                        value: selectedGender,
                        onSelectionChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 16),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: ColorManager.SecondaryFillGreen,
                            hoverColor: ColorManager.GreyColor50,
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          Text(
                            'Remember me',
                            style: TextStyleManager.textStyleGreyColor50M12(
                              context,
                            ),
                          ),
                          const Spacer(),
                          CustomeTxtBtn(
                            onPressed: () {},
                            BtnTitle: 'Forgot Password?',
                            fontSize: 12,
                            fontWeight: fontWeight.medium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 15),
                      ),
                      CustomMainButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignupCubit>().Signup(
                                  Name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  phone: _numberController.text.trim(),
                                  gender: selectedGender ?? '',
                                  confirmPassword:
                                      _confirmpasswordController.text.trim(),
                                );
                          }
                        },
                        btnTitle: 'Create Account', title: 'Create Account',
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 10),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            color: ColorManager.GreyColor40,
                            thickness: 1,
                          ),
                          Container(
                            color: ColorManager.WhiteBackground,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Or sign in with',
                              style: TextStyleManager.textStyleGreyColor60R12(
                                context,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 15),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Units.getHorizontal(
                            context: context,
                            value: 85,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Units.getWidth(
                                context: context,
                                value: 46,
                              ),
                              height: Units.getHeight(
                                context: context,
                                value: 46,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.GreyColor20,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AssetsManager.GoogleIcon),
                            ),
                            Container(
                              width: Units.getWidth(
                                context: context,
                                value: 46,
                              ),
                              height: Units.getHeight(
                                context: context,
                                value: 46,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.GreyColor20,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AssetsManager.FacebookIcon),
                            ),
                            Container(
                              width: Units.getWidth(
                                context: context,
                                value: 46,
                              ),
                              height: Units.getHeight(
                                context: context,
                                value: 46,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.GreyColor20,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AssetsManager.AppleIcon),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 13),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'By logging, you agree to our ',
                                style: TextStyleManager.textStyleGreyColor60R12(
                                  context,
                                ),
                              ),
                              Text(
                                'Terms & Conditions ',
                                style: TextStyleManager.textStyleGreyColor100R11(
                                  context,
                                ),
                              ),
                              Text(
                                'and',
                                style: TextStyleManager.textStyleGreyColor60R12(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'PrivacyPolicy',
                            style: TextStyleManager.textStyleGreyColor100R11(
                              context,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Units.getHeight(
                              context: context,
                              value: 17,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account yet?',
                                style: TextStyleManager.textStyleGreyColor100R11(
                                  context,
                                ),
                              ),
                              CustomeTxtBtn(
                                onPressed: () {
                                  context.go(Routes.kLogin);
                                },
                                BtnTitle: 'Login',
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
import 'package:docdoc_app/core/Navigation/Routes.dart';
import 'package:docdoc_app/core/Share/Custome_main_bottun.dart';
import 'package:docdoc_app/core/Share/TextInputField.dart';
import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/AssetsManager.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/Custome_txt_btn.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:docdoc_app/core/style/fontWeight.dart';
import 'package:docdoc_app/feature/Login/Manager/Login_cubit.dart';
import 'package:docdoc_app/feature/Login/Manager/Login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool rememberMe = false;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          context.go(Routes.kHome);
        } else if (state is FailureLoginState) {
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
                        height: Units.getHeight(context: context, value: 35),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Units.getHorizontal(
                            context: context,
                            value: 31,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyleManager.textStylePrimaryColor100B24(
                                context,
                              ),
                            ),
                            SizedBox(
                              height: Units.getHeight(
                                context: context,
                                value: 8,
                              ),
                            ),
                            Text(
                              "We're excited to have you back, can't wait to "
                              "see what you've been up to since you last "
                              "logged in.",
                              style: TextStyleManager.textStyleBodyBackgroundR14(
                                context,
                              ),
                            ),
                            SizedBox(
                              height: Units.getHeight(
                                context: context,
                                value: 29,
                              ),
                            ),
                          ],
                        ),
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
                        height: Units.getHeight(context: context, value: 20),
                      ),
                      CustomMainButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().Login(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );
                          }
                        },
                        title: 'Login', btnTitle: 'Login',
                      ),
                      SizedBox(
                        height: Units.getHeight(context: context, value: 20),
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
                        height: Units.getHeight(context: context, value: 32),
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
                        height: Units.getHeight(context: context, value: 32),
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
                              value: 24,
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
                                textAlign: TextAlign.center,
                              ),
                              CustomeTxtBtn(
                                onPressed: () {
                                  context.go(Routes.kSignup);
                                },
                                BtnTitle: 'Sign Up',
                                fontSize: 12,
                              ),
                            ],
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
      },
    );
  }
}
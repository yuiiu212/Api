import 'package:docdoc_app/core/Navigation/AppRouter.dart';
import 'package:docdoc_app/core/style/AppTheme.dart';
import 'package:docdoc_app/feature/Home/Presentation/manager/home_cubit.dart';
import 'package:docdoc_app/feature/Home/domain/Home_repo_impl.dart';
import 'package:docdoc_app/feature/Login/Manager/Login_cubit.dart';
import 'package:docdoc_app/feature/Login/domain/Login_repo_impl.dart';
import 'package:docdoc_app/feature/Signup/domain/Signup_repo_impl.dart';
import 'package:docdoc_app/feature/Signup/manager/Signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocDocApp extends StatelessWidget {
  const DocDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(LoginRepoImpl()),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(SignupRepoImpl()),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(HomeRepoImpl()),
        ),
      ],
      child: MaterialApp.router(
        title: 'DocDoc',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.appRouter,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
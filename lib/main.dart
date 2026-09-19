import 'package:docdoc_app/core/Utilis/cache_helper.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/docdoc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorManager.WhiteBackground,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(DocDocApp());
}
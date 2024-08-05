import 'package:e_commerce/product/database/hive_initialize/hive_initialize.dart';
import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/product/utility/bloc_providers/bloc_providers.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitialize.initializeHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviders(
      child: MaterialApp.router(
        title: AppString.appName,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
      ),
    );
  }
}

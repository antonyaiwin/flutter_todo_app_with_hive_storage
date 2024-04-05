import 'package:flutter/material.dart';
import 'package:flutter_todo_app_with_hive_storage/model/todo_model.dart';
import 'package:flutter_todo_app_with_hive_storage/view/home_screen/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/color_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ToDo Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorConstants.scaffoldBackgroundColor,
          foregroundColor: ColorConstants.primaryWhite,
        ),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: ColorConstants.bottomSheetBackgroundColor),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: ColorConstants.primaryWhite.withOpacity(0.5))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: ColorConstants.inputFillColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tempo_brasil/components/screen_state.dart';
import 'package:tempo_brasil/components/shared_preferences_helper.dart';
import 'package:tempo_brasil/shared/theme_colors.dart';
import 'package:tempo_brasil/view/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesHelper.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ChangeNotifierProvider(
    create: (context) => ScreenState(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode appTheme = ThemeMode.light;

  void setTheme(bool darkTheme) {
    setState(() {
      appTheme = darkTheme ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  void initState() {
    bool darkTheme = SharedPreferencesHelper.getDarkTheme();
    setTheme(darkTheme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempo Brasil',
      themeMode: appTheme,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: lightColorScheme.primary,
          titleTextStyle: const TextStyle(
            fontFamily: 'rubik',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: lightColorScheme.onBackground,
          titleTextStyle: const TextStyle(
            fontFamily: 'rubik',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(toggleTheme: setTheme),
    );
  }
}

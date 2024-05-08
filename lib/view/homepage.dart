import 'package:flutter/material.dart';
import 'package:tempo_brasil/components/shared_preferences_helper.dart';
import 'package:tempo_brasil/shared/custom_texts.dart';
import 'package:tempo_brasil/shared/theme_colors.dart';
import 'package:tempo_brasil/view/card_hourly_weather.dart';
import 'package:tempo_brasil/view/card_top_weather.dart';
import 'package:tempo_brasil/view/next_days_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.toggleTheme});

  final Function toggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkTheme = false;
  IconData themeMode = Icons.dark_mode;

  List<String> savedAlarms = [];

  setThemeData() async {
    setState(() {
      darkTheme = !darkTheme;
    });

    widget.toggleTheme(darkTheme);
    await SharedPreferencesHelper.setDarkTheme(darkTheme);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.4),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         setThemeData();
        //       },
        //       icon:
        //       Icon(darkTheme == false ? Icons.dark_mode : Icons.light_mode))
        // ],
      ),
      endDrawer: Drawer(),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/weather_forecast.webp'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const CardWeather(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomText(
                text: 'PREVISÃO POR HORA',
                color: lightColorScheme.primary,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index){
                  return HourlyWeatherCard();
                  })
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomText(
                text: 'PRÓXIMOS DIAS',
                color: lightColorScheme.primary,
                weight: FontWeight.bold,
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, index){
                  return NextDaysView();
                }))
          ],
        ),
      ),
    );
  }
}

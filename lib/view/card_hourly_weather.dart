

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tempo_brasil/shared/custom_texts.dart';
import 'package:tempo_brasil/shared/theme_colors.dart';

class HourlyWeatherCard extends StatefulWidget {
  const HourlyWeatherCard({super.key});

  @override
  State<HourlyWeatherCard> createState() => _HourlyWeatherCardState();
}

class _HourlyWeatherCardState extends State<HourlyWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              CustomText(text: '13:00', color: lightColorScheme.primary,),
              Expanded(child: SizedBox(width: 70,child: Image.asset('assets/icons/sun.png'))),
              CustomText(text: '25°C', color: lightColorScheme.primary,weight: FontWeight.bold,size: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tempo_brasil/shared/custom_texts.dart';
import 'package:tempo_brasil/shared/theme_colors.dart';

class CardWeather extends StatefulWidget {
  const CardWeather({super.key});

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 2,
        color: lightColorScheme.primary,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const CustomText(
                text: 'São José dos Campos - SP',
                weight: FontWeight.w500,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: '25°C',
                        size: 70,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset('assets/icons/sun.png'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

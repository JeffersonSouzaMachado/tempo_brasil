import 'package:flutter/material.dart';
import 'package:tempo_brasil/shared/custom_texts.dart';
import 'package:tempo_brasil/shared/theme_colors.dart';

class NextDaysView extends StatefulWidget {
  const NextDaysView({super.key});

  @override
  State<NextDaysView> createState() => _NextDaysViewState();
}

class _NextDaysViewState extends State<NextDaysView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'TERÇA',
                color: lightColorScheme.primary,
              ),
              SizedBox(width: 30, child: Image.asset('assets/icons/cloudy.png')),
              CustomText(
                text: 'min 25°C',
                color: lightColorScheme.primary,
              ),
              CustomText(
                text: 'max 25°C',
                color: lightColorScheme.primary,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Divider(
            height: 2,
            color: lightColorScheme.primary.withOpacity(0.3),
          ),
        )
      ],
    );
  }
}

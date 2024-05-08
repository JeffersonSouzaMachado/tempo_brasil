import 'package:flutter/material.dart';
import 'package:tempo_brasil/api/city_list.dart';
import 'package:tempo_brasil/api/json_brazil_uf.dart';
import 'package:tempo_brasil/model/city_list_model.dart';
import 'package:tempo_brasil/shared/custom_texts.dart';
import 'package:tempo_brasil/shared/theme_colors.dart';

class SelectCityDialog extends StatefulWidget {
  const SelectCityDialog({super.key});

  @override
  State<SelectCityDialog> createState() => _SelectCityDialogState();
}

class _SelectCityDialogState extends State<SelectCityDialog> {
  String? selectedCity;
  String? selectedUf;
  List<CityModel> cities = [];
  TextEditingController ufController =
      TextEditingController(text: 'Selecione seu Estado');
  TextEditingController cityController =
      TextEditingController(text: 'Selecione sua Cidade');

  List<dynamic> filteredList = [];
  bool hideStateListview = false;

  @override
  void initState() {
    filteredList.addAll(UfBrasil);
    super.initState();
  }

  void filterUfItems(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredList =
            UfBrasil.where((item) => item.contains(query.toUpperCase()))
                .toList();
      });
    } else {
      setState(() {
        filteredList = List.from(UfBrasil);
      });
    }
  }

  void onClose() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BottomSheet(
      onClosing: onClose,
      builder: (BuildContext context) {
        return SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Estado: ",
                      color: lightColorScheme.primary,
                    ),
                    Expanded(
                        child: TextField(
                      controller: ufController,
                      onTap: () {
                        setState(() {
                          ufController.text = '';
                          hideStateListview = false;
                          filteredList = List.from(UfBrasil);
                        });
                      },
                      onChanged: filterUfItems,
                      style: TextStyle(
                          color: lightColorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ))
                  ],
                ),
                if (!hideStateListview)
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: size.width - 100,
                        height: 300,
                        child: ListView.builder(
                            itemCount: filteredList.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: InkWell(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    cities = await LoadCityList()
                                        .getCityList(filteredList[index]);
                                    setState(() {
                                      ufController.text = filteredList[index];
                                      filteredList.clear();
                                      hideStateListview = true;
                                    });
                                  },
                                  child: CustomText(
                                    text: filteredList[index],
                                    color: lightColorScheme.primary,
                                  ),
                                ),
                              );
                            }),
                      )),
                if (cities.isNotEmpty)
                  Row(
                    children: [
                      CustomText(
                        text: "Cidade: ",
                        color: lightColorScheme.primary,
                      ),
                      Expanded(
                          child: TextField(
                        controller: cityController,
                        onTap: () {
                          setState(() {});
                        },
                        onChanged: filterUfItems,
                        style: TextStyle(
                            color: lightColorScheme.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ))
                    ],
                  ),
                if (cities.isNotEmpty)
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: size.width - 100,
                        height: 300,
                        child: ListView.builder(
                            itemCount: cities.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: CustomText(
                                  text: cities[index].nome.toUpperCase(),
                                  color: lightColorScheme.primary,
                                ),
                              );
                            }),
                      )),
              ],
            ),
          ),
        );
      },
    );
  }
//TODO vou exibir no bottomsheet a opçao do estado, depois que selecionar o estado, vai abrir para selecionar a cidade
}

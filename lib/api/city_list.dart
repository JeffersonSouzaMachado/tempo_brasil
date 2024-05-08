import 'package:dio/dio.dart';
import 'package:tempo_brasil/model/city_list_model.dart';

class LoadCityList {
  Future<List<CityModel>> getCityList(String uf) async {
    try {
      final response = await Dio()
          .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/distritos');

      if (response.statusCode == 200) {
        List<CityModel> citiesList = [];
        for (var cityJson in response.data) {
          citiesList.add(CityModel.fromJson(cityJson));
        }
        print(citiesList);
        return citiesList;
      } else {
        throw Exception('Failed to load city list');
      }
    } catch (e) {
      throw Exception('Failed to load city list: $e');
    }
  }
}

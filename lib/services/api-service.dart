import 'dart:convert';

import 'package:countries_app/models/countrieModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIservice {
  String url = 'https://restcountries.com/v3.1/all';
  final Dio dio = Dio();

  Future<Response> getData() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<CountrieModel>> getAllCountries() async {
    Response response = await getData();
    if (response.statusCode == 200) {
      debugPrint(" okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      var data = response.data;
      List<CountrieModel> countries = [];
      for (Map<String, dynamic> json in data) {
        CountrieModel countrie = CountrieModel.fromJson(json);
        countries.add(countrie);
      }
      return countries;
    } else {
      debugPrint(" nonnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
      throw response;
    }
  }

  void saveDataInLocal(List<CountrieModel> countries) async {
    debugPrint('-----------------before try------------------------>');
    try {
      debugPrint('-----------------in try------------------------>');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      debugPrint('-----------------in try 1 ------------------------>');
      String countriesLocal = jsonEncode(countries);
      debugPrint('--------------------------------------------->');
      debugPrint(countriesLocal);
      prefs.setString('country_key', countriesLocal);
    }  catch (response) {
      debugPrint('-----------------in catch------------------------>');
      debugPrint("ERROR::------------------------");
      debugPrint("ERROR:: $response");
      debugPrint("ERROR:: -----------------------");
      rethrow;
    }
  }

  Future<List<CountrieModel>> getDataFromLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final countries = prefs.getString('country_key');
    List<CountrieModel> allCountries = jsonDecode(countries!);
    return allCountries;
  }
}



import 'package:countries_app/models/countrieModel.dart';
import 'package:countries_app/services/api-service.dart';
import 'package:flutter/material.dart';

class DataProvier with ChangeNotifier{
  final APIservice api = APIservice();
  final List<CountrieModel> _allCountries = [];

  List<CountrieModel> get allCountries => _allCountries;

  Future<void> getAllCountries() async{
    try{
      List<CountrieModel> countries = await  api.getAllCountries();
      _allCountries.addAll(countries);
      // save all counties to the local storage
      // api.saveDataInLocal(countries);
      notifyListeners();
    }
    catch(response){
      List<CountrieModel> countries = await  api.getDataFromLocalStorage();
      _allCountries.addAll(countries);
      // rethrow;
    }
  }

  Future<void> initData() async{
    await Future.wait([
      getAllCountries()
    ]);
  }
}
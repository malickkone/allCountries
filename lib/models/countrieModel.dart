// ignore_for_file: public_member_api_docs, sort_constructors_first


// ignore_for_file: file_names

class CountrieModel {
  // name, capital, population, area, and flag image URL.
  Name? name;
  List<String>? capital;
  int? population;
  double? area;
  Flags? flags;

  CountrieModel({
    this.name,
    this.capital,
    this.population,
    this.area,
    this.flags,
  });

  CountrieModel.fromJson(Map<String, dynamic> json){
    name =  Name.fromJson(json['name']);
    capital = json['capital'] == null ? [] : json['capital'].cast<String>() ;
    population = json['population'];
    area = json['area'];
    flags = Flags.fromJson(json['flags']);
  }
  
}


/// the name classe
class Name {
  String? common;
  Name({this.common});
  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
  }
}

class Flags {
  String? png;
  Flags({this.png});
  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
  }
}
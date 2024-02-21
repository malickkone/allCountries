import 'package:countries_app/models/countrieModel.dart';
import 'package:countries_app/repositories/data_provider.dart';
import 'package:countries_app/services/api-service.dart';
import 'package:countries_app/widgets/country_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({super.key});

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  final TextEditingController textController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  List<CountrieModel> allCountriesList = [];
  List<CountrieModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    APIservice().getAllCountries().then((value) => {
          setState(() {
            allCountriesList = value;
            allCountriesList.sort(
              (a, b) => a.name!.common!.compareTo(b.name!.common!),
            );
            filteredList = allCountriesList;
          })
        });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void filterListBySearchText(String searchText) {
    setState(() {
      filteredList = allCountriesList
          .where((country) => country.name!.common!
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<DataProvier>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 182, 215, 168),
            title: Text(
              'LIST OF ALL COUNTRIES',
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 320,
                  height: 55,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 182, 215, 168),
                        Color.fromARGB(255, 217, 234, 211),
                        Color.fromARGB(255, 107, 151, 91),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: TextField(
                      onChanged: (value) => filterListBySearchText(value),
                      onSubmitted: (value) => filterListBySearchText(value),
                      controller: textController,
                      cursorColor: Colors.black,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                          hintText: 'Search a country',
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.search_rounded,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () => FocusScope.of(context).unfocus(),
                          ),
                          suffix: IconButton(
                              icon: const Icon(
                                Icons.clear_rounded,
                              ),
                              onPressed: () {
                                textController.text = "";
                                filterListBySearchText("");
                              }),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.count(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: scrollController,
                      mainAxisSpacing: 25,
                      crossAxisCount: 2,
                      children: List.generate(
                          filteredList.length,
                          (index) => CountryCard(
                              country: filteredList[index]))),
                ),
              ],
            ),
          )),
    );
  }
}

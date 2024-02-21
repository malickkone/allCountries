
// ignore_for_file: use_build_context_synchronously
import 'package:countries_app/pages/all_countries_screen.dart';
import 'package:countries_app/repositories/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider = Provider.of<DataProvier>(context, listen: false);
    await dataProvider.initData();
    Navigator.pushReplacement( 
      context,
      MaterialPageRoute(builder: (context){
        return const AllCountriesScreen();
        // return  CountryCard(country: dataProvider.allCountries[30]);
      })
     );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/worldcolor2.png'),
          const SizedBox(height: 20,),
          const SpinKitFadingCircle(
            color: Color.fromARGB(255, 49, 60, 120),
          )
        ],
      ),
    );
  }
}
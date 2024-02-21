// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable


import 'package:flutter/material.dart';

import 'package:countries_app/models/countrieModel.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryDetails extends StatelessWidget {
  CountrieModel? country;
  CountryDetails({
    Key? key,
    this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 217,234,211),
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(country!.name!.common!, style: GoogleFonts.aDLaMDisplay(fontSize: 30, fontWeight: FontWeight.bold, ),),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255,182,215,168),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Capital :', style: GoogleFonts.aclonica(fontSize: 20, fontWeight: FontWeight.bold),),
                            const SizedBox(width: 20,),
                            Text(country!.capital![0], style: GoogleFonts.aclonica(fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Population :', style: GoogleFonts.aclonica(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 20,),
                            Text(country!.population!.toString(), style: GoogleFonts.aclonica(fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Area :', style: GoogleFonts.aclonica(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 20,),
                            Text('${country!.area} km2', style: GoogleFonts.aclonica(fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 200),
            child: SizedBox( width: 150, height:150, child: Image.network(country!.flags!.png!)),
          )
        ],
      ),
    );
  }
}

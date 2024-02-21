// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:countries_app/pages/country_details.dart';
import 'package:flutter/material.dart';

import 'package:countries_app/models/countrieModel.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryCard extends StatelessWidget {
  CountrieModel country;
  CountryCard({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryDetails(
                  country: country,
                ),
              ));
        },  
        child: Stack(
          children: [
            Card(
              elevation: 5,
              child: Container(
                width: 180,
                height: 200,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255,182,215,168),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(15))),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      country.name!.common!,
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Card(
                elevation: 3,
                child: Container(
                  width: 180,
                  height: 165,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(15))),
                  child: Image.network(
                    country.flags!.png!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_project/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kwidth,
          kwidth,
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Icon(
            Icons.cast,
            color: Colors.white,
            size: 32,
          ),
          kwidth,
          Container(
          width: 35,
                             height: 35,

          decoration: BoxDecoration(
              image: DecorationImage(
                
                  image: AssetImage('assest/Images/NetflixImoji.jpg'))),
          )
        ],
      ),
    );
  }
}

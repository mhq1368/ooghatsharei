import 'package:flutter/material.dart';

class MyColors {
  static const Color searchiconcolor = Color.fromARGB(255, 112, 112, 112);
  static const Color menuiconcolor = Color.fromARGB(255, 112, 112, 112);
  static const Color dividercolor = Color.fromARGB(100, 112, 112, 112);
  static const Color dividercolor1 = Color.fromARGB(255, 112, 112, 112);
  static const Color loadingcolor = Color.fromARGB(255, 51, 95, 121);
}


class MyGradients{
  static const LinearGradient splashBG=LinearGradient(colors:[
    Color(0xff0F2027),
    
    Color(0xff2C5364),

    Color(0xff203A43),
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight

  );
  static const LinearGradient azanListBG=LinearGradient(colors:[
    Color(0xff0F2027),
    
    Color(0xff2C5364),

    Color(0xff203A43),
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft

  );
  static const LinearGradient azanofogh=LinearGradient(colors:[
    Color.fromARGB(128, 15, 32, 39),
    
    Color.fromARGB(128, 44, 83, 100),

    Color.fromARGB(128, 32, 58, 67),
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft

  );
}

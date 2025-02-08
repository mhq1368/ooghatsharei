import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ooghatsharei/Components/constcolors.dart';

SpinKitFadingFour loading(double appHeight) {
  return SpinKitFadingFour(
    color: MyColors.loadingcolor,
    size: appHeight / 30.5,
  );
}

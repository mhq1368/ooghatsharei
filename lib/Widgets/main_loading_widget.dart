import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ooghatsharei/Components/constcolors.dart';

SpinKitFadingFour mainLoading(double appHeight) {
  return SpinKitFadingFour(
    color: MyColors.loadingcolor,
    size: appHeight / 15,
  );
}

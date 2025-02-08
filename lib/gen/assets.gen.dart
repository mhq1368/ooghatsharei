/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Peyda-Black.ttf
  String get peydaBlack => 'assets/fonts/Peyda-Black.ttf';

  /// File path: assets/fonts/Peyda-Bold.ttf
  String get peydaBold => 'assets/fonts/Peyda-Bold.ttf';

  /// File path: assets/fonts/Peyda-ExtraBold.ttf
  String get peydaExtraBold => 'assets/fonts/Peyda-ExtraBold.ttf';

  /// File path: assets/fonts/Peyda-ExtraLight.ttf
  String get peydaExtraLight => 'assets/fonts/Peyda-ExtraLight.ttf';

  /// File path: assets/fonts/Peyda-Light.ttf
  String get peydaLight => 'assets/fonts/Peyda-Light.ttf';

  /// File path: assets/fonts/Peyda-Medium.ttf
  String get peydaMedium => 'assets/fonts/Peyda-Medium.ttf';

  /// File path: assets/fonts/Peyda-Regular.ttf
  String get peydaRegular => 'assets/fonts/Peyda-Regular.ttf';

  /// File path: assets/fonts/Peyda-SemiBold.ttf
  String get peydaSemiBold => 'assets/fonts/Peyda-SemiBold.ttf';

  /// File path: assets/fonts/Peyda-Thin.ttf
  String get peydaThin => 'assets/fonts/Peyda-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        peydaBlack,
        peydaBold,
        peydaExtraBold,
        peydaExtraLight,
        peydaLight,
        peydaMedium,
        peydaRegular,
        peydaSemiBold,
        peydaThin
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/1629506.png
  AssetGenImage get a1629506 => const AssetGenImage('assets/icons/1629506.png');

  /// File path: assets/icons/Mic.png
  AssetGenImage get mic => const AssetGenImage('assets/icons/Mic.png');

  /// File path: assets/icons/Pen.png
  AssetGenImage get pen => const AssetGenImage('assets/icons/Pen.png');

  /// File path: assets/icons/aboutus.png
  AssetGenImage get aboutus => const AssetGenImage('assets/icons/aboutus.png');

  /// File path: assets/icons/exit.png
  AssetGenImage get exit => const AssetGenImage('assets/icons/exit.png');

  /// File path: assets/icons/homeicon.png
  AssetGenImage get homeicon =>
      const AssetGenImage('assets/icons/homeicon.png');

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// File path: assets/icons/menuicon.png
  AssetGenImage get menuicon =>
      const AssetGenImage('assets/icons/menuicon.png');

  /// File path: assets/icons/searchicon.png
  AssetGenImage get searchicon =>
      const AssetGenImage('assets/icons/searchicon.png');

  /// File path: assets/icons/share.png
  AssetGenImage get share => const AssetGenImage('assets/icons/share.png');

  /// File path: assets/icons/usericon.png
  AssetGenImage get usericon =>
      const AssetGenImage('assets/icons/usericon.png');

  /// File path: assets/icons/writeicon.png
  AssetGenImage get writeicon =>
      const AssetGenImage('assets/icons/writeicon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        a1629506,
        mic,
        pen,
        aboutus,
        exit,
        homeicon,
        logo,
        menuicon,
        searchicon,
        share,
        usericon,
        writeicon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/BG.png
  AssetGenImage get bg => const AssetGenImage('assets/images/BG.png');

  /// File path: assets/images/Poster_IMG.png
  AssetGenImage get posterIMG =>
      const AssetGenImage('assets/images/Poster_IMG.png');

  /// File path: assets/images/apppoter.png
  AssetGenImage get apppoter =>
      const AssetGenImage('assets/images/apppoter.png');

  /// File path: assets/images/img1.jpg
  AssetGenImage get img1 => const AssetGenImage('assets/images/img1.jpg');

  /// File path: assets/images/img2.jpg
  AssetGenImage get img2 => const AssetGenImage('assets/images/img2.jpg');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bg, posterIMG, apppoter, img1, img2, profile];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

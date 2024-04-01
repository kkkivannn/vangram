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

  /// File path: assets/fonts/Arizonia-Regular.ttf
  String get arizoniaRegular => 'assets/fonts/Arizonia-Regular.ttf';

  /// List of all assets
  List<String> get values => [arizoniaRegular];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Bell.svg
  String get bell => 'assets/icons/Bell.svg';

  /// File path: assets/icons/Calendar.svg
  String get calendar => 'assets/icons/Calendar.svg';

  /// File path: assets/icons/Call.svg
  String get call => 'assets/icons/Call.svg';

  /// File path: assets/icons/Category.svg
  String get category => 'assets/icons/Category.svg';

  /// File path: assets/icons/Comment.svg
  String get comment => 'assets/icons/Comment.svg';

  /// File path: assets/icons/FilledCategory.svg
  String get filledCategory => 'assets/icons/FilledCategory.svg';

  /// File path: assets/icons/FilledMessage.svg
  String get filledMessage => 'assets/icons/FilledMessage.svg';

  /// File path: assets/icons/FilledSettings.svg
  String get filledSettings => 'assets/icons/FilledSettings.svg';

  /// File path: assets/icons/FilledUser.svg
  String get filledUser => 'assets/icons/FilledUser.svg';

  /// File path: assets/icons/Heart.svg
  String get heart => 'assets/icons/Heart.svg';

  /// File path: assets/icons/Image.svg
  String get image => 'assets/icons/Image.svg';

  /// File path: assets/icons/Lock.svg
  String get lock => 'assets/icons/Lock.svg';

  /// File path: assets/icons/Message.svg
  String get message => 'assets/icons/Message.svg';

  /// File path: assets/icons/Right.svg
  String get right => 'assets/icons/Right.svg';

  /// File path: assets/icons/RightCircle.svg
  String get rightCircle => 'assets/icons/RightCircle.svg';

  /// File path: assets/icons/Settings.svg
  String get settings => 'assets/icons/Settings.svg';

  /// File path: assets/icons/User.svg
  String get user => 'assets/icons/User.svg';

  /// File path: assets/icons/like_me.svg
  String get likeMe => 'assets/icons/like_me.svg';

  /// File path: assets/icons/share_moment.svg
  String get shareMoment => 'assets/icons/share_moment.svg';

  /// File path: assets/icons/share_with_friends.svg
  String get shareWithFriends => 'assets/icons/share_with_friends.svg';

  /// List of all assets
  List<String> get values => [
        bell,
        calendar,
        call,
        category,
        comment,
        filledCategory,
        filledMessage,
        filledSettings,
        filledUser,
        heart,
        image,
        lock,
        message,
        right,
        rightCircle,
        settings,
        user,
        likeMe,
        shareMoment,
        shareWithFriends
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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

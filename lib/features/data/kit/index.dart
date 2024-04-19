import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sphere/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class DataUtils {
  /// toast
  /// 缓存图片
  static Widget imageCache(String url, {BoxFit? fit}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.fill,
      placeholder: (context, url) => CupertinoActivityIndicator(
        color: TColors.primary,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.redAccent,
      ),
    );
  }

  static String getRandomImage() {
    const assetHost = 'https://avatar.iran.liara.run/public/';
    final randomNumber = Random().nextInt(10); // 生成0到999的隨機數
    return '$assetHost$randomNumber';
  }
}

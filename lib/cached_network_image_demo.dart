import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheNetwrokImageDemo extends StatefulWidget {
  const CacheNetwrokImageDemo({super.key});

  @override
  State<CacheNetwrokImageDemo> createState() => _CacheNetwrokImageDemoState();
}

class _CacheNetwrokImageDemoState extends State<CacheNetwrokImageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CachedNetworkImage(
              //imageUrl: 'https://loremflickr.com/320/240/music?lock',

              imageUrl:
                  "https://images-eu.ssl-images-amazon.com/images/G/31/img19/Beauty/GW/desktop/Make-up-CC_desktop_1x._SY304_CB466075850_.jpg",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.red, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 40,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

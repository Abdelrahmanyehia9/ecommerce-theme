import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/dimentions.dart';

class AdvertBanners extends StatelessWidget {
  const AdvertBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            reverse: true,
            height: 120.0,
            viewportFraction: .8),
        items: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            width: double.infinity,
            height: screenHeight(context) * 0.14,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://i.postimg.cc/jdXFNbR7/image.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            width: double.infinity,
            height: screenHeight(context) * 0.14,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://i.postimg.cc/jdXFNbR7/image.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            width: double.infinity,
            height: screenHeight(context) * 0.14,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://i.postimg.cc/jdXFNbR7/image.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            width: double.infinity,
            height: screenHeight(context) * 0.14,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://i.postimg.cc/jdXFNbR7/image.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ]);
  }
}

import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return flexiProductimageSlider(
      arrayImages: const [
        "https://i.ibb.co/ZLFHX3F/1.png",
        "https://i.ibb.co/JKJvs5S/2.png",
        "https://i.ibb.co/LCzV7b3/3.png",
        "https://i.ibb.co/L8JHn1L/4.png",
        "https://i.ibb.co/7RWNCXH/5.png",
        "https://i.ibb.co/bBsh5Pm/6.png",
      ],
      sliderStyle: SliderStyle.overSlider,
      aspectRatio: 0.85,
      boxFit: BoxFit.cover,
      selectedImagePosition: 0,
      thumbnailAlignment: ThumbnailAlignment.right,
      thumbnailBorderType: ThumbnailBorderType.all,
      thumbnailBorderWidth: 2,
      thumbnailBorderRadius: 0,
      thumbnailWidth: 50,
      thumbnailHeight: 65,
      thumbnailBorderColor: AppConstants.kPrimaryColor,
    ) ;
  }
}

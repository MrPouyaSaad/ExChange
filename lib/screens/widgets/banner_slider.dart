// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_ex/screens/loading/home_screen_loading.dart';
import 'package:flutter/material.dart';

import 'package:coin_ex/api/entity/banner_entity.dart';
import 'package:coin_ex/screens/widgets/image_service.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final aspectRatio = 2.6;
final bannerBorderRadius = 12.0;
final bannerMargin = 12.0;

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    Key? key,
    required this.count,
    required this.banners,
  }) : super(key: key);

  final int count;
  final List banners;

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  PageController pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageViewController,
            itemCount: widget.count,
            itemBuilder: (context, index) {
              return _Slide(banner: widget.banners[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: pageViewController, // PageController
              count: widget.count,
              effect: ScaleEffect(
                  dotWidth: 8, dotHeight: 2), // your preferred effect
              //  onDotClicked: (index){

              //  }
            ),
          ).marginOnly(bottom: 8)
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final BannerEntity banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: bannerMargin, right: bannerMargin),
      child: ImageLoadingService(
        loadingWidget: BannerLoadingWidget(),
        imgUrl: banner.imgUrl,
        borderRadius: BorderRadius.circular(bannerBorderRadius),
      ),
    );
  }
}

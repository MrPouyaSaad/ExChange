import 'package:ExChange/screens/widgets/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenLoading extends StatelessWidget {
  const HomeScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'ExChange',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ).marginAll(12.0),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: BannerLoadingWidget(),
            ),
            SizedBox(
              height: 12.0,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoadingButton(),
                  LoadingButton(),
                  LoadingButton(),
                  LoadingButton(),
                ],
              ).marginOnly(left: bannerMargin, right: bannerMargin),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CoinInfoLoading(),
                    CoinInfoLoading(),
                    CoinInfoLoading(),
                    CoinInfoLoading(),
                    CoinInfoLoading(),
                    CoinInfoLoading(),
                  ],
                ).marginOnly(
                    left: bannerMargin, right: bannerMargin, top: bannerMargin),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerLoadingWidget extends StatelessWidget {
  const BannerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / aspectRatio,
      //margin: EdgeInsets.only(left: bannerMargin, right: bannerMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(bannerBorderRadius),
        color: Colors.grey.shade300,
      ),
    );
  }
}

class CoinInfoLoading extends StatelessWidget {
  const CoinInfoLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade300,
            foregroundColor: Colors.grey.shade300,
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: 72,
            height: 16,
            color: Colors.grey.shade300,
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 112,
                height: 12,
                color: Colors.grey.shade300,
              ),
              Container(
                width: 96,
                height: 12,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ],
      ),
    ).marginOnly(bottom: 8.0);
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 82,
      padding: EdgeInsets.all(8.0),
      color: Colors.grey.shade300,
    );
  }
}

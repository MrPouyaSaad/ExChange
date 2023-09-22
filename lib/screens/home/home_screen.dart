import 'package:ExChange/api/repo/banner_repository.dart';
import 'package:ExChange/api/repo/coin_list_repository.dart';
import 'package:ExChange/screens/home/bloc/home_bloc.dart';
import 'package:ExChange/screens/widgets/banner_slider.dart';
import 'package:ExChange/screens/widgets/image_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(
          baneerRepository: bannerRepository,
          coinListRepository: coinListRepository,
        );
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeSuccess) {
              return Column(
                children: [
                  Text(
                    'ExChange',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ).marginAll(12.0),
                  BannerSlider(
                    count: state.banner.length,
                    banners: state.banner,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyElevatedButton(
                        icon: Icon(CupertinoIcons.money_dollar),
                        title: 'Deposit',
                      ),
                      MyElevatedButton(
                        icon: Icon(CupertinoIcons.money_dollar),
                        title: 'Withdraw',
                      ),
                      MyElevatedButton(
                        icon: Icon(CupertinoIcons.creditcard),
                        title: 'Fiat',
                      ),
                      MyElevatedButton(
                        icon: Icon(CupertinoIcons.arrow_right_arrow_left),
                        title: 'Swap',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.coinList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 64,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 12.0,
                                ),
                              ]),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 24,
                                child: ImageLoadingService(
                                  loadingWidget: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey.shade300,
                                    foregroundColor: Colors.grey.shade300,
                                  ),
                                  imgUrl:
                                      'https://s2.coinmarketcap.com/static/img/coins/64x64/${index + 1}.png',
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              Text(
                                state.coinList[index].smb,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ).paddingOnly(left: 12.0),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    state.coinList[index].price,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(state.coinList[index].marketCap),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is HomeLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return Text('Error!!');
            }
          }),
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final Icon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 82,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8.0),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(title),
          ],
        ),
      ),
    );
  }
}

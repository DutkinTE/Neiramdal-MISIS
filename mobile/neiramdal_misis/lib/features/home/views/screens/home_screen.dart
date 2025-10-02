import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neiramdal_misis/features/home/bloc/home_bloc.dart';
import 'package:neiramdal_misis/features/home/bloc/home_state.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/appbar_icon_button.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/mission_card.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/rank_progressbar.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/shop_card_mini.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        if (state is HomeSuccess) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(42, 44, 69, 1),
                        Color.fromRGBO(40, 62, 149, 1),
                        Color.fromRGBO(52, 48, 73, 1),
                      ],
                      stops: [0, 0.36, 1],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                ListView(
                  padding: EdgeInsets.only(bottom: 0, top: kIsWeb ? 100 : 130),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ранг',
                                style: TextTheme.of(context).titleMedium,
                              ),
                              SizedBox(height: 16),
                              RankProgressbar(
                                start: state.user.experience,
                                end: 3500,
                              ),
                              SizedBox(height: 32),
                              Text(
                                'Предстоящие миссии',
                                style: TextTheme.of(context).titleMedium,
                              ),
                              SizedBox(height: 16),
                              MissionCard(state: MissionState.available),
                              SizedBox(height: 8),
                              MissionCard(state: MissionState.available),
                              SizedBox(height: 32),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Космический магазин',
                                    style: TextTheme.of(context).titleMedium,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Смотреть все',
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                          106,
                                          207,
                                          246,
                                          0.78,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          height: 197,
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            children: [
                              ShopCardMini(),
                              SizedBox(width: 20),
                              ShopCardMini(),
                              SizedBox(width: 20),
                              ShopCardMini(),
                              SizedBox(width: 20),
                              ShopCardMini(),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Рейтинг',
                                style: TextTheme.of(context).titleMedium,
                              ),
                              SizedBox(height: 16),
                              MissionCard(state: MissionState.active),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
                SizedBox(
                  height: 100 + MediaQuery.of(context).padding.top,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(42, 57, 112, 1),
                          Color.fromRGBO(42, 57, 112, 0),
                        ],
                        stops: [0.36, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppBarIconButton(
                                  func: () {},
                                  icon: SvgPicture.asset(
                                    'lib/assets/images/notificationIcon.svg',
                                  ),
                                  width: 40,
                                ),
                                SizedBox(width: 32),
                                Text(
                                  'Главная',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            AppBarIconButton(
                              func: () {},
                              icon: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.user.money.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  SvgPicture.asset(
                                    'lib/assets/images/fragmentIcon.svg',
                                    width: 15,
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neiramdal_misis/features/auth/models/user.dart';
import 'package:neiramdal_misis/features/mission/repositories/mission_repository.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/appbar_icon_button.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/mission_card.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/rank_progressbar.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  bool isSelectedStep = false;
  UserModel? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await UserStorage.getUserData();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Center(child: CircularProgressIndicator());
    }
    return isSelectedStep
        ? Scaffold(
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: kIsWeb ? 80 : 100.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'lib/assets/images/backgroundStepsStars.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.only(
                        bottom: 50,
                        top: kIsWeb ? 100 : 130,
                      ),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Выберите миссию',
                                    style: TextTheme.of(context).titleMedium,
                                  ),
                                  SizedBox(height: 32),
                                  MissionCard(state: MissionState.completed),
                                  SizedBox(height: 10),
                                  MissionCard(state: MissionState.active),
                                  SizedBox(height: 10),
                                  MissionCard(state: MissionState.available),
                                  SizedBox(height: 10),
                                  MissionCard(state: MissionState.available),
                                  SizedBox(height: 10),
                                  MissionCard(state: MissionState.disable),
                                  SizedBox(height: 10),
                                  MissionCard(state: MissionState.disable),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                                  func: () {
                                    setState(() {
                                      isSelectedStep = false;
                                    });
                                  },
                                  icon: SvgPicture.asset(
                                    'lib/assets/images/backArrowIcon.svg',
                                  ),
                                  width: 40,
                                ),
                                SizedBox(width: 32),
                                Text(
                                  'Миссии',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            AppBarIconButton(
                              func: () {
                                print(1);
                                MissionRepository().getMission(rank: 'seeker');
                              },
                              icon: SvgPicture.asset(
                                'lib/assets/images/notificationIcon.svg',
                              ),
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
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
                  padding: EdgeInsets.only(bottom: 50, top: kIsWeb ? 100 : 130),
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
                          RankProgressbar(start: _user!.experience, end: 3500),
                          SizedBox(height: 32),
                          Text(
                            'Выберите этап',
                            style: TextTheme.of(context).titleMedium,
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelectedStep = true;
                              });
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: SvgPicture.asset(
                                'lib/assets/images/jupyterCompleteCard.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelectedStep = true;
                              });
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: SvgPicture.asset(
                                'lib/assets/images/ganimedCard.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelectedStep = true;
                              });
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: SvgPicture.asset(
                                'lib/assets/images/ioCard.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            Text(
                              'Этапы',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            AppBarIconButton(
                              func: () {},
                              icon: SvgPicture.asset(
                                'lib/assets/images/notificationIcon.svg',
                              ),
                              width: 40,
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
  }
}

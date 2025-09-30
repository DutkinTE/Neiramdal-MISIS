import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neiramdal_misis/features/shared/views/widgets/appbar_icon_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(bottom: 0, top: kIsWeb ? 40 : 50),
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: EdgeInsets.only(top: kIsWeb ? 20 : 40),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'lib/assets/images/backgroundProfileStars.png',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset('lib/assets/images/avatar.png'),
                          SizedBox(height: 10),
                          Text(
                            'Дуткин Тимур',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Искатель',
                            style: TextStyle(
                              color: const Color.fromRGBO(106, 207, 246, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 800,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(45, 38, 81, 1),
                                  Color.fromRGBO(40, 62, 149, 1),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              height: 151,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromRGBO(
                                                      40,
                                                      62,
                                                      149,
                                                      1,
                                                    ),
                                                    Color.fromRGBO(
                                                      0,
                                                      93,
                                                      172,
                                                      1,
                                                    ),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                        106,
                                                        207,
                                                        246,
                                                        1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    '3025 XP',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Ранг:',
                                                    style: TextStyle(
                                                      height: 1.2,
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Искатель',
                                                    style: TextStyle(
                                                      height: 1.2,
                                                      color:
                                                          const Color.fromRGBO(
                                                            255,
                                                            227,
                                                            148,
                                                            1,
                                                          ),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              height: 151,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromRGBO(
                                                      40,
                                                      62,
                                                      149,
                                                      1,
                                                    ),
                                                    Color.fromRGBO(
                                                      0,
                                                      93,
                                                      172,
                                                      1,
                                                    ),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                        106,
                                                        207,
                                                        246,
                                                        1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    '13',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Заданий\nвыполнено',
                                                    style: TextStyle(
                                                      height: 1.2,
                                                      color:
                                                          const Color.fromRGBO(
                                                            255,
                                                            227,
                                                            148,
                                                            1,
                                                          ),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 59,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                0,
                                                174,
                                                239,
                                                0.2,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(40, 62, 149, 1),
                                                Color.fromRGBO(0, 93, 172, 1),
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Смотреть мои навыки',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 32),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Артефакты',
                                            style: TextTheme.of(
                                              context,
                                            ).titleMedium,
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
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 80,
                                  child: ListView(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: const Color.fromRGBO(
                                            0,
                                            174,
                                            239,
                                            1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: const Color.fromRGBO(
                                            0,
                                            174,
                                            239,
                                            1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: const Color.fromRGBO(
                                            0,
                                            174,
                                            239,
                                            1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: const Color.fromRGBO(
                                            0,
                                            174,
                                            239,
                                            1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: const Color.fromRGBO(
                                            0,
                                            174,
                                            239,
                                            1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: const Color.fromRGBO(
                                            0,
                                            174,
                                            239,
                                            1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 13),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: const Color.fromRGBO(
                                            0,
                                            174,
                                            239,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      Text(
                        'Профиль',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppBarIconButton(
                        func: () {},
                        icon: SvgPicture.asset(
                          'lib/assets/images/settingsIcon.svg',
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

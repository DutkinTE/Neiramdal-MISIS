import 'package:flutter/material.dart';

enum MissionState { completed, active, available, disable }

class MissionCard extends StatefulWidget {
  final MissionState state;
  const MissionCard({super.key, required this.state});

  @override
  State<MissionCard> createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionCard> {
  Color? borderColor;
  Color titleColor = Colors.white;
  Color textColor = Colors.white;
  String? icon;

  @override
  void initState() {
    super.initState();
    switch (widget.state) {
      case MissionState.completed:
        borderColor = Color.fromRGBO(0, 206, 93, 1);
        titleColor = Color.fromRGBO(0, 206, 93, 1);
        icon = 'lib/assets/images/starCompleteIcon.png';
      case MissionState.active:
        borderColor = Color.fromRGBO(255, 227, 148, 1);
        titleColor = Color.fromRGBO(255, 227, 148, 1);
        icon = 'lib/assets/images/starActiveIcon.png';
      case MissionState.available:
        borderColor = Color.fromRGBO(0, 0, 0, 0);
        icon = 'lib/assets/images/starAvailableIcon.png';
      case MissionState.disable:
        borderColor = Color.fromRGBO(0, 0, 0, 0);
        titleColor = Color.fromRGBO(127, 129, 136, 1);
        textColor = Color.fromRGBO(127, 129, 136, 1);
        icon = 'lib/assets/images/starDisableIcon.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 99,
      decoration: BoxDecoration(
        color: Color.fromRGBO(30, 46, 112, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor!),
      ),
      child: Row(
        children: [
          Image.asset(icon!),
          SizedBox(width: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Название миссии',
                style: TextStyle(
                  color: titleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Короткое описание задания\nв две строчки',
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

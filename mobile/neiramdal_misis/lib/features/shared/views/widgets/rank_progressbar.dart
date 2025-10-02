import 'package:flutter/material.dart';

class RankProgressbar extends StatefulWidget {
  final int start;
  final int end;
  const RankProgressbar({super.key, required this.start, required this.end});

  @override
  State<RankProgressbar> createState() => _RankProgressbarState();
}

class _RankProgressbarState extends State<RankProgressbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 81,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(0, 174, 239, 0.2)),
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(40, 62, 149, 1),
            Color.fromRGBO(0, 93, 172, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Искатель',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.start.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO(255, 227, 148, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/${widget.end} XP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          LinearProgressIndicator(
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
            value: widget.start / widget.end,
            color: Color.fromRGBO(0, 174, 239, 1),
            backgroundColor: Color.fromRGBO(42, 44, 69, 1),
          ),
        ],
      ),
    );
  }
}

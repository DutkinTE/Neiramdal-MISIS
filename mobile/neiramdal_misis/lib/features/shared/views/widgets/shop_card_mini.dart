import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopCardMini extends StatefulWidget {
  const ShopCardMini({super.key});

  @override
  State<ShopCardMini> createState() => _ShopCardMiniState();
}

class _ShopCardMiniState extends State<ShopCardMini> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 116,
      height: 197,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 93, 172, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Image.asset('lib/assets/images/car.png')),
          ),
          SizedBox(height: 16),
          Text(
            'Название товара',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            height: 23,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(40, 62, 149, 1),
                  Color.fromRGBO(0, 93, 172, 1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color.fromRGBO(0, 174, 239, 0.2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    height: 1,
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
    );
  }
}

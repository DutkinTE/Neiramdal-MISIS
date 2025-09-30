import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({super.key});

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 177,
      height: 287,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 161,
            height: 161,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 93, 172, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                'lib/assets/images/car.png',
                width: 161,
                height: 161,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Космическая\nмашина',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            height: 40,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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

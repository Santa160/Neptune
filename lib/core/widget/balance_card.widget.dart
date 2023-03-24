import 'package:flutter/material.dart';
import 'package:Neptune/core/constant/constant.dart';
import 'package:simple_shadow/simple_shadow.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.balance});

  final String icon;
  final String title;
  final String balance;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.1, // Default: 0.5
      color: Colors.black, // Default: Black
      offset: const Offset(3, 3), // Default: Offset(2, 2)
      sigma: 3,
      child: Container(
        height: 95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: defaultPadding * 1.6),
                child: SizedBox(
                    height: 60,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              icon,
                              width: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(title),
                          ],
                        ),
                        Positioned(
                          top: 20,
                          child: Text(
                            balance,
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Positioned(
              top: -20,
              right: -10,
              bottom: 0,
              child: Image.asset(
                KImage.coinImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

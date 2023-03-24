import 'package:flutter/material.dart';
import 'package:Neptune/core/widget/balance_card.widget.dart';

class Balance extends StatelessWidget {
  const Balance({super.key, required this.balance, required this.ewallet});
  final String balance;
  final String ewallet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Balance',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        const SizedBox(height: 15),
        BalanceCard(
          title: 'E-Wallet',
          icon: 'assets/images/wallet.png',
          balance: balance,
        ),
        const SizedBox(height: 15),
        BalanceCard(
          title: 'E-Pocket',
          icon: 'assets/images/pocket.png',
          balance: ewallet,
        ),
      ],
    );
  }
}

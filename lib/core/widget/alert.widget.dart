import 'package:Neptune/Auth/logic/logic.dart';
import 'package:Neptune/Responsive/responsive_layout.dart';
import 'package:Neptune/core/core.dart';
import 'package:Neptune/core/logic/cubit/verify_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router/router.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.btnText});

  final String icon;
  final String title;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycPageCheck, KycIndexState>(
      builder: (context, isKycState) {
        return BlocBuilder<PageIndexCubit, PageIndexState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.symmetric(
                vertical: defaultPadding * 1.5,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveLayoutPage.isMobile(context)
                    ? defaultPadding
                    : defaultPadding * 2,
                vertical: defaultPadding / 1.5,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: alertColor,
              ),
              child: Row(children: [
                Image.asset(
                  icon,
                  width: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    if (isKyc == false) {
                      context.read<VerifyPageCubit>().kycPage(900);
                      isKyc = true;
                      context.read<VerifyPageCubit>().kycPage(5);
                      await Future.delayed(Duration(seconds: 1));

                      isKyc = false;
                    }
                  },
                  child: Text(btnText),
                )
              ]),
            );
          },
        );
      },
    );
  }
}

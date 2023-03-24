import 'package:Neptune/Transaction/widgets/transaction.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/example.dart';
import '../../Responsive/responsive.dart';
import '../../core/core.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<DashBaordCubit>().getDash();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = context.watch<DashBaordCubit>().state;

    switch (state.status) {
      case Status.initial:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case Status.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case Status.loaded:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ResponsiveLayoutPage.isDesktop(context) ||
                ResponsiveLayoutPage.isExtraLarge(context))
              const SizedBox(width: defaultPadding),
            Expanded(
              flex: 7,
              child: SizedBox(
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width > 900
                        ? defaultPadding * 2.5
                        : defaultPadding,
                    left: MediaQuery.of(context).size.width > 900
                        ? defaultPadding
                        : 15,
                    right: MediaQuery.of(context).size.width > 900
                        ? defaultPadding
                        : 1,
                    bottom: MediaQuery.of(context).size.width > 900
                        ? defaultPadding
                        : 1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (ResponsiveLayoutPage.isMobile(context))
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (ResponsiveLayoutPage.isExtraLarge(context) ||
                                  ResponsiveLayoutPage.isTablet(context))
                                NavBarWidget(
                                  rupee: state.dashboardModel!.neptuneUnitConf
                                      .naptuneValue,
                                  neptuneInitallValue: state.dashboardModel!
                                      .neptuneUnitConf.naptuneInitailValue,
                                  one_second_rupee: state.dashboardModel!
                                      .neptuneUnitConf.oneSecondRupee,
                                  startTimeStamp: state.dashboardModel!
                                      .neptuneUnitConf.startTimestamp,
                                  dollar: state.dashboardModel!.neptuneUnitConf
                                      .dollarValue,
                                ),
                              if (ResponsiveLayoutPage.isMobile(context))
                                MobileNavBarWidget(
                                  rupee: state.dashboardModel!.neptuneUnitConf
                                      .naptuneValue,
                                  neptuneInitallValue: state.dashboardModel!
                                      .neptuneUnitConf.naptuneInitailValue,
                                  one_second_rupee: state.dashboardModel!
                                      .neptuneUnitConf.oneSecondRupee,
                                  startTimeStamp: state.dashboardModel!
                                      .neptuneUnitConf.startTimestamp,
                                  dollar: state.dashboardModel!.neptuneUnitConf
                                      .dollarValue,
                                ),

                              if (state.dashboardModel!.matureStatus == true)
                                Text(
                                  state.dashboardModel!.matureMsg ?? '',
                                  style: getTextStyle(
                                      15, FontWeight.bold, Colors.blue),
                                ),

                              //** Check Weather Kyc is upadate or not  */

                              if (state.dashboardModel!.kyc == false)
                                const AlertWidget(
                                    icon: KImage.alertImage,
                                    title: 'Your Account is not verify kyc',
                                    btnText: 'Verify now'),
                              gapSize(10, 0),
                              if (ResponsiveLayoutPage.isMobile(context))
                                if (state.dashboardModel!.kyc == true)
                                  const Text(
                                    'Transaction History',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                            ],
                          ),
                        ),

                      // ===============================================
                      // =================================================
                      if (ResponsiveLayoutPage.isExtraLarge(context) ||
                          ResponsiveLayoutPage.isTablet(context))
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (ResponsiveLayoutPage.isExtraLarge(context) ||
                                  ResponsiveLayoutPage.isTablet(context))
                                NavBarWidget(
                                  rupee: state.dashboardModel!.neptuneUnitConf
                                      .naptuneValue,
                                  neptuneInitallValue: state.dashboardModel!
                                      .neptuneUnitConf.naptuneInitailValue,
                                  one_second_rupee: state.dashboardModel!
                                      .neptuneUnitConf.oneSecondRupee,
                                  startTimeStamp: state.dashboardModel!
                                      .neptuneUnitConf.startTimestamp,
                                  dollar: state.dashboardModel!.neptuneUnitConf
                                      .dollarValue,
                                ),
                              if (ResponsiveLayoutPage.isMobile(context))
                                MobileNavBarWidget(
                                  rupee: state.dashboardModel!.neptuneUnitConf
                                      .naptuneValue,
                                  neptuneInitallValue: state.dashboardModel!
                                      .neptuneUnitConf.naptuneInitailValue,
                                  one_second_rupee: state.dashboardModel!
                                      .neptuneUnitConf.oneSecondRupee,
                                  startTimeStamp: state.dashboardModel!
                                      .neptuneUnitConf.startTimestamp,
                                  dollar: state.dashboardModel!.neptuneUnitConf
                                      .dollarValue,
                                ),

                              if (state.dashboardModel!.matureStatus == true)
                                Text(
                                  state.dashboardModel!.matureMsg ?? '',
                                  style: getTextStyle(
                                      15, FontWeight.bold, Colors.blue),
                                ),

                              //** Check Weather Kyc is upadate or not  */

                              if (state.dashboardModel!.kyc == false)
                                const AlertWidget(
                                    icon: KImage.alertImage,
                                    title: 'Your Account is not verify kyc',
                                    btnText: 'Verify now'),
                              gapSize(10, 0),
                              if (ResponsiveLayoutPage.isExtraLarge(context) ||
                                  ResponsiveLayoutPage.isTablet(context))
                                if (state.dashboardModel!.kyc == true)
                                  const Text(
                                    'Transaction History',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      // ====================================================
                      // =======================================================
                      if (state.dashboardModel!.kyc == true)
                        Expanded(
                          flex: 12,
                          child: TransactionHistoryWidget(
                            kyc: state.dashboardModel!.kyc,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            if (ResponsiveLayoutPage.isExtraLarge(context))
              if (state.dashboardModel!.kyc == true)
                RightSideMenu(
                  unitBalance: state.dashboardModel!.eWallet.toString(),
                  ePocket: state.dashboardModel!.ePocket.toString(),
                  name: state.dashboardModel!.name ?? '',
                  memberId: state.dashboardModel!.memberId ?? '',
                  downlineId: state.dashboardModel!.uplineId ?? '',
                  downlineName: state.dashboardModel!.uplineName ?? '',
                  sponsorId: state.dashboardModel!.sponsorId ?? '',
                  sponsorName: state.dashboardModel!.sponsorName ?? '',
                )
          ],
        );

      case Status.error:
        return const Text('Something Went Wrong ');
    }
  }
}

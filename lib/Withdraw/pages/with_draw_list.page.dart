import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/example.dart';
import '../../Responsive/responsive.dart';
import '../../core/core.dart';
import '../example.dart';

class WithDrawListPage extends StatelessWidget {
  const WithDrawListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (ResponsiveLayoutPage.isExtraLarge(context) ||
                            ResponsiveLayoutPage.isTablet(context))
                          NavBarWidget(
                            rupee: state
                                .dashboardModel!.neptuneUnitConf.naptuneValue,
                            neptuneInitallValue: state.dashboardModel!
                                .neptuneUnitConf.naptuneInitailValue,
                            one_second_rupee: state
                                .dashboardModel!.neptuneUnitConf.oneSecondRupee,
                            startTimeStamp: state
                                .dashboardModel!.neptuneUnitConf.startTimestamp,
                            dollar: state
                                .dashboardModel!.neptuneUnitConf.dollarValue,
                          ),
                        if (ResponsiveLayoutPage.isMobile(context))
                          MobileNavBarWidget(
                            rupee: state
                                .dashboardModel!.neptuneUnitConf.naptuneValue,
                            neptuneInitallValue: state.dashboardModel!
                                .neptuneUnitConf.naptuneInitailValue,
                            one_second_rupee: state
                                .dashboardModel!.neptuneUnitConf.oneSecondRupee,
                            startTimeStamp: state
                                .dashboardModel!.neptuneUnitConf.startTimestamp,
                            dollar: state
                                .dashboardModel!.neptuneUnitConf.dollarValue,
                          ),
                        //** Check Weather Kyc is upadate or not  */

                        if (state.dashboardModel!.kyc == false)
                          const AlertWidget(
                              icon: KImage.alertImage,
                              title: 'Your Account is not verify kyc',
                              btnText: 'Verify now'),

                        gapSize(20, 0),
// //
                        if (state.dashboardModel!.kyc == true)
                          const WithDrawListWidget()
                      ],
                    ),
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
        return const Text('Something Went');
    }
  }
}

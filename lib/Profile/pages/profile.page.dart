import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/example.dart';
import '../../core/core.dart';
import '../../Responsive/responsive_layout.dart';
import '../example.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<KycCubit>().refreshScreen();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final state = context.watch<DashBaordCubit>().state;
    final kycState = context.watch<KycCubit>().state;

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

                        gapSize(27, 0),
                        // ====================================================

                        // =========================================
                        //** Profile Widget  */
                        if (kycState.status == KycStatus.initial)
                          const Center(child: CircularProgressIndicator()),
                        if (kycState.status == KycStatus.loaded)
                          ProfileWidget(
                            idType: kycState.kycModel!.idProofType ?? '',
                            idNumber: kycState.kycModel!.idNo ?? '',
                            address: kycState.kycModel!.address ?? '',
                            landMark: kycState.kycModel!.landmark ?? '',
                            countryId: kycState.kycModel!.countryId ?? '',
                            country: kycState.kycModel!.country ?? '',
                            state: kycState.kycModel!.state ?? '',
                            stateId: kycState.kycModel!.stateId ?? '',
                            district: kycState.kycModel!.district ?? '',
                            pincode: kycState.kycModel!.pincode ?? '',
                            idprooffiles: kycState.kycModel!.idProofFiles ?? '',
                            addressprooffiles:
                                kycState.kycModel!.addressProofFiles ?? '',
                          ),
                        if (kycState.status == KycStatus.error)
                          const Center(
                            child: Text('Something Went Wrong'),
                          )
                        // BlocBuilder<KycCubit, KycState>(
                        //   builder: (context, state) {
                        //     if (state is KycInitial || state is KycLoading) {
                        //       return const Center(
                        //           child: CircularProgressIndicator());
                        //     } else if (state is KycLoaded) {
                        //       final a = state.kycModel;
                        //       log(a.address ?? '');
                        //       return ProfileWidget(
                        //         idType: a.idProofType ?? '',
                        //         idNumber: a.idNo ?? '',
                        //         address: a.address ?? '',
                        //         landMark: a.landmark ?? '',
                        //         countryId: a.countryId ?? '',
                        //         country: a.country ?? '',
                        //         state: a.state ?? '',
                        //         stateId: a.stateId ?? '',
                        //         district: a.district ?? '',
                        //         pincode: a.pincode ?? '',
                        //         idprooffiles: a.idProofFiles ?? '',
                        //         addressprooffiles: a.addressProofFiles ?? '',
                        //       );
                        //     } else if (state is KycError) {
                        //       return const Center(
                        //         child: Text('Something went wrong'),
                        //       );
                        //     }
                        //     return const Center(
                        //       child: Text(''),
                        //     );
                        //   },
                        // )

                        // =====================================
                        //Check The MatureStatus
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            if (ResponsiveLayoutPage.isExtraLarge(context))
              // if (state.dashboardModel!.kyc == true)
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

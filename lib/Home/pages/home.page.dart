import 'package:Neptune/Profile/logic/profile_picture/profile_picture_cubit.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../Responsive/responsive_layout.dart';
import '../example.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PlatformFile>? _paths1;
  String? imageFileName1;
  var dio = Dio();
  Uint8List? selectedImageByte1;
  @override
  void initState() {
    context.read<DashBaordCubit>().getDash();
    context.read<ProfilePictureCubit>().getProfilePicture();
    super.initState();
  }

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

                        if (state.dashboardModel!.matureStatus == true)
                          Text(
                            state.dashboardModel!.matureMsg ?? '',
                            style:
                                getTextStyle(15, FontWeight.bold, Colors.blue),
                          ),

                        //** Check Weather Kyc is upadate or not  */

                        if (state.dashboardModel!.kyc == false)
                          const AlertWidget(
                              icon: KImage.alertImage,
                              title: 'Your Account is not verify kyc',
                              btnText: 'Verify now'),

                        if (state.dashboardModel!.kyc == true)
                          const DashBoardWidget(),

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

    //   body: BlocBuilder<DashBoardCubit, DashBoardState>(
    //     builder: (context, state) {
    //       if (state is DashBoardInitial || state is DashBoardLoading) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (state is DashBoardLoaded) {
    //         final a = state.dashboardModel;

    //         return Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             if (ResponsiveLayoutPage.isDesktop(context) ||
    //                 ResponsiveLayoutPage.isExtraLarge(context))
    //               const SizedBox(width: defaultPadding),
    //             Expanded(
    //               flex: 7,
    //               child: SizedBox(
    //                 height: size.height,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(
    //                     top: defaultPadding * 2.5,
    //                     left: defaultPadding,
    //                     right: defaultPadding,
    //                     bottom: defaultPadding,
    //                   ),
    //                   child: SingleChildScrollView(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         NavBarWidget(
    //                           rupee: a.neptuneUnitConf.naptuneValue ?? '',
    //                           neptuneInitallValue: state.dashboardModel
    //                                   .neptuneUnitConf.naptuneInitailValue ??
    //                               '',
    //                           one_second_rupee: state.dashboardModel
    //                               .neptuneUnitConf.oneSecondRupee,
    //                           startTimeStamp: state.dashboardModel
    //                               .neptuneUnitConf.startTimestamp,
    //                         ),

    //                         if (state.dashboardModel.matureStatus == true)
    //                           Text(
    //                             state.dashboardModel.matureMsg ?? '',
    //                             style: getTextStyle(
    //                                 15, FontWeight.bold, Colors.blue),
    //                           ),

    //                         //** Check Weather Kyc is upadate or not  */

    //                         if (a.kyc == false)
    //                           const AlertWidget(
    //                               icon: KImage.alertImage,
    //                               title: 'Your Account is not verify kyc',
    //                               btnText: 'Verify now'),

    //                         if (a.kyc == true) const DashBoardWidget(),

    //                         // =====================================
    //                         //Check The MatureStatus
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(width: defaultPadding),
    //             if (ResponsiveLayoutPage.isExtraLarge(context))
    //               if (a.kyc == true)
    //                 RightSideMenu(
    //                     unitBalance: a.eWallet.toString(),
    //                     ePocket: a.ePocket.toString(),
    //                     name: a.name ?? '',
    //                     memberId: a.memberId ?? '')
    //           ],
    //         );
    //       } else if (state is DashBoardError) {
    //         return Center(
    //           child: Text(state.messageError.toString()),
    //         );
    //       }
    //       return Center(child: Text(state.toString()));
    //     },
    //   ),
    // );
  }
}

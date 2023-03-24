import 'package:Neptune/AddMember/pages/pages.dart';
import 'package:Neptune/Auth/logic/logic.dart';
import 'package:Neptune/Transaction/pages/transaction.page.dart';
import 'package:Neptune/Withdraw/pages/with_draw_list.page.dart';
import 'package:Neptune/Withdraw/pages/withdraw.page.dart';
import 'package:Neptune/core/logic/cubit/verify_page_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:Neptune/Genealogy/example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sidebarx/sidebarx.dart';

import '../Home/example.dart';
import '../Home/logic/dash_board_equatable_not/dash_board_equatable_not_cubit.dart';
import '../Profile/example.dart';
import '../Promotion/example.dart';
import '../Transfer/example.dart';
import '../core/core.dart';
import '../core/widget/button.widget.dart';
import '../core/widget/success.widget.dart';

bool isKyc = false;

class SideBarPage extends StatelessWidget {
  const SideBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SidebarXController(selectedIndex: 0, extended: true);
    final key = GlobalKey<ScaffoldState>();

    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 900;

        return BlocBuilder<DashBoardEquatableNotCubit,
            DashBoardEquatableNotState>(
          builder: (context, state) {
            if (state is DashBoardInitial || state is DashBoardLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DashBoardLoaded) {
              if (state.dashboardModel.membershipConfirmed == false) {
                return const SuccessWidgetPage();
              } else {
                return Scaffold(
                  key: key,
                  appBar: isSmallScreen
                      ? AppBar(
                          backgroundColor: Colors.white,
                          title: Text(
                            'Neptune',
                            style: const TextStyle(color: Colors.black),
                          ),
                          leading: IconButton(
                            onPressed: () {
                              // if (!Platform.isAndroid && !Platform.isIOS) {
                              //   _controller.setExtended(true);
                              // }
                              key.currentState?.openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : null,
                  drawer: ExampleSidebarX(
                    controller: controller,
                  ),
                  body: Row(
                    children: [
                      if (!isSmallScreen)
                        ExampleSidebarX(controller: controller),
                      Expanded(
                        child: Center(
                          child: _ScreensExample(
                            controller: controller,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 900;
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        // margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        // hoverColor: Colors.white,
        // textStyle: TextStyle(color: Colors.black),
        // selectedTextStyle: const TextStyle(color: Colors.black),
        // itemTextPadding: const EdgeInsets.only(left: 10),
        // selectedItemTextPadding: const EdgeInsets.only(left: 10),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          // border: Border.all(color: Colors.transparent),r
        ),
        selectedItemDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        // iconTheme: IconThemeData(
        //   color: Colors.white.withOpacity(0.7),
        //   size: 20,
        // ),
        // selectedIconTheme: const IconThemeData(
        //   color: Colors.white,
        //   size: 20,
        // ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 250,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      footerBuilder: (context, extended) {
        bool data = false;
        return isSmallScreen || data == extended
            ? ButtonWidget(
                text: 'SignOut',
                height: 30,
                weight: 100,
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Sign Out"),
                      content: const Text("Are You sure want to SignOut"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        ButtonWidget(
                          text: 'Okay',
                          onPress: () {
                            context.read<AuthenticationCubit>().logOut();
                            context.router.pop();
                          },
                          height: 30,
                          weight: 100,
                        ),
                      ],
                    ),
                  );
                },
              )
            : const Text('');
      },
      //**LOGO Image */
      headerBuilder: (context, extended) {
        bool data = false;
        return isSmallScreen || data == extended
            ? const Text('')
            : Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      gapSize(50, 0),
                      Image.asset(
                        KImage.logoImage,
                        height: 35,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
      },
      items: [
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.homeImage,
              height: 20,
            ),
          ),
          label: 'Home',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.promotionImage,
              height: 20,
            ),
          ),
          label: 'Promotion',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.genologyImage,
              height: 20,
            ),
          ),
          label: 'Genology',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.transferImage,
              height: 20,
            ),
          ),
          label: 'Transfer',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.transferList,
              height: 20,
            ),
          ),
          label: 'Transfer History',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.profileImage,
              height: 20,
            ),
          ),
          label: 'Profile',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.addMember,
              height: 20,
            ),
          ),
          label: 'Add Member',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.memberList,
              height: 20,
            ),
          ),
          label: 'Member List',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.withdraw,
              height: 20,
            ),
          ),
          label: 'Withdraw',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.withdrawList,
              height: 20,
            ),
          ),
          label: 'Withdraw List',
        ),
        SidebarXItem(
          iconWidget: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: Image.asset(
              KImage.transaction,
              height: 20,
            ),
          ),
          label: 'Transaction',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<VerifyPageCubit, VerifyPageState>(
      builder: (context, state) {
        if (isKyc == false) {
          context.read<VerifyPageCubit>().kycPage(controller.selectedIndex);
        }

        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            // print('Page index$state');
            // final pageTitle = _getTitleByIndex(state.pageIndex);
            switch (
                isKyc == true ? state.pageIndex : controller.selectedIndex) {
              case 0:
                return const HomePage();
              case 1:
                return const PromotionPage();
              case 2:
                return const GenologyPage();
              case 3:
                return const TransferPage();
              case 4:
                return const TransferHistoryPage();
              case 5:
                return const ProfilePage();
              case 6:
                return const AddMemberPage();
              case 7:
                return const MemberListPage();
              case 8:
                return const WithDrawePage();
              case 9:
                return const WithDrawListPage();
              case 10:
                return const TransactionPage();

              default:
                return Text(
                  'Neptune',
                  style: theme.textTheme.headlineSmall,
                );
            }
          },
        );
      },
    );
  }
}

// String _getTitleByIndex(
//   int index,
// ) {
//   switch (index) {
//     case 0:
//       return 'Home';
//     case 1:
//       return 'Promotion';
//     case 2:
//       return 'Genology';
//     case 3:
//       return 'Transfer';
//     case 4:
//       return 'TransferHistory';
//     case 5:
//       return 'Profile';
//     case 6:
//       return 'Add Member';
//     case 7:
//       return 'MemberList';
//     case 8:
//       return 'WithdrawList';
//     case 9:
//       return 'Transaction';

//     default:
//       return 'Not found page';
//   }
// }

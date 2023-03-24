import 'package:Neptune/AddMember/logic/create_member/create_member_cubit.dart';
import 'package:Neptune/Auth/data/repo/disk.repo.dart';
import 'package:Neptune/Genealogy/data/repo/genealogy.repo.dart';
import 'package:Neptune/Genealogy/logic/genealogy/genealogy_cubit.dart';
import 'package:Neptune/Home/data/repo/dashboard.repo.dart';

import 'package:Neptune/Profile/data/repo/profile.repo.dart';

import 'package:Neptune/Profile/logic/kyc/kyc_cubit.dart';
import 'package:Neptune/Profile/logic/logic.dart';
import 'package:Neptune/Promotion/data/repo/promotion.repo.dart';
import 'package:Neptune/Promotion/logic/promotion/promotion_cubit.dart';
import 'package:Neptune/Transaction/data/data.dart';
import 'package:Neptune/Transaction/logic/transaction_type/transaction_type_cubit.dart';
import 'package:Neptune/Transfer/data/repo/transfer.repo.dart';
import 'package:Neptune/Transfer/logic/Transfer_available/transfer_available_cubit.dart';
import 'package:Neptune/Transfer/logic/member_view/member_view_cubit.dart';
import 'package:Neptune/Withdraw/example.dart';
import 'package:Neptune/Withdraw/logic/withdraw_list/withdraw_list_cubit.dart';
import 'package:Neptune/forgetPassword/example.dart';
import 'package:Neptune/core/logic/cubit/verify_page_cubit.dart';
import 'package:Neptune/service/chopper_service/addMember/add_member.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AddMember/example.dart';
import '../Auth/example.dart';
import '../Home/example.dart';
import '../Home/logic/dash_board_equatable_not/dash_board_equatable_not_cubit.dart';
import '../service/chopper_client.service.dart';

class MultiBlocWrapper extends StatelessWidget {
  const MultiBlocWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => AuthenticationCubit(
                authRepo: context.read<AuthRepo>(),
                diskRepo: context.read<DiskRepo>(),
              )),
      BlocProvider(create: (context) => PageIndexCubit()),
      BlocProvider(
          create: (context) => UnitBuyCubit(
                unitBuyRepo: context.read<UnitBuyRepo>(),
              )),
      BlocProvider(
          create: (context) =>
              BankAccountCubit(context.read<BankAccountRepo>())),
      BlocProvider(
        create: (context) =>
            DashBaordCubit(dashBoardRepo: context.read<DashBoardRepo>()),
      ),
      BlocProvider(
          create: (context) => DashBoardEquatableNotCubit(
              dashBoardRepo: context.read<DashBoardRepo>())),
      BlocProvider(
          create: (context) => ImageDashboardCubit(
              dashBoardRepo: context.read<DashBoardRepo>())),
      BlocProvider(
          create: (context) =>
              IdProofTypeCubit(profileRepo: context.read<ProfileRepo>())),
      BlocProvider(
        create: (context) => CountryCubit(
          countryRepo: context.read<ProfileRepo>(),
        ),
      ),
      BlocProvider(
          create: (context) =>
              StateCubit(profileRepo: context.read<ProfileRepo>())),
      BlocProvider(
          create: (context) =>
              KycCubit(profileRepo: context.read<ProfileRepo>())),
      BlocProvider(
          create: (context) => TransferAvailableCubit(
              transferRepo: context.read<TransferRepo>())),
      BlocProvider(
          create: (context) =>
              MemberViewCubit(transferRepo: context.read<TransferRepo>())),
      BlocProvider(create: (context) => KycPageCheck()),
      BlocProvider(create: (context) => VerifyPageCubit()),
      BlocProvider(
          create: (context) =>
              CheckMemberCubit(addMemberRepo: context.read<AddMemberRepo>())),
      BlocProvider(
          create: (context) => AddMemberSponsorCubit(
              addMemberRepo: context.read<AddMemberRepo>())),
      BlocProvider(
          create: (context) =>
              CreateMemberCubit(addMemberRepo: context.read<AddMemberRepo>())),
      BlocProvider(
          create: (context) => MemberListCubit(
              addMemberListRepo: context.read<AddMemberRepo>())),
      BlocProvider(
          create: (context) =>
              WithdrawListCubit(withDrawRepo: context.read<WithDrawRepo>())),
      BlocProvider(
          create: (context) =>
              GenealogyCubit(genealogyRepo: context.read<GenealogyRepo>())),
      BlocProvider(
          create: (context) =>
              PromotionCubit(promotionRepo: context.read<PromotionRepo>())),
      BlocProvider(
          create: (context) => TransactionTypeCubit(
              transferRepo: context.read<TransactionRepo>())),
      BlocProvider(
          create: (context) =>
              ProfilePictureCubit(profileRepo: context.read<ProfileRepo>())),
      BlocProvider(
          create: (context) => ForgetPasswordCubit(
              forgetPasswordRepo: context.read<ForgetPasswordRepo>())),
      BlocProvider(
          create: (context) => AddMemberOfferCubit(
              addMemberRepo: context.read<AddMemberRepo>())),
    ], child: child);
  }
}

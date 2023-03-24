import 'package:Neptune/AddMember/data/repo/add_member.repo.dart';
import 'package:Neptune/Auth/data/repo/disk.repo.dart';
import 'package:Neptune/Genealogy/data/repo/genealogy.repo.dart';
import 'package:Neptune/Home/data/repo/dashboard.repo.dart';

import 'package:Neptune/Profile/data/repo/profile.repo.dart';
import 'package:Neptune/Promotion/data/repo/promotion.repo.dart';
import 'package:Neptune/Transaction/data/data.dart';
import 'package:Neptune/Transfer/data/repo/transfer.repo.dart';
import 'package:Neptune/Withdraw/example.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/Genealogy/genealogy.service.dart';
import 'package:Neptune/service/chopper_service/addMember/add_member.service.dart';
import 'package:Neptune/service/chopper_service/dashbaord/dashboard.service.dart';
import 'package:Neptune/service/chopper_service/forgetPassword/forget_password.service.dart';
import 'package:Neptune/service/chopper_service/login/login.service.dart';
import 'package:Neptune/service/chopper_service/profile/profile_service.dart';
import 'package:Neptune/service/chopper_service/promotion/promotion.service.dart';
import 'package:Neptune/service/chopper_service/transaction/transaction.service.dart';
import 'package:Neptune/service/chopper_service/transfer/transfer.service.dart';
import 'package:Neptune/service/chopper_service/withdraw/withdraw.service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/example.dart';
import '../forgetPassword/example.dart';

class MultiRepositoryProviderWrapper extends StatelessWidget {
  const MultiRepositoryProviderWrapper(
      {super.key, required this.child, required this.sharedPreferences});
  final Widget child;
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    final loginService = chopper.getService<LoginService>();
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<DiskRepo>(
        create: (context) => DiskRepo(sharedPreferences: sharedPreferences),
      ),
      RepositoryProvider<AuthRepo>(
        create: (context) => AuthRepo(loginService),
      ),
      RepositoryProvider<UnitBuyRepo>(
        create: (context) => UnitBuyRepo(loginService),
      ),
      RepositoryProvider<BankAccountRepo>(
        create: (context) => BankAccountRepo(loginService),
      ),
      RepositoryProvider<DashBoardRepo>(
        create: (context) =>
            DashBoardRepo(chopper.getService<DashBoardService>()),
      ),
      RepositoryProvider<ProfileRepo>(
        create: (context) => ProfileRepo(chopper.getService<ProfileService>()),
      ),
      RepositoryProvider<TransferRepo>(
        create: (context) =>
            TransferRepo(chopper.getService<TransferService>()),
      ),
      RepositoryProvider<AddMemberRepo>(
        create: (context) =>
            AddMemberRepo(chopper.getService<AddMemberService>()),
      ),
      RepositoryProvider<WithDrawRepo>(
        create: (context) =>
            WithDrawRepo(chopper.getService<WithDrawService>()),
      ),
      RepositoryProvider<GenealogyRepo>(
        create: (context) => GenealogyRepo(
            genealogyService: chopper.getService<GenealogyService>()),
      ),
      RepositoryProvider<PromotionRepo>(
        create: (context) => PromotionRepo(
            promotionService: chopper.getService<PromotionService>()),
      ),
      RepositoryProvider<TransactionRepo>(
        create: (context) => TransactionRepo(
            transactionService: chopper.getService<TransactionService>()),
      ),
      RepositoryProvider<ForgetPasswordRepo>(
        create: (context) => ForgetPasswordRepo(
            forgetPasswordService: chopper.getService<ForgetPasswordService>()),
      ),
    ], child: child);
  }
}

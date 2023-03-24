import 'dart:developer';

import 'package:Neptune/Auth/data/repo/disk.repo.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';

import 'package:Neptune/service/chopper_service/login/login.service.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../example.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepo authRepo;
  final DiskRepo diskRepo;

  AuthenticationCubit({
    required this.diskRepo,
    required this.authRepo,
  }) : super(const AuthenticationState(status: AuthenticationStatus.initial)) {
    auth();
  }
  void auth() async {
    log('AuthFlow');
    final pref = await SharedPreferences.getInstance();
    final a = pref.get("token");
    if (a != null) {
      log("LogIN $a");
      emit(const AuthenticationState(
        status: AuthenticationStatus.isLoggedIn,
      ));
    } else {
      emit(const AuthenticationState(
        status: AuthenticationStatus.isLoggedOut,
      ));
    }
  }

  Future<void> login(
      {required String userName, required String password}) async {
    try {
      showLoading(title: 'Loading...');

      final a = await authRepo.login(
          memberController: userName, passwordController: password);
      if (a.success == true) {
        diskRepo.saveToken(token: a.token!);
        emit(const AuthenticationState(
          status: AuthenticationStatus.isLoggedIn,
        ));
        EasyLoading.dismiss();
      } else if (a.success == false) {
        showErrorHUD(title: a.message!);
      }
    } catch (error) {
      logger.d(error.toString());
    }
  }

  Future<void> logOut() async {
    diskRepo.deleteToken();

    emit(const AuthenticationState(status: AuthenticationStatus.isLoggedOut));
  }
}

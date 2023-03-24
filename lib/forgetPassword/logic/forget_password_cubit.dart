import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/forgetPassword/data/model/password_change_response.dart';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../example.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordCubit({required this.forgetPasswordRepo})
      : super(const ForgetPasswordState(forgetStatus: ForgetStatus.initial));

  Future<void> passwordForget(
      {required String email,
      required String memberId,
      required BuildContext context}) async {
    emit(const ForgetPasswordState(forgetStatus: ForgetStatus.loading));
    showLoading(title: 'Loading...');
    try {
      final res = await forgetPasswordRepo.forgetPasswordRepo(
          email: email, memberID: memberId);

      final pref = await SharedPreferences.getInstance();
      pref.setString('msg', res.msg!);
      pref.setInt('checkStatus', 1);

      EasyLoading.dismiss();
      emit(ForgetPasswordState(
          forgetPasswordResponse: res, forgetStatus: ForgetStatus.loaded));
    } on UnauthorizeException catch (error) {
      showErrorHUD(title: error.msg);
      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.unauthorize, message: error.msg));
    } on ForgetErrorResponse catch (error) {
      showErrorHUD(title: error.msg!);
      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.error, message: error.msg));
    } catch (error) {
      logger.e(error);

      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.error, message: error.toString()));
    }
  }

  Future<void> otpVerify({required String otp}) async {
    emit(const ForgetPasswordState(forgetStatus: ForgetStatus.loading));
    showLoading(title: 'Loading');
    try {
      final res = await forgetPasswordRepo.optVerifyRepo(otp);
      final pref = await SharedPreferences.getInstance();
      pref.setInt('checkStatus', 2);
      showSuccess(title: res.msg!);
    } on ForgetErrorResponse catch (error) {
      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.error, message: error.msg));
    } catch (error) {
      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.error, message: error.toString()));
    }
  }

  Future<void> changePassword(
      {required String newPassword,
      required String oldPassword,
      required BuildContext context}) async {
    emit(const ForgetPasswordState(forgetStatus: ForgetStatus.loading));
    showLoading(title: 'Loading...');
    try {
      final a = await forgetPasswordRepo.changePasswordRepo(
          newPassword: newPassword, oldPassword: oldPassword);
      showSuccess(title: a.message!);
      context.router.pop();
      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.loaded, passwordChangeResponse: a));
    } on UnauthorizeException catch (error) {
      showErrorHUD(title: error.msg);
      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.unauthorize, message: error.msg));
    } on ForgetErrorResponse catch (error) {
      showErrorHUD(title: error.msg!);
      emit(ForgetPasswordState(
          forgetStatus: ForgetStatus.error, message: error.msg));
    } catch (error) {
      logger.d(error);
      emit(ForgetPasswordState(forgetStatus: ForgetStatus.error));
    }
  }
}

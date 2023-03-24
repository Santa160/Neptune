import 'package:Neptune/core/core.dart';
import 'package:Neptune/core/widget/input_decoration.widget.dart';
import 'package:Neptune/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../example.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  TextEditingController memberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController memberIDController = TextEditingController();

  bool _isObscure = true;
  @override
  void dispose() {
    memberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              KImage.logoImage,
              height: 43,
            ),
            gapSize(34, 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Sign in to your account',
                    style: getTextStyle(
                      25,
                      FontWeight.w400,
                      ColorManager.signText,
                    ),
                  ),
                ),
              ],
            ),
            gapSize(16.0, 0.0),
            TextFormField(
              controller: memberController,
              decoration: inputDecoaration(
                  fillColor: Colors.white,
                  hint: 'Member ID',
                  iconButton: const IconButton(
                      onPressed: null, icon: Icon(Icons.person)),
                  label: 'Member ID'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Member ID can\'t be blank';
                }
                return null;
              },
            ),
            gapSize(14.0, 0.0),
            TextFormField(
              controller: passwordController,
              obscureText: _isObscure,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password can\'t be blank';
                }
                return null;
              },
              decoration: inputDecoaration(
                fillColor: Colors.white,
                hint: 'Password',
                label: 'Password',
                iconButton: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: _isObscure
                      ? const Icon(Icons.lock)
                      : const Icon(Icons.visibility),
                ),
              ),
            ),
            gapSize(12, 0),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    context.router.replace(const ForgetPasswordRoute());
                  },
                  child: Text(
                    'Forget password?',
                    style: getTextStyle(
                        18, FontWeight.w400, ColorManager.neptuneText),
                  )),
            ),
            gapSize(14, 0),
            SizedBox(
              height: 59,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();

                  context.read<AuthenticationCubit>().login(
                      userName: memberController.text.trim(),
                      password: passwordController.text.trim());
                  memberController.clear();
                  passwordController.clear();
                },
                child: Text(
                  'Sign in',
                  style: getTextStyle(
                    18,
                    FontWeight.w400,
                    Colors.white,
                  ),
                ),
              ),
            ),
            gapSize(14, 0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         context.router.replace(const RegisterRoute());
            //       },
            //       child: RichText(
            //         text: TextSpan(
            //             text: 'Not a member yet? ',
            //             style: TextStyle(color: ColorManager.neptuneText),
            //             children: [
            //               TextSpan(
            //                   text: 'Register Now',
            //                   style: TextStyle(color: ColorManager.neptuneText))
            //             ]),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

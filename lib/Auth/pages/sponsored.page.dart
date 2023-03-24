import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/input_decoration.widget.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/Register/register.service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import '../example.dart';

class SponsoredPage extends StatefulWidget {
  const SponsoredPage({super.key});

  @override
  State<SponsoredPage> createState() => _SponsoredPageState();
}

class _SponsoredPageState extends State<SponsoredPage> {
  final TextEditingController sponsorshipController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool onError = false;

  @override
  void dispose() {
    sponsorshipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            KImage.logoImage,
            fit: BoxFit.cover,
            height: 43,
          ),
          gapSize(34, 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Register your account',
                  style: getTextStyle(
                    25,
                    FontWeight.w400,
                    ColorManager.signText,
                  ),
                ),
              ),
            ],
          ),
          gapSize(24, 0),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Sponsored ID Number',
                  style: getTextStyle(
                    20,
                    FontWeight.w400,
                    ColorManager.signText,
                  ),
                ),
              ),
            ],
          ),
          gapSize(11, 0),
          TextFormField(
            controller: sponsorshipController,
            decoration: inputDecoaration(
              hint: 'e.g.NU65468ASD',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Sponsor can\'t be blank';
              }
              return null;
            },
          ),
          gapSize(24, 0),
          ButtonWidget(
            text: 'Verify',
            onPress: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              _formKey.currentState!.save();
              EasyLoading.show(status: 'Loading...');
              final r = await chopper
                  .getService<RegisterService>()
                  .getSponsorship(id: sponsorshipController.text.toString());
              final prefs = await SharedPreferences.getInstance();
              prefs.setString('message', r.body!.message);

              logger.d(r.body!.toJson());

              if (r.body!.success == false) {
                EasyLoading.showError(r.body!.message);
              }
              if (r.body!.success == true) {
                context.read<PageIndexCubit>().pageStatus(2);
                EasyLoading.dismiss();
              }
            },
            height: 59,
            weight: double.infinity,
          ),
        ],
      ),
    );
  }
}

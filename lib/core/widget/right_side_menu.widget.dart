import 'dart:developer';

import 'package:Neptune/Auth/logic/logic.dart';
import 'package:Neptune/Auth/widgets/widgets.dart';
import 'package:Neptune/Profile/logic/profile_picture/profile_picture_cubit.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/forgetPassword/logic/logic.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../core.dart';

import 'input_decoration.widget.dart';

class RightSideMenu extends StatefulWidget {
  const RightSideMenu(
      {super.key,
      required this.unitBalance,
      required this.ePocket,
      required this.name,
      required this.memberId,
      required this.sponsorId,
      required this.sponsorName,
      required this.downlineId,
      required this.downlineName});
  final String unitBalance;
  final String ePocket;
  final String name;
  final String memberId;
  final String sponsorId;
  final String sponsorName;
  final String downlineId;
  final String downlineName;

  @override
  State<RightSideMenu> createState() => _RightSideMenuState();
}

class _RightSideMenuState extends State<RightSideMenu> {
  List<PlatformFile>? _paths1;
  String? imageFileName1;
  var dio = Dio();

  final _formKey = GlobalKey<FormState>();
  Uint8List? selectedImageByte1;
  final _oldPassword = TextEditingController();
  final _newPassWord = TextEditingController();

  String baseUrl = 'https://register.neptunetourist.com/';

  @override
  void dispose() {
    _oldPassword.dispose();
    _newPassWord.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        width: 300,
        decoration: const BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2,
            defaultPadding * 2.5,
            defaultPadding * 2,
            defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile here
              Row(
                children: [
                  BlocBuilder<ProfilePictureCubit, ProfilePictureState>(
                    builder: (context, state) {
                      if (state is ProfilePictureInitial ||
                          state is ProfilePictureLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProfilePictureLoaded) {
                        if (state.pictureModel.status == false) {
                          return Text(state.pictureModel.message ?? '');
                        } else if (state.pictureModel.status == true) {
                          return InkWell(
                            onTap: () async {
                              final pref =
                                  await SharedPreferences.getInstance();
                              try {
                                _paths1 = (await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowMultiple: false,
                                  onFileLoading: (FilePickerStatus status) =>
                                      print(status),
                                  allowedExtensions: [
                                    'png',
                                    'jpg',
                                    'jpeg',
                                    'heic'
                                  ],
                                ))
                                    ?.files;
                                FormData formData = FormData.fromMap(
                                  {
                                    "picture": MultipartFile.fromBytes(
                                      _paths1!.first.bytes!,
                                      filename: _paths1!.first.name,
                                      contentType: MediaType("image", "png"),
                                    )
                                  },
                                );
                                var response = await dio.post(
                                    'https://register.neptunetourist.com/api/members/profilepicture',
                                    data: formData,
                                    options: Options(headers: {
                                      "authorization":
                                          "Bearer ${pref.getString('token')}"
                                    }));
                                print(response);

                                context
                                    .read<ProfilePictureCubit>()
                                    .refreshProfile();
                              } on PlatformException catch (e) {
                                log('Unsupported operation$e');
                              } catch (e) {
                                log(e.toString());
                              }
                              setState(() {
                                if (_paths1 != null) {
                                  selectedImageByte1 = _paths1!.first.bytes!;
                                  //passing file bytes and file name for API call
                                  imageFileName1 = _paths1!.first.name;
                                }
                              });
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: state.pictureModel.dataUrl == null
                                  ? const CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          AssetImage(KImage.profileImage),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(baseUrl +
                                          state.pictureModel.dataUrl!)),
                            ),
                          );
                        }
                      } else if (state is ProfilePictureError) {
                        return Center(child: Text(state.message));
                      }
                      return const Text('');
                    },
                  ),
                  // const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          widget.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.memberId,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Change Password"),
                          content: Form(
                            key: _formKey,
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _oldPassword,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: inputDecoaration(
                                        hint: 'OldPassword',
                                        fillColor: ColorManager.conatinerColors,
                                        label: 'OldPassword'),
                                  ),
                                  gapSize(10, 0),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _newPassWord,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: inputDecoaration(
                                        hint: 'NewPassword',
                                        fillColor: ColorManager.conatinerColors,
                                        label: 'NewPassword'),
                                  ),
                                  gapSize(20, 0),
                                  ButtonWidget(
                                    text: 'Submit',
                                    onPress: () {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      } else if (_oldPassword.text.isEmpty ||
                                          _newPassWord.text.isEmpty) {
                                        return showErrorHUD(
                                            title: 'All Field Required');
                                      }
                                      _formKey.currentState!.save();
                                      // =========================
                                      //** Using chopper and Cubit */

                                      context
                                          .read<ForgetPasswordCubit>()
                                          .changePassword(
                                              newPassword:
                                                  _newPassWord.text.trim(),
                                              oldPassword:
                                                  _oldPassword.text.trim(),
                                              context: context);

                                      // ===============================
                                      //** This is Using Dio Package */

                                      // Dio dio = Dio();
                                      // final pref =
                                      //     await SharedPreferences.getInstance();
                                      // try {
                                      //   Response response = await dio.post(
                                      //       'https://staging.neptunetourist.com/api/sites/changepassword',
                                      //       data: jsonEncode({
                                      //         "oldPassword":
                                      //             _oldPassword.text.trim(),
                                      //         "newPassword":
                                      //             _newPassWord.text.trim()
                                      //       }),
                                      //       options: Options(headers: {
                                      //         "Authorization":
                                      //             'Bearer ${pref.getString('token')}'
                                      //       }));
                                      //   showSuccess(
                                      //       title: response.data['message']);
                                      //   _oldPassword.clear();
                                      //   _newPassWord.clear();
                                      //   context.router.pop();
                                      // } on DioError catch (error) {
                                      //   if (error.response != null) {
                                      //     _oldPassword.clear();
                                      //     _newPassWord.clear();
                                      //     showErrorHUD(
                                      //         title: error
                                      //             .response!.data['message']);
                                      //   }
                                      // }
                                    },
                                    height: 50,
                                    weight: double.infinity,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 15,
                      color: bodyTextColor,
                    ),
                  )
                ],
              ),
              gapSize(10, 0),
              SponsorCardWidget(
                  sponsorId: widget.sponsorId,
                  sponsorName: widget.sponsorName,
                  downlineId: widget.downlineId,
                  downlineName: widget.downlineName),

              // Balance here

              Balance(
                balance: widget.unitBalance,
                ewallet: widget.ePocket,
              ),
              const Spacer(),
              // Sign out here

              InkWell(
                onTap: () {
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
                child: SimpleShadow(
                  opacity: 0.1, // Default: 0.5
                  color: Colors.black, // Default: Black
                  offset: const Offset(3, 3), // Default: Offset(2, 2)
                  sigma: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding * 0.5,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          KImage.signOutImage,
                          width: 23,
                        ),
                        const SizedBox(width: 18),
                        const Text(
                          'Sign out',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

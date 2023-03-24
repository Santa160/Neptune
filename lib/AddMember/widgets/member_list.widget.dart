import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../example.dart';

class MemberListWidget extends StatefulWidget {
  const MemberListWidget({super.key});

  @override
  State<MemberListWidget> createState() => _MemberListWidgetState();
}

class _MemberListWidgetState extends State<MemberListWidget> {
  @override
  void initState() {
    context.read<MemberListCubit>().getMemberList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberListCubit, MemberListState>(
      builder: (context, state) {
        if (state is MemberListInitial || state is MemberListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MemberListLoaded) {
          if (state.createMemberListModel!.success == false) {
            return Center(child: Text(state.createMemberListModel!.message!));
          } else if (state.createMemberListModel!.success == true) {
            return ListView.builder(
              physics: const ScrollPhysics(),
              reverse: true,
              shrinkWrap: true,
              itemCount: state.memberList!.length,
              itemBuilder: (context, index) {
                final p = state.memberList![index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width > 900 ? 35 : 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: bgColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Member ID : ${p.memberId}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Name : ${p.name}'),
                        Text('Email : ${p.email}'),
                        Text("Phone :${p.phone}"),
                        Row(
                          children: [
                            Text(
                                "Opening Neptune Unit : ${p.openingNeptuneUnit} NU"),
                            p.promotionUnit == null
                                ? Container()
                                : RichText(
                                    text: TextSpan(
                                      text: '+ ${p.promotionUnit}',
                                      style: TextStyle(
                                          color: ColorManager.neptuneText),
                                      children: [
                                        TextSpan(
                                            text: ' Promotion Unit',
                                            style: TextStyle(
                                                color:
                                                    ColorManager.buttonColor))
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                        Text('UpLine Member Id : ${p.uplineMemberId}'),
                        Text('Create Date : ${p.createdDate}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }

        if (state is MemberListError) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        }
        return const Text('');
      },
    );
  }
}

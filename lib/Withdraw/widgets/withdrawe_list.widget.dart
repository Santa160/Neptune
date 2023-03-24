import 'package:Neptune/Withdraw/logic/withdraw_list/withdraw_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';

class WithDrawListWidget extends StatefulWidget {
  const WithDrawListWidget({super.key});

  @override
  State<WithDrawListWidget> createState() => _WithDrawListWidgetState();
}

class _WithDrawListWidgetState extends State<WithDrawListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<WithdrawListCubit>().getMemberList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'WithDraw List',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        BlocBuilder<WithdrawListCubit, WithdrawListState>(
          builder: (context, state) {
            if (state is WithdrawListInitial || state is WithdrawListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WithdrawListLoaded) {
              if (state.withDrawModel.success == false) {
                return Center(
                    child: Text(
                  state.withDrawModel.message!,
                ));
              } else if (state.withDrawModel.success == true) {
                final p = state.withDrawModel.dataList;
                if (p!.isEmpty) {
                  return const Center(
                    child: Text('NO Data Found'),
                  );
                }
                return ListView.builder(
                  physics: const ScrollPhysics(),
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: state.withDrawModel.dataList!.length,
                  itemBuilder: (context, index) {
                    final p = state.withDrawModel.dataList![index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
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
                              'TicketNumber : ${p.ticketNumber}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Unit : ${p.unit}'),
                            Text('Amount In Rs : ₹ ${p.amountInRs}'),
                            Text('Amount In Dollar : \$ ${p.amountInDollar}'),
                            if (p.status == 'Rejected')
                              Row(
                                children: [
                                  const Text('Status : '),
                                  containerWidget(
                                      status: p.status, color: Colors.red),
                                ],
                              ),
                            if (p.status == 'Pending')
                              Row(
                                children: [
                                  const Text('Status : '),
                                  containerWidget(
                                      status: p.status,
                                      color: Colors.orange.shade700)
                                ],
                              ),
                            if (p.status == 'Approve')
                              Row(
                                children: [
                                  const Text('Status : '),
                                  containerWidget(
                                      status: p.status, color: Colors.green),
                                ],
                              ),
                            Text("ApplyDate : ${p.appliedDate}"),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
            if (state is WithdrawListError) {
              return Text('Something Went Wrong',
                  style:
                      getTextStyle(15, FontWeight.bold, ColorManager.signText));
            }
            return const Text('');
          },
        )
      ],
    );
  }
}

Widget containerWidget({required String status, required Color? color}) {
  return Container(
    height: 25,
    width: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    alignment: Alignment.center,
    child: Text(status, style: const TextStyle(color: Colors.white)),
  );
}

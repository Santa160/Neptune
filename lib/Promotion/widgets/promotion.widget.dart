import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Responsive/responsive_layout.dart';
import '../../core/core.dart';
import '../logic/promotion/promotion_cubit.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (ResponsiveLayoutPage.isTablet(context) ||
            ResponsiveLayoutPage.isDesktop(context) ||
            ResponsiveLayoutPage.isExtraLarge(context))
          BlocBuilder<PromotionCubit, PromotionState>(
            builder: (context, state) {
              if (state is PromotionInitial || state is PromotionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PromotionLoaded) {
                if (state.promotionModel.success == false) {
                  return Center(child: Text(state.promotionModel.message!));
                } else if (state.dataList!.isNotEmpty ||
                    state.promotionModel.success == true) {
                  return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.dataList!.length,
                      itemBuilder: (context, index) {
                        final p = state.dataList![index];

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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        p.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (p.statusExpired == 'Expired')
                                        Container(
                                          height: 30,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            p.statusExpired,
                                            style: getTextStyle(18,
                                                FontWeight.w200, Colors.white),
                                          ),
                                        ),
                                      if (p.statusExpired == 'Active')
                                        Container(
                                          height: 30,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            p.statusExpired,
                                            style: getTextStyle(18,
                                                FontWeight.w200, Colors.white),
                                          ),
                                        ),
                                      if (p.statusExpired == 'Upcoming')
                                        Container(
                                          height: 30,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.blueAccent,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            p.statusExpired,
                                            style: getTextStyle(18,
                                                FontWeight.w200, Colors.white),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                      'Form : ${DateTimeNotTime.dateTimeFomator(p.dateFrom)}'),
                                  Text(
                                      'To : ${DateTimeNotTime.dateTimeFomator(p.dateTo)}'),
                                  gapSize(5, 0),
                                  Table(
                                    border: const TableBorder(
                                      horizontalInside: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                          style: BorderStyle.solid),
                                    ),
                                    children: [
                                      TableRow(
                                        children: [
                                          tableCellMethod('SL.NO'),
                                          tableCellMethod('OfferUnit'),
                                          tableCellMethod('UnitFrom'),
                                          tableCellMethod('UnitTo'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: p.offerUnits.length,
                                    itemBuilder: (context, index) {
                                      return Table(
                                        children: [
                                          TableRow(children: [
                                            Text((index + 1).toString()),
                                            Text(
                                                ' ${p.offerUnits[index].offerUnit}NU '),
                                            Text(
                                                '${p.offerUnits[index].unitFrom}NU'),
                                            Text(
                                                ' ${p.offerUnits[index].unitTo}NU'),
                                          ]),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              )),
                        );
                      });
                }
              } else if (state is PromotionError) {
                return Center(child: Text(state.message));
              }
              return const Text('');
            },
          ),
        if (ResponsiveLayoutPage.isMobile(context) ||
            ResponsiveLayoutPage.isMobileLarge(context))
          BlocBuilder<PromotionCubit, PromotionState>(
            builder: (context, state) {
              if (state is PromotionInitial || state is PromotionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PromotionLoaded) {
                if (state.promotionModel.success == false) {
                  return Center(child: Text(state.promotionModel.message!));
                } else if (state.promotionModel.success == true) {
                  return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.dataList!.length,
                      itemBuilder: (context, index) {
                        final p = state.dataList![index];

                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: bgColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        p.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (p.statusExpired == 'Expired')
                                        Container(
                                          height: 30,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            p.statusExpired,
                                            style: getTextStyle(18,
                                                FontWeight.w200, Colors.white),
                                          ),
                                        ),
                                      if (p.statusExpired == 'Active')
                                        Container(
                                          height: 30,
                                          width: 60,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            p.statusExpired,
                                            style: getTextStyle(18,
                                                FontWeight.w200, Colors.white),
                                          ),
                                        ),
                                      if (p.statusExpired == 'Upcoming')
                                        Container(
                                          height: 30,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.blueAccent,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            p.statusExpired,
                                            style: getTextStyle(18,
                                                FontWeight.w200, Colors.white),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                      'Form : ${DateTimeNotTime.dateTimeFomator(p.dateFrom)}'),
                                  Text(
                                      'To : ${DateTimeNotTime.dateTimeFomator(p.dateTo)}'),
                                  gapSize(5, 0),
                                  Table(
                                    border: const TableBorder(
                                      horizontalInside: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                          style: BorderStyle.solid),
                                    ),
                                    children: [
                                      TableRow(
                                        children: [
                                          tableCellMethod('SL.NO'),
                                          tableCellMethod('OfferUnit'),
                                          tableCellMethod('UnitFrom'),
                                          tableCellMethod('UnitTo'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: p.offerUnits.length,
                                    itemBuilder: (context, index) {
                                      return Table(
                                        children: [
                                          TableRow(children: [
                                            Text((index + 1).toString()),
                                            Text(
                                                ' ${p.offerUnits[index].offerUnit}NU'),
                                            Text(
                                                '${p.offerUnits[index].unitFrom}NU'),
                                            Text(
                                                ' ${p.offerUnits[index].unitTo}NU'),
                                          ]),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              )),
                        );
                      });
                }
              } else if (state is PromotionError) {
                return const Center(child: Text("Promotion not available."));
              }
              return const Text('');
            },
          ),
      ],
    );
  }
}

TableCell tableCellMethod(String text) {
  return TableCell(
    child: Container(
      height: 25,
      color: Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.only(left: 3, bottom: 2, right: 2, top: 2),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}

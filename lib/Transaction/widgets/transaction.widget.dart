import 'package:Neptune/Transaction/logic/logic.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/transaction/transaction.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../data/model/transaction.model.dart';

class TransactionHistoryWidget extends StatefulWidget {
  const TransactionHistoryWidget({super.key, required this.kyc});
  final bool kyc;

  @override
  State<TransactionHistoryWidget> createState() =>
      _TransactionHistoryWidgetState();
}

class _TransactionHistoryWidgetState extends State<TransactionHistoryWidget> {
  late ScrollController controller;
  TransactionService transactionService = chopper.getService();
  List<TransactionModels> transaction = [];
  int? transactionType;
  bool newState = false;
  // At the beginning, we fetch the first 20 posts
  int _page = 1;
  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 5;

  // The controller for the ListView
  late ScrollController _controller;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This function will be called when the app launches (see the initState function)
// This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res = await transactionService.getTransactionHistory(
          limit: _limit, page: _page, type: transactionType!);
      setState(() {
        transaction = res.body!;
        logger.d(res.body!.toList());
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        final res = await transactionService.getTransactionHistory(
            limit: _limit, page: _page, type: transactionType!);

        final List<TransactionModels> fetchedPosts = res.body!;
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            transaction.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TransactionTypeCubit>().state;
    switch (state.status) {
      case TransactionTypeStatus.initial:
        return const Center(child: CircularProgressIndicator());

      case TransactionTypeStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case TransactionTypeStatus.loaded:
        return _isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width > 900
                          ? MediaQuery.of(context).size.width * 0.20
                          : MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: ColorManager.conatinerColors,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          // isExpanded: true,
                          hint: const Text('Choose Transaction Type'),

                          // Initial Value
                          // value: transactionType,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: transactionType,
                          // Array list of items
                          items: state.types!.map((v) {
                            return DropdownMenuItem(
                              value: v.id,
                              child: Text(v.name),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (newValue) {
                            setState(() {
                              _page = 1;
                              transactionType = int.parse(newValue.toString());

                              _firstLoad();
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  gapSize(10, 0),
                  Expanded(
                    child: transaction.isEmpty
                        ? const Center(child: Text('No Data Found'))
                        : ListView.builder(
                            physics: const ScrollPhysics(),
                            controller: _controller,
                            itemCount: transaction.length,
                            itemBuilder: (_, index) => Padding(
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
                                      "Account Type : ${transaction[index].accountType}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        'Name : ${transaction[index].memberName ?? ''}'),
                                    Text(
                                        'MemberID : ${transaction[index].memberId ?? ''}'),
                                    Text(
                                        'CreditUnit : ${transaction[index].creditUnit ?? ''}'),
                                    Text(
                                        'DebitUnit : ${transaction[index].debitUnit ?? ''}'),
                                    Text(
                                        'Description : ${transaction[index].description ?? ''}'),
                                    Text(
                                        'TransactionDate : ${transaction[index].transactionDate}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),

                  // when the _loadMore function is running
                  // if (_isLoadMoreRunning == true)
                  //   const Padding(
                  //     padding: EdgeInsets.only(top: 10, bottom: 40),
                  //     child: Center(
                  //       child: CircularProgressIndicator(),
                  //     ),
                  //   ),

                  // // When nothing else to load
                  // if (_hasNextPage == false)
                  //   const Center(
                  //     child: Text('You have fetched all of the content'),
                  //   ),
                ],
              );
      case TransactionTypeStatus.error:
        return const Text('Something went Wrong');
    }
  }
}

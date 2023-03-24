import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/transfer/transfer.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Responsive/responsive.dart';
import '../../core/core.dart';
import '../data/model/transferHistory.model.dart';

class TransferHistoryWidget extends StatefulWidget {
  const TransferHistoryWidget({super.key, required this.kyc});
  final bool kyc;

  @override
  State<TransferHistoryWidget> createState() => _TransferHistoryWidgetState();
}

class _TransferHistoryWidgetState extends State<TransferHistoryWidget> {
  TransferService ts = chopper.getService();
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

  List<TransferHistoryModel> result = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
          await ts.getTransferHistory(limit: _limit, page: _page, type: 'to');
      setState(() {
        result = res.body!;
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
        final res =
            await ts.getTransferHistory(limit: _limit, page: _page, type: 'to');

        final List<TransferHistoryModel> fetchedPosts = res.body!;
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            result.addAll(fetchedPosts);
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
    return _isFirstLoadRunning
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ResponsiveLayoutPage.isMobile(context))
                if (widget.kyc == true)
                  const Text(
                    'Transfer History',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
              Expanded(
                child: result.isEmpty
                    ? const Center(child: Text('No Data Found'))
                    : ListView.builder(
                        physics: const ScrollPhysics(),
                        controller: _controller,
                        itemCount: result.length,
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
                                  "Account Type : ${result[index].accountType}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                    'MemberName : ${result[index].memberName}'),
                                Text('MemberID : ${result[index].memberId}'),
                                Text(
                                    'TransferUnit : ${result[index].transferUnit} NU'),
                                Text(
                                    "TransferDate : ${result[index].transferDate}")
                              ],
                            ),
                          ),
                        ),
                      ),
              ),

              // when the _loadMore function is running
              if (_isLoadMoreRunning == true)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

              // When nothing else to load
              if (_hasNextPage == false)
                const Center(
                  child: Text('You have fetched all of the content'),
                ),
            ],
          );
  }
}

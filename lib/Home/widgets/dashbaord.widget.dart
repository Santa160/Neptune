import 'package:Neptune/Home/logic/image_dashboard/image_dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:Neptune/Home/widgets/project_card.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';

import '../../Responsive/responsive_layout.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Projects',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      const SizedBox(height: 15),
      if (ResponsiveLayoutPage.isTablet(context) ||
          ResponsiveLayoutPage.isDesktop(context) ||
          ResponsiveLayoutPage.isExtraLarge(context))
        BlocBuilder<ImageDashboardCubit, ImageDashboardState>(
          builder: (context, state) {
            if (state is ImageDashboardInitial ||
                state is ImageDashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ImageDashboardLoaded) {
              final a = state.imageDashBoardModel;

              if (a.isEmpty) {
                return const Text('No Data Found');
              }
              String baseUrl = 'https://register.neptunetourist.com/';
              return GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: (1 / .4),
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 10,
                  children: List.generate(a.length, (index) {
                    return ProjectCardWidget(
                      image: baseUrl + a[index].url,
                      name: a[index].name,
                    );
                  }));
            } else if (state is ImageDashboardError) {
              return const Center(
                child: Text('Something went Wrong'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

      // Mobile Screen
      if (ResponsiveLayoutPage.isMobile(context) ||
          ResponsiveLayoutPage.isMobileLarge(context))
        BlocBuilder<ImageDashboardCubit, ImageDashboardState>(
          builder: (context, state) {
            if (state is ImageDashboardInitial ||
                state is ImageDashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ImageDashboardLoaded) {
              final a = state.imageDashBoardModel;
              String baseUrl = 'https://register.neptunetourist.com/';
              return ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: ProjectCardWidget(
                              image: baseUrl + a[index].url,
                              name: a[index].name,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              );
            } else if (state is ImageDashboardError) {
              return const Center(
                child: Text('Something went Wrong'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

      //  Large Screen
    ]);
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({
    Key? key,
    required this.flex,
    required this.image,
    required this.name,
  }) : super(key: key);
  final int flex;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: ImageNetwork(
          image: image,
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width,
          duration: 1500,
          // curve: Curves.easeIn,
          onPointer: true,
          debugPrint: false,
          fullScreen: false,
          fitAndroidIos: BoxFit.cover,
          fitWeb: BoxFitWeb.cover,
          borderRadius: BorderRadius.circular(10),
          onLoading: const CircularProgressIndicator(
            color: Colors.indigoAccent,
          ),
          onError: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ));
  }
}

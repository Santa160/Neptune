import 'package:Neptune/Auth/example.dart';
import 'package:Neptune/Genealogy/logic/genealogy/genealogy_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';
import 'package:Neptune/Responsive/responsive_layout.dart';
import 'package:Neptune/core/constant/color.dart';
import 'package:Neptune/core/constant/constant.dart';

import '../data/model/genealogy.model.dart';

class GraphTreeWidget extends StatefulWidget {
  const GraphTreeWidget({super.key});

  @override
  State<GraphTreeWidget> createState() => _GraphTreeWidgetState();
}

class _GraphTreeWidgetState extends State<GraphTreeWidget> {
  ///=====================================================//
  ///**Random Color
  // Color _randomColor() {
  //   Color newColor =
  //       Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  //   return newColor;
  // }

  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    context.read<GenealogyCubit>().getGenealogy(id: '');

    builder
      ..siblingSeparation = (20)
      ..levelSeparation = (20)
      ..subtreeSeparation = (20)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Genealogy',
              style:
                  getTextStyle(25, FontWeight.w400, ColorManager.neptuneText),
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  context.read<GenealogyCubit>().getGenealogy(id: '');
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 10,
                ),
                label: Text('Back')),
          ],
        ),
        gapSize(15, 0),
        if (ResponsiveLayoutPage.isDesktop(context) ||
            ResponsiveLayoutPage.isExtraLarge(context) ||
            ResponsiveLayoutPage.isTablet(context))
          BlocBuilder<GenealogyCubit, GenealogyState>(
            builder: (context, state) {
              if (state is GenealogyInitial || state is GenealogyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GenealogyLoaded) {
                return FittedBox(
                  child: GraphView(
                    paint: Paint()
                      ..color = Colors.grey
                      ..strokeWidth = 1
                      ..style = PaintingStyle.stroke,
                    graph: state.graph!,
                    algorithm: BuchheimWalkerAlgorithm(
                        builder, TreeEdgeRenderer(builder)),
                    builder: (Node node) {
                      // I can decide what widget should be shown here based on the id
                      var p = node.key?.value as int;
                      var nodes = state.genealogyModels.nodes;
                      var nodeValue =
                          nodes.firstWhere((element) => element.id == p);
                      return rectangleWidget(
                        nodeValue,
                      );
                    },
                  ),
                );
              } else if (state is GenealogyLoadedWithNoData) {
                final a = state.genealogyModels.nodes;
                return Column(
                  children: [
                    gapSize(10, 0),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: a[0].img.isNotEmpty
                                ? CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                        'https://register.neptunetourist.com/${a[0].img}'),
                                  )
                                : Image.asset(
                                    KImage.profileImage,
                                  ),
                          ),
                          Text(a[0].name),
                          Text(a[0].memberId)
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is GenealogyError) {
                return Text(state.message);
              }
              return const Text('');
            },
          ),
        if (ResponsiveLayoutPage.isMobile(context) ||
            ResponsiveLayoutPage.isMobileLarge(context))
          BlocBuilder<GenealogyCubit, GenealogyState>(
            builder: (context, state) {
              if (state is GenealogyInitial || state is GenealogyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GenealogyLoaded) {
                return FittedBox(
                  child: GraphView(
                    paint: Paint()
                      ..color = Colors.grey
                      ..strokeWidth = 1
                      ..style = PaintingStyle.stroke,
                    graph: state.graph!,
                    algorithm: BuchheimWalkerAlgorithm(
                        builder, TreeEdgeRenderer(builder)),
                    builder: (Node node) {
                      // I can decide what widget should be shown here based on the id
                      var p = node.key?.value as int;
                      var nodes = state.genealogyModels.nodes;
                      var nodeValue =
                          nodes.firstWhere((element) => element.id == p);
                      return rectangleWidget(
                        nodeValue,
                      );
                    },
                  ),
                );
              } else if (state is GenealogyLoadedWithNoData) {
                final a = state.genealogyModels.nodes;
                return Column(
                  children: [
                    gapSize(10, 0),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: a[0].img.isNotEmpty
                                ? CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 18,
                                    foregroundImage: NetworkImage(
                                        'https://register.neptunetourist.com/${a[0].img}'),
                                  )
                                : Image.asset(
                                    KImage.profileImage,
                                  ),
                          ),
                          Text(a[0].name),
                          Text(a[0].memberId)
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is GenealogyError) {
                return Text('Something Went Wrong');
              }
              return const Text('');
            },
          ),
      ],
    );
  }

  Widget rectangleWidget(
    NodeModel nodeValue,
  ) {
    return InkWell(
      onTap: () {
        context.read<GenealogyCubit>().getGenealogy(
              id: nodeValue.memberId.toString(),
            );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    nodeValue.position == 'L' ? Colors.orange : Colors.green),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: Column(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: nodeValue.img.isNotEmpty
                  ? CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      foregroundImage: NetworkImage(
                          'https://register.neptunetourist.com/${nodeValue.img}'),
                    )
                  : Image.asset(
                      KImage.profileImage,
                    ),
            ),
            Text(nodeValue.name),
            Text(nodeValue.memberId)
          ],
        ),
      ),
    );
  }

  Widget rectangleMobileWidget(int a, Color colors) {
    return InkWell(
        onTap: () {
          print('clicked');
        },
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(KImage.profileImage),
              ),
              Text('Node$a')
            ],
          ),
        ));
  }
}

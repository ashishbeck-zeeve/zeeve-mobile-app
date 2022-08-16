import 'package:animations/animations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/dashboard/provider/provider.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class Nodes extends StatelessWidget {
  /// {@macro dashboard_body}
  const Nodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardNotifier>(
      builder: (context, state, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MarketplacePage.route());
          },
          child: OpenContainer(
            closedElevation: 0,
            closedColor: Theme.of(context).canvasColor,
            openColor: Theme.of(context).canvasColor,
            transitionDuration: const Duration(milliseconds: 400),
            closedBuilder: (BuildContext context, void Function() action) =>
                const DeployButton(),
            openBuilder: (BuildContext context,
                    void Function({Object? returnValue}) action) =>
                const MarketplacePage(),
          ),
        );
      },
    );
  }
}

class DeployButton extends StatelessWidget {
  const DeployButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ZeeveColors.gray,
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/bg.png",
          ),
          fit: BoxFit.cover,
          opacity: 0.25,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: ZeeveColors.primary,
              ),
              Text(
                'Deploy Your First Node',
                style: ZeeveTextStyle.headline5
                    .copyWith(color: ZeeveColors.primary),
              ),
            ],
          ),
          Text(
            'Deploy a node of your choice of protocol in a few clicks with your choice of infrastructure and configurations. Let Zeeve worry about what it takes to get your service up and running!',
            style: ZeeveTextStyle.caption,
          )
        ],
      ),
    );
  }
}

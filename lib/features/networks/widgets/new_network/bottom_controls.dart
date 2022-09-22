import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeeve/core/constants.dart';
import 'package:zeeve/features/networks/provider/networks_provider.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    Key? key,
    required this.isFirst,
    required this.state,
  }) : super(key: key);

  final bool isFirst;
  final NetworksNotifier state;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedSwitcher(
                  duration: kSwitchDuration,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: Visibility(
                    visible: !isFirst,
                    child: button(
                      const Icon(Icons.keyboard_arrow_left),
                      () {
                        state.previousPage();
                      },
                    ),
                  ),
                ),
                const Spacer(),
                button(
                  const Icon(Icons.keyboard_arrow_right),
                  () async {
                    if (state.pageController.page == 3) {
                      Prompts.questionDialog(context,
                              content: const Text(
                                  'Are you sure you want to create the network with this settings?'))
                          .then((value) {
                        if (value) {
                          Navigator.pop(context);
                          Prompts.showSnack(context, 'Successfully Created');
                        }
                      });
                      return;
                    }
                    state.nextPage();
                  },
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/images/fabric.svg',
              height: 48,
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar button(Widget icon, Function() onPressed) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: ZeeveColors.primary,
      child: IconButton(
        onPressed: onPressed,
        color: ZeeveColors.white,
        icon: icon,
      ),
    );
  }
}

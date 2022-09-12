import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:zeeve/features/settings/settings.dart';
import 'package:zeeve/features/settings/view/addcloud_page.dart';

class CloudPage extends StatefulWidget {
  const CloudPage({Key? key}) : super(key: key);

  @override
  State<CloudPage> createState() => _CloudPageState();
}

class _CloudPageState extends State<CloudPage> {
  List<String> labels = ["AWS", "Azure", "Digitalocean", "GCP"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget cloudListTile() {
      return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        padding: const EdgeInsets.all(8),
        color: ZeeveColors.ternary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account name", style: ZeeveTextStyle.subtitle2),
                Text("XYZ", style: ZeeveTextStyle.bodyText2),
                Text("Access key", style: ZeeveTextStyle.subtitle2),
                Text("**********", style: ZeeveTextStyle.bodyText2)
              ],
            ),
            Wrap(
              children: const [
                Icon(Icons.copy),
                Icon(Icons.delete),
                Icon(Icons.visibility_off)
              ],
            ),
          ],
        ),
      );
    }

    return Consumer<SettingsNotifier>(builder: (context, state, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.cloud),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddCloudPage())),
            label: const Text("Add Cloud")),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: width,
          height: height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  elevation: 5,
                  child: ToggleSwitch(
                    // minWidth: 50.0,
                    minHeight: 50.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    animate: true,
                    animationDuration: 300,
                    activeBgColor: const [ZeeveColors.primary],
                    inactiveBgColor: ZeeveColors.whiteBackground,
                    // inactiveFgColor: ZeeveColors.black25,
                    totalSwitches: 4,
                    labels: labels,
                    iconSize: 30.0,
                    borderColor: const [ZeeveColors.primary],
                    dividerColor: ZeeveColors.black,
                    onToggle: (index) {
                      if (kDebugMode) print('switched to: $index');
                      // state.updateCloudName(labels[index!]);
                    },
                  ),
                ),
              ),
              // const Spacer(),
              // const Expanded(child: Center(child: Text("No Data"))),
              cloudListTile(),
              cloudListTile()
              // Expanded(
              //     child: EmptyWidget(
              //       packageImage: PackageImage.Image_3,
              //       title: "No data",
              //     ),
              //   )
              // CommonWidgets.commonButton(context, "Add Cloud",
              //     icon: const Icon(Icons.add))
            ],
          ),
        ),
      );
    });
  }
}

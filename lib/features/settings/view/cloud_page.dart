import 'package:app_ui/app_ui.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CloudPage extends StatefulWidget {
  const CloudPage({Key? key}) : super(key: key);

  @override
  State<CloudPage> createState() => _CloudPageState();
}

class _CloudPageState extends State<CloudPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> labels = ["AWS", "Azure", "Digitalocean", "GCP"];
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.cloud),
          onPressed: () {},
          label: const Text("Add Cloud")),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: width,
        height: height,
        child: Column(
          children: [
            Material(
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
                  print('switched to: $index');
                },
              ),
            ),
            // const Spacer(),
            // const Expanded(child: Center(child: Text("No Data"))),
            Expanded(
                child: EmptyWidget(
              packageImage: PackageImage.Image_3,
              title: "No data",
            ))
            // CommonWidgets.commonButton(context, "Add Cloud",
            //     icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

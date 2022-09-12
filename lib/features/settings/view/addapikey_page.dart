import 'package:app_ui/app_ui.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:zeeve/features/settings/settings.dart';

class AddApikeyPage extends StatefulWidget {
  const AddApikeyPage({super.key});

  @override
  State<AddApikeyPage> createState() => _AddApikeyPageState();
}

enum RadioValue { network, zdfs }

class _AddApikeyPageState extends State<AddApikeyPage> {
  TextEditingController keynameController = TextEditingController(text: "");
  TextEditingController networkController = TextEditingController(text: "");
  TextEditingController permissionController = TextEditingController(text: "");
  RadioValue serviceType = RadioValue.network;
  List<String> selectednetwork = [];
  List<String> selectedpermissions = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
        Consumer<SettingsNotifier>(builder: (context, state, child) {
          return GestureDetector(
            onTap: (() => FocusScope.of(context).unfocus()),
            child: Scaffold(
              appBar: CommonWidgets.appBar(context, "Create Access Key"),
              body: Container(
                padding: const EdgeInsets.all(16),
                width: width,
                height: height,
                child: ListView(
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      "Key Name",
                      style: ZeeveTextStyle.subtitle2,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: keynameController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        hintText: "Key Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => keynameController.text.isEmpty
                          ? 'Please enter key name'
                          : null,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Service Type",
                      style: ZeeveTextStyle.subtitle2,
                    ),
                    Row(
                      children: [
                        Radio<RadioValue>(
                          value: RadioValue.network,
                          groupValue: serviceType,
                          onChanged: (RadioValue? value) {
                            setState(() {
                              serviceType = value!;
                            });
                          },
                        ),
                        const Text("Network"),
                        Radio<RadioValue>(
                          value: RadioValue.zdfs,
                          groupValue: serviceType,
                          onChanged: (RadioValue? value) {
                            setState(() {
                              serviceType = value!;
                            });
                          },
                        ),
                        const Text("ZDFS"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (serviceType == RadioValue.zdfs)
                      EmptyWidget(
                        packageImage: PackageImage.Image_2,
                        title: "Buy Subscription",
                        subTitle:
                            "Please buy zdfs subscription before creating access key.",
                      ),
                    if (serviceType == RadioValue.network)
                      Text(
                        "Select Network",
                        style: ZeeveTextStyle.subtitle2,
                      ),
                    const SizedBox(height: 8),
                    if (serviceType == RadioValue.network)
                      DropDownMultiSelect(
                        onChanged: (List<String> x) {
                          setState(() {
                            selectednetwork = x;
                          });
                        },
                        options: const ['ethNFT', 'demotest', 'DEV-NET'],
                        selectedValues: selectednetwork,
                        // whenEmpty: 'Select Networks',
                        decoration: const InputDecoration(
                          hintText: "Select Networks",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    const SizedBox(height: 8),
                    if (serviceType == RadioValue.network)
                      Text(
                        "Select Permissions",
                        style: ZeeveTextStyle.subtitle2,
                      ),
                    const SizedBox(height: 8),
                    if (serviceType == RadioValue.network)
                      DropDownMultiSelect(
                        onChanged: (List<String> x) {
                          setState(() {
                            selectedpermissions = x;
                          });
                        },
                        options: const [
                          'read_network',
                          'write_network',
                          'delete_network',
                          'add_node',
                          'share_network',
                          'run_pipelines',
                          'view_pipelines',
                          'node.*'
                        ],
                        selectedValues: selectedpermissions,
                        // whenEmpty: 'Select Permissions',
                        decoration: const InputDecoration(
                          hintText: "Select Permissions",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Create Key")),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"))
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:zeeve/features/settings/settings.dart';

class AddCloudPage extends StatefulWidget {
  const AddCloudPage({super.key});

  @override
  State<AddCloudPage> createState() => _AddCloudPageState();
}

class _AddCloudPageState extends State<AddCloudPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController accesskeyController = TextEditingController();
  TextEditingController secretkeyController = TextEditingController();
  TextEditingController credController = TextEditingController();
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
              appBar: CommonWidgets.appBar(context, "Add Cloud"),
              body: Container(
                padding: const EdgeInsets.all(16),
                width: width,
                height: height,
                child: ListView(
                  children: [
                    const SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage("assets/logo.png"))),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Authorize Your ${state.cloudName} Account",
                          style: ZeeveTextStyle.subtitle1,
                        )),
                    const SizedBox(height: 8),
                    cloudTextFields(nameController, "Name", Icons.person),
                    const SizedBox(height: 8),
                    cloudTextFields(
                        accesskeyController, "Access Key", Icons.vpn_key),
                    const SizedBox(height: 8),
                    cloudTextFields(
                        secretkeyController, "Secret Key", Icons.privacy_tip,
                        obscurity: true),
                    const SizedBox(height: 8),
                    cloudTextFields(
                        credController, "Credential Label", Icons.label),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          state.updatedisplaytile(true);
                        },
                        child: const Text("Add cloud")),
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

  static Widget cloudTextFields(
    TextEditingController controller,
    String hinttext,
    IconData icon, {
    bool? obscurity,
    FocusNode? thisFocus,
    FocusNode? nextFocus,
  }) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hinttext,
            style: ZeeveTextStyle.subtitle2,
          ),
          const SizedBox(height: 8),
          (obscurity != null)
              ? TextFormField(
                  controller: controller,
                  focusNode: thisFocus,
                  obscureText: obscurity!,
                  keyboardType: TextInputType.visiblePassword,
                  // textInputAction:
                  //     isPhoneMode ? TextInputAction.done : TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: Icon(icon),
                      hintText: hinttext,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(obscurity!
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            setState(() => obscurity = !obscurity!),
                      )),
                  validator: (val) =>
                      controller.text.isEmpty ? 'Please enter $hinttext' : null,
                  onFieldSubmitted: (val) {
                    nextFocus?.requestFocus();
                  },
                )
              : TextFormField(
                  controller: controller,
                  focusNode: thisFocus,
                  keyboardType: TextInputType.visiblePassword,
                  // textInputAction:
                  //     isPhoneMode ? TextInputAction.done : TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(icon),
                    hintText: hinttext,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) =>
                      controller.text.isEmpty ? 'Please enter $hinttext' : null,
                  onFieldSubmitted: (val) {
                    nextFocus?.requestFocus();
                  },
                ),
        ],
      );
    });
  }
}

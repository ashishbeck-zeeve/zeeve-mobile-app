import 'package:flutter/material.dart';
import 'package:zeeve/features/zdfs/provider/provider.dart';
import 'package:zeeve/features/zdfs/widgets/buttons.dart';
import 'package:zeeve/features/zdfs/widgets/fileswidget.dart';
import 'package:zeeve/features/zdfs/widgets/titlecards.dart';

class ZdfsBody extends StatelessWidget {
  const ZdfsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> zdfswidgets = [
      ElevatedButton(onPressed: () {}, child: const Text("data")),
      const TitleCards()
    ];
    return Consumer<ZdfsNotifier>(
      builder: (context, state, child) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const TitleCards(),
                const ZDFSButtons(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const FilesWidgegt();
                      }),
                )
              ],
            ));
      },
    );
  }
}

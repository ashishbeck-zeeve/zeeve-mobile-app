import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeeve/features/networks/provider/networks_provider.dart';
import 'package:zeeve/features/networks/widgets/new_network/add_org.dart';
import 'package:zeeve/models/new_network_params.dart';

class OrgModulePage extends StatefulWidget {
  const OrgModulePage({super.key});

  @override
  State<OrgModulePage> createState() => _OrgModulePageState();
}

class _OrgModulePageState extends State<OrgModulePage>
    with AutomaticKeepAliveClientMixin {
  void pushOrgPage(NetworksNotifier state,
      {OrgItemParams? org, int? index}) async {
    var data = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddOrgPage(
          org: org,
        ),
      ),
    );
    if (data != null) {
      if (state.params.orgs.isEmpty) {
        state.params.orgs = [data];
      } else if (index != null) {
        state.params.orgs[index] = data;
      } else {
        state.params.orgs.add(data);
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<NetworksNotifier>(
      builder: (context, state, child) {
        var orgs = state.params.orgs;
        // print(params);
        // if (params.orgs.isEmpty) {
        //   params.orgs = [
        //     OrgItemParams(
        //       orderers: [Orderer()],
        //       peers: [Peer()],
        //     ),
        //   ];
        // }

        Widget orgTile(OrgItemParams org, int index) {
          return ListTile(
            title: Text(org.name),
            trailing: const Icon(Icons.keyboard_arrow_right),
            leading: IconButton(
              icon: const Icon(Icons.delete),
              color: ZeeveColors.red,
              onPressed: () async {
                final confirm = await Prompts.questionDialog(context,
                    title: 'Confirm Delete',
                    content: const Text(
                        'Are you sure you want to delete this organisation'));
                if (!confirm) return;
                setState(() {
                  state.params.orgs.removeAt(index);
                });
              },
            ),
            onTap: () => pushOrgPage(state, org: org, index: index),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: [
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: orgs.length,
                itemBuilder: (context, index) {
                  return orgTile(orgs[index], index);
                }),
            SizedBox(
              width: double.infinity,
              child: MyButton(
                  text: 'Add Organisation',
                  icon: const Icon(Icons.add),
                  onPressed: () => pushOrgPage(state)),
            ),
            const SizedBox(
              height: kBottomNavigationBarHeight,
            )
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

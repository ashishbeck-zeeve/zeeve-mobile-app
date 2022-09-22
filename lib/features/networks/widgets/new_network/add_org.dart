// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:zeeve/features/networks/provider/networks_provider.dart';
import 'package:zeeve/features/networks/widgets/new_network/subheading.dart';
import 'package:zeeve/models/new_network_params.dart';

class AddOrgPage extends StatefulWidget {
  OrgItemParams? org;
  AddOrgPage({
    Key? key,
    this.org,
  }) : super(key: key);

  @override
  State<AddOrgPage> createState() => _AddOrgPageState();
}

class _AddOrgPageState extends State<AddOrgPage> {
  OrgItemParams org = OrgItemParams();
  List<Orderer> orderers = [Orderer()];
  List<Peer> peers = [Peer()];
  CSR csr = CSR();

  @override
  void initState() {
    super.initState();
    if (widget.org != null) {
      org = widget.org!;
      orderers = org.orderers;
      peers = org.peers;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonWidgets.appBar(
          context,
          'Add new Organisation',
          actions: [
            TextButton(
                onPressed: () {
                  org.orderers = orderers;
                  org.peers = peers;
                  Navigator.pop(context, org);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: ZeeveColors.white),
                ))
          ],
        ),
        body: ListView(
          children: [
            ItemCA(org: org),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: orderers.length,
              itemBuilder: ((context, index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ItemOrderer(
                      orderer: orderers[index],
                      index: index,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            orderers.removeAt(index);
                          });
                        },
                        color: ZeeveColors.red,
                        icon: const Icon(Icons.delete))
                  ],
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2,
                  vertical: 8),
              child: MyButton(
                text: 'Add Orderer',
                onPressed: () {
                  setState(() {
                    orderers.add(Orderer());
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: peers.length,
              itemBuilder: ((context, index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ItemPeer(
                      peer: peers[index],
                      index: index,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            peers.removeAt(index);
                          });
                        },
                        color: ZeeveColors.red,
                        icon: const Icon(Icons.delete)),
                  ],
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2,
                  vertical: 8),
              child: MyButton(
                text: 'Add Peer',
                onPressed: () {
                  setState(() {
                    peers.add(Peer());
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ),
            ItemCSR(
              csr: csr,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}

// Sub Widgets

class ItemCA extends StatefulWidget {
  OrgItemParams org;
  ItemCA({
    Key? key,
    required this.org,
  }) : super(key: key);

  @override
  State<ItemCA> createState() => _ItemCAState();
}

class _ItemCAState extends State<ItemCA> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SubHeading(title: 'CA'),
            const SizedBox(
              height: 8,
            ),
            InputFields.genericTextField(
              title: 'Name of Organisation',
              initialValue: widget.org.name,
              onChanged: (value) => widget.org.name = value ?? '',
            ),
            InputFields.genericTextField(
              title: 'Username',
              initialValue: widget.org.username,
              onChanged: (value) => widget.org.username = value ?? '',
            ),
            InputFields.genericTextField(
              title: 'Password',
              initialValue: widget.org.password,
              obscurity: true,
              onChanged: (value) => widget.org.password = value ?? '',
            ),
            SwitchListTile.adaptive(
              title: const Text('Enable CA Persistent Volume'),
              value: widget.org.isPersistent,
              onChanged: (value) =>
                  setState(() => widget.org.isPersistent = value),
            ),
            widget.org.isPersistent
                ? InputFields.numberTextField(
                    title: 'Volume Size',
                    initialValue: widget.org.volumeSize.toString(),
                    onChanged: (value) => widget.org.volumeSize = int.tryParse(
                          value ?? '0',
                        ) ??
                        0,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class ItemOrderer extends StatefulWidget {
  Orderer orderer;
  int index;
  ItemOrderer({
    Key? key,
    required this.orderer,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemOrderer> createState() => _ItemOrdererState();
}

class _ItemOrdererState extends State<ItemOrderer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(title: 'Orderer ${widget.index + 1}'),
            SwitchListTile.adaptive(
              title: const Text('Enable Orderer Persistent Volume'),
              value: widget.orderer.isPersistent,
              onChanged: (value) =>
                  setState(() => widget.orderer.isPersistent = value),
            ),
            widget.orderer.isPersistent
                ? InputFields.numberTextField(
                    title: 'Volume Size',
                    initialValue: widget.orderer.volumeSize.toString(),
                    onChanged: (value) =>
                        widget.orderer.volumeSize = int.tryParse(
                              value ?? '0',
                            ) ??
                            0,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class ItemPeer extends StatefulWidget {
  Peer peer;
  int index;
  ItemPeer({
    Key? key,
    required this.peer,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemPeer> createState() => _ItemPeerState();
}

class _ItemPeerState extends State<ItemPeer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(title: 'Peer ${widget.index + 1}'),
            MyRadioTile(
              title: 'Level DB',
              groupValue: widget.peer.db,
              onChanged: (value) {
                setState(() {
                  widget.peer.db = 'Level DB';
                });
              },
            ),
            SwitchListTile.adaptive(
              title: const Text('Enable Peer Persistent Volume'),
              value: widget.peer.isPersistent,
              onChanged: (value) =>
                  setState(() => widget.peer.isPersistent = value),
            ),
            widget.peer.isPersistent
                ? InputFields.numberTextField(
                    title: 'Volume Size',
                    initialValue: widget.peer.volumeSize.toString(),
                    onChanged: (value) => widget.peer.volumeSize = int.tryParse(
                          value ?? '0',
                        ) ??
                        0,
                  )
                : const SizedBox.shrink(),
            MyRadioTile(
              title: 'Couch DB',
              groupValue: widget.peer.db,
              onChanged: (value) {
                setState(() {
                  widget.peer.db = 'Couch DB';
                });
              },
            ),
            widget.peer.db == 'Couch DB'
                ? SwitchListTile.adaptive(
                    title: const Text('Enable Couch DB Persistent Volume'),
                    value: widget.peer.isCouchPersistent,
                    onChanged: (value) =>
                        setState(() => widget.peer.isCouchPersistent = value),
                  )
                : const SizedBox.shrink(),
            widget.peer.db == 'Couch DB' && widget.peer.isCouchPersistent
                ? InputFields.numberTextField(
                    title: 'Volume Size',
                    initialValue: widget.peer.couchVolumeSize.toString(),
                    onChanged: (value) =>
                        widget.peer.couchVolumeSize = int.tryParse(
                              value ?? '0',
                            ) ??
                            0,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class ItemCSR extends StatefulWidget {
  CSR csr;
  ItemCSR({
    Key? key,
    required this.csr,
  }) : super(key: key);

  @override
  State<ItemCSR> createState() => _ItemCSRState();
}

class _ItemCSRState extends State<ItemCSR> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SubHeading(title: 'CSR (optional)'),
            InputFields.genericTextField(
              title: 'Organisation',
              initialValue: widget.csr.org,
              onChanged: (value) => widget.csr.org = value ?? '',
            ),
            InputFields.genericTextField(
              title: 'Organisation Unit',
              initialValue: widget.csr.orgUnit,
              onChanged: (value) => widget.csr.orgUnit = value ?? '',
            ),
            InputFields.genericTextField(
              title: 'Country',
              initialValue: widget.csr.country,
              onChanged: (value) => widget.csr.country = value ?? '',
            ),
            InputFields.genericTextField(
              title: 'State',
              initialValue: widget.csr.state,
              onChanged: (value) => widget.csr.state = value ?? '',
            ),
            InputFields.genericTextField(
              title: 'Locality',
              initialValue: widget.csr.locality,
              onChanged: (value) => widget.csr.locality = value ?? '',
            ),
            InputFields.numberTextField(
              title: 'Validity in years',
              initialValue: widget.csr.validity.toString(),
              onChanged: (value) => widget.csr.validity = int.tryParse(
                    value ?? '0',
                  ) ??
                  0,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/widgets/protocol_item.dart';

class PermissiveProtocols extends StatelessWidget {
  const PermissiveProtocols({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        ProtocolItem(
          title: 'Corda',
          description:
              'Corda is an open source blockchain project, designed for business from the start. Only Corda allows you to build interop',
          imgPath: 'assets/images/corda.svg',
        ),
        ProtocolItem(
          title: 'Fabric',
          description:
              'Hyperledger Fabric allows components, such as consensus and membership services, to be plug-and-play. It leverages conta',
          imgPath: 'assets/images/fabric.svg',
        ),
      ],
    );
  }
}

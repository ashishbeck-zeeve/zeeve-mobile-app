import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/widgets/protocol_item.dart';

class PublicProtocols extends StatelessWidget {
  const PublicProtocols({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ProtocolItem(
          title: 'Avalanche',
          description:
              'Avalanche is an open, programmable smart contracts platform with low cost and Solidity compatible dApps. It is the fastest platform as measured by time-to-finality.',
          imgPath:
              'https://app.zeeve.io/app/static/media/Avalanche.dc864b9e.svg',
        ),
        ProtocolItem(
          title: 'AXIA',
          description:
              'Axia is an open, programmable smart contracts platform with low cost and Solidity compatible dApps. It is the fastest platform as measured by time-to-finality.',
          imgPath: 'https://app.zeeve.io/app/static/media/Axia.827ca4c4.svg',
        ),
        ProtocolItem(
          title: 'Binance',
          description:
              'Binance is an EVM-compatible customized blockchain protocol forked out of Geth and uses consensus of Proof of Staked Authority (PoSA)',
          imgPath: 'https://app.zeeve.io/app/static/media/Binance.751eeaa9.svg',
        ),
      ],
    );
  }
}

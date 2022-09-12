// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/networks/networks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworksBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        Provider(
          create: (context) =>
              ChangeNotifierProvider(create: (_) => NetworksNotifier()),
          child: MaterialApp(home: AllNetworksBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

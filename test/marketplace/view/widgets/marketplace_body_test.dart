// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MarketplaceBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => MarketplaceNotifier()),
          child: MaterialApp(home: MarketplaceBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

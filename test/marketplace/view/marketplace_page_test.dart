// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MarketplacePage', () {
    group('route', () {
      test('is routable', () {
        expect(MarketplacePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MarketplaceView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MarketplacePage()));
      expect(find.byType(MarketplaceView), findsOneWidget);
    });
  });
}

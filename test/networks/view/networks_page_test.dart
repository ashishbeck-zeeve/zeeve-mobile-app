// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/networks/networks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworksPage', () {
    group('route', () {
      test('is routable', () {
        expect(AllNetworksPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders NetworksView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AllNetworksPage()));
      expect(find.byType(NetworksView), findsOneWidget);
    });
  });
}

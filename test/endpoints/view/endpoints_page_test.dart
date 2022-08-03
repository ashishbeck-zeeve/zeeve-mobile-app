// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/endpoints/endpoints.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EndpointsPage', () {
    group('route', () {
      test('is routable', () {
        expect(EndpointsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders EndpointsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EndpointsPage()));
      expect(find.byType(EndpointsView), findsOneWidget);
    });
  });
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/auth_wrapper/auth_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthWrapperPage', () {
    group('route', () {
      test('is routable', () {
        expect(AuthWrapperPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AuthWrapperView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AuthWrapperPage()));
      expect(find.byType(AuthWrapperView), findsOneWidget);
    });
  });
}

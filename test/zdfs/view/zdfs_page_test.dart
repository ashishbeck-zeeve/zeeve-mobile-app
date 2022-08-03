// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/zdfs/zdfs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ZdfsPage', () {
    group('route', () {
      test('is routable', () {
        expect(ZdfsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ZdfsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ZdfsPage()));
      expect(find.byType(ZdfsView), findsOneWidget);
    });
  });
}

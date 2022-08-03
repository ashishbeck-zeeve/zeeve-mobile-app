// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/zdfs/zdfs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ZdfsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => ZdfsNotifier()),
          child: MaterialApp(home: ZdfsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

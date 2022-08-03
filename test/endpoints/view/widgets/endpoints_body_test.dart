// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/endpoints/endpoints.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EndpointsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => EndpointsNotifier()),
          child: MaterialApp(home: EndpointsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

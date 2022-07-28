// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/signup/signup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignupBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => SignupNotifier()),
          child: MaterialApp(home: SignupBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

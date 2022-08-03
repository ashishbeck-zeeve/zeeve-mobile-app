// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/auth_wrapper/auth_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthWrapperBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => AuthWrapperNotifier()),
          child: MaterialApp(home: AuthWrapperBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

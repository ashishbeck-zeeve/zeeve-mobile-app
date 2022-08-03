// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/workspace/workspace.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkspaceBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => WorkspaceNotifier()),
          child: MaterialApp(home: WorkspaceBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zeeve/features/workspace/workspace.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkspacePage', () {
    group('route', () {
      test('is routable', () {
        expect(WorkspacePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders WorkspaceView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WorkspacePage()));
      expect(find.byType(WorkspaceView), findsOneWidget);
    });
  });
}

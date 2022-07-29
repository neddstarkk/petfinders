// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import 'package:petfinders/main.dart';
import 'package:petfinders/ui/screens/home_screen.dart';
import 'package:petfinders/ui/widgets/home_screen_widgets/custom_search_delegate.dart';
import 'package:petfinders/ui/widgets/home_screen_widgets/pet_display_grid.dart';

import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Search Button is present and navigates after tap to Search Delegate',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [mockObserver],
        home: MyApp(),
      ),
    );

    var searchButton = find.byType(IconButton);
    expect(searchButton, findsOneWidget);

    
    await tester.tap(searchButton);
    await tester.pumpAndSettle();

    expect(find.byType(IconButton), findsNWidgets(2));
    expect(find.byType(TextField), findsNWidgets(1));

    var textField = find.byType(TextField);
    await tester.enterText(textField, "Hello Search Field");

    expect(find.text("Hello Search Field"), findsOneWidget);
  });
}

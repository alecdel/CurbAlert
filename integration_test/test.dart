import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:curb_alert/flutter_flow/flutter_flow_drop_down.dart';
import 'package:curb_alert/flutter_flow/flutter_flow_icon_button.dart';
import 'package:curb_alert/flutter_flow/flutter_flow_widgets.dart';
import 'package:curb_alert/flutter_flow/flutter_flow_theme.dart';
import 'package:curb_alert/index.dart';
import 'package:curb_alert/main.dart';
import 'package:curb_alert/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:curb_alert/backend/firebase/firebase_config.dart';
import 'package:curb_alert/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('US1 Account Creation', () {
    testWidgets('Account Creation and Missing Password',
        (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SignInWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('DontHaveAccount-Navigation_h045')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('SignUp-Button_fvzd')), findsOneWidget);
      await tester.enterText(
          find.byKey(ValueKey('SignUp-Email_cdgl')), 'test@uri.edu');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.enterText(
          find.byKey(ValueKey('SignUp-Password_1r3r')), 'Password1!');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.tap(find.byKey(ValueKey('SignUp-Button_fvzd')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('SignUp-Button_fvzd')), findsOneWidget);
      await tester.enterText(
          find.byKey(ValueKey('SignUp-ConfirmPassword_hrbf')), 'Password1!');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.tap(find.byKey(ValueKey('SignUp-Button_fvzd')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('LogOut_q89j')), findsOneWidget);
    });

    testWidgets('Account Creation and Mismatching Passwords',
        (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SignInWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('DontHaveAccount-Navigation_h045')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('SignUp-Button_fvzd')), findsOneWidget);
      await tester.enterText(
          find.byKey(ValueKey('SignUp-Email_cdgl')), 'test@uri.edu');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.enterText(
          find.byKey(ValueKey('SignUp-Password_1r3r')), 'Password1!');
      FocusManager.instance.primaryFocus?.unfocus();
      expect(find.byKey(ValueKey('SignUp-Button_fvzd')), findsOneWidget);
      await tester.enterText(
          find.byKey(ValueKey('SignUp-ConfirmPassword_hrbf')), 'Password!1');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.tap(find.byKey(ValueKey('SignUp-Button_fvzd')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('SignUp-Button_fvzd')), findsOneWidget);
    });
  });

  group('US2 User Authentication', () {
    testWidgets('User Authentication', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SignInWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.enterText(
          find.byKey(ValueKey('Login-Email_f4p0')), 'incorrectemail@uri.edu');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.enterText(
          find.byKey(ValueKey('Login-Password_d88s')), 'Password1!');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.tap(find.byKey(ValueKey('Login-Button_kzl5')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('Login-Button_kzl5')), findsOneWidget);
      await tester.enterText(
          find.byKey(ValueKey('Login-Email_f4p0')), 'test@uri.edu');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.tap(find.byKey(ValueKey('Login-Button_kzl5')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('SEARCH_3r33')), findsOneWidget);
    });

    testWidgets('Forgot Password', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SignInWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('Login-ForgotPassword_20du')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('ResetPassword-Button_izuj')), findsOneWidget);
      await tester.enterText(
          find.byKey(ValueKey('ForgotPassword-Email_oxca')), 'test@uri.edu');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.tap(find.byKey(ValueKey('ResetPassword-Button_izuj')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('Login-Button_kzl5')), findsOneWidget);
    });
  });

  group('US6 Metrics', () {
    testWidgets('Net Promoter Score Survey', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 8000));
      await tester.tap(find.byKey(ValueKey('DontHaveAccount-Navigation_h045')));
      await tester.pumpAndSettle(Duration(milliseconds: 8000));
      await tester.enterText(
          find.byKey(ValueKey('SignUp-Email_cdgl')), 'test2@uri.edu');
      await tester.enterText(
          find.byKey(ValueKey('SignUp-Password_1r3r')), 'password');
      await tester.enterText(
          find.byKey(ValueKey('SignUp-ConfirmPassword_hrbf')), 'password');
      await tester.tap(find.byKey(ValueKey('SignUp-Button_fvzd')));
      await tester.pumpAndSettle(Duration(milliseconds: 8000));
      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('NavBar_usng')),
        matching: find.byKey(ValueKey('IconButton_7rr4')),
      ));
      await tester.pumpAndSettle(Duration(milliseconds: 8000));
      await tester.tap(find.text('Select...'));
      await tester.tap(find.text('5'));
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle(Duration(milliseconds: 8000));
      expect(find.text('Messages'), findsOneWidget);
    });
  });

  group('US5 User Messaging', () {
    testWidgets('Messaging a Seller', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test@uri.edu', password: 'Password1!');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: AvailItemsHOMEWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.descendant(
        of: find.byKey(ValueKey('ListView_2o20')),
        matching: find.byKey(ValueKey('Key7z2_TestItem')),
      ));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Claim Item'), findsOneWidget);
      await tester.tap(find.byType(Button));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.byKey(ValueKey('Text_hesx')), findsOneWidget);
      await tester.tap(find.byKey(ValueKey('conversation_52hj')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('End Chat'), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.enterText(
          find.byKey(ValueKey('SendMessage_tw5m')), 'Hello World');
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('IconButton_xg10')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('Completing a Sale', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test@uri.edu', password: 'Password1!');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: AvailItemsHOMEWidget(),
        ),
      ));

      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.text('Details'));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('Claim Item'), findsOneWidget);
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.text('Claim Item'));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      await tester.tap(find.byKey(ValueKey('conversation_52hj')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(find.text('End Chat'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey('Button_d5j6')));
      await tester.pumpAndSettle(Duration(milliseconds: 3000));
      expect(
          find.text(
              'This will delete the chat.  Please confirm this is what you want to do.'),
          findsOneWidget);
    });
  });

  testWidgets('US4 Golden Path', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: SignInWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('DontHaveAccount-Navigation_h045')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(ValueKey('SignUp-Email_cdgl')), 'uritest3@uri.edu');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(ValueKey('SignUp-Password_1r3r')), 'Password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(ValueKey('SignUp-ConfirmPassword_hrbf')), 'Password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.tap(find.byKey(ValueKey('SignUp-Button_fvzd')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('NavBar_usng')),
      matching: find.byKey(ValueKey('itemsNearButton_ko37')),
    ));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('NavBar_y9o5')),
      matching: find.byKey(ValueKey('userItemsButton_hqej')),
    ));
    expect(find.byKey(ValueKey('GridView_y74m')), findsOneWidget);
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}

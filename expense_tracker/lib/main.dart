import "package:flutter/material.dart";
import 'package:expense_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 59, 96, 181),
);
var kdarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kdarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kdarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkColorScheme.primaryContainer,
            foregroundColor: kdarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: kColorScheme.onSecondaryContainer),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
  //   (fn) => runApp(
  //     MaterialApp(
  //       darkTheme: ThemeData.dark().copyWith(
  //         colorScheme: kdarkColorScheme,
  //         cardTheme: const CardTheme().copyWith(
  //           color: kdarkColorScheme.secondaryContainer,
  //           margin: const EdgeInsets.symmetric(
  //             horizontal: 16,
  //             vertical: 8,
  //           ),
  //         ),
  //         elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: kdarkColorScheme.primaryContainer,
  //             foregroundColor: kdarkColorScheme.onPrimaryContainer,
  //           ),
  //         ),
  //       ),
  //       theme: ThemeData().copyWith(
  //         colorScheme: kColorScheme,
  //         appBarTheme: AppBarTheme(
  //           backgroundColor: kColorScheme.onPrimaryContainer,
  //           foregroundColor: kColorScheme.primary,
  //         ),
  //         cardTheme: const CardTheme().copyWith(
  //           color: kColorScheme.secondaryContainer,
  //           margin: const EdgeInsets.symmetric(
  //             horizontal: 16,
  //             vertical: 8,
  //           ),
  //         ),
  //         elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //               backgroundColor: kColorScheme.primaryContainer),
  //         ),
  //         textTheme: ThemeData().textTheme.copyWith(
  //               titleLarge: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.normal,
  //                   color: kColorScheme.onSecondaryContainer),
  //             ),
  //       ),
  //       themeMode: ThemeMode.system,
  //       home: const Expenses(),
  //     ),
  //   ),
  // );
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/Provider/CounterProvider.dart';
import 'package:theme_provider/Provider/ThemeProvider.dart';

import 'Screen/HomePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(builder: (context, provider, child) {
        return MaterialApp(
          theme: provider.isDark
              ? ThemeData(brightness: Brightness.dark)
              : ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Colors.green,
                  primarySwatch: Colors.green,
                ),
          home: const HomePage(),
        );
      }),
    ),
  );
}

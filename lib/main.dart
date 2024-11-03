import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //to return multiple providers we use this  for bigger apps
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        title: 'shopping app',
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 229, 255),
            primary: const Color.fromARGB(255, 33, 229, 255),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(66, 66, 66, 1)),
              prefixIconColor: Color.fromRGBO(66, 66, 66, 1)),
          fontFamily: '$GoogleFonts.lato()',
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
            bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            titleLarge: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          useMaterial3: true,
        ),
        // home: ProductDetailsPage(
        // product: products[1],)
      ),
    );
  }
}

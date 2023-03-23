import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/Provider/CounterProvider.dart';
import 'package:theme_provider/Provider/ThemeProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    CounterProvider counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme provider"),
        actions: [
          IconButton(
            onPressed: () {
              print("ThemeNotifier :: $themeProvider.isDark");
              themeProvider.isDark = !themeProvider.isDark;
            },
            icon: Icon(
              themeProvider.isDark
                  ? Icons.nightlight_outlined
                  : Icons.wb_sunny_outlined,
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: counterProvider.counterList.length,
          itemBuilder: (context, index) {
            if (index == null) {
              return const CircularProgressIndicator();
            } else {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text("$index"),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterProvider.updateCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  List counterList=[];
  updateCounter(){
    counter++;
    counterList.add(counter);
    print("Counter :: $counter");
    notifyListeners();
  }
}
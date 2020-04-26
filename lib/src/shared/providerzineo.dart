import 'package:flutter/cupertino.dart';

class ThemeProvider with ChangeNotifier{
  bool isDark = false;

  bool isCardExpanding = false;
  int cardExpanding;

  void change(){
    isDark = !isDark;
    notifyListeners();
  }

  void expandCard(int cardpos){
    cardExpanding = cardpos;
    isCardExpanding = !isCardExpanding;
    notifyListeners();
  }

}
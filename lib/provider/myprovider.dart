import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  int _ordersNumber = 0;
  double _totalNumber = 0;
  int _selectedBNBItem = 0;
  int _selectedIndexOfMenuList = 0;
  int _amountOfFood = 1;

  int get ordersNumber => _ordersNumber;

  set ordersNumber(int value) {
    _ordersNumber = value;
  }

  double get totalNumber => _totalNumber;

  set totalNumber(double value) {
    _totalNumber = value;
  }

  int get amountOfFood => _amountOfFood;

  set amountOfFood(int value) {
    _amountOfFood = value;
  }

  int get selectedIndexOfMenuList => _selectedIndexOfMenuList;

  set selectedIndexOfMenuList(int value) {
    _selectedIndexOfMenuList = value;
  }

  void bnBItem(int index) {
    _selectedBNBItem = index;
   // notifyListeners();
  }

  int get selectedBNBItem => _selectedBNBItem;

  void setSelectedIndex(int i) {
    _selectedIndexOfMenuList = i;

  }

 // int get selectedBNBItem => selectedBNBItem;

  // set selectedBNBItem(int value) {
  //   selectedBNBItem = value;
  // }

  void increaseAmountOfFood() {
    _amountOfFood++;
    notifyListeners();
  }

  void decreaseAmountOfFood() {
    _amountOfFood--;
    notifyListeners();
  }

  void increasenumberofOrder(){
_ordersNumber++;
notifyListeners();
  }
  void calculatePrice(int amount,double price){
    _totalNumber+=amount*price;
  notifyListeners();
  }
}
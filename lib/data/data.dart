import 'dart:math';

import 'package:budgetsavvy/models/CategoryModel.dart';
import 'package:budgetsavvy/models/ExpenseModel.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_generateExpenses() {
  List<Expense> expenses = [
    Expense(name: 'Item 0', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 1', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 2', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 3', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 4', cost: rand.nextDouble() * 90),
    Expense(name: 'Item 5', cost: rand.nextDouble() * 90),
  ];
  return expenses;
}

List<Category> categories = [
  Category(name: 'Bills', maxAmount: 100, expenses: _generateExpenses()),
  Category(name: 'Education', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Grocery', maxAmount: 600, expenses: _generateExpenses()),
  Category(name: 'Gift', maxAmount: 330, expenses: _generateExpenses()),
  Category(name: 'Health', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Household', maxAmount: 1000, expenses: _generateExpenses()),
  Category(name: 'Food', maxAmount: 450, expenses: _generateExpenses()),
  Category(name: 'Apparel', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Transport', maxAmount: 600, expenses: _generateExpenses()),
  Category(name: 'Pets', maxAmount: 330, expenses: _generateExpenses()),
  Category(name: 'Social', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Other', maxAmount: 1000, expenses: _generateExpenses()),
];

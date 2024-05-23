import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'cc',
      amount: 33.3,
      date: DateTime.now(),
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true, //take full screen
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); // clear previous snackbars
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('nothing to display here'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}

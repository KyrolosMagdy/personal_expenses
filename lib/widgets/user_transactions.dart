import 'package:flutter/material.dart';

import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final List<Transaction> _userTransactions;
  final Function deleteTransaction;

  UserTransaction(
      this.addNewTransaction, this._userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TransactionList(_userTransactions, deleteTransaction)],
    );
  }
}

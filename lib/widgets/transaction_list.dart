import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function deleteTransaction;

  TransactionList(this._userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 10),
                Container(
                  height: constrains.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${_userTransactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    '${_userTransactions[index].title}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_userTransactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () =>
                        deleteTransaction(_userTransactions[index].id),
                  ),
                ),
              );
            },
            itemCount: _userTransactions.length,
            // children: _userTransactions.map((tx) {
            //   return Card(
            //     child: Row(
            //       children: [
            //         Container(
            //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //           decoration: BoxDecoration(
            //               border: Border.all(
            //             color: Colors.purple,
            //             width: 2,
            //           )),
            //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //           child: Text('\$ ${tx.amount}',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 20,
            //                   color: Colors.purple)),
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               tx.title,
            //               style:
            //                   TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            //             ),
            //             Text(DateFormat.yMMMd().format(tx.date),
            //                 style: TextStyle(color: Colors.grey, fontSize: 11))
            //           ],
            //         )
            //       ],
            //     ),
            //   );
            // }).toList(),
          );
  }
}

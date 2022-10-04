import 'package:flutter/material.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final _userTransactions;
  final Function deleteTransaction;

  TransactionList(this._userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print('Re-Built the TransactionList widget');
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
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
              return TransactionItem(
                  userTransaction: _userTransactions[index],
                  deleteTransaction: deleteTransaction);
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

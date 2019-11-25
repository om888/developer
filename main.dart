import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Personal Expenses',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              accentColor: Colors.amber,
              fontFamily: 'Laser Rod',
            ),
            home: MyHomePage(),
        );
    }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(id: 't2',
      title: 'Weekly Groceries',
      amount: 16.54,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txctitle, double txcamount) {
    final newTxc = Transaction(
      title: txctitle,
      amount: txcamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTxc);
    });
  }

    void _startAddNewTransaction(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: (){} ,
            child: NewTransation(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
          );
        },
      );
    }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add),
                  onPressed: () => _startAddNewTransaction(context)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  //height: 120,
                  child: Card(
                    color: Colors.green,
                    child: Text('Chart!'),
                    elevation: 5,
                  ),
                ),
                TransactionList(_userTransaction),

              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerFloat,
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context)),
        );
      }
    }







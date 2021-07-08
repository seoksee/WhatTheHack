import 'package:budgetsavvy/data/data.dart';
import 'package:budgetsavvy/models/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetsavvy/models/BudgetModel.dart';
import 'package:select_form_field/select_form_field.dart';

class SetBudgetScreen extends StatefulWidget {
  final Function callback;
  final BuildContext context;
  final int index;
  SetBudgetScreen({Key key, this.callback, this.context, this.index = -999})
      : super(key: key);
  @override
  _SetBudgetScreenState createState() => _SetBudgetScreenState();
}

class _SetBudgetScreenState extends State<SetBudgetScreen> {
  double amount;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Map<String, String> aList;
    TextEditingController _amountEditor = TextEditingController();
    TextEditingController _categoryEditor = TextEditingController();
    // double amount;
    BudgetModel model;
    bool showError = false;

    bool editRecord;

    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Budget"),
        // backgroundColor: secondary,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (formKey.currentState.validate()) {
                Map<String, dynamic> data = {
                  "item": _amountEditor.text,
                  "shareBy": aList //.map((e) => e.toString()).join(',')
                };
                editRecord
                    ? model.editExpense(widget.index, data)
                    : model.addExpense(data);
                widget.callback(0); //move to log page
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.save),
            color: Colors.white,
            tooltip: "Save ",
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              if (editRecord) model.deleteExpense(widget.index);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
            tooltip: "Delete",
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        // key: ValueKey<int>(count1),
        child:
            // (model.getCategories.length == 0)
            //     ? Container(
            //         width: double.infinity,
            //         child: Column(
            //           children: [
            //             SizedBox(
            //               height: 30,
            //             ),
            //             Text(
            //               "No user and categories added",
            //               style: TextStyle(fontSize: 21),
            //               textAlign: TextAlign.center,
            //             ),
            //             TextButton(
            //                 onPressed: () {
            //                   widget.callback(2);
            //                   Navigator.pop(context);
            //                 },
            //                 child: Text("Go to settings"))
            //           ],
            //         ),
            //       )
            Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                // SelectFormField(
                //   icon: Icon(Icons.person_outline),
                // ),
                SizedBox(height: 15),
                Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                              child: Text("Bills",
                              style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 20,),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(initialValue: "RM 300.00",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Grocery",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                initialValue: "RM 500.00",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Gift",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                initialValue: "RM 100.00",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Household",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                initialValue: "RM 1,000.00",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Food",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                initialValue: "RM 1,000.00",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Transport",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                initialValue: "RM 500.00",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Others",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                initialValue: "RM 200.00",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 2,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Social",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                initialValue: "RM 200.00",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setAmount(String val) {
    amount = double.parse(val);
  }

  // getTheValue(Map<String, String> val) {
  //   setState(() {
  //     aList = val;
  //   });
  // }

  // sharedProperly() {
  //   double summed = 0;
  //   for (String v in aList.values) {
  //     summed += double.parse(v);
  //   }
  //   // aList.fold(0, (a, b) => a + b);
  //   var val = double.parse(_amountEditor.text);
  //   if (val == null) return false;
  //   if (summed == val) {
  //     showError = false;
  //     return true;
  //   } else {
  //     setState(() {
  //       showError = true;
  //     });
  //     return false;
  //   }
  // }
}

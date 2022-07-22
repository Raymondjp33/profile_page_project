import 'package:flutter/material.dart';

class EditName extends StatefulWidget {
  const EditName({Key? key}) : super(key: key);

  @override
  State<EditName> createState() => EditNameState();
}

class EditNameState extends State<EditName> {
  String firstname = "";
  String lastname = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.pop(context, null);
                })),
        body: Container(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                SizedBox(height: 70),
                Center(
                  child: Text(
                    'Edit your name!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      children: <Widget>[
                        TextField(
                            onChanged: (value) {
                              firstname = value;
                            },
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'New First Name',
                              contentPadding:
                                  EdgeInsets.only(bottom: 3, top: 50),
                            )),
                        TextField(
                            onChanged: (value) {
                              lastname = value;
                            },
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'New Last Name',
                              contentPadding:
                                  EdgeInsets.only(bottom: 3, top: 50),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                    child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent)),
                  onPressed: () {
                    Navigator.pop(context,
                        validCheck() ? (firstname + " " + lastname) : null);
                  },
                  child: Text('Submit'),
                ))
              ],
            ),
          ),
        ));
  }

  // This would be implemented to check if firstname is valid, and if not an
  // error message could show up somewhere as a widget, a similar method
  // could be used for the other edit pages as well
  bool validCheck() {
    // is firstname && lastname valid ? return true:false

    return true;
  }

  TextField buildTextField(String labelText) {
    return TextField(
        decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: labelText,
      contentPadding: EdgeInsets.only(bottom: 3, top: 50),
    ));
  }
}

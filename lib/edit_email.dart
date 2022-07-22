
import 'package:flutter/material.dart';
import 'profile_page.dart';

class EditEmail extends StatefulWidget {
  const EditEmail({Key? key}) : super(key: key);

  @override
  State<EditEmail> createState() => EditEmailState();
}

class EditEmailState extends State<EditEmail> {

  String retval = "";

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
                })
        ),

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
                    'Edit your email address!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                      onChanged: (value){
                        retval = value;
                      },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'New Email Address',
                          contentPadding: EdgeInsets.only(bottom: 3, top: 50),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                    child: TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent)
                      ),
                      onPressed: () {Navigator.pop(context, retval);},
                      child: Text('Submit'),

                    )
                )
              ],
            ),
          ),
        )

    );
  }
}
import 'package:flutter/material.dart';
import 'edit_name.dart';
import 'edit_phone.dart';
import 'edit_email.dart';
import 'edit_about.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String fullname = 'John Doe';
  String phonenumber = '123-456-7890';
  String emailaddress = 'example@gmail.com';
  String summary =
      'Summary portion of the profile page, this text is just to show that the text can extend the lines of the textfield up to five while allowing for the others to remain one';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            SizedBox(
              height: 55,
            ),
            Center(
              child: Text("Profile Page",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent)),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        border: Border.all(width: 6, color: Colors.blueAccent),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: AlignmentDirectional(0, -0.5),
                            image: NetworkImage(
                                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blueAccent,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.edit, color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: <Widget>[
                    buildTextField('Name', fullname, 1, context),
                    buildTextField('Phone Number', phonenumber, 2, context),
                    buildTextField('Email Address', emailaddress, 3, context),
                    buildTextField('About', summary, 4, context)
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  TextField buildTextField(String labelText, String hintText, int infoFlag, BuildContext context) {

    return TextField(
        minLines: 1,
        maxLines: 5,
        readOnly: true,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                handlePushedButton(context, infoFlag);
              },
              color: Colors.blueAccent,
            ),
            contentPadding: EdgeInsets.only(bottom: 5, top: 30),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)));
  }

  Future<void> handlePushedButton(BuildContext context, int infoFlag) async{
    switch(infoFlag)
    {
      case 1: final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditName()));
      if (!mounted) return;

      if (result != null)
        setState(() {
          fullname = result;
        });
      break;

      case 2: final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditPhone()));
      if (!mounted) return;

      if (result != null)
        setState(() {
          phonenumber = result;
        });
      break;

      case 3: final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditEmail()));
      if (!mounted) return;

      if (result != null)
        setState(() {
          emailaddress = result;
        });
      break;

      case 4: final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditAbout()));
      if (!mounted) return;

      if (result != null)
        setState(() {
          summary = result;
        });
      break;
    }


  }
}



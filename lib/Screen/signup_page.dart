import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screen/login_page.dart';
import 'package:news_app/utility/validator.dart';
import 'package:news_app/utility/widget.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _formKey = GlobalKey<FormState>();

  String firstname,lastname,email,password,password2;


  @override
  Widget build(BuildContext context) {

    var DoRegister = (){
      print(firstname);
      final form = _formKey.currentState;
      if(form.validate()){
        form.save();
        print("firstname");
        print(lastname);
      }else{
        Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 6),
        ).show(context);
      }
    };
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/registerpage.jpg'),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                      Text('Glad to see you joined!',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: validateEmail,
                        onSaved: (value) => firstname = value,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.lightBlue)),
                          hintText: 'First Name',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: validateEmail,
                        onSaved: (value) => lastname = value,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.lightBlue)),
                          hintText: 'Last Name',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: validateEmail,
                        onSaved: (value) => email = value,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.lightBlue)),
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value)=>value.isEmpty?'Please enter password':null,
                        onSaved: (value) => password = value,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.lightBlue)),
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value)=>value.isEmpty?'Please confirm your password':null,
                        onSaved: (value) => password2 = value,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.lightBlue)),
                          hintText: 'Confirm Password ',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "By clicking 'sign Up' I agree that I have read and accepted the terms of use",style: TextStyle(fontSize: 14),textAlign: TextAlign.center,maxLines: 2,),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 180,
                      child: longButtons('Sign up', DoRegister)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Have an account?",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      width: 180,
                      child: RaisedButton(
                        disabledColor: Colors.white,
                        disabledTextColor: Colors.black,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.indigoAccent )),
                        child: Text('Sign In',style: TextStyle(fontSize: 18),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

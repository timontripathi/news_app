import 'package:flutter/material.dart';
import 'package:news_app/Screen/signup_page.dart';
import 'package:news_app/Screen/trendPage.dart';
import 'package:news_app/utility/validator.dart';
import 'package:news_app/utility/widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey();


  String _userName, _password;

  @override
  Widget build(BuildContext context) {

    var doLogin = (){

    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView (
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/loginpage.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                        'Welcome to News',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                    Text('Find the latest news based on your preferences.',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
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
                      autofocus: false,
                      onSaved: (value)=> _userName = value,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.lightBlue)),
                          hintText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value)=> value.isEmpty?"Please enter password":null,
                      onSaved: (value)=> _password = value,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.lightBlue)),
                        hintText: 'Password',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 45,
                    width: 180,
                    child: RaisedButton(
                      disabledColor: Colors.indigoAccent,
                      disabledTextColor: Colors.white,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TrendPage()),
                        );
                      },
                      child: Text('Sign In',style: TextStyle(fontSize: 18),),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Don't have an account?",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 45,
                    width: 180,
                    child: RaisedButton(
                      disabledColor: Colors.indigoAccent,
                      disabledTextColor: Colors.white,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.indigoAccent )),
                      child: Text('Sign Up',style: TextStyle(fontSize: 18),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

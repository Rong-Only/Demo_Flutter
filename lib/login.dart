// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, body_might_complete_normally_nullable

import 'package:demo_interview/main.dart';
import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  String username = 'root';
  String password = '123546';
  bool _isOuscure = true;
  bool _isRememberme = true;
  final _formkey = GlobalKey<FormState>();
  final _usernameControler = TextEditingController();
  final _passwordControler = TextEditingController();
  var sneckBar = SnackBar(
    content: Text('Longin Success!'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "SHOPING",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 227, 207, 54),
        ),
        backgroundColor: const Color.fromARGB(255, 227, 207, 54),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME TO SHOPING',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextFormField(
                      controller: _usernameControler,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none, // Removes default border
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: Icon(Icons.check_circle)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Username ';
                        }
                        if (value != username) {
                          return 'Username is not correct';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: TextFormField(
                      controller: _passwordControler,
                      obscureText: _isOuscure,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none, // Removes default border
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isOuscure = !_isOuscure;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Passwprd ';
                        }
                        if (value != password) {
                          return 'Password is not correct';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Checkbox(
                          value: _isRememberme,
                          onChanged: (value) {
                            setState(() {
                              _isRememberme = value!;
                            });
                          })
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blue, // <-- set your background color here
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // optional: round corners
                        ),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          String username = _usernameControler.text;
                          String password = _passwordControler.text;
                          if (username == this.username &&
                              password == this.password) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(sneckBar);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ));
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text("Login with an account!"),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'icons/facebook.png',
                                height: 45,
                                width: 45,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'icons/communication.png',
                                height: 45,
                                width: 45,
                              ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

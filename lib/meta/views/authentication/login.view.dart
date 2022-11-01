import 'package:flutter/material.dart';
import 'package:practice_1/app/providers/routes/app.routes.dart';
import 'package:practice_1/meta/profile.view.dart';
import 'package:provider/provider.dart';

import '../../../core/notifier/authentication.notifier.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formvalue = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        child: Form(
          key: _formvalue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: 'Your Name : ',
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Your Email : ',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the email';
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Your Password : ',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the password';
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (!_formvalue.currentState!.validate()) {
                      return;
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => profileview()),
                    // );
                    String name = namecontroller.text;
                    String email = emailcontroller.text;
                    String password = passwordcontroller.text;

                    if (email.isNotEmpty &&
                        password.isNotEmpty &&
                        name.isNotEmpty) {
                      final response = await authenticationNotifier.LoginView(
                          Email: email, Password: password, Name: name);
                      if (response != "Login Successful") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profileview()),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Fill the credentials")));
                    }
                  },
                  child: Text('Submit'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Approutes.SignUpRoute);
                    },
                    child: Text("Don't have an account ? Signup "))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

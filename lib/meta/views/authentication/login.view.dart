import 'package:flutter/material.dart';
import 'package:practice_1/app/providers/routes/app.routes.dart';
import 'package:provider/provider.dart';

import '../../../core/notifier/authentication.notifier.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  void initState() {
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    phonecontroller = TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  hintText: 'Your Name : ',
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Your Email : ',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'Your Password : ',
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phonecontroller,
                decoration: InputDecoration(
                  hintText: 'Your Phone No. : ',
                  labelText: 'Phone No.',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  String name = namecontroller.text;
                  String email = emailcontroller.text;
                  String password = passwordcontroller.text;
                  String Phone = phonecontroller.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    await authenticationNotifier.signup(
                        Email: email, Password: password);
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
    );
  }
}

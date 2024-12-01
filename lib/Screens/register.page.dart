import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  //check les forme de validation
  final keyForm = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();

  //variable pour mdp
  bool _passVariable = false;

  // methode validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return "Please enter your email";
    final emailpattern = r'^[^@]+@[^@]+\.[^@]+';
    final regExp = RegExp(emailpattern);
    if (!regExp.hasMatch(value)) return "Email inavlide";
    return null;
  }

  String? passValidator(String? value) {
    if (value == null || value.isEmpty) return "Please enter your email";
    if (value.length < 6)
      return "Taille de mot de passe doit depasser 6 caracteres";
  }

  String? confirmpassValidator(String? value) {
    if (value == null || value.isEmpty) return "Please enter your email";
    if (value != passcontroller.text) return "Password does not match";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Register",
            style: TextStyle(color: Colors.blue, fontSize: 40),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("image/login.png", height: 100, width: 100),
                  SizedBox(height: 20),
                  Text("Hello Back to the home Page",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, color: Colors.blueAccent)),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        labelText: "email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.deepOrange,
                        )),
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passcontroller,
                    obscureText:
                        !_passVariable, //on veut que ca soit true par defaut
                    decoration: InputDecoration(
                        labelText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.deepOrange,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passVariable = !_passVariable;
                              });
                            },
                            icon: Icon(_passVariable
                                ? Icons.visibility
                                : Icons.visibility_off))),

                    keyboardType: TextInputType.emailAddress,
                    validator: passValidator,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: confirmpasscontroller,
                    obscureText:
                        !_passVariable, //on veut que ca soit true par defaut
                    decoration: InputDecoration(
                        labelText: "Confirm password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.deepOrange,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passVariable = !_passVariable;
                              });
                            },
                            icon: Icon(_passVariable
                                ? Icons.visibility
                                : Icons.visibility_off))),

                    keyboardType: TextInputType.emailAddress,
                    validator: passValidator,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (keyForm.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('processing login')),
                          );
                          Navigator.pushNamed(context, "/login");
                        }
                      },
                      child: Text(
                        "Login",
                        style:
                            TextStyle(fontSize: 30, color: Colors.deepPurple),
                      )),
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text("Already have an account ?",
                          style: TextStyle(
                              fontSize: 30, color: Colors.blueAccent)))
                ],
              ),
            )));
  }
}

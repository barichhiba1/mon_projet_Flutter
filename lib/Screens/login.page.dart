import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  bool _passVisible = false; // Gère la visibilité du mot de passe

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  String? _emailvalidator(String? value) {
    if (value == null || value.isEmpty) return "Please enter your email";
    final emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    final regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) return "Please enter a valid email address";
    return null;
  }

  String? _passvalidator(String? value) {
    if (value == null || value.isEmpty) return "Please enter your password";
    if (value.length < 6) return "Password must be at least 6 characters long";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("image/login.png", height: 120, width: 120),
              SizedBox(height: 20),
              Text(
                "Hello Back to the home page!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.blueAccent),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.blueAccent,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _emailvalidator,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passcontroller,
                obscureText: !_passVisible, // Contrôle de la visibilité
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blueAccent,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passVisible = !_passVisible;
                      });
                    },
                    icon: Icon(
                      _passVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: _passvalidator,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Login')),
                    );
                    Navigator.pushNamed(context, "/home");
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30, color: Colors.deepOrange),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text("Already have an account ?",
                      style: TextStyle(fontSize: 30, color: Colors.blueAccent)))
            ],
          ),
        ),
      ),
    );
  }
}

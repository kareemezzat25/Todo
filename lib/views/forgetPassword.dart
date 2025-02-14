import 'package:flutter/material.dart';
import 'package:todo_app/models/theme.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String routeName = "forgetPassword";
  var emailController = TextEditingController();
  ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Forget Password"),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/forgetPassword.png",
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).focusColor),
                    prefixIcon:
                        Icon(Icons.email, color: Theme.of(context).focusColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Theme.of(context).focusColor))),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Reset Password",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(362, 56),
                    backgroundColor: MyThemeData.primarycolorlight,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
              )
            ],
          ),
        ));
  }
}

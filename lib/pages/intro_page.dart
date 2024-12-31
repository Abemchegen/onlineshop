import "package:flutter/material.dart";
import "package:onlineshop/components/my_button.dart";
import 'package:onlineshop/components/custom_input_field.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              // space
              const SizedBox(height: 25),

              // title
              const Text("AASTU shop",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),

              const SizedBox(height: 10),

              //subtitle
              Text(
                "Premium Quality Products",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

              // Email input field
              CustomInputField(
                hintText: "Enter your email",
                isPasswordField: false,
                controller: emailController,
              ),

              const SizedBox(height: 15),

              // Password input field
              CustomInputField(
                hintText: "Enter your password",
                isPasswordField: true,
                controller: passwordController,
              ),

              const SizedBox(height: 15),

              const SizedBox(height: 15),

              // Sign-in button
              MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Text("Sign In"),
              ),

              const SizedBox(height: 25),

              // sign up prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/signup_page'),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

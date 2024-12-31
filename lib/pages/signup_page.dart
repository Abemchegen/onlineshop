import 'package:flutter/material.dart';
import 'package:onlineshop/components/my_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            // Space
            const SizedBox(height: 25),

            // Title
            const Text(
              "Create an Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Join AASTU Shop Today",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // Name input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Sign-up input field (email)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Sign-up input field (password)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Confirm Password input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Sign-up button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: const Text("Sign Up"),
            ),

            const SizedBox(height: 20),

            // Back to sign-in prompt
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

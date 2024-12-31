import 'package:flutter/material.dart';
import 'package:onlineshop/models/profile.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Name
            Row(
              children: [
                const Icon(Icons.person, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  profile.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Email
            Row(
              children: [
                const Icon(Icons.email, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  profile.email,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Edit profile button
            ElevatedButton.icon(
              onPressed: () => _editProfile(context),
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }

  // Function to edit profile
  void _editProfile(BuildContext context) {
    final profile = Provider.of<Profile>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        String updatedName = profile.name;
        String updatedEmail = profile.email;

        return AlertDialog(
          title: const Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Name field
              TextField(
                decoration: const InputDecoration(labelText: "Name"),
                controller: TextEditingController(text: profile.name),
                onChanged: (value) => updatedName = value,
              ),

              // Email field
              TextField(
                decoration: const InputDecoration(labelText: "Email"),
                controller: TextEditingController(text: profile.email),
                onChanged: (value) => updatedEmail = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                profile.updateName(updatedName);
                profile.updateEmail(updatedEmail);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}

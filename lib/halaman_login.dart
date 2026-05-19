import 'package:flutter/material.dart';

class LinkedInLoginPage extends StatefulWidget {
  const LinkedInLoginPage({super.key});

  @override
  State<LinkedInLoginPage> createState() => _LinkedInLoginPageState();
}

class _LinkedInLoginPageState extends State<LinkedInLoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo LinkedIn
              Row(
                children: [
                  const Text(
                    'Linked',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(color: const Color(0xFF0A66C2)),
                    child: const Text(
                      'in',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Judul
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Stay updated on your professional world',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              // Input Email / Phone
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email or Phone',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Input Password
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Text(
                      _obscureText ? 'show' : 'hide',
                      style: const TextStyle(
                        color: Color(0xFF0A66C2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Forgot Password
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF0A66C2),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Sign In
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B76FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Divider "or"
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('or', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 24),

              // Tombol Google
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.g_mobiledata, color: Colors.red, size: 30),
                      SizedBox(width: 8),
                      Text(
                        'Continue with Google',
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Apple
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.apple, color: Colors.black, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Sign in with Apple',
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Bagian Join Now
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'New to LinkedIn? ',
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Join now',
                        style: const TextStyle(
                          color: Color(0xFF0A66C2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

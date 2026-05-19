import 'package:flutter/material.dart';

void main() {
  runApp(const KaeriApp());
}

class KaeriApp extends StatelessWidget {
  const KaeriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaeri Workspace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF2A294),
          primary: const Color(0xFFD68A7C),
          surface: const Color(0xFFF9F9F9),
          onPrimary: Colors.white,
        ),
        // FontFamily Playfair Display dihapus agar langsung bisa di-run tanpa error font
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFFF2A294),
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
          ),
          headlineMedium: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(color: Color(0xFF666666)),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFDF4F2),
                  Color(0xFFF9F9F9),
                  Color(0xFFF2F2F2),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 3),
                  //Logo
                  Image.asset('assets/images/kaeri.png', height: 150),
                  const SizedBox(height: 5),

                  const SizedBox(height: 8),
                  Text(
                    'WORKSPACE',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8C4D42),
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Welcome Text
                  Text(
                    'Welcome back, Artist.',
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(fontSize: 28),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Please sign in to your studio dashboard.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  // Input Fields
                  const CustomTextField(
                    label: 'Email Address',
                    hintText: 'name@artistry.com',
                  ),
                  const SizedBox(height: 24),
                  const CustomTextField(
                    label: 'Password',
                    hintText: '••••••••',
                    isPassword: true,
                    suffixIcon: Icons.visibility_off_outlined,
                  ),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Color(0xFF666666)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Login Button
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD68A7C), Color(0xFFE5A195)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFD68A7C).withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Social Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SocialButton(
                        icon: Icons.g_mobiledata,
                        label: 'Google',
                      ),
                      const SizedBox(width: 16),
                      const SocialButton(
                        icon: Icons.face_retouching_natural,
                        label: '',
                        isCircle: true,
                      ),
                    ],
                  ),

                  const SizedBox(height: 48),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Color(0xFF666666)),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF8C4D42),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final IconData? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.grey)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFF2A294),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isCircle;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isCircle ? 12 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: isCircle
          ? Icon(icon, size: 28, color: const Color(0xFF333333))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Icon(icon, size: 24, color: const Color(0xFF333333)),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

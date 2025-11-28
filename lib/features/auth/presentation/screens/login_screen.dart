// import 'package:flutter/material.dart';
// import 'package:flutter_carlos112mo/features/Owner/presentation/screens/owner_home_screen.dart';
// import 'package:flutter_carlos112mo/features/auth/presentation/controller/auth_controller.dart';
// import 'package:flutter_carlos112mo/features/auth/presentation/screens/signup_screen.dart';
// import 'package:flutter_carlos112mo/features/others/presentation/screens/dashboard_screen.dart';
// import 'package:flutter_carlos112mo/features/player/presentation/screens/player_home_screen.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     final _authController = Get.find<AuthController>();

//     final TextEditingController _emailController = TextEditingController();
//     final TextEditingController _passwordController = TextEditingController();
//     final FocusNode _emailFocus = FocusNode();
//     final FocusNode _passwordFocus = FocusNode();

//     void _submit() {
//       // if (!_formKey.currentState!.validate()) return;
//       _authController.login(_emailController.text, _passwordController.text);
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),

//               // App Logo
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/sample_logo.png', height: 80),
//                     const SizedBox(height: 8),
//                     Text(
//                       'App Name',
//                       style: theme.textTheme.bodyMedium?.copyWith(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 36),

//               // Sign In Title
//               Text(
//                 'Sign in to your account',
//                 style: theme.textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),

//               const SizedBox(height: 4),

//               // Create account link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Or ', style: theme.textTheme.bodySmall),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(SignupScreen());
//                     },
//                     child: Text(
//                       'create a new account',
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color: theme.colorScheme.primary,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 28),

//               // Email Field
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email address',
//                   hintText: 'Your email address',

//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 14,
//                   ),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),

//               const SizedBox(height: 16),

//               // Password Field
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 14,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Sign in Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton.icon(
//                   onPressed: _submit,
//                   // onPressed: () {
//                   //   Get.offAll(() => DashboardScreen());
//                   // },
//                   icon: const Icon(Icons.login, size: 18),
//                   label: const Text('Sign in'),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // Remember me and Forgot password
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(value: false, onChanged: (v) {}),
//                       const Text('Remember me'),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Forgot your password?',
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color: theme.colorScheme.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 24),

//               // Divider with "Or continue with"
//               // Row(
//               //   children: [
//               //     const Expanded(child: Divider(thickness: 1)),
//               //     Padding(
//               //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               //       child: Text(
//               //         'Or continue with',
//               //         style: theme.textTheme.bodySmall,
//               //       ),
//               //     ),
//               //     const Expanded(child: Divider(thickness: 1)),
//               //   ],
//               // ),

//               // const SizedBox(height: 20),

//               // Google Button
//               // SizedBox(
//               //   width: double.infinity,
//               //   height: 48,
//               //   child: OutlinedButton.icon(
//               //     onPressed: () {},
//               //     icon: Image.asset('assets/images/google.png', height: 22),
//               //     label: const Text('Google'),
//               //     style: OutlinedButton.styleFrom(
//               //       shape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(8),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter_carlos112mo/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:flutter_carlos112mo/features/auth/presentation/screens/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = Get.find<AuthController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      _authController.login(email, password);
    } else {
      Get.snackbar('Error', 'Please enter email and password');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // App Logo
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/sample_logo.png', height: 80),
                    const SizedBox(height: 8),
                    Text(
                      'App Name',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              // Sign In Title
              Text(
                'Sign in to your account',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 4),

              // Create account link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Or ', style: theme.textTheme.bodySmall),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: Text(
                      'create a new account',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Email Field
              TextField(
                controller: _emailController,
                focusNode: _emailFocus,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Your email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              // Password Field
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Sign in Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.login, size: 18),
                  label: const Text('Sign in'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Remember me and Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (v) {}),
                      const Text('Remember me'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() =>  EmailVerifyScreen());
                    },
                    child: Text(
                      'Forgot your password?',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

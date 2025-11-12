import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _selectedRole = '';
  bool _acceptTerms = false;

  final _authController = Get.find<AuthController>();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  void _submit() {
    _authController.register(
      _nameController.text.toString(),
      _emailController.text,
      _passwordController.text,
      _selectedRole,
    );
  }

  void _selectRole(String role) {
    setState(() => _selectedRole = role);
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
              const SizedBox(height: 24),

              // App Logo
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/sample_logo.png', height: 96),
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

              const SizedBox(height: 28),

              // Create account Title
              Text(
                'Create a new account',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // Sign in link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Or ', style: theme.textTheme.bodySmall),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> LoginScreen());
                    },
                    child: Text(
                      'sign in to your existing account',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Full name
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Full name', style: theme.textTheme.bodyMedium),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'John Doe',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Email address
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Email address', style: theme.textTheme.bodyMedium),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'you@gmail.com',
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

              // Password
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Password', style: theme.textTheme.bodyMedium),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '••••••••',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Registering as
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'I am registering as a',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _selectRole('user'),
                      icon: Icon(
                        Icons.person,
                        color: _selectedRole == 'user'
                            ? AppColors.primaryGreen
                            : AppColors.textGrey,
                      ),
                      label: Text(
                        'Player',
                        style: TextStyle(
                          color: _selectedRole == 'user'
                              ? AppColors.primaryGreen
                              : AppColors.textBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: _selectedRole == 'user'
                              ? AppColors.primaryGreen
                              : AppColors.containerGrey,
                        ),
                        backgroundColor: _selectedRole == 'user'
                            ? AppColors.primaryLightGreen
                            : Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _selectRole('owner'),
                      icon: Icon(
                        Icons.sports_tennis,
                        color: _selectedRole == 'owner'
                            ? AppColors.primaryGreen
                            : AppColors.textGrey,
                      ),
                      label: Text(
                        'Field Owner',
                        style: TextStyle(
                          color: _selectedRole == 'owner'
                              ? AppColors.primaryGreen
                              : AppColors.textBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: _selectedRole == 'owner'
                              ? AppColors.primaryGreen
                              : AppColors.containerGrey,
                        ),
                        backgroundColor: _selectedRole == 'owner'
                            ? AppColors.primaryLightGreen
                            : Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Create account button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _submit();
                  },
                  icon: const Icon(Icons.person_add, size: 20),
                  label: const Text(
                    'Create account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Divider with "Or continue with"
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or continue with',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textGrey,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 18),

              // Google Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/images/google.png', height: 22),
                  label: const Text('Google'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Small bottom padding to make scroll comfortable
            ],
          ),
        ),
      ),
    );
  }
}

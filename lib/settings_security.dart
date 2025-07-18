import 'dart:ui';
import 'package:flutter/material.dart';
import 'animated_backgroundpage.dart'; // Import your animated background page

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final _formKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isButtonEnabled = false;

  void _checkFormValid() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _isButtonEnabled = isValid;
    });
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildPasswordField(String label, TextEditingController controller, {bool isConfirm = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        onChanged: (_) => _checkFormValid(),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Please enter $label';
          if (value.length < 6) return 'Password must be at least 6 characters';
          if (isConfirm && value != newPasswordController.text) return 'Passwords do not match';
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Security',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🌄 Animated Background
          AnimatedBackgroundpage(showPropertyCards: false), // Use the animated background

          // Glass effect container
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Form(
                    key: _formKey,
                    onChanged: _checkFormValid,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Change password',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(height: 30),
                        _buildPasswordField('Current password', currentPasswordController),
                        _buildPasswordField('New password', newPasswordController),
                        _buildPasswordField('Re-enter new password', confirmPasswordController, isConfirm: true),
                        const Padding(
                          padding: EdgeInsets.only(top: 4, bottom: 16),
                          child: Text(
                            'Your password must be at least 6 characters long.',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isButtonEnabled
                                ? () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Password changed successfully')),
                                );
                              }
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Change password', style: TextStyle(fontSize: 18)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
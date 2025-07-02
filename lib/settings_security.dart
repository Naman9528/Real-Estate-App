import 'package:flutter/material.dart';

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
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security',style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: _checkFormValid,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Change password',
                  style: TextStyle(fontSize: 20,),
                ),
              ),
              const SizedBox(height: 40),
              _buildPasswordField('Current password', currentPasswordController),
              _buildPasswordField('New password', newPasswordController),
              _buildPasswordField('Re-enter new password', confirmPasswordController, isConfirm: true),
              const Padding(
                padding: EdgeInsets.only(top: 4, bottom: 16),
                child: Text(
                  'Your password must be at least 6 characters long.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                    if (_formKey.currentState!.validate()) {
                      // Perform password update logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password changed successfully')),
                      );
                    }
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled ? Colors.blue : Colors.blue,
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text('Change password',style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

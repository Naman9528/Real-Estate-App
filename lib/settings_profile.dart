import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: 'Aman Gupta');
  final nicknameController = TextEditingController(text: 'aman');
  final emailController = TextEditingController(text: 'youremail@domain.com');
  final phoneController = TextEditingController(text: '+919006578127');
  final addressController = TextEditingController(text: 'Sector 45, Greater Noida');

  String selectedCountry = 'India';
  String selectedGender = 'Male';

  final List<String> countries = ['India', 'USA', 'UK', 'Canada'];
  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Full Name', nameController),
              _buildTextField('Nick Name', nicknameController),
              _buildTextField('Email', emailController, keyboardType: TextInputType.emailAddress),
              _buildTextField('Phone Number', phoneController, keyboardType: TextInputType.phone),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown('Country', countries, selectedCountry, (value) {
                      setState(() => selectedCountry = value!);
                    }),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: _buildDropdown('Gender', genders, selectedGender, (value) {
                      setState(() => selectedGender = value!);
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              _buildTextField('Address', addressController),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated successfully')),
                      );
                    }
                  },
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 1),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String currentValue, void Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentValue,
              isExpanded: true,
              items: items.map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

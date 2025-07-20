import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import this to use File

class PropertyListingForm extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;

  const PropertyListingForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _PropertyListingFormState createState() => _PropertyListingFormState();
}

class _PropertyListingFormState extends State<PropertyListingForm> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = pickedFile;
    });
  }

  void _submit() {
    if (_image != null && _priceController.text.isNotEmpty && _typeController.text.isNotEmpty) {
      widget.onSubmit({
        'image': _image!.path,
        'price': _priceController.text,
        'type': _typeController.text,
        'description': _descriptionController.text,
      });
      Navigator.pop(context); // Close the form
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and take a photo.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Your Property')),
      body: SingleChildScrollView( // Wrap the body in a SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Take Photo'),
            ),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.file(File(_image!.path)), // Display the image
              ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: 'Type (e.g., Apartment, Villa)'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
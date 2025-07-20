import 'package:flutter/material.dart';
import '../models/property_model.dart'; // Import the model

class BookingProvider with ChangeNotifier {
  final List<Property> _bookedProperties = [];

  List<Property> get bookedProperties => _bookedProperties;

  void addBooking(Property property) {
    _bookedProperties.add(property);
    notifyListeners();
  }
}
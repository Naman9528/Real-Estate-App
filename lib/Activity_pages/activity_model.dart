class Activity {
  final String description;
  final String imagePath; // New field for the image path
  final DateTime timestamp;

  Activity({required this.description, required this.imagePath}) : timestamp = DateTime.now();
}
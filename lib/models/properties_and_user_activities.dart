class Property {
  final String id;
  final String name;
  final String imageUrl;

  Property({required this.id, required this.name, required this.imageUrl});
}

class UserActivity {
  final String userId;
  final List<String> shortlistedProperties;
  final List<String> bookedProperties;

  UserActivity({required this.userId, required this.shortlistedProperties, required this.bookedProperties});
}
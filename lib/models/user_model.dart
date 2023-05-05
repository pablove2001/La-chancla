class UserModel {
  // Required
  final String full_name;
  final String email;
  final List<String> events_created;
  final List<String> favorite_events;
  final String password;
  final String state_name;

  // Default
  final String photoURL;

  UserModel({
    // Required
    required this.full_name,
    required this.email,
    required this.events_created,
    required this.favorite_events,
    required this.password,
    required this.state_name,

    // Default
    this.photoURL =
        'https://user-images.githubusercontent.com/52970365/235539406-0581dcb1-7276-42df-b8f9-6d58b619d6be.png',
  });
}

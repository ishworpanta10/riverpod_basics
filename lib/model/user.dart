class User {
  final String username;
  final int age;
  final String address;

  const User({
    required this.username,
    required this.age,
    required this.address,
  });
}

const List<User> userList = [
  User(username: 'Ishwor', age: 25, address: 'dhading'),
  User(username: 'Shyam', age: 25, address: 'dhading'),
  User(username: 'Sita', age: 25, address: 'pokhara'),
  User(username: 'Kabita', age: 25, address: 'kathmandu'),
];

const List<String> userDropDownList = ['ishwor', 'shyam', 'hari', 'gita'];

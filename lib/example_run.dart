import 'package:hive_flutter/hive_flutter.dart';

class ExampleRun {
  ExampleRun() {
    Hive.initFlutter();
  }
  void doSome() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    var box = await Hive.openBox<User>('test');
    final user = User('Ivan', 24);
    await box.add(user);
    print(box.values);
  }
}

class User {
  String name;
  int age;

  User(this.name, this.age);

  @override
  String toString() => 'Name: $name, age: $age';
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    final name = reader.readString();
    final age = reader.readInt();
    return User(name, age);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.age);
  }
}

    /// Example put, get, defaultValue
    // await box.put('name', 'Ivan');
    // await box.put('age', 27);
    // final name = box.get('name') as String?;
    // print(name);
    // final age = box.get('age') as int?;
    // print(age);
    // final surname = box.get('surname', defaultValue: 'Ivanov') as String;
    // print(surname);


    // Add list
    // await box.put('friends', ['Dave', 'Simon', 'Lisa']);
    // final friends = box.get('friends');
    // print(friends);

    // Delete keys value and disk
    // await box.delete('age');
    // await box.deleteFromDisk();
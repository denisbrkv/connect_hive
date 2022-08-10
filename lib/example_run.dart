import 'package:hive_flutter/hive_flutter.dart';

class ExampleRun {
  ExampleRun() {
    Hive.initFlutter();
  }
  void doSome() async {
    var box = await Hive.openBox<dynamic>('testBox');
    await box.put('name', 'Ivan');
    await box.put('age', 27);
    final name = box.get('name') as String?;
    print(name);
    final age = box.get('age') as int?;
    print(age);
    final surname = box.get('surname', defaultValue: 'Ivanov') as String;
    print(surname);
    box.close();
  }
}

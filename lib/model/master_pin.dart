import 'package:hive/hive.dart';

part 'master_pin.g.dart';

@HiveType(typeId: 0)
class MasterPin extends HiveObject {
  @HiveField(0)
  late String pin;
}

import 'package:hive/hive.dart';
import 'package:pass_keep/model/master_pin.dart';

class Boxes {
  static Box<MasterPin> getMasterPin() => Hive.box<MasterPin>('MasterPin');
}

import 'package:demo_bloc/provider/databaseProvider.dart';
import 'package:demo_bloc/test3/model/staff.dart';

class StaffDao {

  final databasee = DatabaseProvider.dbProvider;

  Future<int> createStaff(Staff staff) async {
    final db = await databasee.database;
    var result = await db.insert('staff', staff.toJson());
    print(result.toString());
     return result;
  }
  Future<List<Staff>>getAllStaff() async {
    final db = await databasee.database;
    var result = await db.rawQuery('SELECT * FROM staff');
    List<Staff> listStaff = result.map((e) => Staff.fromJson(e)).toList();
    return listStaff;
  }
}
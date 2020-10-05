import 'package:demo_bloc/dao/staffDao.dart';
import 'package:demo_bloc/test3/model/staff.dart';

class StaffRepository{
  final staffDao = StaffDao();

  Future insertStaff(Staff staff) => staffDao.createStaff(staff);

  Future getAllStaff() => staffDao.getAllStaff();

}
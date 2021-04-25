part of 'staff_bloc.dart';

@immutable
abstract class StaffState {
  final List<Staff> listStaff;

  StaffState({this.listStaff});
}

class InitialStaffState extends StaffState {

}

class StaffStateAddSuccess extends StaffState{

}
class StaffStateGetStaff extends StaffState {
  StaffStateGetStaff(List<Staff> listStaff) : super(listStaff: listStaff);
}
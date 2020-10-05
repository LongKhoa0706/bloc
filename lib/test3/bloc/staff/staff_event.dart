part of 'staff_bloc.dart';

@immutable
abstract class StaffEvent {


  @override
  String toString() => runtimeType.toString();
}

class StaffEventAddStaff extends StaffEvent {
  final Staff staff;

  StaffEventAddStaff(this.staff);

}

class StaffEventGetStaff extends StaffEvent {

}
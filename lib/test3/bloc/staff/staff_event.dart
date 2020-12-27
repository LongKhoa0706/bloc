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
class StaffEvenDeleteStaff extends StaffEvent {
  final int id;

  StaffEvenDeleteStaff(this.id);

}
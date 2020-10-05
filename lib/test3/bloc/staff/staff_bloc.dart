import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo_bloc/repositories/repository.dart';
import 'package:demo_bloc/repositories/staffRepository.dart';
import 'package:demo_bloc/test3/model/staff.dart';
import 'package:meta/meta.dart';

part 'staff_event.dart';

part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  final Repository repository = Repository();

  StaffBloc() : super(InitialStaffState());

  @override
  Stream<StaffState> mapEventToState(StaffEvent event) async* {
    if (event is StaffEventAddStaff) {
        try{
          await repository.staffRepository.insertStaff(event.staff);
          print(event.staff.email);
        }catch(e){
            print(e);
        }
    }
    if (event is StaffEventGetStaff) {
      try{
        List<Staff> listStaff =   await repository.staffRepository.getAllStaff();
          yield StaffStateGetStaff(listStaff);
      }catch(e){
        print(e);
      }
    }
  }
}

import 'package:demo_bloc/provider/databaseProvider.dart';
import 'package:demo_bloc/test3/bloc/staff/staff_bloc.dart';
import 'package:demo_bloc/test3/model/staff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
 StaffBloc staffBloc = StaffBloc();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

 @override
 void dispose() {
   staffBloc.close();
   // TODO: implement dispose
   super.dispose();
 }



 void createStaff() {
    staffBloc.add(StaffEventAddStaff(Staff(email: nameController.text,phone: phoneController.text)));
 }
  @override
  Widget build(BuildContext context) {

    staffBloc.add(StaffEventGetStaff());
    return Scaffold(
      appBar: AppBar(
        title: Text("Manager Staff"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: BlocListener<StaffBloc,StaffState>(
          cubit: staffBloc,
          listenWhen: (previousState, state) {
            return null;
          },
          listener: (context,state){
            staffBloc.add(StaffEventGetStaff());
          },
          child: BlocBuilder<StaffBloc,StaffState>(
            cubit: staffBloc,
            builder: (BuildContext context,state){
              if ( state is InitialStaffState || state is StaffStateGetStaff) {

                return Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.person),
                        ),
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: Icon(Icons.phone),
                        ),
                        controller: phoneController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: createStaff,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Add")
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.listStaff.length,
                          shrinkWrap: true,
                          itemBuilder: (_,index){
                            Staff staff = state.listStaff[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(index.toString(),style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                                title: Text(staff.email),
                                subtitle: Text(staff.phone),
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        )
      ),
    );
  }
}



class Staff {
    int id;
    String email;
    String phone;

    Staff({this.id, this.email, this.phone});

    factory Staff.fromJson(Map<String, dynamic> json) {
        return Staff(
            id: json['id'], 
            email: json['email'], 
            phone: json['phone'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['email'] = this.email;
        data['phone'] = this.phone;
        return data;
    }
}
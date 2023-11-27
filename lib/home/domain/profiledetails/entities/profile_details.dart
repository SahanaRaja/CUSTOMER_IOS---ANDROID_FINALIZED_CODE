import 'package:equatable/equatable.dart';

class ProfileDetails extends Equatable {
  final String? salutations;
  final String? country;
  final String? city;
  final String? message;
  final String? dob;
  final String? state;
  final String? profilePicture;
  final String? lastName;
  final String? email;
  final String? firstName;
  final String? zipCode;
  final String? addr1;
  final String? addr2;
  final String? mob1;
  final String? mob2;
  final String? mob3;
  final int? result;
  final String? mobile;
  

  const ProfileDetails(
      {this.salutations,
      this.country,
      this.city,
      this.message,
      this.dob,
      this.state,
      this.profilePicture,
      this.lastName,
      this.email,
      this.firstName,
      this.zipCode,
      this.addr1,
      this.addr2,
      this.mob1,
      this.mob2,
      this.mob3,
      this.result,
      this.mobile});

  @override
  List<Object?> get props => [
        salutations,
        country,
        city,
        message,
        dob,
        state,
        profilePicture,
        lastName,
        email,
        firstName,
        zipCode,
        addr1,
        addr2,
        mob1,
        mob2,
        mob3,
        result,
        mobile
      ];
}

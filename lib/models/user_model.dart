class UserModel {
  final int? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final String? username;
  final String? email;
  final dynamic parentPhone;
  final dynamic phone;
  final String? photo;
  final DateTime? dateOfBirth;
  final dynamic emailVerifiedAt;
  final dynamic providerId;
  final String? providerName;
  final dynamic bio;
  final int? status;
  final int? isPrivate;
  final int? onlineStatus;
  final dynamic countryId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.parentPhone,
    this.phone,
    this.photo,
    this.dateOfBirth,
    this.emailVerifiedAt,
    this.providerId,
    this.providerName,
    this.bio,
    this.status,
    this.onlineStatus,
    this.countryId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.isPrivate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"] ?? '',
        lastname: json["lastname"] ?? '',
        username: json["username"],
        email: json["email"],
        parentPhone: json["parent_phone"],
        phone: json["phone"],
        photo: json["photo"] ?? '',
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        emailVerifiedAt: json["email_verified_at"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        bio: json["bio"],
        isPrivate: json["is_private"] ?? 0,
        status: json["status"],
        onlineStatus: json["online_status"],
        countryId: json["country_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "parent_phone": parentPhone,
        "phone": phone,
        "photo": photo,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "email_verified_at": emailVerifiedAt,
        "provider_id": providerId,
        "provider_name": providerName,
        "bio": bio,
        "status": status,
        "online_status": onlineStatus,
        "country_id": countryId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

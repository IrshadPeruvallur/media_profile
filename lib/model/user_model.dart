class MediaModel {
  final String? id;
  final String? userId;
  final String? fileType;
  final String? filePath;
  final String? description;
  final int? likeCount;
  final int? commentCount;
  final String? firstName;
  final String? lastName;
  final String? profilePic;

  MediaModel({
    this.id,
    this.userId,
    this.fileType,
    this.filePath,
    this.description,
    this.likeCount,
    this.commentCount,
    this.firstName,
    this.lastName,
    this.profilePic,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['_id'],
      userId: json['userId'],
      fileType: json['fileType'],
      filePath: json['filePath'],
      description: json['description'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePic: json['profilePic'],
    );
  }
  Map<String, dynamic> toJson(String token) {
    return {'Authorization': 'Bearer $token'};
  }
}

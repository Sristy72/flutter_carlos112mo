class ChangePasswordRequest {
  final String oldPassword;
  final String newPassword;

  ChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      // must match your API body exactly
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
}

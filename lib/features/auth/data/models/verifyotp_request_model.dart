class VerifyOtpMOdel{
  final String email;
  final String otp;
  VerifyOtpMOdel({
  required this.email,required this.otp,
  });
  Map<String,dynamic> toJson(){
    return{
      "email":email,
      "otp":otp
    };
  }
}
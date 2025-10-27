
class Urls{
  static const String _baseUrl="https://ecom-rs8e.onrender.com/api";
  static const String signUPUrl="$_baseUrl/auth/signup";
  static const String verifyOTP="$_baseUrl/auth/verify-otp";
  static const String loginUrl="$_baseUrl/auth/login";
  static const String sliderUrl="$_baseUrl/slides";
  static  String categorylistUrl(int pageNum, int pageSize)=>"$_baseUrl/categories?count=$pageSize&page=$pageNum";
}
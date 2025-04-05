/// message : "reset code not verified"
/// code : 400
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjI0Y2Q1ODZhMDI0ZjA2ZWEyNzc3YyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5ODU2NDIyfQ.xXnCxBWkjHgYf1dPEuX6MfqIF7aBg8Vg2GGBG_W_DEM"

class ResetPasswordResponseEntity {
  ResetPasswordResponseEntity({
    this.message,
    this.code,
    this.token,});

   String? message;
  int? code;
  String? token;


}
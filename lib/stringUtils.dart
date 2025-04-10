//"Ehab Salah"
//"ehab"
//"Salah"
//""
//null
String extractFirstName(String? fullName){
  if(fullName==null)return"";
  return fullName.split(" ")[0];
}

//"Ehab Salah"
//"ehab"
//"Salah"
//""
//null
String extractSecondName(String? fullName){
  if(fullName==null)return"";

  var parts= fullName.split(" ");
  if(parts.length<2)return"";//de m3naaha fe klma wahda bs
  return parts[1];

}
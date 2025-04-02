 import 'package:flora_mart/stringUtils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //description -> test scenario al body call back func
  //happy scenaroi
  //group 3SHAN law 3ndk kza func lnfs al feature--- al 7l al tany t3ml new file w thot feha al testcase bs de ahla
  group("extractFirstName",() {
    test("when call extractFirstName with correct Full Name it should return first part", (){
      //arrange   brtb al parameter
      String fullName="Ehab Salah";
      //act     //bcall al func w ashof al return bta3ha
      String result=extractFirstName(fullName);
      //assert
      expect(result, equals("Ehab"));
    });
    test("when call extractFirstName with correct Full Name it should return first part", (){
      //arrange   brtb al parameter
      String fullName="Ehab Salah";
      //act     //bcall al func w ashof al return bta3ha
      String result=extractFirstName(fullName);
      //assert
      expect(result, equals("Ehab"));
    });
    test("when we call extractFirstName with empty fullName then it returns empty String",
            (){
          //arrange
          String fullName="";
          //act
          String result=extractFirstName(fullName);
          //assert
          expect(result, (equals("")));
        });
  });
group("extractLastName test", (){
  test("when call extractLastName with two parts fullName"
      " then it return last part", (){
    String fullName="ehab salah";
    String result=extractSecondName(fullName);
    expect(result, (equals("salah")));
  });
  test("when call extractLastName with null full it shiuld return empty string", (){
    String fullName="";
    String result=extractSecondName(fullName);
    expect(result, (equals("")));
  });

});

}
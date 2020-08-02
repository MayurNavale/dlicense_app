import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';
import 'medicalpage.dart';


Medical welcomeFromJson(String str) => Medical.fromJson(json.decode(str));

String welcomeToJson(Medical data) => json.encode(data.toJson());

class Medical {
    Medical({
        this.comments,
        this.dtAudiogram,
        this.dtEcg,
        this.dtExam,
        this.dtExpPrevcert,
        this.dtExpiryC1,
        this.dtExpiryC1Sp,
        this.dtExpiryC2,
        this.dtExpiryC3,
        this.dtExpiryClapl,
        this.dtIssue,
        this.id,
        this.licenseId=0,
        this.licenseNumber,
        this.limitationId=0,
        this.stateId=0,
    });

    String comments;
    String dtAudiogram;
    String dtEcg;
    String dtExam;
    String dtExpPrevcert;
    String dtExpiryC1;
    String dtExpiryC1Sp;
    String dtExpiryC2;
    String dtExpiryC3;
    String dtExpiryClapl;
    String dtIssue;
    int id;
    int licenseId;
    int licenseNumber;
    int limitationId;
    int stateId;

    factory Medical.fromJson(Map<String, dynamic> json) => Medical(
        comments: json["comments"],
        dtAudiogram: json["dtAudiogram"],
        dtEcg: json["dtEcg"],
        dtExam: json["dtExam"],
        dtExpPrevcert: json["dtExpPrevcert"],
        dtExpiryC1: json["dtExpiryC1"],
        dtExpiryC1Sp: json["dtExpiryC1sp"],
        dtExpiryC2: json["dtExpiryC2"],
        dtExpiryC3: json["dtExpiryC3"],
        dtExpiryClapl: json["dtExpiryClapl"],
        dtIssue: json["dtIssue"],
        id: json["id"],
        licenseId: json["licenseId"],
        licenseNumber: json["licenseNumber"],
        limitationId: json["limitationId"],
        stateId: json["stateId"],
    );

    Map<String, dynamic> toJson() => {
        "comments": comments,
        "dtAudiogram": dtAudiogram,
        "dtEcg": dtEcg,
        "dtExam": dtExam,
        "dtExpPrevcert": dtExpPrevcert,
        "dtExpiryC1": dtExpiryC1,
        "dtExpiryC1sp": dtExpiryC1Sp,
        "dtExpiryC2": dtExpiryC2,
        "dtExpiryC3": dtExpiryC3,
        "dtExpiryClapl": dtExpiryClapl,
        "dtIssue": dtIssue,
        "id": id,
        "licenseId": licenseId,
        "licenseNumber": licenseNumber,
        "limitationId": limitationId,
        "stateId": stateId,
    };
}

  


List<Map<String, dynamic>> medicaltpedatalist=[
  {
    "id": 1,
    "type": " CLASS 1/2/LAPL"
  },
  {
    "id": 2,
    "type": " CLASS 3"
  },
  
];
var medic;

  String findval(int a, int casevalue) {
    switch (casevalue) {
      case 1:
        {
      
          int val = a;
          val--;
          if(a==0){return medic;}else{
          for (int dat = 0; dat <= medicaltpedatalist.length; dat++) {
            if (dat == val) {
            //  print(countriesdatalist[dat]['countryCode']);
             return medicaltpedatalist[dat]['type'];
            }
          }
        }
    }
        break;

      case 2:
          {
      
          int val = a;
          val--;
          if(a==0){return medic;}else{
          for (int dat = 0; dat <= statedatalist.length; dat++) {
            if (dat == val) {
            //  print(countriesdatalist[dat]['countryCode']);
             return statedatalist[dat]['stateName'];
            }
          }
        }
    }
        break;

      //   //  levelvaluedata=levelvalue(2);

        
      case 3:
        {
          int val = a;
          val--;
           if(a==0){return medic;}else{
          for (int dat = 0; dat <= limitationdatalist.length; dat++) {
            if (dat == val) {
            //  print(countriesdatalist[dat]['countryName']);
             return limitationdatalist[dat]['limitation'];
            }}
          } // levelvaluedata=levelvalue(3);
        }
        break;
      // case 4:
      //   {
      //      int val = a;
      //     val--;
      //      if(a==0){return contries;}else{
      //     for (int dat = 0; dat <= licenseclassdatalist.length; dat++) {
      //       if (dat == val) {
      //       //  print(licenseclassdatalist[dat]['className']);
      //        return licenseclassdatalist[dat]['className'];
      //       }
      //     } 
      //        }  //  levelvaluedata=fourear.toString();

      //   }
      //   break;
      // case 5:
      //   {
      //     int val = a;
      //     val--;
      //     for (int dat = 0; dat <= examinerdatalist.length; dat++) {
      //       if (dat == val) {
      //       //  print(examinerdatalist[dat]['examinerType']);
      //        return examinerdatalist[dat]['examinerType'];
      //       } //  levelvaluedata= sixear.toString();
      //   }
      //   }
      //   break;
      // case 6:
      //   {
      //     int val = a;
      //     val--;
      //   // return instructordatalist[val]['instructorType'];
      //     for (int dat = 0; dat <= instructordatalist.length; dat++) {
      //       if (dat == val) {
      //       //  print(instructordatalist[dat]['instructorType']);
      //        return instructordatalist[dat]['instructorType'];
      //       } //  levelvaluedata= sixear.toString();
      //   } //  levelvaluedata= levelvalue(6);
      //   }
      //   break;
      //  case 7:
      //   {
      //     int val = a;
      //     val--;
      //   // return instructordatalist[val]['instructorType'];
      //     for (int dat = 0; dat <= endorsementdatalist.length; dat++) {
      //       if (dat == val) {
      //       //  print(endorsementdatalist[dat]['endorsementType']);
      //        return endorsementdatalist[dat]['endorsementType'];
      //       } //  levelvaluedata= sixear.toString();
      //   } //  levelvaluedata= levelvalue(6);
      //   }
      //   break;
      //   case 8:
      //   {
      //     int val = a;
      //     val--;
      //    if(a==0){return contries;}else{
      //     for (int dat = 0; dat <= licensetitlesdatalist.length; dat++) {
      //       if (dat == val) {
      //       //  print(licensetitlesdatalist[dat]['title']);
      //        return licensetitlesdatalist[dat]['title'];
      //       } //  levelvaluedata= sixear.toString();
      //   } //  levelvaluedata= levelvalue(6);
      //   }
      //   }
      //   break;
      //   case 9:
      //   {
      //     int val = a;
      //     val--;
      //     if(a==0){return contries;}else{
      //     for (int dat = 0; dat <= licensecodesdatalist.length; dat++) {
      //       if (dat == val) {
      //         //print(licensecodesdatalist[dat]['code']);
      //        return licensecodesdatalist[dat]['code'];
      //       }
      //     }
      //      } //  iions= countriesdatalist[dat]['code'];
      //   }
      //   break;
      default:
        {
         return null; //statements;
        }
        break;
    }
    
  }

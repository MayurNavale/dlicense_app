import 'package:flutter/material.dart';
import 'model.dart';


class ShowSelectedData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected option"),
      ),
      body: Container(
        padding: new EdgeInsets.all(10.0),

        child: ListView(
          children:[
            Text('State of issue: $contries'),
            Text('Licence code : $licenceCodeOptions'),
            Text('Licence numbe:  $licence_Number'),
            Text('Title of licence: $titleOfLicenceOptions'),
            Text('Date of Initial Issue:  $dateOfInitialIssue'),
            Text('Issued By(Countr code: $countryCodes'),
           // Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()),
            Text('Date of rating test:  $dateofratingtest'),
            Text('Date of IR test:  $dateofIRtest'),
            Text('Valid until  :  $validuntil'),
            Text('Examiners certificate number : $examinerscertificatenumber'),
            Text('Class:$classOptions'),
            Text('Type :$tpyeOptionData'),
            Text('IR :$ir'),Text('Co-Pilot :$co_Pilot'),
            Text('--------------------'),
            Text('Additional Ratings'),
            Text('Class :$addtiionalratingclassOptions'),
            Text('Type:$additionalratingtpyeOptionData'),
            Text('IR :$additionalratingIR'),
            Text('Co-Pilot :$additionalratingcoPilot'),
            Text('Remarks and Restrictions :$remarksandRestrictions'),
            Text('-----------------'),
            Text('Instructor'),
            Text('Instructor :$instructorsOptions'),
            Text('Remarks and Restrictions :$instructorremarksandRestrictions'),
            Text('---------------'),
            Text('Examiners :'),Text('Examiners :$examiners'),Text('Remarks and Restrictions :$examinarRemarksandRestrictions'),
            Text('---------------'),
            Text('Rating certificate endorsement :$ratingcertificateendorsement'),



            FlatButton(
              color:Colors.yellow,
              child: Text('Done'),
              textColor:Colors.black,
              onPressed: () {

              },

            ),


          ],
        ),
      ),

    );
  }
}
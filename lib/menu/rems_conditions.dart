import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/menu/terms.dart';

import '../models/cor_palete.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (
            BuildContext context, bool innerBoxIsScrolled) {
          return [SliverAppBar(
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Pallette.backgroundColor,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Terms & Conditions', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                    ],
                  ),

                ],
              ),
            ),
          )];
        },
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. INTRODUCTION', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(introduction,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            Text(into,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('2. CHANGES TO THE AGREEMENTS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(changes,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('3. ENJOYING RABBI TV', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(enjoying,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('4. ACCESS TO OUR SERVICE', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(access,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('5. THIRD PARTY APPLICATIONS AND DEVICES', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(thirdParty,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('6. CONTENT ON APP', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(content,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('8. GUIDELINES FOR REVIEWS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(guidelines1,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('9. MOBILE APPLICATION LICENSE', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(license,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('10. SERVICES MANAGEMENT', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(service,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('11. PRIVACY POLICY', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(ppolicy,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('12. TERM AND TERMINATION', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(termination,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('13. MODIFICATIONS AND INTERRUPTIONS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(modifi,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('14. GOVERNING LAW', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(glaw,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('15. DISPUTE RESOLUTION', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(dispute,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('16. CORRECTIONS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(correct,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('17. DISCLAIMER', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(disclaimer,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('18. LIMITATIONS OF LIABILITY', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(limit,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('19. INDEMNIFICATION', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(idemn,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('20. USER DATA', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(udata,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('21. ELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(sign,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('22. MISCELLANEOUS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(missc,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
            Text('23. CONTACT US', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
            SizedBox(height: 15,),
            Text(contactus,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            SizedBox(height: 15,),
          ],
        ),
        )
        ),
      ),
    );
  }
}

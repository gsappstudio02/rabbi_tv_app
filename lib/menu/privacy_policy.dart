import 'package:flutter/material.dart';

import '../models/cor_palete.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                      Text('Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
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
                Text('Last updated June 11, 2024', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 14),),
                SizedBox(height: 15,),
                Text('This privacy notice for Rabbi ("we," "us," or "our"), describes how and why we might collect, store, use, and/or share ("process") your information when you use our services ("Services"), such as when you: Download and use our mobile application (Rabbi TV), or any other application of ours that links to this privacy notice Engage with us in other related ways, including any sales, marketing, or events Questions or concerns? Reading this privacy notice will help you understand your privacy rights and choices. If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at contact@rabbitv.app.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('SUMMARY OF KEY POINTS', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('This summary provides key points from our privacy notice, but you can find out more details about any of these topics by clicking the link following each key point or by using our table of contents below to find the section you are looking for. What personal information do we process? When you visit, use, or navigate our Services, we may process personal information depending on how you interact with us and the Services, the choices you make, and the products and features you use. Learn more about personal information you disclose to us. Do we process any sensitive personal information? We do not process sensitive personal information. Do we collect any information from third parties? We do not collect any information from third parties. How do we process your information? We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent. We process your information only when we have a valid legal reason to do so. Learn more about how we process your information. In what situations and with which parties do we share personal information? We may share information in specific situations and with specific third parties. Learn more about when and with whom we share your personal information. How do we keep your information safe? We have organizational and technical processes and procedures in place to protect your personal information. However, no electronic transmission over the internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Learn more about how we keep your information safe. What are your rights? Depending on where you are located geographically, the applicable privacy law may mean you have certain rights regarding your personal information. Learn more about your privacy rights. How do you exercise your rights? The easiest way to exercise your rights is by submitting a data subject access request, or by contacting us. We will consider and act upon any request in accordance with applicable data protection laws.Want to learn more about what we do with any information we collect? Review the privacy notice in full.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('1. WHAT INFORMATION DO WE COLLECT?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('Personal information you disclose to us\n\nIn Short: We collect personal information that you provide to us.\n\nWe collect personal information that you voluntarily provide to us when you express an interest in obtaining information about us or our products and Services, when you participate in activities on the Services, or otherwise when you contact us.\n\Sensitive Information. We do not process sensitive information.\n\Application Data. If you use our application(s), we also may collect the following information if you choose to provide us with access or permission: Push Notifications. We may request to send you push notifications regarding your account or certain features of the application(s). If you wish to opt out from receiving these types of communications, you may turn them off in your device settings. This information is primarily needed to maintain the security and operation of our application(s), for troubleshooting, and for our internal analytics and reporting purposes.\n\nAll personal information that you provide to us must be true, complete, and accurate, and you must notify us of any changes to such personal information.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('2. HOW DO WE PROCESS YOUR INFORMATION?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('In Short: We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent.\n\nWe process your personal information for a variety of reasons, depending on how you interact with our Services, including:\n\nTo send administrative information to you. We may process your information to send you details about our products and services, changes to our terms and policies, and other similar information.\n\nTo send you marketing and promotional communications. We may process the personal information you send to us for our marketing purposes, if this is in accordance with your marketing preferences. You can opt out of our marketing emails at any time. For more information, see "WHAT ARE YOUR PRIVACY RIGHTS?" below.\n\nTo protect our Services. We may process your information as part of our efforts to keep our Services safe and secure, including fraud monitoring and prevention.\n\nTo comply with our legal obligations. We may process your information to comply with our legal obligations, respond to legal requests, and exercise, establish, or defend our legal rights.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('3. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('In Short: We may share information in specific situations described in this section and/or with the following third parties.\n\nWe may need to share your personal information in the following situations:\n\nBusiness Transfers. We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('4. HOW LONG DO WE KEEP YOUR INFORMATION?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('In Short: We keep your information for as long as necessary to fulfill the purposes outlined in this privacy notice unless otherwise required by law.\n\nWe will only keep your personal information for as long as it is necessary for the purposes set out in this privacy notice, unless a longer retention period is required or permitted by law (such as tax, accounting, or other legal requirements).\n\nWhen we have no ongoing legitimate business need to process your personal information, we will either delete or anonymize such information, or, if this is not possible (for example, because your personal information has been stored in backup archives), then we will securely store your personal information and isolate it from any further processing until deletion is possible.',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                SizedBox(height: 15,),
                Text('5. HOW DO WE KEEP YOUR INFORMATION SAFE?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('In Short: We aim to protect your personal information through a system of organizational and technical security measures.\n\nWe have implemented appropriate and reasonable technical and organizational security measures designed to protect the security of any personal information we process. However, despite our safeguards and efforts to secure your information, no electronic transmission over the Internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Although we will do our best to protect your personal information, transmission of personal information to and from our Services is at your own risk. You should only access the Services within a secure environment.',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('6. DO WE COLLECT INFORMATION FROM MINORS?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('In Short: We do not knowingly collect data from or market to children under 18 years of age.\n\nWe do not knowingly collect, solicit data from, or market to children under 18 years of age, nor do we knowingly sell such personal information. By using the Services, you represent that you are at least 18 or that you are the parent or guardian of such a minor and consent to such minor dependent’s use of the Services. If we learn that personal information from users less than 18 years of age has been collected, we will deactivate the account and take reasonable measures to promptly delete such data from our records. If you become aware of any data we may have collected from children under age 18, please contact us at info@rabbitv.app',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('7. WHAT ARE YOUR PRIVACY RIGHTS?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('In Short:  You may review, change, or terminate your account at any time, depending on your country, province, or state of residence.\n\nWithdrawing your consent: If we are relying on your consent to process your personal information, which may be express and/or implied consent depending on the applicable law, you have the right to withdraw your consent at any time. You can withdraw your consent at any time by contacting us by using the contact details provided in the section "HOW CAN YOU CONTACT US ABOUT THIS NOTICE?" below.\n\nHowever, please note that this will not affect the lawfulness of the processing before its withdrawal nor, when applicable law allows, will it affect the processing of your personal information conducted in reliance on lawful processing grounds other than consent.\n\nIf you have questions or comments about your privacy rights, you may email us at contact@rabbitv.app',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('8. CONTROLS FOR DO-NOT-TRACK FEATURES', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),

                Text('Most web browsers and some mobile operating systems and mobile applications include a Do-Not-Track ("DNT") feature or setting you can activate to signal your privacy preference not to have data about your online browsing activities monitored and collected. At this stage, no uniform technology standard for recognizing and implementing DNT signals has been finalized. As such, we do not currently respond to DNT browser signals or any other mechanism that automatically communicates your choice not to be tracked online. If a standard for online tracking is adopted that we must follow in the future, we will inform you about that practice in a revised version of this privacy notice.',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('9. DO WE MAKE UPDATES TO THIS NOTICE?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),

                Text('In Short: Yes, we will update this notice as necessary to stay compliant with relevant laws.\n\nWe may update this privacy notice from time to time. The updated version will be indicated by an updated "Revised" date at the top of this privacy notice. If we make material changes to this privacy notice, we may notify you either by prominently posting a notice of such changes or by directly sending you a notification. We encourage you to review this privacy notice frequently to be informed of how we are protecting your information.',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('10. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('If you have questions or comments about this notice, you may email us at info@rabbitv.app', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                SizedBox(height: 15,),
                Text('11. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
                SizedBox(height: 15,),
                Text('You have the right to request access to the personal information we collect from you, details about how we have processed it, correct inaccuracies, or delete your personal information. You may also have the right to withdraw your consent to our processing of your personal information. These rights may be limited in some circumstances by applicable law. To request to review, update, or delete your personal information, please fill out and submit a data subject access request.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              ],
            )
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutRabbiTeam extends StatefulWidget {
  const AboutRabbiTeam({Key? key}) : super(key: key);

  @override
  State<AboutRabbiTeam> createState() => _AboutRabbiTeamState();
}

class _AboutRabbiTeamState extends State<AboutRabbiTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rabbi TV operates as a close-knit family, diversified into multiple specialized teams that work harmoniously to ensure the platform runs flawlessly. Our core teams include the Management Team, Product Team, and Media Team, each dedicated to bringing our vision to life.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              SizedBox(height: 15,),
              Text('Management Team', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
              SizedBox(height: 15,),
              Text("The Management Team is the brain of Rabbi TV, steering the platform towards our ambitious vision and fulfilling our mission. They play a pivotal role in overseeing various teams, setting strategic policies, and ensuring seamless operations. Their leadership, dedication, and foresight are the driving forces behind our success, constantly pushing boundaries to achieve excellence and inspire our community.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              SizedBox(height: 15,),
              Text('Product Team', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
              SizedBox(height: 15,),
              Text("The Product Team holds the crucial responsibility of managing our applications across multiple platforms. They ensure that our digital presence is robust, user-friendly, and continuously evolving to meet the ever-changing needs of our audience. With a focus on innovation and quality, they work tirelessly to create an engaging and accessible experience for all users.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              SizedBox(height: 15,),
              Text('Media Team', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),),
              SizedBox(height: 15,),
              Text("The Media Team is the creative heartbeat of Rabbi TV, managing all aspects of content creation. They are involved in every stage of production, from pre-production to post-production and release. Their creativity, passion, and attention to detail ensure that our content is not only high-quality and engaging but also educational and inspirational. They craft contents that resonate.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              SizedBox(height: 15,),
            ],
          ),
        )
      )
    );
  }
}

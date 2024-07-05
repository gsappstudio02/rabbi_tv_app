import 'package:flutter/material.dart';

class AboutRabbi extends StatefulWidget {
  const AboutRabbi({Key? key}) : super(key: key);

  @override
  State<AboutRabbi> createState() => _AboutRabbiState();
}

class _AboutRabbiState extends State<AboutRabbi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text("Rabbi(Teacher) represents a divine vision bestowed upon our dear Brother Vimalraj, serving as a clear message from God. Referencing the Transfiguration experience of Jesus Christ, a 3-day Power Camp is proposed to train individuals, empowering them to uphold the divine will of our Heavenly Father steadfastly.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              SizedBox(height: 15,),
              Text("Inspired by this divine vision, our cherished brother conducted 3-day Power Camps in multiple locations across nations, spanning from the northern to the southern regions. Through this ministry, we reached out to over 10,000 individuals, delivered them from demonic possessions, imparting knowledge of the Bible's secrets, and elucidating the purpose and calling of their lives.The impact of our fellowship extended beyond these events, as we gathered a community of individuals eager to fulfill God's will. We diligently trained them to spread the Gospel, covering cities, states, and nations, resulting in a bountiful harvest of souls for the kingdom of God.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              SizedBox(height: 15,),
              Text("In solidarity with our Brother and to enhance the impact of his vision, a fellowship of like-minded individuals emerged. United by a shared understanding of the significance and value of this Vision, these brothers joined hands with our Brother, collectively moving forward in this journey.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}

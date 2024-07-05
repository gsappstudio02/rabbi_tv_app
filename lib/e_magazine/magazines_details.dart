import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/e_magazine/pdf_viewer.dart';

import '../models/cor_palete.dart';

class MagazinesDetails extends StatefulWidget {
  const MagazinesDetails({Key? key, required this.cover_img, required this.title, required this.subtitle, required this.author, required this.pdf_url}) : super(key: key);
  final String cover_img;
  final String title;
  final String subtitle;
  final String author;
  final String pdf_url;
  @override
  State<MagazinesDetails> createState() => _MagazinesDetailsState();
}

class _MagazinesDetailsState extends State<MagazinesDetails> {
  @override
  Widget build(BuildContext context) {
    double height_size=MediaQuery.of(context).size.height;
    double width_size=MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>MagazinesPDFViewer(pdf_url: widget.pdf_url,)));
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            width: width_size-80,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Text('Read', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
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
                  Text('E Magazines', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: width_size,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 220,
                    width: width_size,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          widget.cover_img,
                        width: 150,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: width_size,
                      child: Text(widget.title,
                        style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w900),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  SizedBox(
                    width: width_size,
                      child: Text(widget.author,
                        style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: width_size,
                    child: Text(
                      widget.subtitle,style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Divider(),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Iconsax.verify, color: Colors.green, size: 30,),
                          SizedBox(height: 5,),
                          Text('Verified Author', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),)
                        ],
                      ),
                      Container(color: Colors.white, height: 40, width: 2,),
                      Column(
                        children: [
                          Icon(Icons.currency_rupee_rounded, color: Colors.green, size: 30,),
                          SizedBox(height: 5,),
                          Text('Free', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),)
                        ],
                      ),
                      Container(color: Colors.white, height: 40, width: 2,),
                      Column(
                        children: [
                          Icon(Iconsax.document, color: Colors.green, size: 30,),
                          SizedBox(height: 5,),
                          Text('In App Reader', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

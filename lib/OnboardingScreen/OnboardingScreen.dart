
import 'package:blyndr_app/LoginScreen/Login.dart';
import 'OnboardingData.dart';
import 'package:flutter/cupertino.dart';
import 'package:blyndr_app/Miscellaneous/DeviceSizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:blyndr_app/LoginScreen/Register.dart';
import 'package:blyndr_app/LoginScreen/EmailLogin.dart';


class OnboardingScreen extends StatefulWidget{
  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen>{

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  int i;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState(){
    super.initState();
    slides = getSlides();

  }

  Widget pageIndexIndicator(bool isCurrentpage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal:2.0),
      height: isCurrentpage? 10.0:6.0,
      width: isCurrentpage?10.0:6.0,
      decoration: BoxDecoration(
        color: isCurrentpage?Colors.blue :Colors.grey,
        borderRadius: BorderRadius.circular(10.0)
      ),
      );
  }
  @override
  Widget build(BuildContext context){
    DeviceSizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body:PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (value){
          setState(() {
             currentIndex = value;
          });
          },
       itemBuilder: (context,index){
         return SliderTile(
          imageAsset: slides[index].getImagePath(),
          description: slides[index].getDescription()
          );
       }
     ),
     bottomSheet: currentIndex!= slides.length-1? Container(
       color: Colors.white,
       alignment: Alignment.topCenter,
       height: DeviceSizeConfig.screenHeight*0.07,
       padding: EdgeInsets.symmetric(horizontal:20),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget> [
        ElevatedButton(
           onPressed:(){
             pageController.animateToPage(slides.length, 
             duration: Duration(milliseconds: 400), curve: Curves.linear);},
              style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
             child: Text('Skip',style: TextStyle(fontSize:20, color: Colors.white),
         ),),
         Row(children: <Widget>[
           for(i=0; i< slides.length; i++)
            currentIndex == i ? pageIndexIndicator(true):pageIndexIndicator(false),
         ],
         ),
         ElevatedButton(
           onPressed:(){
             pageController.animateToPage(currentIndex+1, 
             duration: Duration(milliseconds: 400), curve: Curves.linear);},
              style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(Colors.blue,),
              ),
              child: Text('Next',style: TextStyle(fontSize:20, color: Colors.white,  ),
         ),),

       ],
       ),
     ): Container(
       color: Colors.white,
       alignment: Alignment.topCenter,
       height: DeviceSizeConfig.screenHeight*0.2,
       //width: DeviceSizeConfig.screenWidth*0.5,
       child:ListView(
         padding: const EdgeInsets.all(8),
         children:<Widget> [
           ElevatedButton(
          child: Text('Sign in with Email'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmailPasswordForm()),
            );
          },
        ),
            LoginPageWidget(),
            ElevatedButton(
            child: Text('Sign up with email'),
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterEmailSection()),
            );
          },
        ),
         ]
           ,)
       ),
    );
  }
  }


class SliderTile extends StatelessWidget{
  

  String imageAsset, description;
  SliderTile({this.imageAsset, this.description});

  @override
  Widget build(BuildContext context){
    return Container(
      
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(imageAsset, height: DeviceSizeConfig.screenHeight*0.4,
        width:DeviceSizeConfig.screenWidth*0.5,),
        SizedBox(height: 15,),
        Text(description, style:TextStyle(fontSize:20, color: Colors.blue,fontWeight: FontWeight.bold) ,),
         ],
      ),
      );
  }
}
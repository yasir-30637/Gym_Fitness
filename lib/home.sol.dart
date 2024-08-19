

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectnew/login.sol.dart';
import 'package:projectnew/round_button.dart';
import 'package:projectnew/weightgain.dart';
import 'package:projectnew/weightloss.dart';
import 'package:projectnew/workout_view.dart';

import 'color_extension.dart';
import 'drawer.dart';
import 'map_page.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var currentPage=DrawerSections.dashboard;


  final List<Category> catego = [
    Category(
      imagUrl: "assets/alexsandra.jpg",
      name: "Example exercises",
    ),
    Category(
      imagUrl: "assets/wl.jpg",
      name: "Weight Loss",
    ),
    Category(
      imagUrl: "assets/wg.jpeg",
      name: "Weight Gain",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);





    return Scaffold(

      appBar: AppBar(
        backgroundColor: TColor.gray,
        centerTitle: true,
        elevation: 0.1,

        title: Text(
          "Hey Master",
          style: TextStyle(
              color: Colors.amber,
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
      ),
      drawer:Drawer(

        child: Container(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: Column(
            children: [
              const MyHeaderDrawer(
                userName: "yasir khan",
                userEmail: "yasir@123.com",
                profileImageUrl: "assets/2.jpg",
              ),
              MyDrawerList(),
            ],
          ),
        ),
      ) ,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: Column(
            children: [


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),



              ),

              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Find ",
                          style: GoogleFonts.lato(
                            fontSize: 26,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "your Workout",
                          style: GoogleFonts.lato(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.filter_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: 353,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Color(0xFF232441),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "SEARCH WORKOUT",
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Hard workout",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Full body",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Crossfit",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                      itemCount: catego.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(

                          padding: const EdgeInsets.symmetric(horizontal: 10.0),

                        child: InkWell(

                        onTap: () {
                          if(index==0) {
                            // Handle click action for each item in the list
                            // You can navigate to a new page or perform any desired action
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WorkoutView()),

                            );
                          }
                          if(index==1) {
                            // Handle click action for each item in the list
                            // You can navigate to a new page or perform any desired action
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WeightLoss()),

                            );
                          }
                          if(index==2) {
                            // Handle click action for each item in the list
                            // You can navigate to a new page or perform any desired action
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WeightGain()),

                            );
                          }
                        },

                          child: Column(
                            children: [
                              Container(
                                height: 172,
                                width: 141,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(catego[index].imagUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                catego[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                        );
                      }),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
  Widget MyDrawerList(){
    return Container(

      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Dashboasrd",Icons.dashboard_outlined,
              currentPage==DrawerSections.dashboard ? true :false),
          menuItem(2, "contacts",Icons.people_alt_outlined,
              currentPage==DrawerSections.contacts ? true :false),
          menuItem(3, "Location",Icons.location_on,
              currentPage==DrawerSections.location ? true :false),
          menuItem(4, "Logout",Icons.logout_outlined,
              currentPage==DrawerSections.logout ? true :false),
          Divider(),
          menuItem(5, "Setting",Icons.settings_outlined,
              currentPage==DrawerSections.settings ? true :false),
          menuItem(6, "Notifications",Icons.notifications_outlined,
              currentPage==DrawerSections.notifications ? true :false),
          Divider(),
          menuItem(7, "Privacy_policy",Icons.privacy_tip_outlined,
              currentPage==DrawerSections.privacy_policy ? true :false),
        ],
      ),
    );

  }
  Widget menuItem(int id,String title,IconData icon,bool selected){
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child:InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {

            if(id==1){

              currentPage=DrawerSections.dashboard;
            }
            else if(id==2){
              currentPage=DrawerSections.contacts;
            }
            else if(id==3){
              currentPage=DrawerSections.location;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapPage()), // Create MapPage
              );

            }
            else if(id==4){
              currentPage=DrawerSections.logout;
              _handleLogout(context);
            }
            else if(id==5){
              currentPage=DrawerSections.settings;
            }
            else if(id==6){
              currentPage=DrawerSections.notifications;
            }
            else if(id==7){
              currentPage=DrawerSections.privacy_policy;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(child: Icon(icon,size: 20,color:Colors.black ,)),
              Expanded(child: Text(title,style: TextStyle(color: Colors.black,fontSize: 16),)),
            ],
          ),
        ),
      ),
    );
  }
  void _handleLogout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyLogin()),
    );
  }

}

enum DrawerSections {

  dashboard,
  contacts,
  location,
  logout,
  settings,
  notifications,
  privacy_policy,
}

class Category {
  final String imagUrl;
  final String name;

  Category({required this.imagUrl, required this.name});
}



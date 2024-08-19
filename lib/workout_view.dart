import 'package:flutter/material.dart';
import 'package:projectnew/round_button.dart';




import 'color_extension.dart';

class WorkoutView extends StatefulWidget {
  const WorkoutView({super.key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  List workArr = [
    {
      "name": "Climber",
      "image": "assets/2.jpg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
    {
      "name": "Climber",
      "image": "assets/29.jpg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
    {
      "name": "Climber",
      "image": "assets/25.jpg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
    {
      "name": "Climber",
      "image": "assets/19.jpg",
      "title": "workout",
      "subtitle": "Personalized workouts will help\nyou gain strength"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0.1,

        title: Text(
          "Workout",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),

      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          itemCount: workArr.length,
          itemBuilder: (context, index) {
            var wObj = workArr[index] as Map? ?? {};
            Positioned(
              top: 20.0,
              left: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the previous page
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
              ),
            );
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: media.width * 0.5,
              decoration: BoxDecoration(
                  color: TColor.gray, borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Image.asset(
                    wObj["image"].toString(),
                    width: media.width,
                    height: media.width * 0.5,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.5,
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.black.withOpacity(0.7)
                          : TColor.gray.withOpacity(0.35),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wObj["title"],
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          wObj["name"],
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          wObj["subtitle"],
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: 100,
                                height: 25,
                                child: RoundButton(
                                  title: "see more",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  onPressed: () {

                                  },
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset("assets/11.jpg",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/image1.jpg",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/image3.jpg",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/image2.jpg",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child:
                Image.asset("assets/65.jpg", width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
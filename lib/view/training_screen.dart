import 'package:flutter/material.dart';
import 'package:yoga_trainer/core/color_manager.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.green),
          iconSize: 32,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              Text(
                "Ready To Go",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.darkGreen,
                ),
              ),
              Text(
                'Cat-Cow Pose',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.greenGrey,
                ),
              ),
              SizedBox(
                height: 353,
                child: Image.asset('assets/images/Copy of Base.png'),
              ),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: ColorManager.green, width: 4),
                ),
                child: Center(
                  child: Text(
                    '0:30',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.green,
                    ),
                  ),
                ),
              ),
              Text(
                'Skip',
                style: TextStyle(fontSize: 24, color: ColorManager.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_trainer/core/color_manager.dart';
import 'package:yoga_trainer/modelView/session_provider.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);
    return sessionProvider.sessions.isNotEmpty
        ? Scaffold(
            backgroundColor: Colors.white,
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
                      sessionProvider.sessions[0].metadata['title'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.grey,
                      ),
                    ),
                    SizedBox(
                      height: 353,
                      child: Consumer<SessionProvider>(
                        builder: (context, sessionProvider, state) {
                          return Image.asset(sessionProvider.assets[0]);
                        },
                      ),
                    ),
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: ColorManager.green, width: 4),
                      ),
                      child: Center(
                        child: Consumer<SessionProvider>(
                          builder: (context, sessionProvider, state) {
                            return Text(
                              sessionProvider.timeLeft.toString(),
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                color: ColorManager.green,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => sessionProvider.timer(context),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 24,
                          color: ColorManager.green
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

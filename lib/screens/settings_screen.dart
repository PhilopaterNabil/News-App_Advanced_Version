import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_team/components/container_settings.dart';
import 'package:news_app_team/models/theme_provider.dart';
import 'package:news_app_team/screens/email_preferences_screen.dart';
import 'package:news_app_team/screens/personal_details_screen.dart';
import 'package:news_app_team/screens/privacy_and_cookies_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.purpleAccent,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   'Settings',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     color: Colors.purpleAccent,
            //     fontSize: 22,
            //   ),
            // ),
            // const SizedBox(height: 50),
            ContainerSettings(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PersonalDetailsScreen(),
                ),
              ),
              title: 'Person details',
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 15),
            ContainerSettings(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyAndCookiesScreen(),
                ),
              ),
              title: 'Privacy and cookies',
              icon: const Icon(
                Icons.lock,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 15),
            ContainerSettings(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmailPreferencesScreen(),
                ),
              ),
              title: 'Email preferences',
              icon: const Icon(
                Icons.email_outlined,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.dark_mode,
                          color: Colors.purpleAccent,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Dark Mood",
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CupertinoSwitch(
                        value: Provider.of<ThemeProvider>(context).isDarkmood,
                        onChanged: (value) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .theme();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

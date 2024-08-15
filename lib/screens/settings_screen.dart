import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ninja_flutter/components/container_settings.dart';
import 'package:task_ninja_flutter/screens/email_preferences_screen.dart';
import 'package:task_ninja_flutter/screens/personal_details_screen.dart';
import 'package:task_ninja_flutter/screens/privacy_and_cookies_screen.dart';
import 'package:task_ninja_flutter/theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 50),
            ContainerSettings(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersonalDetailsScreen(),
                  )),
              title: 'Person details',
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Color.fromARGB(255, 184, 33, 33),
              ),
            ),
            const SizedBox(height: 15),
            ContainerSettings(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyAndCookiesScreen(),
                  )),
              title: 'Privacy and cookies',
              icon: const Icon(
                Icons.lock,
                color: Color.fromARGB(255, 184, 33, 33),
              ),
            ),
            const SizedBox(height: 15),
            ContainerSettings(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmailPreferencesScreen(),
                  )),
              title: 'Email preferences',
              icon: const Icon(
                Icons.email_outlined,
                color: Color.fromARGB(255, 184, 33, 33),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.dark_mode,
                          color: Color.fromARGB(255, 184, 33, 33),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Dark Mood",
                          style: TextStyle(
                            color: Color.fromARGB(255, 184, 33, 33),
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

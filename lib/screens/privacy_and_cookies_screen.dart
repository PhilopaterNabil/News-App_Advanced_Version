// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyAndCookiesScreen extends StatelessWidget {
  const PrivacyAndCookiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Privacy and cookies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "This page lets you control how we use your info, and whether we can track how you use the BBC. We use this information to give you a more personal experience.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Personalization settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Allow Personalization",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (bool newbool) {
                      print(newbool);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "This makes the BBC more relevant and personal to you, including some of the advertising shown to you.\n \n Just so you know, we’re still improving this feature. So turning it off currently affects different parts of BBC in different ways.\n \n We never hide stories from you, and the top stories can be easily accessed at all times.\n \n If you turn this off, you may still see personalized ads, but they won’t be personalized using your account data.Find out more about personalized advertising.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "About your personalization settings",
                  style: TextStyle(
                    color: Color.fromARGB(255, 184, 33, 33),
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 184, 33, 33),
                    decorationThickness: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Allow personalized promotional messages \n on other sites",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoSwitch(
                    value: true,
                    onChanged: (bool newbool) {
                      print(newbool);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "This means we can share some data securely with our partners to make our promotional messages on others sites revelant to you. For example, we might promote the BBC Sport section to you if you’ve read a sports related article.\n\nTo personalize our promotional messages, we securely match encrypted email addresses with the other site, such as a social media platform. The other site can only see your email address if you already have an account their site. We don’t provide any more data on BBC users.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "How does the BBC use cookies for commercial purposes (outside the UK)?",
                  style: TextStyle(
                      color: Color.fromARGB(255, 184, 33, 33),
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 184, 33, 33)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Cookies settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Some cookies are essential for the BBC website to work. Others help us give you a better, more personal BBC.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Change your cookie",
                  style: TextStyle(
                    color: Color.fromARGB(255, 184, 33, 33),
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 184, 33, 33),
                    decorationThickness: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

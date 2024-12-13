import 'package:doc_booking_app/global/images.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_field.dart';
import '../widgets/profile_image.dart';

class UserInfoScreen extends StatelessWidget {
  static const routeName = '/user-info-screen';
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
        leading: IconButton(
          icon: Image.asset(AppImage.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              icon: Image.asset(AppImage.editProfile),
              onPressed: () {
                // Handle edit profile
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(height: 20), // Spacing from the app bar
            ProfileImage(
              imageUrl: 'https://s3-alpha-sig.figma.com/img/df1c/b52e/f5e502e6fea97dabf492ab66036e7ec2?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=o5Buqz1bYL-0yvutHptCw9Q9Du~5NUyQg7hPUu~Up5hK5~2MlwWiNoXDE09ElYH1JGSj~Ck4JQUOZLqFwmwPwYTTRNzT0oeoaa2Ebms9K5Fx5kQHV9nVlmms6A-j2Ar10u4AbtL4ShTDFdA6WOa5uBWpoGPpUXANiqebyiDrTV9LWtz5oSds91yMhcU6l-YksInL8b9s4TKb9eb4MfXuvflFyRTn3Q3q5xSxsXFF-rghYf0hY0J0dV~ZdXGkIk50KZj5fJ50sY59U1Mn2AqxsKBcvoht0l8~RBfdFybpmbAW0k07XrNNufO2CqXsDA5hlAeenCneKfovS~4EBmLdPg__',
            ),
            const SizedBox(height: 25),
            ProfileField(label: 'Full Name', value: 'Alex Doe'),
            ProfileField(label: 'Email Address', value: 'alex.doe@gmail.com'),
            ProfileField(label: 'Phone Number', value: '+1-345-567-23-56'),
            ProfileField(label: 'DOB', value: '27/02/1992'),
            ProfileField(label: 'Sex', value: 'Male'),
            ProfileField(label: 'Address', value: 'Street 2334, New York'),
            ProfileField(label: 'Zip Code', value: '53542'),
            ProfileField(label: 'State', value: 'New City'),
          ],
        ),
      ),
    );
  }
}

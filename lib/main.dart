import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/add': (context) => AddAppointmentPage(),
        '/view': (context) => ViewOldServicesPage(services: [
          'abdelhadi',
          'Wahib',
          'Helmi',
        ]),
        '/patientInfo': (context) => PatientInfoPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isPageGreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Container(
        color: isPageGreen ? Colors.green : null,
        child: Column(
          children: [
            Image.asset(
              "images/for.png", // Replace with the actual path to your image
              // Adjust the image size and aspect ratio
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                value: isPageGreen,
                onChanged: (bool? value) {
                  setState(() {
                    isPageGreen = value ?? false;
                  });
                },
              ),
            ),
            // Rest of the content
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              child: Text('Add new services'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/view');
              },
              child: Text('Show old services'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Appointment')),
      body: Center(
        child: Text('Add Appointment Page Content'),
      ),
    );
  }
}

class ViewOldServicesPage extends StatelessWidget {
  final List<String> services;

  ViewOldServicesPage({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Old Services')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Old services:'),
            for (String service in services)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/patientInfo');
                },
                child: Text(
                  service,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PatientInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Information')),
      body: Center(
        child: Text('Patient Information Page Content'),
      ),
    );
  }
}

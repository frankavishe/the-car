import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PictureBackgroundPage(),
      routes: {
        '/breakdown': (context) => BreakdownPage(),
        '/service': (context) => ServicePage(),
        '/request_technician': (context) => RequestTechnicianPage(),
      },
    );
  }
}

class PictureBackgroundPage extends StatefulWidget {
  @override
  _PictureBackgroundPageState createState() => _PictureBackgroundPageState();
}

class _PictureBackgroundPageState extends State<PictureBackgroundPage> {
  String _selectedOption = 'BREAKDOWN'; // Initial selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/garage1.jpg'), // Corrected image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'FIX YOUR CAR NOW',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20), // Adding spacing between subtitle and dropdown menu
              DropdownButton<String>(
                value: _selectedOption,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // Update the selected option when it changes
                    setState(() {
                      _selectedOption = newValue;
                    });
                  }
                },
                items: <String>['BREAKDOWN', 'SERVICE', 'REQUEST TECHNICIAN']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
                dropdownColor: Colors.black, // Customize dropdown menu color
              ),
              SizedBox(height: 20), // Adding spacing between dropdown menu and button
              ElevatedButton(
                onPressed: () {
                  // Action to perform when the button is pressed
                  print('Submit button pressed!');

                  // Navigate to the selected page based on the dropdown value
                  switch (_selectedOption) {
                    case 'BREAKDOWN':
                      Navigator.pushNamed(context, '/breakdown');
                      break;
                    case 'SERVICE':
                      Navigator.pushNamed(context, '/service');
                      break;
                    case 'REQUEST TECHNICIAN':
                      Navigator.pushNamed(context, '/request_technician');
                      break;
                    default:
                    // Handle any other cases
                      break;
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BreakdownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breakdown Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image taking up 50% of the page
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/breakdown1.jpg', // Replace 'your_image.png' with the path to your image asset
                fit: BoxFit.cover,
              ),
            ),
            // Text widget
            Expanded(
              flex: 1,
              child: Center(
                child: Text('This is the Breakdown Page'),
              ),
            ),
            // Car recovery description
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu tortor in leo fermentum fermentum. Integer interdum libero ut turpis hendrerit malesuada.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Price
            Text(
              'Price: Tsh 5000',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Pay Button
            ElevatedButton(
              onPressed: () {
                // Add functionality for payment here
              },
              child: Text('PAY'),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Page'),
      ),
      backgroundColor: Colors.transparent, // Make scaffold background transparent
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/auto-repair-3691962.jpg'), // Replace 'assets/background_image.jpg' with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildRowWithSpaces([
                _buildServiceBox('GARAGE SERVICE', Colors.red),
                _buildPriceButton(),
              ]),
              SizedBox(height: 10), // Space between rows
              _buildRowWithSpaces([
                _buildServiceBox('CAR WASH', Colors.blue),
                _buildPriceButton(),
              ]),
              SizedBox(height: 10), // Space between rows
              _buildRowWithSpaces([
                _buildServiceBox('OIL CHANGE', Colors.green),
                _buildPriceButton(),
              ]),
              SizedBox(height: 10), // Space between rows
              _buildRowWithSpaces([
                _buildServiceBox('TIRE ROTATION', Colors.orange),
                _buildPriceButton(),
              ]),
              SizedBox(height: 10), // Space between rows
              _buildRowWithSpaces([
                _buildServiceBox('BRAKE SERVICE', Colors.purple),
                _buildPriceButton(),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowWithSpaces(List<Widget> children) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    );
  }

  Widget _buildServiceBox(String text, Color color) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add functionality for service button
              },
              child: Text('Service'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceButton() {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {
          // Add functionality for the price button
        },
        child: Text('Price'),
      ),
    );
  }
}

class RequestTechnicianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Technician Page'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/Mechanic.jpg', // Replace 'assets/background_image.jpg' with your actual image path
              fit: BoxFit.cover,
            ),
          ),
          // Title Overlay
          Center(
            child: Text(
              'REQUEST A MECHANIC',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Pay Button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                // You can add your payment logic here
              },
              child: Text('PAY'),
            ),
          ),
        ],
      ),
    );
  }
}

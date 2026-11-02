
import 'package:flutter/material.dart';

void main() {
  runApp(const RajuRidesApp());
}

class RajuRidesApp extends StatelessWidget {
  const RajuRidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RAJU RIDES',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pickupController = TextEditingController();
  final destinationController = TextEditingController();

  String selectedRide = 'RAJU Economy';

  @override
  void dispose() {
    pickupController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  void bookRide() {
    if (pickupController.text.trim().isEmpty ||
        destinationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter pickup and destination'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Request prepared: $selectedRide',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'RAJU RIDES',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(Icons.account_circle, size: 30),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Where would you like to go?',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: pickupController,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.my_location,
                color: Colors.green,
              ),
              hintText: 'Enter pickup location',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: destinationController,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              hintText: 'Enter destination',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Choose your ride',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          rideOption(
            Icons.directions_car,
            'RAJU Economy',
            'Affordable rides',
          ),
          rideOption(
            Icons.local_taxi,
            'RAJU Comfort',
            'Comfortable travel',
          ),
          rideOption(
            Icons.airport_shuttle,
            'RAJU XL',
            'For more passengers',
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: bookRide,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'BOOK A RIDE',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Center(
            child: Text('Your Ride, Your Way'),
          ),
        ],
      ),
    );
  }

  Widget rideOption(
    IconData icon,
    String title,
    String subtitle,
  ) {
    final isSelected = selectedRide == title;

    return Card(
      color: isSelected ? Colors.green.shade50 : Colors.white,
      child: ListTile(
        onTap: () {
          setState(() {
            selectedRide = title;
          });
        },
        leading: Icon(icon, color: Colors.green, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(
          isSelected ? Icons.check_circle : Icons.circle_outlined,
          color: Colors.green,
        ),
      ),
    );
  }
}

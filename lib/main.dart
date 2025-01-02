import 'package:flutter/material.dart';

void main() => runApp(FleetTrackingApp());

class FleetTrackingApp extends StatelessWidget {
  const FleetTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleet Tracking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FleetTrackingHomePage(),
    );
  }
}

class FleetTrackingHomePage extends StatefulWidget {
  const FleetTrackingHomePage({super.key});

  @override
  _FleetTrackingHomePageState createState() => _FleetTrackingHomePageState();
}

class _FleetTrackingHomePageState extends State<FleetTrackingHomePage> {
  // Sample vehicle locations
  final List<Map<String, String>> vehicles = [
    {'id': '1', 'name': 'Vehicle 1', 'location': 'Delhi'},
    {'id': '2', 'name': 'Vehicle 2', 'location': 'Mumbai'},
    {'id': '3', 'name': 'Vehicle 3', 'location': 'Bangalore'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fleet Tracking'),
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return ListTile(
            title: Text(vehicle['name']!),
            subtitle: Text('Location: ${vehicle['location']}'),
            trailing: Icon(Icons.location_on),
            onTap: () {
              // Action on click (navigate to details, etc.)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${vehicle['name']} selected')),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to refresh locations
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Refreshing vehicle locations...')),
          );
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

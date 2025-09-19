import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'models/CarPark.dart';
import 'models/ParkingRegistration.dart';
import 'models/ModelProvider.dart'; // required for ModelQueries
import 'register_parking_dialog.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<CarPark> carParks = [];
  List<ParkingRegistration> registrations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Fetch car parks
      final carParkReq = ModelQueries.list(
        CarPark.classType
         
      );
      final carParkResp = await Amplify.API.query(request: carParkReq).response;
      final parks = carParkResp.data?.items.whereType<CarPark>().toList() ?? [];

      // Fetch registrations
      final regReq = ModelQueries.list(
        ParkingRegistration.classType
        
      );
      final regResp = await Amplify.API.query(request: regReq).response;
      final regs = regResp.data?.items.whereType<ParkingRegistration>().toList() ?? [];

      setState(() {
        carParks = parks;
        registrations = regs;
      });
    } catch (e) {
      safePrint('Error fetching data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  double calculateProgress(int current, int max) => current / max;

  int getCurrentOccupancy(CarPark park) {
    final now = DateTime.now().toUtc();
    return registrations
        .where((reg) =>
            reg.carParkId == park.id &&
            reg.leaveTime.getDateTimeInUtc().isAfter(now))
        .length;
  }

  Widget buildProgressBar(String label, int current, int max) {
    final color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 5),
          Stack(
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width *
                    0.7 *
                    calculateProgress(current, max),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    '$current/$max',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Availability'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/carpark.png',
                      width: 400,
                      height: 400,
                    ),
                    const SizedBox(height: 20),
                    ...carParks.map((cp) => buildProgressBar(
                        cp.name, getCurrentOccupancy(cp), cp.maxCapacity ?? 100)),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => RegisterParkingDialog(
                            carParks: carParks,
                            onRegistered: _fetchData, // refresh bars
                          ),
                        );
                      },
                      child: const Text('Register Parking'),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}

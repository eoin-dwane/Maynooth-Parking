import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'models/CarPark.dart';
import 'models/ParkingRegistration.dart';
import 'models/ModelProvider.dart'; // required for ModelMutations
import 'package:uuid/uuid.dart';

class RegisterParkingDialog extends StatefulWidget {
  final List<CarPark> carParks;
  final VoidCallback onRegistered;

  const RegisterParkingDialog({
    super.key,
    required this.carParks,
    required this.onRegistered,
  });

  @override
  State<RegisterParkingDialog> createState() => _RegisterParkingDialogState();
}

class _RegisterParkingDialogState extends State<RegisterParkingDialog> {
  CarPark? selectedPark;
  DateTime? leaveTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Register Parking'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<CarPark>(
            hint: const Text('Select Car Park'),
            value: selectedPark,
            isExpanded: true,
            items: widget.carParks.map((cp) {
              return DropdownMenuItem(
                value: cp,
                child: Text(cp.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedPark = value;
              });
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 1)),
              );
              if (picked != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    leaveTime = DateTime(
                      picked.year,
                      picked.month,
                      picked.day,
                      time.hour,
                      time.minute,
                    );
                  });
                }
              }
            },
            child: Text(leaveTime == null
                ? 'Select Leaving Time'
                : 'Leaving: ${leaveTime!.hour}:${leaveTime!.minute.toString().padLeft(2, '0')}'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: selectedPark != null && leaveTime != null
              ? () async {
                  try {
                    final user = await Amplify.Auth.getCurrentUser();
                    final registration = ParkingRegistration(
                      id: const Uuid().v4(),
                      carParkId: selectedPark!.id,
                      userId: user.userId,
                      leaveTime: TemporalDateTime(leaveTime!.toUtc()),
                      createdAt: TemporalDateTime.now(),
                    );

                    await Amplify.API.mutate(
                      request: ModelMutations.create(
                        registration,
                        
                      ),
                    ).response;

                    widget.onRegistered(); // refresh bars
                    Navigator.pop(context);
                  } catch (e) {
                    safePrint('Error registering parking: $e');
                  }
                }
              : null,
          child: const Text('Register'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../widgets/medicine_card.dart';
import '../widgets/device_connection_modal.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Harry!',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() => Text(
                            '${controller.medicines.length} Medicines Left',
                            style: GoogleFonts.inter(
                              color: Colors.grey[600],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.medical_services_outlined),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const DeviceConnectionModal(),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/settings');
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                      // const CircleAvatar(
                      //   radius: 20,
                      //   backgroundImage: AssetImage('assets/images/profile.png'),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => controller.previousDay(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Obx(() => Text(
                          controller.getFormattedDate(),
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () => controller.nextDay(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    // Swipe right - go to previous day
                    controller.previousDay();
                  } else if (details.primaryVelocity! < 0) {
                    // Swipe left - go to next day
                    controller.nextDay();
                  }
                },
                child: Obx(() {
                  if (controller.medicines.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/empty.png',
                            width: 120,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Nothing Is Here, Add a Medicine',
                            style: GoogleFonts.inter(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  // Group medicines by schedule time
final Map<String, List<dynamic>> groupedMedicines = {};
                  
                  // Define time periods with their display times
                  final timePeriods = {
                    'Before Breakfast': 'Morning 08:00 am',
                    'After Food': 'Afternoon 02:00 pm',
                    'After Dinner': 'Night 09:00 pm',
                  };
                  
                  // Group medicines by their schedule
                  for (var medicine in controller.medicines) {
                    if (!groupedMedicines.containsKey(medicine.schedule)) {
                      groupedMedicines[medicine.schedule] = [];
                    }
                    groupedMedicines[medicine.schedule]!.add(medicine);
                  }
                  
                  return ListView.builder(
                    padding: const EdgeInsets.all(20),
                    // Each schedule group will have a header + its medicines
                    itemCount: groupedMedicines.length,
                    itemBuilder: (context, index) {
                      final schedule = groupedMedicines.keys.elementAt(index);
                      final medicinesInGroup = groupedMedicines[schedule]!;
                      
                      // Get the display time for this schedule
                      final displayTime = timePeriods[schedule] ?? schedule;
                      
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Time period header
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
                            child: Text(
                              displayTime,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // Medicines in this time period
                          ...medicinesInGroup.map((medicine) => MedicineCard(medicine: medicine)).toList(),
                          SizedBox(height: 16),
                        ],
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Report',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.toNamed('/report');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-medicine'),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
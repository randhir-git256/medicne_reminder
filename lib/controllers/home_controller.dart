import 'package:get/get.dart';
import '../models/medicine_model.dart';

class HomeController extends GetxController {
  final medicines = <Medicine>[].obs;
  final selectedDate = DateTime.now().obs;
  final isDeviceConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMedicines();
  }

  void loadMedicines() {
    // Only show medicines on Tuesday, March 4th
    final date = selectedDate.value;
    final isMarch4th = date.day == 4 && date.month == 3 && _getWeekdayName(date.weekday) == 'Tuesday';
    
    if (isMarch4th) {
      medicines.addAll([
        Medicine(
          name: 'Calpol 500mg Tablet',
          dosage: '1/2 Pill',
          schedule: 'Before Breakfast',
          type: 'capsule',
          compartment: 1,
          color: 'pink',
          frequency: 'Everyday',
          timesPerDay: 'Three Time',
          status: 'taken',
          day: 4,
        ),
        Medicine(
          name: 'Calpol 500mg Tablet',
          dosage: '1/2 Pill',
          schedule: 'Before Breakfast',
          type: 'capsule',
          compartment: 2,
          color: 'blue',
          frequency: 'Everyday',
          timesPerDay: 'Three Time',
          status: 'missed',
          day: 4,
        ),
        Medicine(
          name: 'Calpol 500mg Tablet',
          dosage: '1/2 Pill',
          schedule: 'After Food',
          type: 'capsule',
          compartment: 3,
          color: 'purple',
          frequency: 'Everyday',
          timesPerDay: 'Three Time',
          status: 'snoozed',
          day: 4,
        ),
      ]);
    }
    // For all other dates, medicines list will remain empty
  }

  void changeDate(DateTime date) {
    selectedDate.value = date;
    // Reload medicines for the selected date
    // In a real app, this would filter from a database
    medicines.clear();
    loadMedicines();
  }

  void nextDay() {
    changeDate(selectedDate.value.add(const Duration(days: 1)));
  }

  void previousDay() {
    changeDate(selectedDate.value.subtract(const Duration(days: 1)));
  }

  String getFormattedDate() {
    final date = selectedDate.value;
    final day = date.day.toString();
    final month = _getMonthName(date.month);
    final weekday = _getWeekdayName(date.weekday);
    return '$weekday, $month $day';
  }

  String _getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  String _getWeekdayName(int weekday) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[weekday - 1];
  }

  void toggleDeviceConnection() {
    isDeviceConnected.value = !isDeviceConnected.value;
  }
}
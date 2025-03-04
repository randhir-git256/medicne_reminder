import 'package:hive_flutter/hive_flutter.dart';
import '../models/medicine_model.dart';

class HiveService {
  static const String medicineBox = 'medicines';
  late Box<Medicine> _medicineBox;

  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MedicineAdapter());
    }
    _medicineBox = await Hive.openBox<Medicine>(medicineBox);
  }

  Future<void> addMedicine(Medicine medicine) async {
    await _medicineBox.add(medicine);
  }

  Future<void> updateMedicine(int index, Medicine medicine) async {
    await _medicineBox.putAt(index, medicine);
  }

  Future<void> deleteMedicine(int index) async {
    await _medicineBox.deleteAt(index);
  }

  List<Medicine> getAllMedicines() {
    return _medicineBox.values.toList();
  }

  Medicine? getMedicine(int index) {
    return _medicineBox.getAt(index);
  }

  Future<void> updateMedicineStatus(int index, String status) async {
    final medicine = _medicineBox.getAt(index);
    if (medicine != null) {
      final updatedMedicine = Medicine(
        name: medicine.name,
        dosage: medicine.dosage,
        schedule: medicine.schedule,
        type: medicine.type,
        compartment: medicine.compartment,
        color: medicine.color,
        frequency: medicine.frequency,
        timesPerDay: medicine.timesPerDay,
        status: status,
        day: medicine.day,
      );
      await _medicineBox.putAt(index, updatedMedicine);
    }
  }

  Future<void> clearAll() async {
    await _medicineBox.clear();
  }

  int get medicineCount => _medicineBox.length;

  Future<void> close() async {
    await _medicineBox.close();
  }
}
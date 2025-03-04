import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/medicine_model.dart';
import '../widgets/medicine_card.dart';


class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatisticsCard(),
            _buildDashboardCard(),
            _buildHistorySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today\'s Report',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('5', 'Total'),
                  _buildStatItem('3', 'Taken'),
                  _buildStatItem('1', 'Missed'),
                  _buildStatItem('1', 'Snoozed'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue[400],
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Check Dashboard',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Here you will find everything related\nto your active and past medicines.',
                style: GoogleFonts.inter(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue[400]!,
                        ),
                        strokeWidth: 8,
                      ),
                      CircularProgressIndicator(
                        value: 0.25,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.pink[300]!,
                        ),
                        strokeWidth: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistorySection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Check History',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.blue[400]),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                6,
                (index) => _buildDateCard(
                  day: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'][index],
                  date: (index + 1).toString(),
                  isSelected: index == 0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildMedicineHistorySection(),
        ],
      ),
    );
  }

  Widget _buildDateCard({
    required String day,
    required String date,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Text(
            day,
            style: GoogleFonts.inter(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue[400] : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue[400]! : Colors.grey[300]!,
              ),
            ),
            child: Center(
              child: Text(
                date,
                style: GoogleFonts.inter(
                  color: isSelected ? Colors.white : Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMedicineHistorySection() {
    // Sample medicine data for demonstration
    final morningMedicines = [
      Medicine(
        name: 'Calpol 500mg Tablet',
        dosage: '1 tablet',
        schedule: 'Before Breakfast',
        type: 'capsule',
        compartment: 1,
        color: 'purple',
        frequency: 'daily',
        timesPerDay: '1',
        status: 'taken',
        day: 1,
      ),
      Medicine(
        name: 'Calpol 500mg Tablet',
        dosage: '1 tablet',
        schedule: 'Before Breakfast',
        type: 'capsule',
        compartment: 2,
        color: 'pink',
        frequency: 'daily',
        timesPerDay: '1',
        status: 'missed',
        day: 27,
      ),
    ];

    final afternoonMedicines = [
      Medicine(
        name: 'Calpol 500mg Tablet',
        dosage: '1 tablet',
        schedule: 'After Food',
        type: 'capsule',
        compartment: 3,
        color: 'purple',
        frequency: 'daily',
        timesPerDay: '1',
        status: 'snoozed',
        day: 1,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Morning Section
        _buildTimePeriodHeader('Morning 08:00 am'),
        ...morningMedicines.map((medicine) => MedicineCard(medicine: medicine)).toList(),
        
        const SizedBox(height: 16),
        
        // Afternoon Section
        _buildTimePeriodHeader('Afternoon 02:00 pm'),
        ...afternoonMedicines.map((medicine) => MedicineCard(medicine: medicine)).toList(),
      ],
    );
  }

  Widget _buildTimePeriodHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}
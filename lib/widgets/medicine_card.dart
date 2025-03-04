import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/medicine_model.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  const MedicineCard({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getColor(medicine.color),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  _getMedicineTypeIcon(medicine.type),
                  width: 30,
                  height: 40,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${medicine.schedule} • Day ${medicine.day.toString().padLeft(2, '0')}',
                    style: GoogleFonts.inter(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _buildStatusIcon(medicine.status),
                const SizedBox(height: 4),
                _buildStatusText(medicine.status),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Color _getColor(String color) {
    switch (color.toLowerCase()) {
      case 'pink':
        return Colors.pink[100]!;
      case 'blue':
        return Colors.blue[100]!;
      case 'purple':
        return Colors.purple[100]!;
      case 'green':
        return Colors.green[100]!;
      case 'orange':
        return Colors.orange[100]!;
      default:
        return Colors.grey[100]!;
    }
  }
  
  Widget _buildStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'taken':
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green[50],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.notifications, color: Colors.green[700], size: 20),
        );
      case 'missed':
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red[50],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.notifications, color: Colors.red[700], size: 20),
        );
      case 'snoozed':
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.notifications, color: Colors.orange[700], size: 20),
        );
      default:
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.notifications, color: Colors.grey[700], size: 20),
        );
    }
  }
  
  Widget _buildStatusText(String status) {
    Color textColor;
    switch (status.toLowerCase()) {
      case 'taken':
        textColor = Colors.green[700]!;
        break;
      case 'missed':
        textColor = Colors.red[700]!;
        break;
      case 'snoozed':
        textColor = Colors.orange[700]!;
        break;
      default:
        textColor = Colors.grey[700]!;
    }
    
    return Text(
      status.capitalize!,
      style: GoogleFonts.inter(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
  String _getMedicineTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'tablet':
        return 'assets/images/tablet.svg';
      case 'capsule':
        return 'assets/images/capsule.svg';
      case 'cream':
        return 'assets/images/cream.svg';
      default:
        return 'assets/images/tablet.svg';
    }
  }
}
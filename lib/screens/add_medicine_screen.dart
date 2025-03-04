import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_button.dart';

class AddMedicineScreen extends StatelessWidget {
  AddMedicineScreen({Key? key}) : super(key: key);

  final TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Medicines',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Medicine Name',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Compartment',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: ChoiceChip(
                      label: Text('${index + 1}'),
                      selected: index == 0,
                      selectedColor: Colors.blue[100],
                      onSelected: (bool selected) {},
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Colour',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Colors.pink[100],
                  Colors.purple[100],
                  Colors.red[100],
                  Colors.green[100],
                  Colors.orange[100],
                  Colors.blue[100],
                ].map((color) => _buildColorCircle(color!)).toList(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Type',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildTypeOption('Tablet', 'assets/images/tablet.svg'),
                const SizedBox(width: 12),
                _buildTypeOption('Capsule', 'assets/images/capsule.svg'),
                const SizedBox(width: 12),
                _buildTypeOption('Cream', 'assets/images/cream.svg'),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Quantity',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: quantityController,
                    decoration: const InputDecoration(
                      hintText: 'Take 1/2 Pill',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildDateSection('Set Date', 'Today', 'End Date'),
            const SizedBox(height: 24),
            _buildDropdownSection('Frequency of Days', 'Everyday'),
            const SizedBox(height: 24),
            _buildDropdownSection('How many times a Day', 'Three Time'),
            const SizedBox(height: 24),
            _buildTimeSlots(),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildTimingChip('Before Food', true),
                const SizedBox(width: 12),
                _buildTimingChip('After Food', false),
                const SizedBox(width: 12),
                _buildTimingChip('Before Sleep', false),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Add',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
  Widget _buildTypeOption(String label, String svgAsset) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              svgAsset,
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection(String title, String start, String end) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: Text(start),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: Text(end),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownSection(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlots() {
    return Column(
      children: List.generate(
        3,
        (index) => ListTile(
          leading: const Icon(Icons.access_time),
          title: Text('Dose ${index + 1}'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }

  Widget _buildTimingChip(String label, bool isSelected) {
    return Expanded(
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: Colors.blue[100],
        onSelected: (bool selected) {},
      ),
    );
  }
}
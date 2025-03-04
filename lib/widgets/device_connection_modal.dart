import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_button.dart';

class DeviceConnectionModal extends StatelessWidget {
  const DeviceConnectionModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your Device is not connected',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/device_disconnected.png',
              height: 120,
            ),
            const SizedBox(height: 24),
            Text(
              'Connect your device with',
              style: GoogleFonts.inter(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: '',
                    icon: Icons.bluetooth,
                    onPressed: () {},
                    height: 45,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: '',
                    icon: Icons.wifi,
                    onPressed: () {},
                    height: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
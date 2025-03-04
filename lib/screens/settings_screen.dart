import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileSection(),
              _buildSettingsSection(),
              _buildDeviceSection(),
              _buildCaretakersSection(),
              _buildDoctorSection(),
              _buildFooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return ListTile(
      contentPadding: const EdgeInsets.all(20),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
      title: Text(
        'Take Care!',
        style: GoogleFonts.inter(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      ),
      subtitle: Text(
        'Harry Potter',
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Settings',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildSettingTile(
          icon: Icons.notifications_none,
          title: 'Notification',
          subtitle: 'Check your medicine notification',
        ),
        _buildSettingTile(
          icon: Icons.volume_up_outlined,
          title: 'Sound',
          subtitle: 'Ring, Silent, Vibrate',
        ),
        _buildSettingTile(
          icon: Icons.person_outline,
          title: 'Manage Your Account',
          subtitle: 'Password, Email ID, Phone Number',
        ),
      ],
    );
  }

  Widget _buildDeviceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Device',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildSettingTile(
          icon: Icons.bluetooth_outlined,
          title: 'Connect',
          subtitle: 'Bluetooth, Wi-Fi',
        ),
        _buildSettingTile(
          icon: Icons.volume_up_outlined,
          title: 'Sound Option',
          subtitle: 'Ring, Silent, Vibrate',
        ),
      ],
    );
  }

  Widget _buildCaretakersSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Caretakers: 03',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCaretakerItem('Doc Laura', 'assets/images/caretaker0.png'),
                _buildCaretakerItem('Ron Sult', 'assets/images/caretaker1.png'),
                _buildCaretakerItem('Sunny Tim', 'assets/images/caretaker2.png'),
                _buildAddCaretakerItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaretakerItem(String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCaretakerItem() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          Text(
            'Add',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDoctorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Doctor',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildSettingTile(
          icon: Icons.add,
          title: 'Add Your Doctor',
          subtitle: 'Or use invite link',
        ),
      ],
    );
  }

  Widget _buildFooterSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildTextButton('Privacy Policy'),
          _buildTextButton('Terms of Use'),
          _buildTextButton('Rate Us'),
          _buildTextButton('Share'),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: Colors.grey[300]!),
              ),
              child: Text(
                'Log Out',
                style: GoogleFonts.inter(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget _buildTextButton(String text) {
    return TextButton(
      onPressed: () {},
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
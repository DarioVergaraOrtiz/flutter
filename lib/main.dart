import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const DivorcePartyApp());
}

class DivorcePartyApp extends StatelessWidget {
  const DivorcePartyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divorce Party',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'PoetsenOne', // Fuente global
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20), // Tamaño base para textos
        ),
      ),
      home: const Scaffold(
        body: SafeArea(
          child: MainContent(),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF631A8A),
      child: Column(
        children: [
          HeaderSection(),
          const SizedBox(height: 20),
          Expanded(
            child: InfoSection(),
          ),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/party_bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            left: 16,
            top: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Te invito a mi:',
                  style: TextStyle(
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    color: Color.lerp(
                      const Color(0xFFD3B2F9),
                      Colors.white,
                      0.2,
                    ),
                    fontFamily: 'PoetsenOne', 
                  ),
                ),
                Text(
                  'Divorce Party',
                  style: TextStyle(
                    fontSize: 60, 
                    color: const Color(0xFFD3B2F9),
                    height: 1.0,
                    fontFamily: 'PoetsenOne', 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class InfoSection extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          _InfoItem(
            iconPath: 'assets/icons/ic_location.png',
            text: 'Lugar: Universidad Central del Ecuador',
            color: const Color(0xFF2196F3),
            onTap: () => _launchUrl('geo:0,0?q=Universidad Central del Ecuador'),
          ),
          _InfoItem(
            iconPath: 'assets/icons/ic_calendar.png',
            text: 'Fecha: 23 de Mayo, 2025',
            color: const Color(0xFFFFC107),
          ),
          _InfoItem(
            iconPath: 'assets/icons/ic_share.png',
            text: 'Dress Code: Party dress',
            color: Colors.white,
            onTap: () => _launchUrl(
                'https://ar.pinterest.com/search/pins/?q=Party%20dress%20negro&rs=typed'),
          ),
          _InfoItem(
            iconPath: 'assets/icons/instagram.png',
            text: 'Instagram: @gabylizeth77',
            color: const Color(0xFFE91E63),
            onTap: () => _launchUrl(
                'https://www.instagram.com/gabylizeth77?igsh=MTF6cHZ2MmF3NmFueg&utm_source=qr'),
          ),
          _InfoItem(
            iconPath: 'assets/icons/ic_phone.png',
            text: 'Teléfono: +593 987654321',
            color: const Color(0xFF4CAF50),
            onTap: () => _launchUrl('tel:+593987654321'),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color color;
  final VoidCallback? onTap;

  const _InfoItem({
    required this.iconPath,
    required this.text,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 40,
              height: 40,
              color: color,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'PoetsenOne', 
                  package: null, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
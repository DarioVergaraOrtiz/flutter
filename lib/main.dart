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
        fontFamily: 'PoetsenOne',
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF631A8A),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HeaderSection(),
            SizedBox(height: 20),
            InfoSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.asset(
            'assets/images/party_bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 16,
          top: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Te invito a mi:',
                style: TextStyle(
                  fontSize: 55,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFD3B2F9),
                ),
              ),
              Text(
                'Divorce Party',
                style: TextStyle(
                  fontSize: 70,
                  fontFamily: 'PoetsenOne',
                  color: Color(0xFFD3B2F9),
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'No se pudo abrir \$url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoItem(
          icon: Icons.location_on,
          text: 'Lugar: Universidad Central del Ecuador',
          color: Colors.blue,
          onTap: () => _launchUrl('geo:0,0?q=Universidad Central del Ecuador'),
        ),
        InfoItem(
          icon: Icons.calendar_today,
          text: 'Fecha: 23 de Mayo, 2025',
          color: Colors.amber,
          onTap: null,
        ),
        InfoItem(
          icon: Icons.share,
          text: 'Dress Code: Party dress',
          color: Colors.white,
          onTap: () => _launchUrl(
              'https://ar.pinterest.com/search/pins/?q=Party%20dress%20negro&rs=typed'),
        ),
        InfoItem(
          icon: null,
          text: 'Instagram: @gabylizeth77',
          color: Colors.pink,
          assetIcon: 'assets/icons/instagram.png',
          onTap: () => _launchUrl(
              'https://www.instagram.com/gabylizeth77?igsh=MTF6cHZ2MmF3NmFueg&utm_source=qr'),
        ),
        InfoItem(
          icon: Icons.phone,
          text: 'Teléfono: +593 987654321',
          color: Colors.green,
          onTap: () => _launchUrl('tel:+593987654321'),
        ),
      ],
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData? icon;
  final String? assetIcon;
  final String text;
  final Color color;
  final VoidCallback? onTap;

  const InfoItem({
    super.key,
    this.icon,
    this.assetIcon,
    required this.text,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget leading;
    if (assetIcon != null) {
      leading = Image.asset(
        assetIcon!,
        width: 40,
        height: 40,
        color: color,
      );
    } else {
      leading = Icon(icon, color: color, size: 40);
    }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

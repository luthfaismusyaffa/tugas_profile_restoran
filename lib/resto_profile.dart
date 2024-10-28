import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RestoProfile extends StatelessWidget {
  final String restoName = "Rm. Arimbi Udinus";
  final String description = "Restoran dengan hidangan lezat dan layanan terbaik, di UDINUS.";
  final String address = "Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131";
  final String openingHours = "Senin - Minggu: 10:00 - 22:00";
  final String email = "sekretariat@dinus.id";
  final String phone = "(024)3517261";

  final List<Map<String, String>> menuItems = [
    {
      "name": "Nasi Goreng",
      "image": "images/nasigoreng.png",
    },
    {
      "name": "Ayam Bakar",
      "image": "images/ayambakar.png",
    },
    {
      "name": "Sate Ayam",
      "image": "images/sateayam.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restoName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/gambar1.png"), // Gambar profil dari folder assets
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () => _launchEmail(),
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () => _launchPhone(),
                ),
                IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () => _launchMaps(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              "Deskripsi:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Text(description),
            SizedBox(height: 16.0),
            Text(
              "List Menu:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: [
                        Text(
                          menuItems[index]['name']!,
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.0),
                        Image.asset(
                          menuItems[index]['image']!,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Jam Buka:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Text(openingHours),
            SizedBox(height: 16.0),
            Text(
              "Alamat:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Text(address),
          ],
        ),
      ),
    );
  }

  void _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    await launchUrl(phoneUri);
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(emailUri);
  }

  void _launchMaps() async {
    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}';
    final Uri mapUri = Uri.parse(googleMapsUrl);
    await launchUrl(mapUri);
  }
}

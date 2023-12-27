import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobil Uygulama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobil Uygulama'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          buildListTile(context, 'Bakiye Yükleme', BakiyeYuklemeScreen()),
          buildListTile(context, 'Sefer Bilgileri', SeferBilgileriScreen()),
          buildListTile(context, 'İstasyon Bilgileri', IstasyonBilgileriScreen()),
          buildListTile(context, 'Kart Kontrol', KartKontrolScreen()),
          buildListTile(context, 'Otomatik Bakiye Dolumu', OtomatikDolumScreen()),
          buildListTile(context, 'Ulaşılabilir Duraklar', UlasilabilirDuraklarScreen()),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class BakiyeYuklemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bakiye Yükleme'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Kart İsmi'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Kart Numarası'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'SKT'),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'CVV'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Yükleme işlemi kodu buraya gelecek
              },
              child: Text('Yükleme Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

class SeferBilgileriScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sefer Bilgileri'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Saat')),
              DataColumn(label: Text('Sefer Bilgisi')),
            ],
            rows: List.generate(
              32,
                  (index) => DataRow(cells: [
                DataCell(Text('${7 + (index ~/ 2)}:${index % 2 == 0 ? '00' : '30'}')),
                DataCell(Text('Üniversite Aracı - İstasyon X')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class IstasyonBilgileriScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İstasyon Bilgileri'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Muş/Alparslan Üniversitesi Karşısı Durağı'),
            // Ek bilgiler buraya eklenebilir
          ],
        ),
      ),
    );
  }
}

class KartKontrolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kart Kontrol'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Kart Sahibi'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Kart Numarası'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Yükleme işlemi kodu buraya gelecek
              },
              child: Text('Yükleme Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

class OtomatikDolumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otomatik Bakiye Dolumu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Otomatik Yükleme İstediğiniz Kartı Ekleyin'),
            // Kart ekleme alanları buraya eklenebilir
          ],
        ),
      ),
    );
  }
}

class UlasilabilirDuraklarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulaşılabilir Duraklar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ulaşılabilir duraklarla ilgili bilgiler buraya eklenebilir
          ],
        ),
      ),
    );
  }
}

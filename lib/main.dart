// Flutter ve materyal paketlerini projeye dahil ediyoruz.
import 'package:flutter/material.dart';

// Uygulama burada başlıyor.
void main() {
  runApp(MyApp());
}

// MyApp sınıfını oluşturuyoruz ve StatelessWidget sınıfından kalıtım alıyoruz.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp bileşenini kullanarak uygulama özelliklerini belirtiyoruz.
    return MaterialApp(
      title: 'Mobil Uygulama', // Uygulama başlığı
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // Tema renk skalası
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaEkran(), // Ana ekranı uygulamanın başlangıç ekranı olarak belirtiyoruz.
    );
  }
}

// AnaEkran adında bir StatefulWidget sınıfı oluşturuyoruz.
class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

// _AnaEkranState, AnaEkran sınıfının durumuyla ilgili bilgileri tutar.
class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    // Scaffold bileşeni, temel materyal tasarım yapısını sağlar.
    return Scaffold(
      appBar: AppBar(
        title: Text('Muş Ulaşım Kartı Mobil Uygulaması'), // Başlık çubuğu
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green, // Yeşil arka plan rengi
          image: DecorationImage(
            image: NetworkImage(
              'https://kulturportali.gov.tr/repoKulturPortali/large/13022013/ac2fbbcc-fdc9-4a43-83cf-f7f758273498.JPG?format=jpg&quality=50', // Arka plan görüntüsü
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Her buton için özel bir işlevsel buton oluşturmak için buildRoundedButton metodu kullanılır.
                buildRoundedButton(context, 'Bakiye Yükleme', BakiyeYuklemeScreen()),
                SizedBox(height: 10), // Aralarda biraz boşluk bırakıyoruz
                buildRoundedButton(context, 'Sefer Bilgileri', SeferBilgileriScreen()),
                SizedBox(height: 10),
                buildRoundedButton(context, 'İstasyon Bilgileri', IstasyonBilgileriScreen()),
                SizedBox(height: 10),
                buildRoundedButton(context, 'Kart Kontrol', KartKontrolScreen()),
                SizedBox(height: 10),
                buildRoundedButton(context, 'Otomatik Bakiye Dolumu', OtomatikDolumScreen()),
                SizedBox(height: 10),
                buildRoundedButton(context, 'Ulaşılabilir Duraklar', UlasilabilirDuraklarScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Yuvarlak şekilli butonlar oluşturmak için buildRoundedButton metodu kullanılır.
  Widget buildRoundedButton(BuildContext context, String title, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40), // Buton içeriğine biraz boşluk bırakıyoruz
        child: Text(title),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Yuvarlak kenarlı buton
        ),
        primary: Colors.blueGrey, // gri renkli buton
      ),
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
                DataCell(Text('Üniversite Aracı - Belediye')),
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
            Expanded(
              child: Image.network(
                'https://www.uyduharita.org/wp-content/uploads/mus-uydu-goruntusu2-1280x720.gif',
                fit: BoxFit.cover, // Görüntüyü ekran boyutuna sığacak şekilde genişletir
              ),
            ),
            // Diğer bileşenler buraya eklenebilir
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
              child: Text('Kontrol Et'),
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
              child: Text('Kart Kayıt'),
            ),
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
            Image.network('https://image.milimaj.com/i/milliyet/75/869x477/5da3a13a45d2a0b778a09499.jpg'),
            Image.network('https://foto.sondakika.com/haber/2018/03/10/mus-ta-kapali-duraklarin-sayisi-arttiriliyor-10642651_amp.jpg'),
            Image.network('http://www.mus.bel.tr/kurumlar/mus.bel.tr/haberler/2022/AGUSTOS/23082022/23082022-2/300051749_437327385087841_4695141298342224900_n.jpg'),
            // Diğer bileşenler buraya eklenebilir
          ],
        ),
      ),
    );
  }
}


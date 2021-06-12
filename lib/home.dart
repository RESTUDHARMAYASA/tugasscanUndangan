import 'package:flutter/material.dart';
import 'package:flutter_application_1/undanganList.dart';
import 'qr.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Kehadiran Undangan"),
        leading: Icon(Icons.people_alt),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UndanganList()));
                },
                child: Text(
                  "Daftar Undangan",
                  style: TextStyle(fontSize: 40, color: Colors.cyanAccent),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRViewExample()),
                  );
                },
                child: Text(
                  "Cek QR Code",
                  style: TextStyle(fontSize: 40, color: Colors.amber),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.people),
                        title: Text("Total Undangan : 10"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.star, color: Colors.blue),
                        title: Text("Hadir : 8"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.star, color: Colors.grey),
                        title: Text("Belum Hadir : 2"),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

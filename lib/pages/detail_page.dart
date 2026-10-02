import 'package:flutter/material.dart';
import '../data.dart';

class DetailPage extends StatelessWidget {
  final Shoe shoe;

  const DetailPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    int _counter = 0;

    void _incrementCounter(){
      setState((){
        _counter++;
      });

    }
    return Scaffold(
      appBar: AppBar(title: Text(shoe.shoeName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                shoe.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 200,
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.snowshoeing_sharp, size: 64)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              shoe.shoeName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              shoe.category,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            SizedBox(height: 12),
            Text(
              shoe.price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),

          //     SizedBox( height: 12),
          //       Text('$_counter'),
          //     FloatingActionButton(
          //       onPressed: _incrementCounter,
          //       tooltip: 'Increment',
          //       child: const Text('-'),
          //     ),
          //     const Text(
          //       'Jumlah Produk',
          //       style: TextStyle(fontWeight: FontWeight.w600),
          //     ),
          //     FloatingActionButton(
          //       onPressed: _incrementCounter,
          //       tooltip: 'Increment',
          //       child: const Icon(Icons.add),
          //     ),
          //     ),
          //   const SizedBox(height: 12),
          //   const Text(
          //     'Deskripsi',
          //     style: TextStyle(fontWeight: FontWeight.w600),
          //   ),
          //   const SizedBox(height: 4),
          //   Text(shoe.description, style: const TextStyle(fontSize: 13)),
          //
          //   const Text(
          //     'Stok: ',
          //     style: TextStyle(fontWeight: FontWeight.w600),
          //   ),
          //     const SizedBox(height: 4),
          //     Text(shoe.stock as String, style: const TextStyle(fontSize: 13)),
          // ],
        ),
      ]),
    ));
  }

  void setState(Null Function() param0) {}
}
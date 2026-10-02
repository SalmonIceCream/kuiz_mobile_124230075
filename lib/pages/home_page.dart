import 'package:flutter/material.dart';
import '../data.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _query = '';
  String _selectedCategory = 'Semua';

  final List<String> _categories = ['Semua', 'Running', 'Sneakers', 'Basketball'];

  List<Shoe> get _filteredShoes {
    return _filteredShoes.where((m) {
      final matchCategory =
          _selectedCategory == 'Semua' || m.category == _selectedCategory;
      final matchQuery = m.shoeName.toLowerCase().contains(_query.toLowerCase());
      return matchCategory && matchQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filteredShoes;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Cari sepatu',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          // BONUS: Filter kategori
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final cat = _categories[i];
                return ChoiceChip(
                  label: Text(cat),
                  selected: _selectedCategory == cat,
                  onSelected: (_) => setState(() => _selectedCategory = cat),
                );
              },
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? const Center(child: Text('Sepatu tidak ditemukan'))
                : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final shoe = items[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      shoe.image,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  title: Text(shoe.shoeName),
                  subtitle: Text('${shoe.category} • ${shoe.price}  • ${shoe.likes}  • ${shoe.stock}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(shoe: shoe,),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
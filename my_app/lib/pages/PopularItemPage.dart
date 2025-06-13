import 'package:flutter/material.dart';

class PopularItemDetailPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const PopularItemDetailPage({super.key, required this.item});

  @override
  State<PopularItemDetailPage> createState() => _PopularItemDetailPageState();
}

class _PopularItemDetailPageState extends State<PopularItemDetailPage> {
  String selectedSize = 'Small (₹ 450)';
  String spiceLevel = 'Mild';
  int quantity = 1;
  int tableNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.item['image'], height: 200, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.item['title'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(widget.item['rating'])
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text("• 50+ Orders"),
                const Spacer(),
                Text(widget.item['price'],
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "About This Item",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "A fiery twist on a classic! This spicy vegetarian Margherita pizza has a thin, crispy crust with zesty, chili-infused tomato sauce, mozzarella, fresh basil, and spicy olive oil.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text(
              "Customize",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Size:"),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                choiceChip('Small (₹ 450)'),
                choiceChip('Medium (₹ 550)'),
                choiceChip('Large (₹ 750)'),
              ],
            ),
            const SizedBox(height: 12),
            const Text("Spice Level:"),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                spiceChip('Mild'),
                spiceChip('Medium'),
                spiceChip('Extra Spicy'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("Quantity:"),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(quantity.toString()),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                  labelText: "Enter Your Table Number", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  tableNumber = int.tryParse(value) ?? 1;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Order Placed!"),
                ));
              },
              child: const Text("Place Order", style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }

  Widget choiceChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedSize == label,
      onSelected: (val) {
        setState(() {
          selectedSize = label;
        });
      },
      selectedColor: Colors.orange,
    );
  }

  Widget spiceChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: spiceLevel == label,
      onSelected: (val) {
        setState(() {
          spiceLevel = label;
        });
      },
      selectedColor: Colors.orange,
    );
  }
}

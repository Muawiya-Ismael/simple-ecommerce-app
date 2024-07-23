import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_app/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  final Cart _cartOfShoes = Cart();
  late List<Shoe> _shoesFounded;

  @override
  void initState() {
    super.initState();
    _shoesFounded = _cartOfShoes.getShoeList();
  }

  onSearch(String value) {
    setState(() {
      _shoesFounded = _cartOfShoes.getShoeList()
          .where((shoe) => shoe.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
      context: context,
      builder: (context) =>
      const AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cartOfShoes, child) =>
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(

                    onChanged: (value) => onSearch(value),

                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      hintText: "Search",
                    ),
                  )
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  "Everyone runs... some run faster than others.",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hot Picks 🔥",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 10.0),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(right: 25.0),
                  itemCount: _shoesFounded.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = _shoesFounded[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                ),
              )

            ],
          ),
    );
  }
}


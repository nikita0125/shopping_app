import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; //for state management , its very close to inherited widget thats why is creates a store
import 'package:shopping_app/cart_provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart;
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      //
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart',
            style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 40)),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                cartItem['imageUrl'] as String,
              ),
              radius: 45,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  // barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete Item'),
                      content: const Text(
                          'Are you sure you want to remove the item?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'No',
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 40, 110, 230),
                                      fontSize: 20)),
                            )),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .removeProduct(cartItem);
                              // Provider.of<CartProvider>(context, listen: false)
                              //     .removeProduct(cartItem);

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Yes',
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 241, 43, 43),
                                      fontSize: 20)),
                            ))
                      ],
                    );
// return Dialog(
//   child: Text('are you sure you want to remove the item?',style: GoogleFonts.lato(textStyle:const TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),),

// );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodySmall),
            ),
            subtitle: Text('size:${cartItem['size']}'),
          );
        },
      ),
    );
  }
}

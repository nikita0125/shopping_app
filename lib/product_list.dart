import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details_page.dart';

import 'package:shopping_app/global_variabls.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'ALL',
    'NIKE',
    'JORDAN',
    'ADDIDAS',
    'BATA',
    'PUMA'
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  //inherited model listens to only one property but inherited widget listens to the entire class
  //lyout builder takes the height and width inposed on it by the parent widget but media query dont look for constraints it will take as much height and width as required no matterw hat the constaraits are
  // media query takes entire width

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);

    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(45)),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 151, 151, 151),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 3),
                  child: Text(
                    'Shoes \nCollection',
                    style: GoogleFonts.firaSans(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'search here ',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      // enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 105,
              child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        label: Text(
                          filter,
                          style: GoogleFonts.lato(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(0, 147, 147, 147),
                        side: const BorderSide(
                          color: Color.fromARGB(0, 147, 147, 147),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
           
            Expanded(child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 1080) {
                return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(
                                  product: products[index]);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        productCardColor: index.isEven
                            ? const Color.fromRGBO(215, 242, 255, 1)
                            : const Color.fromRGBO(255, 252, 241, 1),
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  // scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(
                                  product: products[index]);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        productCardColor: index.isEven
                            ? const Color.fromRGBO(215, 242, 255, 1)
                            : const Color.fromRGBO(255, 252, 241, 1),
                      ),
                    );
                  },
                );
              }
            })),
            // Expanded(
            //   child: size.width > 650
            //       ? GridView.builder(
            //           itemCount: products.length,

            //           gridDelegate:
            //               const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 2,
            //                   crossAxisCount: 2),
            //           itemBuilder: (context, index) {
            //             final product = products[index];
            //             return GestureDetector(
            //               onTap: () {
            //                 Navigator.of(context).push(
            //                   MaterialPageRoute(
            //                     builder: (context) {
            //                       return ProductDetailsPage(
            //                           product: products[index]);
            //                     },
            //                   ),
            //                 );
            //               },
            //               child: ProductCard(
            //                 title: product['title'] as String,
            //                 price: product['price'] as double,
            //                 image: product['imageUrl'] as String,
            //                 productCardColor: index.isEven
            //                     ? const Color.fromRGBO(215, 242, 255, 1)
            //                     : const Color.fromRGBO(255, 252, 241, 1),
            //               ),
            //             );
            //           },
            //         )
            //       : ListView.builder(
            //           // scrollDirection: Axis.vertical,
            //           itemCount: products.length,
            //           itemBuilder: (context, index) {
            //             final product = products[index];
            //             return GestureDetector(
            //               onTap: () {
            //                 Navigator.of(context).push(
            //                   MaterialPageRoute(
            //                     builder: (context) {
            //                       return ProductDetailsPage(
            //                           product: products[index]);
            //                     },
            //                   ),
            //                 );
            //               },
            //               child: ProductCard(
            //                 title: product['title'] as String,
            //                 price: product['price'] as double,
            //                 image: product['imageUrl'] as String,
            //                 productCardColor: index.isEven
            //                     ? const Color.fromRGBO(215, 242, 255, 1)
            //                     : const Color.fromRGBO(255, 252, 241, 1),
            //               ),
            //             );
            //           },
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}

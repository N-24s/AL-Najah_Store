import 'package:al_najah_store/models/shop/search_suggestion.dart';
import 'package:al_najah_store/view_model_vm/shop/search/search_vm.dart';
import 'package:al_najah_store/view_model_vm/shop/product_vm.dart';
import 'package:al_najah_store/views/Shop/product_details/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final ProductVM productVM = Get.find<ProductVM>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context); 
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); 
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredProducts = productVM.products.where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
      .map((product) {
        return ProductSuggestion(id: product.id.toString(), name: product.name);
      }).toList();

    if (filteredProducts.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return ListView.builder(
      itemCount:filteredProducts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredProducts[index].name),
          onTap: () {
            productVM.getProductDetails((int.parse(filteredProducts[index].id)-30).toString());
            print("${filteredProducts[index].id}");
            Get.to(() => const ProductDetail()); 
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(); 
    }

    final suggestions = productVM.products
           .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
      .map((product) {
        return ProductSuggestion(id: product.id.toString(), name: product.name);
      }).toList();

    if (suggestions.isEmpty) {
      return Center(child: Text('No suggestions available'));
    }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
          onTap: () {
            print("suggestionssuggestions${suggestions[index].id}");
            query = suggestions[index].name; 
            showResults(context); 
          },
        );
      },
    );
  }
}






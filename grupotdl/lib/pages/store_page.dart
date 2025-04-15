import 'package:flutter/material.dart';
import 'package:grupotdl/widgets/product_card.dart';

class LojaPage extends StatelessWidget {
  LojaPage({super.key});

  final List<Map<String, String>> produtos = [
    {
      'nome': 'Gift Card',
      'preco': 'R\$ 500 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
    {
      'nome': 'Pacote de Moedas',
      'preco': 'R\$ 200 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
    {
      'nome': 'Desconto Premium',
      'preco': 'R\$ 100 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
    {
      'nome': 'Super Oferta',
      'preco': 'R\$ 50 Tokens',
      'imagem': 'assets/giftcard.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 600 ? 2 : 3;

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return ProductCard(
            nome: produto['nome']!,
            preco: produto['preco']!,
            imagem: produto['imagem']!,
            onConfirm: () {
              debugPrint('Produto comprado: ${produto['nome']}');
            },
          );
        },
      ),
    );
  }
}

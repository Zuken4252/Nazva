import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [

          /// Растягивающийся AppBar
          const SliverAppBar.large(
            title: Text("Корзина"),
          ),

          /// Основной контент
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Иконка и текст по центру
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Center(
                          child: Icon(
                            Icons.inbox_outlined,
                            size: 80,
                            color: Colors.black26,
                          ),
                        ),

                        SizedBox(height: 12),

                        Center(
                          child: Text(
                            "Здесь будут отображаться ваши купленные экскурсии",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  /// Кнопки Регистрация и Вход
                  Row(
                    children: [

                      Expanded(
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                            foregroundColor: Colors.black87,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            minimumSize: const Size(0, 56),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.app_registration),
                          label: const Text("Регистрация"),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                            foregroundColor: Colors.black87,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            minimumSize: const Size(0, 56),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.login),
                          label: const Text("Вход"),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 16),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
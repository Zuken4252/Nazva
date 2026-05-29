import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: CustomScrollView(
        slivers: [

          /// Растягивающийся AppBar
          const SliverAppBar.large(
            title: Text("Профиль"),
          ),

          /// Основной контент
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  /// Аватар + имя
                  Row(
                    children: [

                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurple.shade100,
                        child: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Card(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Гость",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "Вы в гостевом аккаунте",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  /// Иконка и текст по центру
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.account_circle,
                          size: 80,
                          color: Colors.black26,
                        ),

                        SizedBox(height: 12),

                        Text(
                          "Вы не авторизованы",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
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
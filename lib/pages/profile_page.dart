import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль"),
      ),

      body: Padding(
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

                const Column(
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
                      "Вы не вошли в аккаунт",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  ],
                )

              ],
            ),

            const SizedBox(height: 30),

            /// Кнопки
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade100,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Войти",
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                const SizedBox(width: 10),

                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Редактировать"),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
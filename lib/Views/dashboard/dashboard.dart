import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.primary;
    const currentIndex = 0;
    const username = "Raed";
    const bool notifications = false;
    const double balance = 150.0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 2),
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.menu_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Text(
                                    "good evening,",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    username,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(1.0),
                                onPressed: () {},
                                icon: notifications
                                    ? const Icon(
                                        Icons.notifications_on,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.notifications_outlined,
                                        color: Colors.white,
                                      ),
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(1.0),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.history_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Balance
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Your Total Balance",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                              Text(
                                "${balance.toString()}DT",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_right_outlined,
                                size: 45,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.hotel_outlined),
                        label: const Text("Hotel"),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.villa_outlined),
                        label: const Text("Villa"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Best Rated:",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11.0,
        unselectedFontSize: 9.0,
        iconSize: 28,
        useLegacyColorScheme: false,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? const Icon(
                    Icons.home_filled,
                  )
                : const Icon(
                    Icons.home_outlined,
                  ),
            label: "Home",
            backgroundColor: backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? const Icon(
                    Icons.bookmark_outlined,
                  )
                : const Icon(
                    Icons.bookmark_outline,
                  ),
            label: "Bookmarked",
            backgroundColor: backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.search_outlined,
            ),
            label: "Discover",
            backgroundColor: backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.app_registration_rounded,
            ),
            label: "Registration",
            backgroundColor: backgroundColor,
          ),
        ],
      ),
    );
  }
}

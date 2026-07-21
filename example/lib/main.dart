import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:collapsible_sidebar/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sidebar ui',
      theme: AppTheme.light.copyWith(
        iconTheme: const IconThemeData(weight: 200),
      ),
      darkTheme: AppTheme.dark.copyWith(
        iconTheme: const IconThemeData(weight: 200),
      ),
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: const SidebarPage(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Yay! Button Pressed!')));
              },
              child: const Icon(CupertinoIcons.location),
            ),
          );
        },
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});
  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  final AssetImage _avatarImg = AssetImage('assets/man.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
          text: 'Dashboard',
          icon: CupertinoIcons.chart_bar,
          onPressed: () => setState(() => _headline = 'DashBoard'),
          onHold: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: const Text("Dashboard"))),
          isSelected: true,
          subItems: [
            CollapsibleItem(
              text: 'Menu',
              icon: CupertinoIcons.book,
              onPressed: () => setState(() => _headline = 'Menu'),
              onHold: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: const Text("Menu"))),
              isSelected: true,
            ),
            CollapsibleItem(
                text: 'Shop',
                iconImage: AssetImage("assets/shop_icon.png"),
                icon: CupertinoIcons.snow,
                onPressed: () => setState(() => _headline = 'Shop'),
                onHold: () => ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: const Text("Shop"))),
                isSelected: true,
                subItems: [
                  CollapsibleItem(
                    text: 'Cart',
                    icon: CupertinoIcons.cart,
                    onPressed: () => setState(() => _headline = 'Cart'),
                    onHold: () => ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: const Text("Cart"))),
                    isSelected: true,
                  )
                ]),
          ]),
      CollapsibleItem(
        text: 'Search',
        icon: CupertinoIcons.search,
        onPressed: () => setState(() => _headline = 'Search'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Search"))),
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: CupertinoIcons.bell,
        onPressed: () => setState(() => _headline = 'Notifications'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Notifications"))),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: CupertinoIcons.settings,
        onPressed: () => setState(() => _headline = 'Settings'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Settings"))),
      ),
      CollapsibleItem(
        text: 'Alarm',
        icon: CupertinoIcons.alarm,
        onPressed: () => setState(() => _headline = 'Alarm'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Alarm"))),
      ),
      CollapsibleItem(
        text: 'Eco',
        icon: CupertinoIcons.leaf_arrow_circlepath,
        onPressed: () => setState(() => _headline = 'Eco'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Eco"))),
      ),
      CollapsibleItem(
        text: 'Event',
        icon: CupertinoIcons.calendar,
        onPressed: () => setState(() => _headline = 'Event'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Event"))),
      ),
      CollapsibleItem(
        text: 'No Icon',
        onPressed: () => setState(() => _headline = 'No Icon'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("No Icon"))),
      ),
      CollapsibleItem(
        text: 'Email',
        icon: CupertinoIcons.mail,
        onPressed: () => setState(() => _headline = 'Email'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Email"))),
      ),
      CollapsibleItem(
          text: 'News',
          iconImage: AssetImage("assets/news_icon.png"),
          onPressed: () => setState(() => _headline = 'News'),
          onHold: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: const Text("News"))),
          subItems: [
            CollapsibleItem(
              text: 'Old News',
              icon: CupertinoIcons.time,
              onPressed: () => setState(() => _headline = 'Old News'),
              onHold: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: const Text("Old News"))),
            ),
            CollapsibleItem(
                text: 'Current News',
                icon: CupertinoIcons.rosette,
                onPressed: () => setState(() => _headline = 'Current News'),
                onHold: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text("Current News"))),
                subItems: [
                  CollapsibleItem(
                    text: 'News 1',
                    icon: CupertinoIcons.circle,
                    onPressed: () => setState(() => _headline = 'News 1'),
                    onHold: () => ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: const Text("News 1"))),
                  ),
                  CollapsibleItem(
                      text: 'News 2',
                      icon: CupertinoIcons.circle,
                      onPressed: () => setState(() => _headline = 'News 2'),
                      onHold: () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: const Text("News 2"))),
                      subItems: [
                        CollapsibleItem(
                          text: 'News 2 Detail',
                          icon: CupertinoIcons.circle,
                          onPressed: () =>
                              setState(() => _headline = 'News 2 Detail'),
                          onHold: () => ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                                  content: const Text("News 2 Detail"))),
                        )
                      ]),
                  CollapsibleItem(
                    text: 'News 3',
                    icon: CupertinoIcons.circle,
                    onPressed: () => setState(() => _headline = 'News 3'),
                    onHold: () => ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: const Text("News 3"))),
                  )
                ]),
            CollapsibleItem(
              text: 'New News',
              icon: CupertinoIcons.building_2_fill,
              onPressed: () => setState(() => _headline = 'New News'),
              onHold: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: const Text("New News"))),
            ),
          ]),
      CollapsibleItem(
        text: 'Face',
        icon: CupertinoIcons.smiley,
        onPressed: () => setState(() => _headline = 'Face'),
        onHold: () => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text("Face"))),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        collapseOnBodyTap: false,
        avatarImg: _avatarImg,
        title: 'John Smith',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        body: _body(size, context),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        selectedTextColor: Theme.of(context).colorScheme.primary,
        selectedIconColor: Theme.of(context).colorScheme.onPrimaryContainer,
        selectedIconBox: Theme.of(context).colorScheme.primaryContainer,
        toggleButtonIconColor: Theme.of(context).colorScheme.primary,
        unselectedTextColor: Theme.of(context).colorScheme.onSurfaceVariant,
        unselectedIconColor: Theme.of(context).colorScheme.onSurfaceVariant,
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15,
            ),
        titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
        toggleTitleStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
        sidebarBoxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text(
                _headline,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Select an option from the sidebar',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

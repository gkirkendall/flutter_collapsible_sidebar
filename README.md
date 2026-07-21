# collapsible_sidebar

---

A collapsible sidebar for Flutter apps implementing Material Design, upgraded for **Flutter 3.x** and **Material 3** with built-in **FlexColorScheme** integration.

---

## 🌟 Version 3.0.0 - Flutter 3 Upgrade ✨

This is an updated fork of `collapsible_sidebar` modernized for Flutter 3.x, Android v2 embedding, modern Java/Gradle tools, and seamless dark/light theme support powered by [`flex_color_scheme`](https://pub.dev/packages/flex_color_scheme).

### 🚀 Key Fork Improvements in v3.0.0
- **Flutter 3.x Compatibility**: Modernized Dart SDK constraints (`>=3.0.0 <4.0.0`) and updated core APIs.
- **Android V2 Embedding & Gradle Upgrade**: Fully compatible with recent AGP and Java versions for Android builds.
- **Material 3 & Theme Support**: Built-in `AppTheme` helpers (`lib/color_theme.dart`) with `FlexColorScheme` integration.
- **Multi-Platform Support**: Tested across Web, Android, iOS, macOS, Linux and Windows desktop.
- **Overflow Fixes**: Resolved `RenderFlex` overflow issues in collapsed/expanded transitions and item text rendering.

---

## Features

- Material Design styling
- Pre-built customizable tile widgets (`CollapsibleItem`s)
- Smooth collapse/expand animations
- Supports LTR & RTL languages
- Multi-level nested menus
- Alert badges with custom counts on items
- Integrated `FlexColorScheme` light & dark themes

## Supported Platforms

- 📱 Flutter Android
- 📱 Flutter iOS
- 🌐 Flutter Web
- 🖥️ Flutter Desktop (macOS, Linux & Windows)

---

## Live Preview

Check out the interactive web demo:
👉 **[https://gkirkendall.github.io/flutter_collapsible_sidebar/](https://gkirkendall.github.io/flutter_collapsible_sidebar/)**

> **Note**: Built with Flutter Web. For the best mobile preview experience, open on a mobile device or desktop browser.

---

## Installation

Add `collapsible_sidebar` to your `pubspec.yaml`:

```yaml
dependencies:
  collapsible_sidebar:
    git:
      url: https://github.com/gkirkendall/flutter_collapsible_sidebar.git
      ref: flutter3_upgrade
  flex_color_scheme: ^8.4.0
```

And import it in your Dart code:

```dart
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:collapsible_sidebar/color_theme.dart'; // Optional: for built-in FlexColorScheme themes
```

---

## How to Use

### 1. Define Theme (Optional, powered by FlexColorScheme)

Use `AppTheme.light` and `AppTheme.dark` in your `MaterialApp` for modern Material 3 styling:

```dart
MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system,
  home: const SidebarPage(),
);
```

### 2. Create your list of `CollapsibleItem`s

You can nest `CollapsibleItem`s using `subItems` for multi-level navigation:

```dart
List<CollapsibleItem> get _items {
  return [
    CollapsibleItem(
      text: 'Dashboard',
      icon: CupertinoIcons.chart_bar,
      onPressed: () => setState(() => _headline = 'Dashboard'),
      isSelected: true,
      subItems: [
        CollapsibleItem(
          text: 'Analytics',
          icon: CupertinoIcons.graph_square,
          onPressed: () => setState(() => _headline = 'Analytics'),
          isSelected: true,
        ),
      ],
    ),
    CollapsibleItem(
      text: 'Notifications',
      badgeCount: 5,
      icon: CupertinoIcons.bell,
      onPressed: () => setState(() => _headline = 'Notifications'),
    ),
    CollapsibleItem(
      text: 'Settings',
      icon: CupertinoIcons.settings,
      onPressed: () => setState(() => _headline = 'Settings'),
    ),
  ];
}
```

### 3. Add `CollapsibleSidebar` to your layout

Bind sidebar colors dynamically to your app's active `ThemeData`:

```dart
@override
Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return SafeArea(
    child: CollapsibleSidebar(
      isCollapsed: MediaQuery.of(context).size.width <= 800,
      items: _items,
      avatarImg: const AssetImage('assets/avatar.png'),
      title: 'John Smith',
      onTitleTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile Clicked')),
        );
      },
      body: _body(size, context),
      // Theme integrations
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      selectedTextColor: Theme.of(context).colorScheme.primary,
      selectedIconColor: Theme.of(context).colorScheme.onPrimaryContainer,
      selectedIconBox: Theme.of(context).colorScheme.primaryContainer,
      toggleButtonIconColor: Theme.of(context).colorScheme.primary,
      unselectedTextColor: Theme.of(context).colorScheme.onSurfaceVariant,
      unselectedIconColor: Theme.of(context).colorScheme.onSurfaceVariant,
    ),
  );
}

Widget _body(Size size, BuildContext context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: Theme.of(context).colorScheme.surface,
    child: Center(
      child: Text(
        _headline,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ),
  );
}
```

---

## Parameters (Customizable Attributes)

| Parameter | Data Type | Default Value | Description |
| :---: | :---: | :---: | :--- |
| `isCollapsed` | `bool` | `true` | Set condition to control collapsed/expanded state (e.g. screen width) |
| `collapseOnBodyTap` | `bool` | `true` | Tap outside sidebar to collapse |
| `items` | `List<CollapsibleItem>` | **required** | List of items and nested sub-items |
| `body` | `Widget` | **required** | Main content widget of the app |
| `showTitle` | `bool` | `true` | Show or hide avatar image and title |
| `title` | `String` | `'Lorem Ipsum'` | Title string next to avatar |
| `titleBack` | `bool` | `false` | Display back icon instead of avatar image |
| `titleBackIcon` | `IconData` | `Icons.arrow_back` | Custom back icon |
| `onTitleTap` | `VoidCallback?` | `null` | Callback when title or avatar is tapped |
| `onHoverPointer` | `MouseCursor` | `SystemMouseCursors.click` | Mouse cursor on hover |
| `avatarImg` | `ImageProvider?` | `null` | Avatar image source |
| `height` | `double` | `double.infinity` | Height of sidebar |
| `minWidth` | `double` | `80` | Sidebar width when collapsed |
| `maxWidth` | `double` | `270` | Sidebar width when expanded |
| `borderRadius` | `double` | `15` | Corner radius of sidebar |
| `iconSize` | `double` | `40` | Size of item icons |
| `customContentPaddingLeft` | `double` | `-1` | Custom left padding for items (-1 for default) |
| `toggleTitle` | `String` | `'Collapse'` | Toggle button label |
| `toggleButtonIcon` | `IconData` | `Icons.chevron_right` | Toggle button icon |
| `toggleButtonIconColor` | `Color?` | `null` | Color of toggle icon |
| `backgroundColor` | `Color` | `Color(0xff2B3138)` | Sidebar background color |
| `avatarBackgroundColor` | `Color` | `Color(0xff6A7886)` | Avatar background circle color |
| `selectedIconBox` | `Color` | `Color(0xff2F4047)` | Background box color for selected item |
| `selectedIconColor` | `Color` | `Color(0xff4AC6EA)` | Selected item icon color |
| `selectedTextColor` | `Color` | `Color(0xffF3F7F7)` | Selected item text color |
| `unselectedIconColor` | `Color` | `Color(0xff6A7886)` | Unselected item icon color |
| `unselectedTextColor` | `Color` | `Color(0xffC0C7D0)` | Unselected item text color |
| `badgeBackgroundColor` | `Color` | `Color(0xffFF6767)` | Badge background color |
| `badgeTextColor` | `Color` | `Color(0xffF3F7F7)` | Badge text color |
| `duration` | `Duration` | `500ms` | Animation speed for expand/collapse |
| `curve` | `Curve` | `Curves.fastLinearToSlowEaseIn` | Animation curve |
| `screenPadding` | `double` | `4` | Outer padding around sidebar |
| `topPadding` | `double` | `0` | Vertical space above item list |
| `bottomPadding` | `double` | `0` | Vertical space below item list |
| `itemPadding` | `double` | `10` | Spacing between items |
| `customItemOffsetX` | `double` | `-1` | X-axis offset for items (-1 for default) |
| `fitItemsToBottom` | `bool` | `false` | Align items towards the bottom |
| `showToggleButton` | `bool` | `true` | Show or hide the expand/collapse toggle button |
| `sidebarBoxShadow` | `List<BoxShadow>` | `[BoxShadow(...)]` | Sidebar shadow decorations |

---

## Credits & Acknowledgments

This package is a modernized fork of the original [`collapsible_sidebar`](https://github.com/DrunkOnBytes/flutter_collapsible_sidebar) created by **Arjun Sinha** ([@DrunkOnBytes](https://github.com/DrunkOnBytes)).

Special thanks to all original contributors:

<a href="https://github.com/DrunkOnBytes/flutter_collapsible_sidebar/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=DrunkOnBytes/flutter_collapsible_sidebar&max=100&anon=1" />
</a>

---

## License

Apache 2.0 - See [LICENSE](LICENSE) for details.

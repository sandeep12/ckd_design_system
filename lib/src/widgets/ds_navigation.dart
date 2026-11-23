import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../assets.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';
import 'ds_badge.dart';
import 'ds_icon.dart';
import 'ds_logo_chip.dart';

/// One destination in the app shell navigation.
class DsNavDestination {
  const DsNavDestination({required this.label, required this.iconAsset});

  final String label;
  final String iconAsset;
}

/// Web app-shell top bar (`TopBar`, Kind=Default): logo chip + bell.
class DsTopBar extends StatelessWidget {
  const DsTopBar({super.key, this.onBellTap, this.hasUnread = false});

  final VoidCallback? onBellTap;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DsSizes.topbar,
      color: DsColors.navBg,
      padding: const EdgeInsets.symmetric(horizontal: DsSpacing.insetXl),
      child: Row(
        children: [
          const DsLogoChip(),
          const Spacer(),
          _BellButton(
            onTap: onBellTap,
            hasUnread: hasUnread,
            color: DsColors.textOnShell,
            size: DsSizes.buttonHeightMd,
          ),
        ],
      ),
    );
  }
}

class _BellButton extends StatelessWidget {
  const _BellButton({
    required this.onTap,
    required this.hasUnread,
    required this.color,
    required this.size,
  });

  final VoidCallback? onTap;
  final bool hasUnread;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: hasUnread ? 'Notifications, unread' : 'Notifications',
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(DsRadii.button),
                  child: Center(child: DsIcon(DsAssets.icBell, color: color)),
                ),
              ),
            ),
            if (hasUnread)
              const Positioned(
                // Sits on the bell's shoulder, as drawn.
                right: DsSpacing.insetSm + 2,
                top: DsSpacing.insetSm + 2,
                child: IgnorePointer(child: DsNotificationDot()),
              ),
          ],
        ),
      ),
    );
  }
}

/// Web sidebar (`SidebarNav`): wordmark, nav items and pinned user card.
///
/// The selected item renders the page-coloured "tongue" with concave
/// fillets that fuse it into the content panel to its right.
class DsSidebarNav extends StatelessWidget {
  const DsSidebarNav({
    super.key,
    required this.title,
    this.subtitle,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    required this.userName,
    this.userCaption,
    this.onUserTap,
  });

  final String title;
  final String? subtitle;
  final List<DsNavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final String userName;
  final String? userCaption;
  final VoidCallback? onUserTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DsSizes.navWidth,
      color: DsColors.navBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DsSpacing.navInset,
              vertical: DsSpacing.insetXl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: DsTypography.h4.copyWith(color: DsColors.textOnShell),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: DsSpacing.stackXs),
                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsTypography.caption
                        .copyWith(color: DsColors.textOnShellSecondary),
                  ),
                ],
              ],
            ),
          ),
          for (var i = 0; i < destinations.length; i++) ...[
            if (i > 0) const SizedBox(height: DsSpacing.navItemGap),
            _NavItem(
              destination: destinations[i],
              selected: i == selectedIndex,
              onTap: () => onSelected(i),
            ),
          ],
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DsSpacing.insetMd,
              vertical: DsSpacing.insetLg,
            ),
            child: _UserCard(
              name: userName,
              caption: userCaption,
              onTap: onUserTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final DsNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  static const double _fillet = 16;
  static const double _carve = 32;

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: [
        DsIcon(
          destination.iconAsset,
          color: selected ? DsColors.navItemTextActive : DsColors.navItemText,
        ),
        const SizedBox(width: DsSpacing.inlineMd),
        Expanded(
          child: Text(
            destination.label,
            style: selected
                ? DsTypography.label.copyWith(color: DsColors.navItemTextActive)
                : DsTypography.bodySm.copyWith(color: DsColors.navItemText),
          ),
        ),
      ],
    );

    if (!selected) {
      return Semantics(
        button: true,
        child: SizedBox(
          height: DsSizes.navItemHeight,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              hoverColor: DsColors.navItemBgHover,
              borderRadius: BorderRadius.circular(DsRadii.control),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: DsSpacing.navInset),
                child: row,
              ),
            ),
          ),
        ),
      );
    }

    Widget carve() => SvgPicture.asset(
          DsAssets.navFilletCarve,
          package: DsAssets.package,
          width: _carve,
          height: _carve,
        );

    return Semantics(
      selected: true,
      button: true,
      child: SizedBox(
        height: DsSizes.navItemHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Concave fillets above and below the tongue's right edge.
            const Positioned(
              right: 0,
              top: -_fillet,
              width: _fillet,
              height: _fillet,
              child: ColoredBox(color: DsColors.navItemBgSelected),
            ),
            Positioned(right: 0, top: -_carve, child: carve()),
            const Positioned(
              right: 0,
              bottom: -_fillet,
              width: _fillet,
              height: _fillet,
              child: ColoredBox(color: DsColors.navItemBgSelected),
            ),
            Positioned(right: 0, bottom: -_carve, child: carve()),
            Positioned.fill(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: DsSpacing.navInset),
                decoration: const BoxDecoration(
                  color: DsColors.navItemBgSelected,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(DsRadii.surface),
                  ),
                ),
                child: row,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({required this.name, this.caption, this.onTap});

  final String name;
  final String? caption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(DsRadii.pill);
    return Material(
      color: DsColors.surfaceShellHover,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(
          padding: const EdgeInsets.all(DsSpacing.insetMd),
          child: Row(
            children: [
              DsAvatar(initials: initialsOf(name)),
              const SizedBox(width: DsSpacing.inlineSm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: DsTypography.label
                          .copyWith(color: DsColors.textOnShell),
                    ),
                    if (caption != null) ...[
                      const SizedBox(height: DsSpacing.stackXs),
                      Text(
                        caption!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsTypography.caption
                            .copyWith(color: DsColors.textOnShellSecondary),
                      ),
                    ],
                  ],
                ),
              ),
              const DsIcon(
                DsAssets.icChevronRight,
                size: DsSizes.iconSm,
                color: DsColors.textOnShellSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Up to two initials from a display name (`Alex Ramos` → `AR`).
String initialsOf(String name) {
  final parts =
      name.split(RegExp(r'[\s\-_.]+')).where((p) => p.isNotEmpty).toList();
  if (parts.isEmpty) return '?';
  final first = parts.first[0];
  final second = parts.length > 1 ? parts[1][0] : '';
  return (first + second).toUpperCase();
}

/// Mobile app bar (`Mobile/AppBar`, Kind=Brand): logo + bell.
class DsMobileAppBar extends StatelessWidget {
  const DsMobileAppBar({super.key, this.onBellTap, this.hasUnread = false});

  final VoidCallback? onBellTap;
  final bool hasUnread;

  static const double _logoWidth = 110;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DsSizes.appBar,
      padding: const EdgeInsets.symmetric(horizontal: DsSpacing.insetLg),
      decoration: const BoxDecoration(
        color: DsColors.surfaceRaised,
        border: Border(
          bottom: BorderSide(
            color: DsColors.borderSubtle,
            width: DsSizes.borderWidthDefault,
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DsSpacing.insetXs),
            child: Image.asset(
              DsAssets.logoOed,
              package: DsAssets.package,
              width: _logoWidth,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          _BellButton(
            onTap: onBellTap,
            hasUnread: hasUnread,
            color: DsColors.iconDefault,
            size: DsSizes.controlLg,
          ),
        ],
      ),
    );
  }
}

/// Mobile bottom navigation (`Mobile/TabBar`).
///
/// Selection is a pill behind the glyph plus the dark label — a shape
/// change, never colour alone.
class DsTabBar extends StatelessWidget {
  const DsTabBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<DsNavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: DsColors.tabbarBg,
        border: Border(
          top: BorderSide(
            color: DsColors.borderSubtle,
            width: DsSizes.borderWidthDefault,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: DsSizes.tabbar,
          child: Row(
            children: [
              for (var i = 0; i < destinations.length; i++)
                Expanded(
                  child: _TabItem(
                    destination: destinations[i],
                    selected: i == selectedIndex,
                    onTap: () => onSelected(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final DsNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      button: true,
      child: InkResponse(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: DsSizes.tabPillWidth,
              height: DsSizes.tabPillHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? DsColors.selectedBg : null,
                borderRadius: BorderRadius.circular(DsRadii.pill),
              ),
              child: DsIcon(destination.iconAsset),
            ),
            const SizedBox(height: DsSpacing.inlineXs),
            Text(
              destination.label,
              style: DsTypography.caption.copyWith(
                color: selected
                    ? DsColors.tabbarItemTextActive
                    : DsColors.tabbarItemText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

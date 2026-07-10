import 'package:flutter/material.dart';


class GameProfileHub extends StatelessWidget {

  const GameProfileHub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 1. The Main Top Bar (Wooden style container)
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 90,
              width: 420,
              decoration: BoxDecoration(
                // Wooden color gradient
                gradient: const LinearGradient(
                  colors: [Color(0xFFE5A647), Color(0xFFB06A24)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF6E3A07), width: 4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 100, right: 16),
                child: Row(
                  children: [
                    // Inner Info Pill (Name and Level)
                    Expanded(
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFBE6),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: const Color(0xFFD4A359), width: 3),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            // Heart Icon
                            const Icon(Icons.favorite, color: Color(0xFFFF6B6B), size: 28),
                            const SizedBox(width: 8),
                            // User Name
                            const Text(
                              'David',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A2E12),
                                fontFamily: 'CasualGameFont', // Replace with your game font
                              ),
                            ),
                            const Spacer(),
                            // Level Tag
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B6B),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: const Color(0xFFE54747), width: 2),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.favorite, color: Color(0xFFFFFBE6), size: 12),
                                  SizedBox(width: 4),
                                  Text(
                                    'Lv.14',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Settings/Gear Button
                    const _SettingsButton(),
                  ],
                ),
              ),
            ),
            
            // Avatar (Overlapping on the left)
            Positioned(
              left: -10,
              top: -15,
              child: const _AvatarWidget(),
            ),
          ],
        ),

        // 2. The Hanging Links
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (_) => const _HangingLink()),
          ),
        ),

        // 3. The Bottom Row of Menu Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MenuButton(
                imagepath: 'assets/images/message_icon.png', 
                badgeCount: 1,
              ),
              _MenuButton(
                imagepath: 'assets/images/outoor_icon.png'
              ),
              _MenuButton(
                imagepath: 'assets/images/outoor_icon.png'
              ),
              _MenuButton(
                imagepath: 'assets/images/outoor_icon.png'
              ),
              _MenuButton(
                imagepath: 'assets/images/outoor_icon.png'
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Avatar circle with golden frame
class _AvatarWidget extends StatelessWidget {

  const _AvatarWidget(
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFFFF9E6),
        border: Border.all(color: const Color(0xFFE5A647), width: 5),
        boxShadow: const [
          BoxShadow(color: Colors.black26, offset: Offset(0, 3), blurRadius: 4)
        ],
      ),
      child: const CircleAvatar(
        backgroundColor: Colors.transparent,
        // Replace with your local image asset: Image.asset('assets/david_avatar.png')
        child: Icon(Icons.person, size: 60, color: Color(0xFFB06A24)), 
      ),
    );
  }
}

/// Stylized Gear Settings Button
class _SettingsButton extends StatelessWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFFCD667),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFB06A24), width: 3),
      ),
      child: const Icon(Icons.settings, color: Color(0xFF8A4F13), size: 26),
    );
  }
}

/// Wooden link bracket connecting the top bar to the icons
class _HangingLink extends StatelessWidget {
  const _HangingLink();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFF8A4F13),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(6)),
        border: Border.all(color: const Color(0xFF502A04), width: 2),
      ),
    );
  }
}

/// Individual Square Menu Items
class _MenuButton extends StatelessWidget {
  final String imagepath;
  final int badgeCount;

  const _MenuButton({
    super.key,
    required this.imagepath,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBE6),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFD4A359), width: 4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 4),
                blurRadius: 2,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              // Replace placeholder with: Image.asset(iconPath)
              child: Image.asset(
                imagepath,
                width: 72,
                height: 72,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        // Red Notification Badge (e.g., Chat Icon)
        if (badgeCount > 0)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B6B),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
              child: Text(
                '$badgeCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

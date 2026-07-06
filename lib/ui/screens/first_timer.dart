import 'package:flutter/material.dart';

const Color _accentGreen = Color(0xFF3EB869);

/// First-time onboarding screen â€” modern, scrollable introduction
/// Class name kept as `AboutTether` per request.
class AboutTether extends StatelessWidget {
  const AboutTether({super.key});

  static const _heroAsset = 'assets/images/sidePeakAnimals.png';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => _goToAccountCreation(context),
            child: const Text('Skip'),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero illustration
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: theme.colorScheme.surfaceContainerHighest,
                      width: double.infinity,
                      height: mq.size.height * 0.38,
                      child: Image.asset(
                        _heroAsset,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) => const Center(
                          child: Icon(Icons.image_not_supported, size: 56),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Headline
                Text(
                  'Welcome to Tether',
                  style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  'The gentle way for couples to grow closer, one small step at a time.',
                  style: textTheme.bodyMedium?.copyWith(fontSize: 16, height: 1.4),
                ),

                const SizedBox(height: 18),

                // Informational sections
                const _InfoSection(
                  title: 'Build stronger emotional connection',
                  body:
                      'TetherUs helps couples deepen their emotional bond through guided conversations, micro-rituals, and meaningful check-ins.',
                ),

                const SizedBox(height: 12),

                const _InfoSection(
                  title: 'Consistency matters',
                  body:
                      'Small, regular actions compound. The more you use Tether, the more youâ€™ll notice improved understanding and closeness.',
                ),

                const SizedBox(height: 12),

                const _InfoSection(
                  title: 'Guided activities & shared goals',
                  body:
                      'Follow short activities, quick check-ins, and set shared goals that keep you aligned and engaged as a couple.',
                ),

                const SizedBox(height: 18),

                // Feature highlight cards
                Text(
                  "What you'll find inside",
                  style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                const Column(
                  children: [
                    _FeatureCard(
                      icon: Icons.favorite,
                      title: 'Daily Check-ins',
                      subtitle: 'Quick prompts to share how you feel and listen to each other.',
                    ),
                    SizedBox(height: 10),
                    _FeatureCard(
                      icon: Icons.emoji_emotions,
                      title: 'Mini Activities',
                      subtitle: 'Fun, guided exercises to spark connection in 5â€“10 minutes.',
                    ),
                    SizedBox(height: 10),
                    _FeatureCard(
                      icon: Icons.flag,
                      title: 'Shared Goals',
                      subtitle: 'Create, track, and celebrate small wins together.',
                    ),
                    SizedBox(height: 10),
                    _FeatureCard(
                      icon: Icons.lock,
                      title: 'Privacy-first',
                      subtitle: 'Everything you share stays between you and your partner.',
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // CTA Button inside the scroll
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => _goToAccountCreation(context),
                    child: const Text('Create Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),

                const SizedBox(height: 18),

                // Small sign-in hint
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: textTheme.bodyMedium),
                    TextButton(
                      onPressed: () => _goToAccountCreation(context),
                      child: const Text('Sign in'),
                    )
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToAccountCreation(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AccountCreationScreen()));
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final String body;

  const _InfoSection({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Text(body, style: textTheme.bodyMedium?.copyWith(height: 1.4)),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: _accentGreen.withAlpha((0.12 * 255).round()),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: _accentGreen, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: theme.textTheme.bodyMedium?.color?.withAlpha((0.8 * 255).round()))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Simple placeholder for account creation route
class AccountCreationScreen extends StatelessWidget {
  const AccountCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: const SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Account creation placeholder\n\nFill this screen with your signup flow.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}


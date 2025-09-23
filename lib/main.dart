import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool following = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header (foto + nama + tombol)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/300?img=12', // ganti dgn asset/image mu
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ammar Nabil Fauzan',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Mobile & Web Developer • Tech Enthusiast',
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: () => setState(() => following = !following),
                  icon: Icon(following ? Icons.check : Icons.person_add_alt),
                  label: Text(following ? 'Following' : 'Follow'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Bio singkat
            Card(
              elevation: 0,
              color: theme.colorScheme.surfaceContainerHighest,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Halo! Saya developer yang suka Flutter, backend ringan, dan ngulik UI/UX. '
                  'Saat ini lagi fokus bikin aplikasi produktivitas mini dan eksperimen animasi.',
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Statistik
            Row(
              children: const [
                _StatItem(value: '24', label: 'Repos'),
                _DividerDot(),
                _StatItem(value: '1.2k', label: 'Followers'),
                _DividerDot(),
                _StatItem(value: '180', label: 'Following'),
              ],
            ),

            const SizedBox(height: 16),

            // Keterampilan / tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                _SkillChip('Flutter'),
                _SkillChip('Dart'),
                _SkillChip('Firebase'),
                _SkillChip('REST API'),
                _SkillChip('UI/UX'),
              ],
            ),

            const SizedBox(height: 16),

            // Kontak / tautan
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: theme.colorScheme.outlineVariant),
              ),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('ammar@example.com'),
                    subtitle: Text('Email'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.link),
                    title: Text('github.com/ammar'),
                    subtitle: Text('GitHub'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text('Samarinda, Indonesia'),
                    subtitle: Text('Location'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Tombol aksi
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.message_outlined),
                    label: const Text('Message'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.work_outline),
                    label: const Text('Hire Me'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(value, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(label, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _DividerDot extends StatelessWidget {
  const _DividerDot();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 8, child: Center(child: Text('·')));
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(label),
      avatar: const Icon(Icons.code, size: 16),
      side: BorderSide(color: theme.colorScheme.outlineVariant),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

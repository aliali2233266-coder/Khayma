import 'package:flutter/material.dart';

void main() => runApp(const KhaymaTaxiApp());

class KhaymaTaxiApp extends StatelessWidget {
  const KhaymaTaxiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khayma Taxi',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF28A9E8)),
        scaffoldBackgroundColor: const Color(0xFFF5F9FC),
      ),
      home: const RoleScreen(),
    );
  }
}

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Center(child: Logo()),
            const SizedBox(height: 18),
            const Text('تكسي الخيمة', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF083B66))),
            const Text('Khayma Taxi', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF28A9E8))),
            const SizedBox(height: 48),
            _RoleButton(title: 'تطبيق الزبون', icon: Icons.person_pin_circle_outlined,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PassengerHome()))),
            const SizedBox(height: 14),
            _RoleButton(title: 'تطبيق السائق', icon: Icons.local_taxi_outlined,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DriverHome()))),
            const Spacer(),
            const Text('Prototype v0.1 • Thi Qar, Iraq', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    ),
  );
}

class _RoleButton extends StatelessWidget {
  final String title; final IconData icon; final VoidCallback onTap;
  const _RoleButton({required this.title, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) => FilledButton.icon(
    style: FilledButton.styleFrom(
      backgroundColor: const Color(0xFF28A9E8), foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    onPressed: onTap, icon: Icon(icon), label: Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
  );
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 104, height: 104,
    decoration: BoxDecoration(color: const Color(0xFFE5F6FD), borderRadius: BorderRadius.circular(32)),
    child: const Icon(Icons.local_taxi_rounded, size: 58, color: Color(0xFF0B4F7C)),
  );
}

class PassengerHome extends StatelessWidget {
  const PassengerHome({super.key});
  @override
  Widget build(BuildContext context) => _Scaffold(title: 'الرئيسية', children: [
    _MapCard(),
    const SizedBox(height: 16),
    _Field(label: 'من أين؟', icon: Icons.my_location, value: 'موقعي الحالي'),
    const SizedBox(height: 10),
    _Field(label: 'إلى أين؟', icon: Icons.location_on, value: 'جامعة ذي قار'),
    const SizedBox(height: 14),
    FilledButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TripScreen())),
      style: FilledButton.styleFrom(padding: const EdgeInsets.all(17)),
      child: const Text('احجز تكسي الآن', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
    ),
    const SizedBox(height: 12),
    OutlinedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RoutesScreen())),
      child: const Text('الخطوط الشهرية'),
    ),
  ]);
}

class DriverHome extends StatelessWidget {
  const DriverHome({super.key});
  @override
  Widget build(BuildContext context) => _Scaffold(title: 'لوحة السائق', children: [
    _StatusCard(),
    const SizedBox(height: 14),
    _MapCard(),
    const SizedBox(height: 14),
    Card(child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: const Text('طلب رحلة جديد'),
      subtitle: const Text('الناصرية → جامعة ذي قار • 8,000 د.ع'),
      trailing: FilledButton(onPressed: () {}, child: const Text('قبول')),
    )),
    Card(child: ListTile(
      leading: const Icon(Icons.lock_outline),
      title: const Text('كود الرحلة'),
      subtitle: const Text('KHM-482731'),
      trailing: TextButton(onPressed: () {}, child: const Text('تحقق')),
    )),
  ]);
}

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});
  @override
  Widget build(BuildContext context) => _Scaffold(title: 'تفاصيل الرحلة', children: [
    _MapCard(),
    const SizedBox(height: 14),
    Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(children: const [
      ListTile(leading: Icon(Icons.person), title: Text('السائق علي'), subtitle: Text('Toyota Corolla • أبيض • 12345 بغداد')),
      Divider(),
      ListTile(leading: Icon(Icons.pin_drop), title: Text('KHM-482731'), subtitle: Text('كود الرحلة')),
      ListTile(leading: Icon(Icons.route), title: Text('5.4 KM'), subtitle: Text('المسافة • ETA 12 دقيقة')),
      ListTile(leading: Icon(Icons.payments_outlined), title: Text('8,000 د.ع'), subtitle: Text('الدفع: نقدي')),
    ]))),
    const SizedBox(height: 12),
    FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.share), label: const Text('مشاركة الرحلة مع العائلة')),
  ]);
}

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});
  @override
  Widget build(BuildContext context) => _Scaffold(title: 'الخطوط الشهرية', children: [
    Card(child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.directions_bus)),
      title: const Text('خط الجامعة'),
      subtitle: const Text('07:30 ص • 02:30 م\n50,000 د.ع • 12 مقعد متاح'),
      isThreeLine: true,
      trailing: FilledButton(onPressed: () {}, child: const Text('اشتراك')),
    )),
    Card(child: ListTile(
      leading: const CircleAvatar(child: Icon(Icons.directions_bus)),
      title: const Text('خط الشطرة — الناصرية'),
      subtitle: const Text('06:45 ص • 03:00 م\n65,000 د.ع • 8 مقاعد'),
      isThreeLine: true,
      trailing: FilledButton(onPressed: () {}, child: const Text('اشتراك')),
    )),
  ]);
}

class _Scaffold extends StatelessWidget {
  final String title; final List<Widget> children;
  const _Scaffold({required this.title, required this.children});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
    body: ListView(padding: const EdgeInsets.all(16), children: children),
  );
}

class _MapCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: 230,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
        colors: [Color(0xFFDDF4FF), Color(0xFFF7FBFD)]),
      border: Border.all(color: const Color(0xFFBFE8F8)),
    ),
    child: Stack(children: [
      const Center(child: Icon(Icons.map_outlined, size: 78, color: Color(0xFF28A9E8))),
      Positioned(right: 14, top: 14, child: Chip(label: const Text('Thi Qar • Live Map'))),
      const Positioned(left: 18, bottom: 16, child: Text('موقعك الحالي', style: TextStyle(fontWeight: FontWeight.bold))),
    ]),
  );
}

class _Field extends StatelessWidget {
  final String label, value; final IconData icon;
  const _Field({required this.label, required this.icon, required this.value});
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(leading: Icon(icon, color: const Color(0xFF0B4F7C)),
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.w700))),
  );
}

class _StatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
    child: SwitchListTile(value: true, onChanged: (_) {},
      title: const Text('أنت متصل الآن', style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: const Text('استقبال طلبات الرحلات'),
    ),
  );
}

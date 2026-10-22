import 'package:flutter/material.dart';

void main() {
  runApp(const BharatYatriApp());
}

class BharatYatriApp extends StatelessWidget {
  const BharatYatriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bharat Yatri & Suraksha Super App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const SecurityLockScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 0. సెక్యూరిటీ లాక్ స్క్రీన్ (Security PIN Protection Screen)
class SecurityLockScreen extends StatefulWidget {
  const SecurityLockScreen({super.key});

  @override
  State<SecurityLockScreen> createState() => _SecurityLockScreenState();
}

class _SecurityLockScreenState extends State<SecurityLockScreen> {
  final TextEditingController _pinController = TextEditingController();
  final String _correctPin = '1234'; // డిఫాల్ట్ సెక్యూరిటీ పిన్

  void _verifyPin() {
    if (_pinController.text == _correctPin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainDashboard()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("తప్పు పిన్ (Incorrect PIN)! దయచేసి '1234' ఎంటర్ చేయండి."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_outline, size: 64, color: Colors.deepOrange),
                  const SizedBox(height: 16),
                  const Text(
                    'సురక్ష & భారత్ యాత్రి లాక్',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'దయచేసి మీ 4-అంకెల సెక్యూరిటీ పిన్ ఎంటర్ చేయండి (Default: 1234)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    maxLength: 4,
                    decoration: const InputDecoration(
                      labelText: 'సెక్యూరిటీ పిన్ (PIN)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.security),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _verifyPin,
                      child: const Text('అన్‌లాక్ చేయి (Unlock)', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const BharatYatriScreen(),
    const SurakshaScreen(),
    const TicketBookingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'హోమ్'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'భారత్ యాత్రి'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'సురక్ష'),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: 'బుకింగ్స్'),
        ],
      ),
    );
  }
}

// 1. హోమ్ స్క్రీన్ (Home Screen)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('భారత్ యాత్రి - స్వాగతం'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('ప్రసిద్ధ ప్రదేశాలు & గమ్యస్థానాలు', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: const Icon(Icons.location_city, color: Colors.deepOrange),
              title: const Text('తాజ్ మహల్, ఆగ్రా'),
              subtitle: const Text('చారిత్రక అద్భుతం - బుక్ చేయండి'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('వివరాలు'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[800], foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpenseCalculatorScreen()));
                },
                icon: const Icon(Icons.calculate),
                label: const Text('బడ్జెట్ కాలిక్యులేటర్'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NearbyPlacesScreen()));
                },
                icon: const Icon(Icons.near_me),
                label: const Text('చుట్టుపక్కల ప్రదేశాలు'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 2. భారత్ యాత్రి స్క్రీన్ (Bharat Yatri Profile & Trip Diary)
class BharatYatriScreen extends StatefulWidget {
  const BharatYatriScreen({super.key});

  @override
  State<BharatYatriScreen> createState() => _BharatYatriScreenState();
}

class _BharatYatriScreenState extends State<BharatYatriScreen> {
  final List<Map<String, String>> _trips = [
    {'title': 'అతిరపల్లి వాటర్ ఫాల్స్ (Kerala)', 'date': 'Feb 2025', 'expense': '₹5,000'},
  ];
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();

  void _addNewTrip() {
    if (_placeController.text.isNotEmpty) {
      setState(() {
        _trips.add({
          'title': _placeController.text,
          'date': 'ఈరోజు',
          'expense': '₹${_expenseController.text.isEmpty ? "0" : _expenseController.text}',
        });
        _placeController.clear();
        _expenseController.clear();
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('భారత్ యాత్రి - కమ్యూనిటీ & డైరీ'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepOrange),
            accountName: Text('స్వామి (Traveler)'),
            accountEmail: Text('swami@bharatyatri.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.deepOrange),
            ),
          ),
          const SizedBox(height: 15),
          const Text('నా బ్యాడ్జెస్ & విజయాలు', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Chip(avatar: Icon(Icons.star, color: Colors.amber), label: Text('Pro Explorer')),
              Chip(avatar: Icon(Icons.landscape), label: Text('Nature Lover')),
            ],
          ),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.between,
            children: [
              const Text('నా ట్రిప్ డైరీ & జ్ఞాపకాలు', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('కొత్త ట్రిప్ లాగ్ జోడించండి'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _placeController,
                            decoration: const InputDecoration(labelText: 'ప్లేస్ పేరు (ఉదా: Ooty)'),
                          ),
                          TextField(
                            controller: _expenseController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'ఖర్చు (₹)'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('రద్దు')),
                        ElevatedButton(onPressed: _addNewTrip, child: const Text('సేవ్ చేయి')),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('కొత్త ట్రిప్'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _trips.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.flight_takeoff, color: Colors.deepOrange),
                  title: Text(_trips[index]['title']!),
                  subtitle: Text('తేదీ: ${_trips[index]['date']}'),
                  trailing: Text(
                    'ఖర్చు: ${_trips[index]['expense']}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// 3. సురక్ష స్క్రీన్ (Suraksha Safety Hub)
class SurakshaScreen extends StatefulWidget {
  const SurakshaScreen({super.key});

  @override
  State<SurakshaScreen> createState() => _SurakshaScreenState();
}

class _SurakshaScreenState extends State<SurakshaScreen> {
  final List<String> _emergencyContacts = [
    'ఇంటి నంబర్ (Family): 9876543210',
    'స్నేహితుడు (Bava): 9123456789'
  ];
  final TextEditingController _contactController = TextEditingController();

  void _addContact() {
    if (_contactController.text.isNotEmpty) {
      setState(() {
        _emergencyContacts.add(_contactController.text);
        _contactController.clear();
      });
      Navigator.pop(context);
    }
  }

  void _triggerSOS(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('⚠️ SOS అలర్ట్ యాక్టివేట్ అయింది!', style: TextStyle(color: Colors.red)),
        content: const Text('మీ లైవ్ లొకేషన్ మరియు ఎమర్జెన్సీ మెసేజ్ మీ సేవ్ చేసిన కాంటాక్ట్ నంబర్లకు పంపబడుతోంది!'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('క్యాన్సల్')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('మెసేజ్ విజయవంతంగా పంపబడింది!')),
              );
            },
            child: const Text('కన్ఫర్మ్', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('సురక్ష - ఎమర్జెన్సీ సేఫ్టీ'), backgroundColor: Colors.red[700]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'ప్రమాదకర పరిస్థితుల్లో సహాయం కోసం కింద ఉన్న SOS బటన్ నొక్కండి',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 140,
                height: 140,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: const CircleBorder()),
                  onPressed: () => _triggerSOS(context),
                  child: const Text(
                    'SOS\nHELP',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.between,
              children: [
                const Text('ఎమర్జెన్సీ కాంటాక్ట్స్', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.person_add, color: Colors.deepOrange),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('కొత్త కాంటాక్ట్ జోడించండి'),
                        content: TextField(
                          controller: _contactController,
                          decoration: const InputDecoration(hintText: 'పేరు & ఫోన్ నంబర్'),
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('రద్దు')),
                          ElevatedButton(onPressed: _addContact, child: const Text('సేవ్')),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _emergencyContacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.contact_phone, color: Colors.green),
                    title: Text(_emergencyContacts[index]),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text('అత్యవసర హెల్ప్‌లైన్ నంబర్లు', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const ListTile(
              leading: Icon(Icons.local_police, color: Colors.blue),
              title: Text('పోలీస్ హెల్ప్‌లైన్'),
              trailing: Text('112', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const ListTile(
              leading: Icon(Icons.medical_services, color: Colors.green),
              title: Text('అంబులెన్స్ / మెడికల్'),
              trailing: Text('108', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. టికెట్ బుకింగ్ స్క్రీన్ (Ticket Bookings Hub)
class TicketBookingScreen extends StatefulWidget {
  const TicketBookingScreen({super.key});

  @override
  State<TicketBookingScreen> createState() => _TicketBookingScreenState();
}

class _TicketBookingScreenState extends State<TicketBookingScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  final List<Map<String, String>> _myBookings = [
    {'type': 'ట్రైన్ (Train)', 'route': 'విశాఖపట్నం ➔ సికింద్రాబాద్', 'date': '25 Oct 2026', 'status': 'కన్ఫర్మ్'},
    {'type': 'బస్ (Bus)', 'route': 'విజయవాడ ➔ తిరుపతి', 'date': '10 Nov 2026', 'status': 'బుక్ అయింది'},
  ];

  void _searchTickets(String category) {
    if (_fromController.text.isNotEmpty && _toController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('$category లభ్యత (Availability)'),
          content: Text('${_fromController.text} నుండి ${_toController.text} మధ్య సర్వీసులు అందుబాటులో ఉన్నాయి!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _myBookings.add({
                    'type': category,
                    'route': '${_fromController.text} ➔ ${_toController.text}',
                    'date': 'త్వరలో',
                    'status': 'బుక్ అయింది',
                  });
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('టికెట్ విజయవంతంగా బుక్ చేయబడింది!')),
                );
              },
              child: const Text('టికెట్ బుక్ చేయి'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('దయచేసి ఎక్కడి నుండి - ఎక్కడికి వివరాలు ఇవ్వండి!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ఆల్-ఇన్-ఒన్ టికెట్ బుకింగ్'),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'రైళ్లు (Train)'),
              Tab(text: 'బస్సులు (Bus)'),
              Tab(text: 'ఫ్లైట్స్ (Flight)'),
              Tab(text: 'నా బుకింగ్స్'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSearchForm('రైలు (Train)', Icons.train),
            _buildSearchForm('బస్సు (Bus)', Icons.directions_bus),
            _buildSearchForm('ఫ్లైట్ (Flight)', Icons.flight),
            _buildMyBookingsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchForm(String categoryName, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          Icon(icon, size: 60, color: Colors.deepOrange),
          const SizedBox(height: 15),
          Text('$categoryName టికెట్ సెర్చ్', textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextField(controller: _fromController, decoration: const InputDecoration(labelText: 'బయలుదేరే ప్రదేశం (From)', border: OutlineInputBorder())),
          const SizedBox(height: 15),
          TextField(controller: _toController, decoration: const InputDecoration(labelText: 'చేరుకోవాల్సిన ప్రదేశం (To)', border: OutlineInputBorder())),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
              onPressed: () => _searchTickets(categoryName),
              child: Text('$categoryName వెతకండి', style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyBookingsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('మీ డిజిటల్ టికెట్లు & పాసులు', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _myBookings.length,
              itemBuilder: (context, index) {
                final booking = _myBookings[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.confirmation_number, color: Colors.deepOrange, size: 36),
                    title: Text(booking['route']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('రకం: ${booking['type']} | తేదీ: ${booking['date']}'),
                    trailing: Chip(
                      label: Text(booking['status']!, style: const TextStyle(color: Colors.white, fontSize: 12)),
                      backgroundColor: Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 5. ట్రిప్ ఖర్చుల కాలిక్యులేటర్ (Expense Calculator Screen)
class ExpenseCalculatorScreen extends StatefulWidget {
  const ExpenseCalculatorScreen({super.key});

  @override
  State<ExpenseCalculatorScreen> createState() => _ExpenseCalculatorScreenState();
}

class _ExpenseCalculatorScreenState extends State<ExpenseCalculatorScreen> {
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final String _selectedCategory = 'ఆహారం (Food)';

  final List<Map<String, String>> _expenses = [
    {'title': 'రైలు టికెట్లు', 'category': 'ట్రావెల్', 'amount': '₹1,500'},
    {'title': 'హోటల్ రూమ్', 'category': 'బస', 'amount': '₹2,500'},
  ];

  double get _totalExpense {
    double sum = 0;
    for (var item in _expenses) {
      String cleanAmount = item['amount']!.replaceAll('₹', '').replaceAll(',', '');
      sum += double.tryParse(cleanAmount) ?? 0;
    }
    return sum;
  }

  void _addExpense() {
    if (_descController.text.isNotEmpty && _amountController.text.isNotEmpty) {
      setState(() {
        _expenses.add({
          'title': _descController.text,
          'category': _selectedCategory,
          'amount': '₹${_amountController.text}',
        });
        _descController.clear();
        _amountController.clear();
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ట్రిప్ ఖర్చుల కాలిక్యులేటర్'), backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.deepOrange[50],
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('మొత్తం ఖర్చు:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('₹${_totalExpense.toStringAsFixed(0)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ఖర్చుల జాబితా', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('కొత్త ఖర్చును జోడించండి'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(controller: _descController, decoration: const InputDecoration(labelText: 'వివరణ')),
                            TextField(controller: _amountController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'మొత్తం (₹)')),
                          ],
                        ),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('రద్దు')),
                          ElevatedButton(onPressed: _addExpense, child: const Text('సేవ్')),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('ఖర్చు జోడించు'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _expenses.length,
                itemBuilder: (context, index) {
                  final exp = _expenses[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.currency_rupee, color: Colors.deepOrange),
                      title: Text(exp['title']!),
                      subtitle: Text('కేటగిరీ: ${exp['category']}'),
                      trailing: Text(exp['amount']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 6. నియర్‌బై ప్లేసెస్ హబ్ (Nearby Places Hub)
class NearbyPlacesScreen extends StatelessWidget {
  const NearbyPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> nearbyList = [
      {'name': 'అతిరపల్లి వాటర్ ఫాల్స్', 'distance': '12 కి.మీ దూరం', 'time': '25 నిమిషాలు'},
      {'name': 'స్థానిక దేవాలయం & వ్యూ పాయింట్', 'distance': '5 కి.మీ దూరం', 'time': '10 నిమిషాలు'},
      {'name': 'ట్రావెల్ హెరిటేజ్ మ్యూజియం', 'distance': '8 కి.మీ దూరం', 'time': '15 నిమిషాలు'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('చుట్టుపక్కల ప్రదేశాలు (Nearby)'), backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('సమీప పర్యాటక ప్రదేశాలు:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: nearbyList.length,
                itemBuilder: (context, index) {
                  var place = nearbyList[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.map, color: Colors.deepOrange, size: 36),
                      title: Text(place['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('${place['distance']} | ${place['time']}'),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${place['name']} డైరెక్షన్స్ లోడ్ అవుతున్నాయి...')),
                          );
                        },
                        child: const Text('డైరెక్షన్స్'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
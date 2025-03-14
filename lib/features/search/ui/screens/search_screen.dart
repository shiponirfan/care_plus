import 'package:care_plus/features/common/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static String name = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTEController = TextEditingController();
  final TextEditingController _areaTEController = TextEditingController();
  TextEditingController _dateTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: 'Search',
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Select Area',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            TextField(
              controller: _dateTEController,
              onTap: _selectDate,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Select Date',
                prefixIcon: Icon(Icons.date_range),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Search'),
            ),
          ],
        ));
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat.yMMMMd().format(pickedDate);

      setState(() {
        _dateTEController = TextEditingController(text: formattedDate);
      });
    }
  }
}

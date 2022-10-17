import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class AllPrescriptionsage extends StatefulWidget {
  const AllPrescriptionsage({Key? key}) : super(key: key);

  @override
  State<AllPrescriptionsage> createState() => _AllPrescriptionsageState();
}

class _AllPrescriptionsageState extends State<AllPrescriptionsage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Prescriptions",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset('assets/images/pdf.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset('assets/images/pdf.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset('assets/images/pdf.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset('assets/images/pdf.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

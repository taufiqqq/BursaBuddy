import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController NOSController = TextEditingController();
  TextEditingController BPController = TextEditingController();
  TextEditingController BCController = TextEditingController();
  TextEditingController NBPController = TextEditingController();
  TextEditingController SPController = TextEditingController();
  TextEditingController SCController = TextEditingController();
  TextEditingController NSPController = TextEditingController();
  TextEditingController ProfitController = TextEditingController();
  TextEditingController ROIController = TextEditingController();
  TextEditingController Break_EvenController = TextEditingController();

  double NOS = 0.0;
  double BP = 0.0;
  double BC = 0.0;
  double NBP = 0.0;
  double SP = 0.0;
  double SC = 0.0;
  double NSP = 0.0;

  double Profit = 0.0;
  double ROI = 0.0;
  double Break_Even = 0.0;

  bool buyingCommissionIsPercentage = true;
  bool sellingCommissionIsPercentage = true;

  @override
  void initState() {
    super.initState();
    // Add listeners to input fields to calculate NBP and NSP automatically
    NOSController.addListener(_calculateValues);
    BPController.addListener(_calculateValues);
    BCController.addListener(_calculateValues);
    SPController.addListener(_calculateValues);
    SCController.addListener(_calculateValues);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Title Container
          Container(
            alignment: Alignment.center,
            child: Text(
              "Investment Calculator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Input And Output of Calculator Container
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Input Fields
                NumericInputField(labelText: 'Number of shares', controller: NOSController),
                SizedBox(height: 16),
                Text(
                  "Purchase of shares",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                NumericInputField(labelText: 'Buying Price (RM)', controller: BPController),
                NumericInputField(labelText: buyingCommissionIsPercentage ? 'Buying Commission (%)' : 'Buying Commission (RM)', controller: BCController),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: buyingCommissionIsPercentage,
                      onChanged: (value) {
                        setState(() {
                          buyingCommissionIsPercentage = value as bool;
                          _calculateValues();
                        });
                      },
                    ),
                    Text('%',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      ),
                    ),
                    Radio(
                      value: false,
                      groupValue: buyingCommissionIsPercentage,
                      onChanged: (value) {
                        setState(() {
                          buyingCommissionIsPercentage = value as bool;
                          _calculateValues();
                        });
                      },
                    ),
                    Text('RM',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      ),
                    ),
                  ],
                ),
                NumericInputField(labelText: 'Net Buying Price (RM)', controller: NBPController),
                SizedBox(height: 16),
                // Gross Dividend Per Share
                Text(
                  "Selling Shares",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                // Input Fields
                NumericInputField(labelText: 'Selling Price (RM)', controller: SPController),
                NumericInputField(labelText: sellingCommissionIsPercentage ? 'Selling Commission (%)' : 'Selling Commission (RM)', controller: SCController),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: sellingCommissionIsPercentage,
                      onChanged: (value) {
                        setState(() {
                          sellingCommissionIsPercentage = value as bool;
                          _calculateValues();
                        });
                      },
                    ),
                    Text('%',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      ),
                    ),
                    Radio(
                      value: false,
                      groupValue: sellingCommissionIsPercentage,
                      onChanged: (value) {
                        setState(() {
                          sellingCommissionIsPercentage = value as bool;
                          _calculateValues();
                        });
                      },
                    ),
                    Text('RM',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      ),
                    ),
                  ],
                ),
                //add a radio button besides the buying commission (%/RM)
                NumericInputField(labelText: 'Net Selling Price (RM)', controller: NSPController),
                SizedBox(height: 16),
                Text(
                  "Investment Performance",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                  // Output Fields
                Column(
                  children: [
                    NumericInputField(labelText: "Profit (RM)", controller: ProfitController),
                    NumericInputField(labelText: "Return On Investment (ROI)", controller: ROIController),
                    NumericInputField(labelText: "Break-even Selling Price (RM)", controller: Break_EvenController),
                  ],
                ),
                SizedBox(height: 16),
                // Reset and Calculate Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _resetValues,
                      child: Text('Reset'),
                    ),
                  ],
                ),
                // The commented code from your previous build method goes here
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _calculateValues() {
    setState(() {
      NOS = double.tryParse(NOSController.text) ?? 0.0;
      BP = double.tryParse(BPController.text) ?? 0.0;
      BC = double.tryParse(BCController.text) ?? 0.0;
      SP = double.tryParse(SPController.text) ?? 0.0;
      SC = double.tryParse(SCController.text) ?? 0.0;

      // Perform calculations
      if (buyingCommissionIsPercentage) {
        BC = ((NOS * BP) * (BC / 100));
      }
      if (sellingCommissionIsPercentage) {
        SC = ((NOS * SP) * (SC / 100));
      }
      Profit = ((SP * NOS) - SC) - ((BP * NOS) + BC);
      ROI = (Profit / ((BP * NOS) + BC)) * 100;

      // Calculate Net Buying Price (NBP) and Net Selling Price (NSP)
      NBP = (NOS * BP) + BC;
      NSP = (NOS * SP) - SC;

      // Check if NOS is not zero to avoid division by zero
      if (NOS != 0) {
        Break_Even = ((BP * NOS) + BC) / (NOS * (1 - (SC/(NOS * SP))));
      } else {
        Break_Even = 0.0; // Set to default value if NOS is zero
      }
      // Update text fields for NBP and NSP
      NBPController.text = NBP.toStringAsFixed(2);
      NSPController.text = NSP.toStringAsFixed(2);
      ProfitController.text = Profit.toStringAsFixed(2);
      ROIController.text = ROI.toStringAsFixed(3);
      Break_EvenController.text = Break_Even.toStringAsFixed(2);
    });
  }

  void _resetValues() {
    setState(() {
      NOSController.clear();
      BPController.clear();
      BCController.clear();
      NBPController.clear();
      SPController.clear();
      SCController.clear();
      NSPController.clear();

      Profit = 0.0;
      ROI = 0.0;
      Break_Even = 0.0;
    });
  }
}

class NumericInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  NumericInputField({required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: labelText),
    );
  }
}

class OutputTextField extends StatelessWidget {
  final String labelText;
  final String value;

  OutputTextField({required this.labelText, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            initialValue: value,
            readOnly: true,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}

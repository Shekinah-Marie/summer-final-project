import 'package:flutter/material.dart';

Widget phase2(Map<String, dynamic> data) {
  final earScreening = data['ear_screening'] ?? {};
  final otoscopy = data['otoscopy'] ?? {};
  final hearingScreening = data['hearing_screening'] ?? {};
  final hearingAid = data['hearing_aid_fitting'] ?? {};
  final fittingQC = data['fitting_quality_control'] ?? {};
  final counseling = data['counseling'] ?? {};
  final finalQC = data['final_quality_control'] ?? {};

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 5),
      _sectionTitle('EAR SCREENING'),
      const SizedBox(height: 10),
      _radioQuestion(
        "Ear Clear for Impressions:",
        ["No", "Yes"],
        earScreening['is_clear'] == 'Yes' ? 1 : 0,
      ),

      const SizedBox(height: 5),
      _sectionTitle('OTOSCOPY'),
      const SizedBox(height: 10),

      Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        children: [
          const TableRow(
            children: [
              SizedBox(),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'LEFT',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'RIGHT',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          _otoscopyRow('Wax', otoscopy['wax']),
          _otoscopyRow('Infection', otoscopy['infection']),
          _otoscopyRow('Perforation', otoscopy['perforation']),
          _otoscopyRow('Tinnitus', otoscopy['tinnitus']),
          _otoscopyRow('Atresia', otoscopy['atresia']),
          _otoscopyRow('Implant', otoscopy['implant']),
          _otoscopyRow('Other', otoscopy['other']),
          _otoscopyRow('Medical Recommendation', otoscopy['med_recommendation']),
        ],
      ),

      const SizedBox(height: 16),
      const Text('Medical Given:'),
      Wrap(
        spacing: 10,
        children: ['Antibiotic', 'Analgesic', 'Antiseptic', 'Antifungal'].map((med) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: otoscopy['medication_given']?.contains(med) ?? false,
                onChanged: null,
              ),
              Text(med),
            ],
          );
        }).toList(),
      ),

      const SizedBox(height: 16),
      const Text('Ears Clear for Fitting:'),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('LEFT:'),
              const SizedBox(width: 12),
              Radio(value: 'No', groupValue: otoscopy['ears_clear_for_assessment_left'], onChanged: null),
              const Text('No'),
              const SizedBox(width: 12),
              Radio(value: 'Yes', groupValue: otoscopy['ears_clear_for_assessment_left'], onChanged: null),
              const Text('Yes'),
            ],
          ),
          Row(
            children: [
              const Text('RIGHT:'),
              const SizedBox(width: 8),
              Radio(value: 'No', groupValue: otoscopy['ears_clear_for_assessment_right'], onChanged: null),
              const Text('No'),
              const SizedBox(width: 12),
              Radio(value: 'Yes', groupValue: otoscopy['ears_clear_for_assessment_right'], onChanged: null),
              const Text('Yes'),
            ],
          ),
        ],
      ),
      const SizedBox(height: 16),
      const Text('Comments:'),
      const SizedBox(height: 8),
      TextFormField(
        initialValue: (otoscopy['comments'] == null || otoscopy['comments'].toString().trim().isEmpty)
            ? 'N/A'
            : otoscopy['comments'],
        maxLines: 3,
        enabled: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),
    
    //HEARING SCREENING
    const SizedBox(height: 15),
    _sectionTitle('HEARING SCREENING'),
    const SizedBox(height: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Screening Method:"),
          const SizedBox(height: 6),
          Row(
            children: [
              Radio<String>(
                value: 'Audiogram',
                groupValue: hearingScreening['method'] ?? 'N/A',
                onChanged: null,
              ),
              const Text('Audiogram'),
              const SizedBox(width: 16),
              Radio<String>(
                value: 'WFA® Voice Test',
                groupValue: hearingScreening['method'] ?? 'N/A',
                onChanged: null,
              ),
              const Text('WFA® Voice Test'),
            ],
          ),
          const SizedBox(height: 10),
          const Text("Left Ear:"),
          Row(
            children: [
              Radio<String>(
                value: 'Pass',
                groupValue: hearingScreening['left_result'] ?? 'N/A',
                onChanged: null,
              ),
              const Text('Pass'),
              const SizedBox(width: 50),
              Radio<String>(
                value: 'Fail',
                groupValue: hearingScreening['left_result'] ?? 'N/A',
                onChanged: null,
              ),
              const Text('Fail'),
            ],
          ),
          const SizedBox(height: 10),
          const Text("Right Ear:"),
          Row(
            children: [
              Radio<String>(
                value: 'Pass',
                groupValue: hearingScreening['right_result'] ?? 'N/A',
                onChanged: null,
              ),
              const Text('Pass'),
              const SizedBox(width: 50),
              Radio<String>(
                value: 'Fail',
                groupValue: hearingScreening['right_result'] ?? 'N/A',
                onChanged: null,
              ),
              const Text('Fail'),
            ],
          ),
          const SizedBox(height: 10),
          const Text("How satisfied are you with your hearing?"),
          const SizedBox(height: 6),
          Row(
            children: [
              Radio<String>(
                value: 'Unsatisfied',
                groupValue: hearingScreening['hearing_satisfaction'] ?? 'N/A',
                onChanged: null,
                visualDensity: VisualDensity.compact,
              ),
              const Text('Unsatisfied'),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Undecided',
                groupValue: hearingScreening['hearing_satisfaction'] ?? 'N/A',
                onChanged: null,
                visualDensity: VisualDensity.compact,
              ),
              const Text('Undecided'),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Satisfied',
                groupValue: hearingScreening['hearing_satisfaction'] ?? 'N/A',
                onChanged: null,
                visualDensity: VisualDensity.compact,
              ),
              const Text('Satisfied'),
            ],
          ),
        ],
      ),
      
      //HEARING AID FITTING
      const SizedBox(height: 20),
      _sectionTitle("HEARING AID FITTING"),
      const SizedBox(height: 10),
      const Center(
        child: Text(
          "Results of Left and Right Ear",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(height: 6),
      // LEFT EAR TABLE
      Table(
        border: TableBorder.all(color: Colors.grey),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            children: [
              _tableCell(""),
              _tableCell("LEFT", bold: true, center: true),
              _tableCell("RIGHT", bold: true, center: true),
            ],
          ),
          TableRow(
            children: [
              _tableCell("Power Level"),
              _tableCell(hearingAid['left_power_level'] ?? '-', center: true),
              _tableCell(hearingAid['right_power_level'] ?? '-', center: true),
            ],
          ),
          TableRow(
            children: [
              _tableCell("Volume"),
              _tableCell(hearingAid['left_volume'] ?? '-', center: true),
              _tableCell(hearingAid['right_volume'] ?? '-', center: true),
            ],
          ),
          TableRow(
            children: [
              _tableCell("Battery"),
              _tableCell(hearingAid['left_battery'] ?? '-', center: true),
              _tableCell(hearingAid['right_battery'] ?? '-', center: true),
            ],
          ),
          TableRow(
            children: [
              _tableCell("Earmold"),
              _tableCell(hearingAid['left_earmold'] ?? '-', center: true),
              _tableCell(hearingAid['right_earmold'] ?? '-', center: true),
            ],
          ),
        ],
      ),

      const SizedBox(height: 10),
      const Text("Number of Hearing Aids Fit:"),
      Row(
        children: [
        Radio<String>( 
          value: '0',
          groupValue: hearingAid['num_hearing_aids'] ?? 'N/A',
          onChanged: null,
          ),
          const Text('0'),
          const SizedBox(width: 30),
          Radio<String>(
            value: '1',
            groupValue: hearingAid['num_hearing_aids'] ?? 'N/A',
            onChanged: null,
          ),
          const Text('1'),
          const SizedBox(width: 30),
          Radio<String>(
            value: '2',
            groupValue: hearingAid['num_hearing_aids'] ?? 'N/A',
            onChanged: null,
          ),
          const Text('2'),
          ],
        ),

        const SizedBox(height: 20),
        const Text(
          "Special Device:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Radio<String>(
              value: 'Bone Conductor (675)',
              groupValue: hearingAid['special_device'] ?? '',
              onChanged: null,
              visualDensity: VisualDensity.compact,
            ),
            const Flexible(child: Text('Bone Conductor (675)')),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Body Aid (AA)',
              groupValue: hearingAid['special_device'] ?? '',
              onChanged: null,
              visualDensity: VisualDensity.compact,
            ),
            const Flexible(child: Text('Body Aid (AA)')),
          ],
        ),

      const SizedBox(height: 10),
      const Text("Hearing Type", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
      Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        children: [
          const TableRow(
            children: [
              SizedBox(),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'LEFT',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'RIGHT',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          _hearingTypeRow('Normal Hearing', hearingAid['left_hearing_type'], hearingAid['right_hearing_type']),
          _hearingTypeRow('Distortion', hearingAid['left_hearing_type'], hearingAid['right_hearing_type']),
          _hearingTypeRow('Implant', hearingAid['left_hearing_type'], hearingAid['right_hearing_type']),
          _hearingTypeRow('Recruitment', hearingAid['left_hearing_type'], hearingAid['right_hearing_type']),
          _hearingTypeRow('No Response', hearingAid['left_hearing_type'], hearingAid['right_hearing_type']),
          _hearingTypeRow('Other', hearingAid['left_hearing_type'], hearingAid['right_hearing_type']),
        ],
      ),

      const Text('Comments:'),
      const SizedBox(height: 8),
      TextFormField(
        initialValue: (hearingAid['notes'] == null || hearingAid['notes'].toString().trim().isEmpty)
            ? 'N/A'
            : hearingAid['notes'],
        maxLines: 3,
        enabled: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
      ),

      //FITTING QUALITY CONTROL
      const SizedBox(height: 15),
      _sectionTitle('FITTING QUALITY CONTROL'),
      const SizedBox(height: 10),
        _radioQuestion(
        "Patient Clear for Counseling:",
        ["Yes", "No"],
        fittingQC['is_clear_for_counseling'] == 'Yes' ? 1 : 0,
      ),

      //COUNSELING
      const SizedBox(height: 15),
      _sectionTitle('COUNSELING'),
      const SizedBox(height: 10),
      Row(
        children: [
          Radio<String>(
            value: 'Yes',
            groupValue: counseling['completed']?.toString(),
            onChanged: null,
            visualDensity: VisualDensity.compact,
          ),
          const Flexible(
            child: Text('Patient completed counseling and received AfterCare information'),
          ),
        ],
      ),
      Row(
        children: [
          Radio<String>(
            value: 'Yes',
            groupValue: counseling['is_student_ambassador']?.toString(),
            onChanged: null,
            visualDensity: VisualDensity.compact,
          ),
          const Flexible(
            child: Text('Patient has been trained as a Student Ambassador'),
          ),
        ],
      ),

      //FINAL QUALITY CONTROL
      const SizedBox(height: 15),
      _sectionTitle('FINAL QUALITY CONTROL'),
      const SizedBox(height: 10),
      const Text('Number of batteries provided:'),
      const SizedBox(height: 10),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('13 = '),
          Container(
            width: 50,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            child: Text(
              finalQC['battery_13']?.toString() ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: 30),
          const Text('675 = '),
          Container(
            width: 50,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            child: Text(
              finalQC['battery_675']?.toString() ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _sectionTitle(String title) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    color: Colors.blueGrey.shade100,
    child: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _radioQuestion(String question, List<String> options, int? selectedIndex) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Wrap(
          spacing: 20,
          children: List.generate(
            options.length,
            (i) => _buildInlineRadio(options[i], selectedIndex, i),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInlineRadio(String label, int? selectedIndex, int index) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        selectedIndex == index ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: selectedIndex == index ? Colors.teal : Colors.grey,
        size: 20,
      ),
      const SizedBox(width: 4),
      Text(label),
      const SizedBox(width: 16),
    ],
  );
}

TableRow _hearingTypeRow(String type, dynamic leftType, dynamic rightType) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(type),
    ),
    Center(
      child: Radio(
        value: type,
        groupValue: leftType,
        onChanged: null,
      ),
    ),
    Center(
      child: Radio(
        value: type,
        groupValue: rightType,
        onChanged: null,
      ),
    ),
  ]);
}

Widget _tableCell(String text, {bool bold = false, bool center = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.left,
      style: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}

TableRow _otoscopyRow(String label, String? value) {
  final sides = _parseSides(value);

  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(label),
      ),
      Center(
        child: Radio<bool>(
          value: true,
          groupValue: sides.contains('left'),
          onChanged: null,
        ),
      ),
      Center(
        child: Radio<bool>(
          value: true,
          groupValue: sides.contains('right'),
          onChanged: null,
        ),
      ),
    ],
  );
}

List<String> _parseSides(String? value) {
  return value?.toLowerCase().split(',').map((e) => e.trim()).toList() ?? [];
}
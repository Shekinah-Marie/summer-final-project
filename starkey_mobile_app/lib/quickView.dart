import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:starkey_mobile_app/api_connection/api_connection.dart';
import 'package:starkey_mobile_app/utils/activity_logger.dart';
import 'package:starkey_mobile_app/patient_history.dart';
import 'package:intl/intl.dart';

class QuickViewScreen extends StatefulWidget {
  final int userId;
  final String roleName;

  const QuickViewScreen({
    super.key,
    required this.userId,
    required this.roleName,
  });

  @override
  State<QuickViewScreen> createState() => _QuickViewScreenState();
}

class _QuickViewScreenState extends State<QuickViewScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String _searchBy = 'All';
  bool _isLoading = false;
  bool _hasSearched = false;
  bool _isFetchingMore = false;
  bool _hasMoreData = true;
  int _currentPage = 1;

  List<Map<String, dynamic>> _patients = [];

  final List<String> _searchOptions = [
    'All',
    'SHF Patient ID',
    'Surname',
    'First Name',
    'City/Village',
  ];
  bool _ascending = true;

  @override
  void initState() {
    super.initState();
    _searchPatients();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 50 &&
          !_isFetchingMore &&
          _hasMoreData &&
          !_isLoading &&
          _patients.isNotEmpty) {
        _loadMorePatients();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _searchPatients() async {
    setState(() {
      _isLoading = true;
      _patients = [];
      _hasSearched = true;
      _currentPage = 1;
      _hasMoreData = true;
      _isFetchingMore = false;
    });

    final stopwatch = Stopwatch()..start();

    await _fetchPatients(page: _currentPage);

    final elapsed = stopwatch.elapsed;
    if (elapsed < const Duration(seconds: 3)) {
      await Future.delayed(Duration(seconds: 3) - elapsed);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadMorePatients() async {
    if (_isFetchingMore || !_hasMoreData) return;

    setState(() => _isFetchingMore = true);
    _currentPage++;

    final stopwatch = Stopwatch()..start();

    await _fetchPatients(page: _currentPage);

    final elapsed = stopwatch.elapsed;
    if (elapsed < const Duration(seconds: 3)) {
      await Future.delayed(Duration(seconds: 3) - elapsed);
    }

    setState(() => _isFetchingMore = false);
  }

  Future<void> _fetchPatients({required int page}) async {
    final Map<String, String> paramMap = {
      'SHF Patient ID': 'PatientID',
      'Surname': 'Surname',
      'First Name': 'FirstName',
      'School': 'School',
      'City/Village': 'City',
    };

    final url = Uri.parse(ApiConnection.getUser);

    final Map<String, String> body = {
      'UserID': widget.userId.toString(),
      'Role': widget.roleName,
      'Page': page.toString(),
    };

    if (_searchBy != 'All') {
      final paramKey = paramMap[_searchBy]!;
      body[paramKey] = _searchController.text.trim();
    }

    try {
      debugPrint("🔍 Fetching patients (Page $page) with payload: $body");
      final response = await http.post(url, body: body);
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        final newPatients = List<Map<String, dynamic>>.from(data['patients']);
        setState(() {
          if (newPatients.isEmpty) {
            _hasMoreData = false;
          } else {
            _patients.addAll(newPatients);
          }
        });

        if (_searchBy != 'All' &&
            _searchController.text.trim().isNotEmpty &&
            page == 1) {
          await ActivityLogger.log(
            userId: widget.userId,
            actionType: 'SearchPatient',
            description:
                'User searched for "${_searchController.text.trim()}" by $_searchBy',
          );
        }
      } else {
        setState(() {
          _hasMoreData = false;
        });
        if (page == 1) {
          _showNoPatientsMessage(data['message'] ?? 'No patients found');
        }
      }
    } catch (e) {
      setState(() {
        _isFetchingMore = false;
        _hasMoreData = false;
      });
      debugPrint('Error fetching patients: $e');
      _showErrorMessage('Network error');
    }
  }

  void _showNoPatientsMessage(String message) {
    setState(() {
      _patients = [];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    if (_searchBy != 'All' && _searchController.text.trim().isNotEmpty) {
      ActivityLogger.log(
        userId: widget.userId,
        actionType: 'SearchPatient',
        description:
            'No patients found for "${_searchController.text.trim()}" by $_searchBy',
      );
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _sortPatients() {
    setState(() {
      String sortField;
      switch (_searchBy) {
        case 'SHF Patient ID':
          sortField = 'shf_id';
          break;
        case 'Surname':
        case 'First Name':
          sortField = 'Name';
          break;
        case 'City/Village':
          sortField = 'City';
          break;
        default:
          sortField = 'shf_id';
      }

      _patients.sort((a, b) {
        final aValue = a[sortField] ?? '';
        final bValue = b[sortField] ?? '';
        final result = aValue.toString().compareTo(bValue.toString());
        return _ascending ? result : -result;
      });
    });
  }

  Widget _buildPatientCard(Map<String, dynamic> patient) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF207088), width: 2),
      ),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPatientRow('SHF ID:', patient['shf_id']),
            _buildPatientRow('Name:', patient['Name']),
            _buildPatientRow('Age:', patient['Age']),
            _buildPatientRow('Birthdate:', _formatDate(patient['Birthdate'])),
            _buildPatientRow('Gender:', patient['Gender']),
            _buildPatientRow('City:', patient['City']),
            _buildPatientRow('Mobile:', patient['Mobile']),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF207088),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientHistoryScreen(
                        userId: widget.userId,
                        patientId: int.tryParse(
                              patient['SHF Patient ID'].toString(),
                            ) ??
                            0,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'View History',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(dynamic rawDate) {
    if (rawDate == null || rawDate.toString().isEmpty) return '';
    try {
      final date = DateTime.parse(rawDate);
      return DateFormat('MMMM d, y').format(date);
    } catch (_) {
      return rawDate.toString();
    }
  }

  Widget _buildPatientRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF207088),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${value ?? ''}',
              style: const TextStyle(
                color: Color(0xFF207088),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Quick View',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(20, 104, 132, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.white),
            onPressed: () {
              setState(() => _ascending = !_ascending);
              _sortPatients();
            },
            tooltip: 'Toggle Sort',
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(20, 104, 132, 1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Search by:', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _searchBy,
                  dropdownColor: const Color.fromRGBO(20, 104, 132, 1),
                  style: const TextStyle(color: Colors.white),
                  items: _searchOptions
                      .map(
                        (option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _searchBy = value;
                        _searchController.clear();
                        _patients = [];
                        _hasSearched = false;
                      });
                      _searchPatients();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            AbsorbPointer(
              absorbing: _searchBy == 'All',
              child: TextFormField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: _searchBy == 'All'
                      ? 'Change "Search by" first.'
                      : 'Enter $_searchBy...',
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      if (_searchBy == 'All') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please change "Search by" to search.',
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          _isLoading = true;
                          _hasSearched = true;
                        });
                        _searchPatients();
                      }
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
                onFieldSubmitted: (_) {
                  if (_searchBy != 'All') {
                    setState(() {
                      _isLoading = true;
                      _hasSearched = true;
                    });
                    _searchPatients();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            else if (_patients.isEmpty && _hasSearched)
              const Text(
                'No patients found.',
                style: TextStyle(color: Colors.white),
              )
            else
Expanded(
  child: ListView.builder(
    controller: _scrollController,
    itemCount: _patients.length + 1,
    itemBuilder: (context, index) {
      if (index < _patients.length) {
        return _buildPatientCard(_patients[index]);
      } else {
        if (_isFetchingMore) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        } else if (!_hasMoreData && _patients.isNotEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                "No more patients to load.",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }
    },
  ),
),

          ],
        ),
      ),
    );
  }
}

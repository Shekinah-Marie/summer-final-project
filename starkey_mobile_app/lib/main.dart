import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dashboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_connection/api_connection.dart';
import 'utils/activity_logger.dart';
import 'otp_FP.dart';
import 'dart:ui';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starkey App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/starkeyLogo.png', width: 200, height: 200),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Color(0xFF3E61AC)),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<bool> _sendLoginOtp(String username) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConnection.sendOtp),
        body: {'username': username},
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200 && data['success'] == true) {
        Fluttertoast.showToast(msg: 'OTP sent successfully');
        return true;
      } else {
        Fluttertoast.showToast(
          msg: data['message'] ?? 'Failed to send OTP',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error sending OTP: $e',
        backgroundColor: Colors.red,
      );
    }
    return false;
  }

  Future<void> _showOtpDialog(String username, Map<String, dynamic> userData) async {
    int remainingSeconds = 300;
    int failedAttempts = 0;
    bool isLocked = false;
    int lockDuration = 30;
    int lockCountdown = 0;
    Timer? countdownTimer;
    Timer? lockTimer;
    bool canResend = false;
    bool isVerifying = false;

    TextEditingController otpController = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            void startOtpTimer() {
              countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
                if (remainingSeconds <= 1) {
                  timer.cancel();
                  setState(() {
                    canResend = true;
                  });
                  Fluttertoast.showToast(
                    msg: 'OTP has expired. Please tap Resend to get a new one.',
                    backgroundColor: Colors.orange,
                  );
                } else {
                  setState(() {
                    remainingSeconds--;
                  });
                }
              });
            }

            if (countdownTimer == null) {
              startOtpTimer();
            }

            String formatTime(int seconds) {
              final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
              final secs = (seconds % 60).toString().padLeft(2, '0');
              return '$minutes:$secs';
            }

            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                title: const Center(
                  child: Text("OTP Verification", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Enter the 6-digit OTP sent to your registered number."),
                    const SizedBox(height: 10),
                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: const InputDecoration(
                        labelText: 'OTP',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Expires in: ${formatTime(remainingSeconds)}',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    if (canResend || isLocked)
                      TextButton.icon(
                        onPressed: () async {
                          setState(() {
                            isLocked = false;
                            canResend = false;
                            failedAttempts = 0;
                            remainingSeconds = 300;
                          });

                          countdownTimer?.cancel();
                          lockTimer?.cancel();
                          startOtpTimer();

                          try {
                            final resendResponse = await http.post(
                              Uri.parse(ApiConnection.sendOtp),
                              body: {'username': username},
                            );

                            final resendData = jsonDecode(resendResponse.body);

                            if (resendResponse.statusCode == 200 && resendData['success'] == true) {
                              Fluttertoast.showToast(msg: "OTP resent.");
                              await ActivityLogger.log(
                                userId: null,
                                actionType: 'ResendOTP',
                                description: 'OTP resent for "$username"',
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: resendData['message'] ?? "Failed to resend OTP.",
                                backgroundColor: Colors.red,
                              );
                            }
                          } catch (e) {
                            Fluttertoast.showToast(
                              msg: "Error: ${e.toString()}",
                              backgroundColor: Colors.red,
                            );
                          }
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Resend OTP"),
                      ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      countdownTimer?.cancel();
                      lockTimer?.cancel();
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: (isVerifying || isLocked)
                        ? null
                        : () async {
                            if (otpController.text.trim().length != 6) {
                              Fluttertoast.showToast(msg: "Enter a valid 6-digit OTP.");
                              return;
                            }

                            setState(() => isVerifying = true);

                            try {
                              final response = await http.post(
                                Uri.parse(ApiConnection.verifyOtp),
                                body: {
                                  'username': username,
                                  'otp': otpController.text.trim(),
                                },
                              );

                              final data = jsonDecode(response.body);

                              if (response.statusCode == 200 && data['success'] == true) {
                                final userId = int.tryParse(userData['UserID'].toString());

                                await ActivityLogger.log(
                                  userId: userId,
                                  actionType: 'VerifyOTP',
                                  description: 'Login OTP verified for "$username"',
                                );

                                // ✅ Login is only logged *after* successful OTP
                                await ActivityLogger.log(
                                  userId: userId,
                                  actionType: 'Login',
                                  description: 'User "$username" successfully logged in after OTP verification',
                                );

                                countdownTimer?.cancel();
                                lockTimer?.cancel();
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Dashboard(userData: userData)),
                                );
                              } else {
                                failedAttempts++;

                                Fluttertoast.showToast(
                                  msg: data['message'] ?? 'Invalid OTP',
                                  backgroundColor: Colors.red,
                                );

                                await ActivityLogger.log(
                                  userId: null,
                                  actionType: 'VerifyOTP',
                                  description: 'Failed OTP attempt $failedAttempts for "$username"',
                                  status: 'Failed',
                                );

                                if (failedAttempts >= 3) {
                                  isLocked = true;
                                  lockCountdown = lockDuration;
                                  lockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
                                    if (lockCountdown <= 1) {
                                      timer.cancel();
                                      setState(() {
                                        isLocked = false;
                                        failedAttempts = 0;
                                      });
                                    } else {
                                      setState(() {
                                        lockCountdown--;
                                      });
                                    }
                                  });
                                }
                              }
                            } catch (e) {
                              Fluttertoast.showToast(
                                msg: "Error: ${e.toString()}",
                                backgroundColor: Colors.red,
                              );
                            } finally {
                              setState(() => isVerifying = false);
                            }
                          },
                    child: isVerifying
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : isLocked
                            ? Text("Locked: ${lockCountdown}s")
                            : const Text("Verify"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    countdownTimer?.cancel();
    lockTimer?.cancel();
  }

Future<void> _submitForm() async {
  if (!_formKey.currentState!.validate()) return;

  if (!_agreedToTerms) {
    Fluttertoast.showToast(
      msg: 'You must agree to the Terms and Conditions',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    return;
  }

  setState(() => _isLoading = true);

  final username = _usernameController.text.trim();
  final password = _passwordController.text.trim();

  try {
    final response = await http.post(
      Uri.parse(ApiConnection.login),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {'username': username, 'password': password},
    );

    setState(() => _isLoading = false);

    if (!response.body.trim().startsWith('{')) {
      Fluttertoast.showToast(msg: 'Server error. Please try again later.');
      return;
    }

    final data = json.decode(response.body);
    final message = data['message'] ?? 'Invalid username or password';

    if (response.statusCode == 200 && data['success'] == true) {
      final userData = data['userData'];
      final sent = await _sendLoginOtp(username);
      if (sent) {
        await _showOtpDialog(username, userData); // logs OTP + Login success
      }
    } else {
      final lockMatch = RegExp(r'Try again in (\d+)s').firstMatch(message);
      if (lockMatch != null) {
        final seconds = lockMatch.group(1) ?? '30';
        Fluttertoast.showToast(msg: 'Account is locked. Please wait $seconds seconds.');
          await ActivityLogger.log(
            userId: int.parse(data['UserID']),
            actionType: 'Login',
            description: 'Login successful for "$username"',
            status: 'Success',
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Dashboard(userData: data)),
          );
      } else if (message.toLowerCase().contains('user not found')) {
        Fluttertoast.showToast(msg: 'No account found with username "$username".');
      } else {
        Fluttertoast.showToast(msg: message);
        await ActivityLogger.log(
          userId: null,
          actionType: 'Login',
          description: 'Failed login attempt for "$username" — $message',
          status: 'Failed',
        );
      }
    }
  } catch (e) {
    setState(() => _isLoading = false);
    Fluttertoast.showToast(msg: 'Network error. Please try again.');
  }
}

 void _showTermsDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Center(
        child: Text(
          'Terms and Conditions for Use of the Starkey Connect Mobile Application',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
          textAlign: TextAlign.center,
        ),
      ),
      content: SizedBox(
        height: 400,
        width: 300,
        child: SingleChildScrollView(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 13, height: 1.5),
              children: [
                TextSpan(
                  text: 'IMPORTANT NOTICE TO EMPLOYEES\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'As an employee of Starkey Hearing Foundation, Philippines, you are granted access to the Starkey Connect mobile application (“the App”) solely for the purpose of supporting healthcare-related functions in line with your assigned role. Your use of the App is subject to the following terms and conditions, grounded in the ',
                ),
                TextSpan(
                  text: 'Data Privacy Act of 2012 (DPA)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ' and relevant Department of Health (DOH) guidelines. By using this App, you acknowledge and agree to comply with the following:\n\n',
                ),
                // Sections
                TextSpan(
                  text: '1. Lawful and Ethical Use\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Use the App lawfully, fairly, and ethically.\n'),
                TextSpan(text: '• Access data only on a '),
                TextSpan(
                  text: '“need-to-know” basis.\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '2. Data Privacy and Confidentiality\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Keep all patient information strictly confidential.\n'),
                TextSpan(text: '• Do not share data via unsecured platforms.\n\n'),
                TextSpan(
                  text: '3. Consent and Transparency\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Obtain consent before processing data.\n'),
                TextSpan(text: '• Inform patients how data will be used.\n\n'),
                TextSpan(
                  text: '4. Data Minimization\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Collect and process only necessary data.\n\n'),
                TextSpan(
                  text: '5. Access Control\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Access is based on roles and responsibilities.\n'),
                TextSpan(text: '• Do not share login credentials.\n\n'),
                TextSpan(
                  text: '6. Security Measures\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Use passwords and encrypted channels.\n'),
                TextSpan(text: '• Report lost or compromised devices.\n\n'),
                TextSpan(
                  text: '7. Physical and Digital Security\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Do not store or export patient data improperly.\n'),
                TextSpan(text: '• Properly dispose of printed records.\n\n'),
                TextSpan(
                  text: '8. Reporting of Data Breaches\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Report breaches to the DPO immediately.\n'),
                TextSpan(text: '• Failure to report may result in legal action.\n\n'),
                TextSpan(
                  text: '9. Patient Rights\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Respect patients’ rights to access, correct, or object to their data usage.\n\n'),
                TextSpan(
                  text: '10. Training and Compliance\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '• Stay updated through organizational training.\n\n'),
                TextSpan(
                  text: '11. Disciplinary and Legal Consequences\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '• Unauthorized use may lead to suspension, termination, or legal consequences under the DPA.\n\n',
                ),
                TextSpan(
                  text: 'Acknowledgement\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'By proceeding, you acknowledge that:\n'),
                TextSpan(text: '• You have read and understood these Terms.\n'),
                TextSpan(text: '• You agree to comply fully with them.\n'),
                TextSpan(text: '• You accept your responsibilities under the DPA and Foundation policies.\n\n'),
                TextSpan(
                  text: 'If you do not agree, please exit the app and inform your supervisor immediately.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Continue'),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF146884),
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                'assets/logoLogin.png',
                width: 300,
                height: 300,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .49,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      0,
                      100,
                      182,
                    ).withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your username'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OtpFP(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                    CheckboxListTile(
                      value: _agreedToTerms,
                      onChanged: (value) {
                        setState(() => _agreedToTerms = value ?? false);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      title: RichText(
                        text: TextSpan(
                          text: 'I agree to the ',
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _showTermsDialog,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

## Setup Instructions for `starkey_mobile_app`

### 1. Start XAMPP Services
- Open the XAMPP Control Panel.
- Start **MySQL** and **Apache**.
- Confirm both services are running.

### 2. Set Up API and Database
- Copy the `api` folder into your `xampp/htdocs` directory.
- Download the provided `.sql` file.
- Open phpMyAdmin and create a database named `starkeyhf`.
- Import the `.sql` file into the `starkeyhf` database.

### 3. Configure the Mobile App
- In the `starkey_mobile_app` project, update the API endpoint IP address to your computer’s local IP address so the app connects to your local server.
- After updating the IP address, run `flutter run` to launch the app on your device.

### 4. Account Information
- The app supports two predefined accounts. Registration is disabled.

#### Test Account Credentials

**City Coordinator**
- **Username:** Angelo
- **Password:** Torano0909,

After logging in, an OTP will be sent to the registered phone number. If you do not have access to the number, check the `otp_codes` table in the database to view the OTP sent.

#### User Roles in Database
To test different roles, change the `roleID` in the `users` table:
- `1` = Admin: Full access, including all activity logs and patient information/history.
- `2` = City Coordinator: Access to patient information/history within assigned city.
- `3` = Country Coordinator: Access to all patient information/history.

Use the credentials above to log in and test the app.

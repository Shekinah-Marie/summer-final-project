## Setup Instructions for `starkey_mobile_app`

### 1. Prepare the API and Database
- Move the `api` folder into your `xampp/htdocs` directory.
- Download the `.sql` file.
- Open phpMyAdmin and create a database named `starkeyhf`.
- Import the downloaded `.sql` file into the `starkeyhf` database.

### 2. Start XAMPP Services
- Open the XAMPP control panel.
- Start **MySQL** and **Apache**.
- Make sure both services are running.

### 3. Configure the Mobile App
- In the `starkey_mobile_app` project, update the API endpoint IP address to match your computer's local IP. This lets the app connect to your local server.

### 4. Account Information
- The app supports only two predefined accounts. Registration is not available.

#### Test Account Credentials

**City Coordinator**
- **Username:** Angelo
- **Password:** Torano0909,

#### User Roles in Database
You can change the `roleID` in the `users` table in database to test different roles:
- `1` = Admin - can access all even the activity logs of all users and access all patient info and history
- `2` = City Coordinator - can access patient info and history within city they assign
- `3` = Country Coordinator - can access all patient info and history

Use the credentials above to log in and test the app.

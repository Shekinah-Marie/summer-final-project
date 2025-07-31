<?php 
header('Content-Type: application/json');

// Include DB connection
include '../connection.php';

// Check DB connection
if (!isset($connectNow) || !$connectNow) {
  echo json_encode([
    'success' => false,
    'message' => 'Database connection failed.',
  ]);
  exit;
}

// SQL: Join sms_logs -> patients -> cities
$sql = "
  SELECT 
    s.SMSLogID,
    s.PatientID,
    CONCAT(COALESCE(p.first_name, ''), ' ', COALESCE(p.surname, '')) AS patient_name,
    s.RecipientNumber,
    s.Message,
    s.Status,
    s.SentAt,
    COALESCE(c.CityName, 'Unknown') AS City
  FROM sms_logs s
  LEFT JOIN patients p ON s.PatientID = p.id
  LEFT JOIN cities c ON p.city_id = c.CityID
  ORDER BY s.SentAt DESC
";

$result = mysqli_query($connectNow, $sql);

if ($result) {
  $logs = [];
  $counter = 1; // Start from 1

  while ($row = mysqli_fetch_assoc($result)) {
    $logs[] = [
      'row_number' => $counter++,
      'sms_log_id' => $row['SMSLogID'],
      'patient_id' => $row['PatientID'],
      'patient_name' => trim($row['patient_name']) !== '' ? trim($row['patient_name']) : 'Unknown',
      'recipient_number' => $row['RecipientNumber'],
      'message' => $row['Message'],
      'status' => $row['Status'],
      'sent_at' => $row['SentAt'],
      'city' => $row['City'],
    ];
  }

  echo json_encode([
    'success' => true,
    'data' => $logs
  ]);
} else {
  echo json_encode([
    'success' => false,
    'message' => 'Failed to fetch SMS logs.',
    'error' => mysqli_error($connectNow)
  ]);
}
?>

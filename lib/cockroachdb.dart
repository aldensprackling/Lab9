import 'package:postgres/postgres.dart';

/// returns a connection to the db
/// parameters: none
/// returns a Future<Connection>
Future<Connection> getOpenConnection() async {
  return Connection.open(
    // open up a connection to the internet
    Endpoint(
      port: 26257,
      host: 'aldens-cluster-14350.5xj.gcp-us-central1.cockroachlabs.cloud',
      database: 'lab_8',
      username: 'alden',
      password: 'iKhWBPDRfZhtnv2i8XhqNA',
    ),
    settings: const ConnectionSettings(
      sslMode: SslMode.verifyFull,
    ),
  );
}

Future<Result> fetchCluans() async {
  Connection? conn;
  try {
    print('getting connection');
    conn = await getOpenConnection();
    print('got connection');
    final Result result = await conn.execute(
      Sql.named(
          'SELECT * FROM cluans'), 
    );
    return result; // Ensure that the method returns a Result
  } catch (e) {
    print('Error fetching data: $e');
    rethrow; // Re-throw the error after logging or handling it
  } finally {
    conn?.close(); // Close the connection if it was opened
  }
}

#include <ESP8266WiFi.h>
#include <WebSocketClient.h>

const char* ssid     = "bles";
const char* password = "chelseafc231";
char path[] = "/rgb";
char host[] = "192.168.43.82";

WebSocketClient webSocketClient;

WiFiClient client;

#define redPin 1
#define greenPin 0
#define bluePin 2

void setup() {
//  Serial.begin(115200);
  delay(10);

  // We start by connecting to a WiFi network

//  Serial.println();
//  Serial.println();
//  Serial.print("Connecting to ");
//  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
//    Serial.print(".");
  }

//  Serial.println("");
//  Serial.println("WiFi connected");
//  Serial.println("IP address: ");
//  Serial.println(WiFi.localIP());

  delay(5000);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  delay(100);
  analogWrite(redPin, 0);
  analogWrite(greenPin, 0);
  analogWrite(bluePin, 1023);

  // Connect to the websocket server
  if (client.connect(host, 8888)) {
//    Serial.println("Connected");
  } else {
//    Serial.println("Connection failed.");
    while (1) {
      // Hang on failure
    }
  }

  // Handshake with the server
  webSocketClient.path = path;
  webSocketClient.host = host;
  if (webSocketClient.handshake(client)) {
//    Serial.println("Handshake successful");
      analogWrite(bluePin, 0);
      analogWrite(greenPin, 1023);
  } else {
//    Serial.println("Handshake failed.");
    while (1) {
      analogWrite(bluePin, 0);
      analogWrite(redPin,1023);
      // Hang on failure
    }
  }
  delay(1000);
  analogWrite(redPin, 0);
  analogWrite(greenPin, 0);
  analogWrite(bluePin, 0);
}


void loop() {
  String data;

  if (client.connected()) {

    webSocketClient.getData(data);
    if (data.length() > 0) {
//      Serial.print("Received data: ");
//      Serial.println(data);
      changeColor(data);
    }

  } else {
//    Serial.println("Client disconnected.");
    while (1) {
      // Hang on disconnect.
    }
  }
}

void changeColor(String getColor) {
  char temp[6];
  
  getColor.toCharArray(temp,7);
  char* separator = strchr(temp, ':');
  int col = atoi(temp);
  int colorVal = atoi(++separator);
//  Serial.print(col); Serial.print("  "); Serial.println(colorVal);
  if (col == 1)                       // 1 for red
    analogWrite(redPin, colorVal);
  else if (col == 2)                  // 2 for green
    analogWrite(greenPin, colorVal);
  else if (col == 3)                  // 3 for blue
    analogWrite(bluePin, colorVal);
}


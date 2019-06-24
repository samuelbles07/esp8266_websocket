#include <ESP8266WiFi.h>
#include <WebSocketClient.h>

const char* ssid     = "bles";
const char* password = "chelseafc231";
char path[] = "/dim";
char host[] = "192.168.43.82";

WebSocketClient webSocketClient;

#define ledPin 0

WiFiClient client;

void setup() {
  Serial.begin(115200);
  delay(10);

  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");  
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  delay(5000);
  
//  pinMode(ledPin, OUTPUT);
  // Connect to the websocket server
  if (client.connect(host, 8888)) {
    Serial.println("Connected");
  } else {
    Serial.println("Connection failed.");
    while(1) {
      // Hang on failure
    }
  }
  
  // Handshake with the server
  webSocketClient.path = path;
  webSocketClient.host = host;
  if (webSocketClient.handshake(client)) {
    Serial.println("Handshake successful");
  } else {
    Serial.println("Handshake failed.");
//    digitalWrite(ledPin, HIGH);
    while(1) {
      // Hang on failure
    }  
  }
  analogWrite(ledPin, 512); 
}

void loop() {
  String data;
  
  if (client.connected()) {
    
    webSocketClient.getData(data);
    if (data.length() > 0) {
      Serial.print("Received data: ");
      Serial.println(data);
      int pwm = data.toInt();
      analogWrite(ledPin, pwm);
    }
    
    
  } else {
    Serial.println("Client disconnected.");
    while (1) {
      // Hang on disconnect.
    }
  }  
}

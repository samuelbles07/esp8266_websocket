#include <ESP8266WiFi.h>
#include <WebSocketClient.h>

const char* ssid     = "bles";
const char* password = "chelseafc231";
char path[] = "/blink";
char host[] = "192.168.43.82";
//String ip = host;
WebSocketClient webSocketClient;

#define ledPin 0
int interval = 500;
int oldMillis = 0;
int ledState = LOW;

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
  
  pinMode(ledPin, OUTPUT);
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
    digitalWrite(ledPin, HIGH);
    while(1) {
      // Hang on failure
    }  
  }

}

void loop() {
  String data;
  unsigned long nowMillis = millis();

  if(nowMillis - oldMillis >= interval){
    oldMillis = nowMillis;
    if(ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;
    digitalWrite(ledPin, ledState);  
  }
  
  if (client.connected()) {
    
    webSocketClient.getData(data);
    if (data.length() > 0) {
      Serial.print("Received data: ");
      Serial.println(data);
      interval = data.toInt();
    }
    
  } else {
    Serial.println("Client disconnected.");
    while (1) {
      // Hang on disconnect.
    }
  }
}

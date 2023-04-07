//1 path linear
const int FEED1=34;
const int FEED3=49;
const int PORKING1=2;
const int PORKING3=18;
const int Switch=21;
const int trigger=14;

unsigned long pluseCounter =0;
const int GATE1=25;
const int GATE2=24;
const int GATE3=26;
bool P1flag;
bool P3flag;

void onRising(){
  ++pluseCounter;
}

void setup() {
  // put your setup code here, to run once:

  pinMode(FEED1,OUTPUT);
  pinMode(FEED3,OUTPUT);
  pinMode(PORKING1,INPUT);
  pinMode(PORKING3,INPUT);
  pinMode(GATE1,OUTPUT);
  pinMode(GATE2,OUTPUT);
  pinMode(GATE3,OUTPUT);
  
  digitalWrite(FEED1,LOW);
  digitalWrite(FEED3,LOW);
  digitalWrite(GATE1,HIGH);
  digitalWrite(GATE2,HIGH);
  digitalWrite(GATE3,LOW); 
  
  bool P1flag=false;
  bool P3flag=false;
  attachInterrupt(digitalPinToInterrupt(Switch),onRising,RISING);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

  if(digitalRead(trigger)==HIGH){

    if(digitalRead(PORKING1)==HIGH&&P1flag==false){
      digitalWrite(FEED1,HIGH);
      digitalWrite(FEED3,LOW);
      P1flag=true;
      P3flag=false;
      Serial.println("F1");
      Serial.println(String(pluseCounter)); 
    }
    if(digitalRead(PORKING3)==HIGH&&P3flag==false){
      digitalWrite(FEED3,HIGH); 
      digitalWrite(FEED1,LOW);
      P1flag=false;
      P3flag=true;
      Serial.println("F3");
      Serial.println(String(pluseCounter));
    }
  }
}

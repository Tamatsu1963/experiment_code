// two path linear
//definition
const int FEED1=34;
const int FEED3=49;
const int PORKING1=2;
const int PORKING3=18;
const int SENSOR1=38; 
const int SENSOR5=42;
const int GATE3=24;
const int Switch=21;
const int trigger=14;

unsigned long pluseCounter =0;
bool S1flag, F1flag, S3flag, F3flag;
//pluse count
void onRising(){
  ++pluseCounter;
}

void setup() {
  // put your setup code here, to run once:

  pinMode(FEED1,OUTPUT);
  pinMode(FEED3,OUTPUT);
  pinMode(GATE3,OUTPUT);
  pinMode(SENSOR1,INPUT);
  pinMode(SENSOR5,INPUT);
  pinMode(PORKING1,INPUT);
  pinMode(PORKING3,INPUT);
  //pinMode(LED1,OUTPUT);
  //pinMode(LED3,OUTPUT);
  pinMode(Switch,INPUT);
  pinMode(trigger,INPUT);

  digitalWrite(FEED1,LOW);
  digitalWrite(FEED3,LOW);
  digitalWrite(GATE3,HIGH);

  S1flag=false;
  S3flag=false;
  F1flag=false;
  F3flag=false;
  attachInterrupt(digitalPinToInterrupt(Switch),onRising,RISING);
  
  Serial.begin(9600);//給餌箱に頭を入れたことを確認するためシリアル通信
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(trigger)==HIGH){
    if(digitalRead(SENSOR1)==HIGH&&S1flag==false){
      digitalWrite(FEED1,LOW);
      //digitalWrite(GATE3,LOW);
      S1flag=true;
      F1flag=false;
      Serial.println("S1");
      Serial.println(String(pluseCounter));
    }

    if(digitalRead(SENSOR5)==HIGH&&S3flag==false){
      digitalWrite(FEED3,LOW);
      //digitalWrite(GATE3,LOW);
      S3flag=true;
      F3flag=false;
      Serial.println("S3");
      Serial.println(String(pluseCounter));
    }

    if(digitalRead(PORKING1)==HIGH&&F1flag==false){
      digitalWrite(FEED1,HIGH);
      //digitalWrite(GATE3,HIGH);
      S3flag=false;
      F1flag=true;
      Serial.println("F1");
      Serial.println(String(pluseCounter));
    }

    if(digitalRead(PORKING3)==HIGH&&F3flag==false){
      digitalWrite(FEED3,HIGH);
      //digitalWrite(GATE3,HIGH);
      S1flag=false;
      F3flag=true;
      Serial.println("F3");
      Serial.println(String(pluseCounter));
    }
  }

}

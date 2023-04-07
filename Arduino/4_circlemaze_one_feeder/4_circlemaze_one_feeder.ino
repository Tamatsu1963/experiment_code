const int FEED1=34;
const int FEED2=35;
const int FEED3=49;
const int FEED4=48;
const int PORKING1=2;
const int PORKING2=3;
const int PORKING3=18;
const int PORKING4=19;
const int SENSOR1=38;
const int SENSOR2=39;   
const int SENSOR5=42;
const int SENSOR4=41;
const int GATE1=22;
const int GATE2=23;
const int GATE3=24;
const int GATE4=25;
const int GATE5=26;
const int GATE6=27;
const int GATE7=28;
const int GATE8=29;
const int Switch=21;
const int trigger=14;

int count;
unsigned long pluseCounter;
bool S1flag, S2flag, S3flag, S4flag, F1flag;

//pluse count
void onRising(){
  ++pluseCounter;
}


void setup() {
  // put your setup code here, to run once:

pinMode(FEED1,OUTPUT);
pinMode(GATE1,OUTPUT);
pinMode(GATE2,OUTPUT);
pinMode(GATE3,OUTPUT);
pinMode(GATE4,OUTPUT);
pinMode(GATE5,OUTPUT);
pinMode(GATE6,OUTPUT);
pinMode(GATE7,OUTPUT);
pinMode(GATE8,OUTPUT);
pinMode(SENSOR1,INPUT);
pinMode(SENSOR2,INPUT);
pinMode(SENSOR5,INPUT);
pinMode(SENSOR4,INPUT);
pinMode(PORKING1,INPUT);
pinMode(PORKING2,INPUT);
pinMode(PORKING3,INPUT);
pinMode(PORKING4,INPUT);
pinMode(Switch,INPUT);
pinMode(trigger,INPUT);

digitalWrite(FEED1,LOW);
digitalWrite(GATE1,HIGH);
digitalWrite(GATE2,HIGH);
digitalWrite(GATE3,HIGH);
digitalWrite(GATE4,HIGH);
digitalWrite(GATE5,HIGH);
digitalWrite(GATE6,LOW);
digitalWrite(GATE7,HIGH);
digitalWrite(GATE8,LOW);

count=0;
pluseCounter =0;
S1flag=false;//センサーのフラグ
S2flag=false;
S3flag=false;
S4flag=false;
F1flag=false;//餌箱のフラグ

attachInterrupt(digitalPinToInterrupt(Switch),onRising,RISING);
Serial.begin(9600); // 通信速度（bits/sec）はお使いの環境に合わせてください。
}


void loop() {
  // put your main code here, to run repeatedly:

  if(digitalRead(trigger)==HIGH){

    if(count==0){
        digitalWrite(GATE6,HIGH);
        }
  
    if(digitalRead(SENSOR1)==HIGH){
      digitalWrite(GATE3,LOW);
      digitalWrite(GATE4,HIGH);
      digitalWrite(GATE5,HIGH);
      digitalWrite(GATE6,HIGH);
      if(S1flag==false){
        digitalWrite(FEED1,LOW);
        S1flag=true;
        S3flag=false;
        F1flag=false;
        Serial.println("S1");
        Serial.println(String(pluseCounter));
      } 
    }
/*
    if(digitalRead(SENSOR1)==HIGH&&S4flag==true){
      digitalWrite(GATE3,LOW);
    }
*/  
    if(digitalRead(SENSOR2)==HIGH){
      digitalWrite(GATE3,HIGH);
      digitalWrite(GATE4,LOW);
      digitalWrite(GATE5,HIGH);
      digitalWrite(GATE6,HIGH);
      if(S2flag==false){
        S2flag=true;
        S4flag=false;
        Serial.println("s2");
        Serial.println(String(pluseCounter));
      } 
    }
/*
    if(digitalRead(SENSOR2)==HIGH&&S1flag==true){
      digitalWrite(GATE4,LOW);
    }
*/
    if(digitalRead(SENSOR5)==HIGH){
      digitalWrite(GATE3,HIGH);
      digitalWrite(GATE4,HIGH);
      digitalWrite(GATE5,HIGH);
      digitalWrite(GATE6,LOW);
      digitalWrite(GATE8,HIGH);
      if(S3flag==false){
        count=count+1;
        S3flag=true;
        S1flag=false;
        Serial.println("s3");
        Serial.println(String(pluseCounter));
      } 
    }
/*
    if(digitalRead(SENSOR3)==HIGH&&S2flag==true){
      digitalWrite(GATE6,LOW);
    }
*/
    if(digitalRead(SENSOR4)==HIGH){
      digitalWrite(GATE3,HIGH);
      digitalWrite(GATE4,HIGH);
      digitalWrite(GATE5,LOW);
      digitalWrite(GATE6,HIGH);
      if(S4flag==false){
       S2flag=false;
       S4flag=true;
       Serial.println("s4");
       Serial.println(String(pluseCounter));
      } 
    }
/*
    if(digitalRead(SENSOR4)==HIGH&&S3flag==true){
      digitalWrite(GATE5,LOW);
    }
*/
  if(digitalRead(PORKING1)==HIGH&&F1flag==false){
    digitalWrite(GATE3,LOW);
    digitalWrite(FEED1,HIGH);
    F1flag=true;
    Serial.println("F1");
    Serial.println(String(pluseCounter));
  }

/*
  if(count==41){
    digitalWrite(GATE4,LOW);
    digitalWrite(GATE6,LOW);
  }
  */
  
  
    
  

    
}
  if(digitalRead(trigger)==LOW){
    digitalWrite(GATE4,LOW);
    digitalWrite(GATE8,LOW);
    digitalWrite(GATE6,LOW);
  }
}

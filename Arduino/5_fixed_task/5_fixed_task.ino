//時間制限あり
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
const int SENSOR3=40;
const int SENSOR4=41;
const int SENSOR5=42;   
const int SENSOR6=43;
const int SENSOR7=44;   
const int SENSOR8=45;
const int GATE1=22;
const int GATE2=23;
const int GATE3=24;
const int GATE4=25;
const int GATE5=26;
const int GATE6=27;
const int GATE7=28;
const int GATE8=29;
const int Switch=21;
const int Trigger=14;
//const int LED=6;

int count1, count2, count4, S, feedernumber;
int count3=0;
unsigned long pluseCounter =0;

bool S1flag, S2flag, S3flag, S4flag, F1flag, F2flag, F3flag, F4flag;

//pluse count
void onRising(){
  ++pluseCounter;
}

void setup() {
  // put your setup code here, to run once:
  pinMode(FEED1,OUTPUT);
  pinMode(FEED2,OUTPUT);
  pinMode(FEED3,OUTPUT);
  pinMode(FEED4,OUTPUT);
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
  pinMode(SENSOR3,INPUT);
  pinMode(SENSOR3,INPUT);
  pinMode(SENSOR4,INPUT);
  pinMode(SENSOR5,INPUT);
  pinMode(SENSOR6,INPUT);
  pinMode(SENSOR7,INPUT);
  pinMode(SENSOR8,INPUT);
  pinMode(PORKING1,INPUT);
  pinMode(PORKING2,INPUT);
  pinMode(PORKING3,INPUT);
  pinMode(PORKING4,INPUT);
  pinMode(Switch,INPUT);
  pinMode(Trigger,INPUT);
  //pinMode(LED,OUTPUT);

  //初期状態
  digitalWrite(FEED1,LOW);
  digitalWrite(FEED2,LOW);
  digitalWrite(FEED3,LOW);
  digitalWrite(FEED4,LOW);
  digitalWrite(GATE1,HIGH);
  digitalWrite(GATE2,HIGH);
  digitalWrite(GATE3,HIGH);
  digitalWrite(GATE4,HIGH);
  digitalWrite(GATE5,HIGH);
  digitalWrite(GATE6,LOW);
  digitalWrite(GATE7,HIGH);
  digitalWrite(GATE8,LOW);
  //digitalWrite(LED,LOW);
  
  count1=0;//餌を得られる回数
  count2=0;
  count3=0;
  count4=0;
  S=0;
  pluseCounter =0;
  feedernumber=2;
  S1flag=false;
  S2flag=false;
  S3flag=false;
  S4flag=false;
  F1flag=false;
  F2flag=false;
  F3flag=false;
  F4flag=false;

  attachInterrupt(digitalPinToInterrupt(Switch),onRising,RISING);

  Serial.begin(9600);//給餌箱に頭を入れたことを確認するためシリアル通信

}

void loop() {
  // put your main code here, to run repeatedly:

if(digitalRead(Trigger)==HIGH&&pluseCounter<45000){
  if(count3<=10){
    if(S==0){
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
        if(feedernumber==1){
          Serial.println("S1");
          Serial.println(String(pluseCounter));
        }else{
          Serial.println("s1");
          Serial.println(String(pluseCounter));
        }
      }
    }
    if(digitalRead(SENSOR2)==HIGH){
      digitalWrite(GATE3,HIGH);
      digitalWrite(GATE4,LOW);
      digitalWrite(GATE5,HIGH);
      digitalWrite(GATE6,HIGH);
      if(S2flag==false){
        digitalWrite(FEED2,LOW);
        S2flag=true;
        S4flag=false;
        F2flag=false;
        if(feedernumber==2){
          Serial.println("S2");
          Serial.println(String(pluseCounter));
        }else{
          Serial.println("s2");
          Serial.println(String(pluseCounter));
        }
      }
    }
    if(digitalRead(SENSOR5)==HIGH){ //sensor3の位置
      digitalWrite(GATE3,HIGH);
      digitalWrite(GATE4,HIGH);
      digitalWrite(GATE5,HIGH);
      digitalWrite(GATE6,LOW);
      if(S3flag==false){
        S=1;
        count3=count3+1;
        digitalWrite(GATE8,HIGH);
        digitalWrite(FEED3,LOW);
        S1flag=false;
        S3flag=true;
        F3flag=false;
        if(feedernumber==3){
          Serial.println("S3");
          Serial.println(String(pluseCounter));
        }else{
          Serial.println("s3");
          Serial.println(String(pluseCounter));
        }
      }
    }
    if(digitalRead(SENSOR4)==HIGH){
      digitalWrite(GATE3,HIGH);
      digitalWrite(GATE4,HIGH);
      digitalWrite(GATE5,LOW);
      digitalWrite(GATE6,HIGH);
      if(S4flag==false){
        digitalWrite(FEED4,LOW);
        S2flag=false;
        S4flag=true;
        F4flag=false;
        if(feedernumber==4){
          Serial.println("S4");
          Serial.println(String(pluseCounter));
        }else{
          Serial.println("s4");
          Serial.println(String(pluseCounter));
        }
      }
    }
    if(digitalRead(PORKING1)==HIGH&&F1flag==false){
      F1flag=true;
      if(feedernumber==1){
        digitalWrite(FEED1,HIGH);
        Serial.println("F1");
        Serial.println(String(pluseCounter));
      }else{
        Serial.println("f1");
        Serial.println(String(pluseCounter));
      }
    }
    if(digitalRead(PORKING2)==HIGH&&F2flag==false){
      F2flag=true;
      if(feedernumber==2){
        digitalWrite(FEED2,HIGH);
        Serial.println("F2");
        Serial.println(String(pluseCounter));
      }else{
        Serial.println("f2");
        Serial.println(String(pluseCounter));
      }
    }
    if(digitalRead(PORKING3)==HIGH&&F3flag==false){
      F3flag=true;
      if(feedernumber==3){
        digitalWrite(FEED3,HIGH);
        Serial.println("F3");
        Serial.println(String(pluseCounter));
      }else{
        Serial.println("f3");
        Serial.println(String(pluseCounter));
      }
    }
    if(digitalRead(PORKING4)==HIGH&&F4flag==false){
      F4flag=true;
      if(feedernumber==4){
        digitalWrite(FEED4,HIGH);
        Serial.println("F4");
        Serial.println(String(pluseCounter));
      }else{
        Serial.println("f4");
        Serial.println(String(pluseCounter));
      } 
    }
  }
    if(count3>=11){
      digitalWrite(GATE6,LOW);
      digitalWrite(GATE3,LOW);
      digitalWrite(GATE5,LOW);
    }

}else{
  digitalWrite(GATE6,LOW);
  digitalWrite(GATE3,LOW);
  digitalWrite(GATE5,LOW);
}
        
}

//FEED number 3

const int SWITCH=3;
const int dSWITCH=20;
const int FEED=49;
const int DISCARD= 51;


const int GATE2=24;
const int GATE1=25;
const int GATE3=26;

bool flag;
bool dflag;

void setup() {
  // put your setup code here, to run once:

  pinMode(SWITCH,INPUT_PULLUP);
  pinMode(dSWITCH,INPUT_PULLUP);
  pinMode(FEED,OUTPUT);
  pinMode(DISCARD,OUTPUT);
  pinMode(GATE1,OUTPUT);
  pinMode(GATE2,OUTPUT);
  pinMode(GATE3,OUTPUT);

  digitalWrite(FEED,LOW);
  digitalWrite(DISCARD,LOW);
  digitalWrite(GATE1,HIGH);
  digitalWrite(GATE2,HIGH);
  digitalWrite(GATE3,LOW); 

  bool flag=false;
  bool dflag=false;


attachInterrupt(digitalPinToInterrupt(SWITCH), trigger, CHANGE);
attachInterrupt(digitalPinToInterrupt(dSWITCH), Dtrigger, CHANGE);

}

void loop() {
  // put your main code here, to run repeatedly:

  if(flag==true){
    digitalWrite(FEED,HIGH);
    delay(100);
    digitalWrite(FEED,LOW);
    flag=false;
  }

  if(dflag==true){
    digitalWrite(DISCARD,HIGH);
    delay(100);
    digitalWrite(DISCARD,LOW);
    dflag=false;
  }

}

void trigger(){
  flag=true;
}


void Dtrigger(){
    dflag=true;
}

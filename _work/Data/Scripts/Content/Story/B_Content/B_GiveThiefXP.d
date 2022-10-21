var int VictimCount;
var int VictimLevel;
var int ThiefLevel;

const int ThiefXP = 50;
//------------------------------------------------------------------
FUNC VOID B_GiveThiefXP()
{
	
	VictimCount = (VictimCount +1);//zähl die Opfer
	
	
	if (VictimLevel == 0)
	{
		VictimLevel = 2; //Start
	};
	
	if (VictimCount >= VictimLevel)
	{
		//----------------Kalkulation-----------------
		
		ThiefLevel = (ThiefLevel +1);
		VictimLevel =(VictimCount  + ThiefLevel); //Erhöhe die Anzahl der nötigen Opfer zum nächsten Level (aktuelleOpfer + aktueller Level)
		
		//Platz für Goodies (Items, Attributes...) 
	};
		
		//-------------------XP-----------------------
		
		B_GivePlayerXP (ThiefXP + (ThiefLevel * 10));  
};
//------------------------------------------------------------------ 
FUNC VOID B_ResetThiefLevel()
{

	
	if (VictimCount > ThiefLevel)
	{
		VictimCount = (VictimCount - 1); 
	};
	
	
};

var int VictimCount;
var int VictimLevel;
var int ThiefLevel;

const int ThiefXP = 50;
//------------------------------------------------------------------
FUNC VOID B_GiveThiefXP()
{
	
	VictimCount = (VictimCount +1);//zдhl die Opfer
	
	
	if (VictimLevel == 0)
	{
		VictimLevel = 2; //Start
	};
	
	if (VictimCount >= VictimLevel)
	{
		//----------------Kalkulation-----------------
		
		ThiefLevel = (ThiefLevel +1);
		VictimLevel =(VictimCount  + ThiefLevel); //Erhцhe die Anzahl der nцtigen Opfer zum nдchsten Level (aktuelleOpfer + aktueller Level)
		
		//Platz fьr Goodies (Items, Attributes...) 
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

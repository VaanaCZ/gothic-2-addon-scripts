var int VictimCount;
var int VictimLevel;
var int ThiefLevel;

const int ThiefXP = 50;
//------------------------------------------------------------------
FUNC VOID B_GiveThiefXP()
{
	
	VictimCount = (VictimCount +1);//z�hl die Opfer
	
	
	if (VictimLevel == 0)
	{
		VictimLevel = 2; //Start
	};
	
	if (VictimCount >= VictimLevel)
	{
		//----------------Kalkulation-----------------
		
		ThiefLevel = (ThiefLevel +1);
		VictimLevel =(VictimCount  + ThiefLevel); //Erh�he die Anzahl der n�tigen Opfer zum n�chsten Level (aktuelleOpfer + aktueller Level)
		
		//Platz f�r Goodies (Items, Attributes...) 
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

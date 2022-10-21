// ************************************************************
// 						Ambient - NEWS
// ************************************************************

INSTANCE DIA_Ambient_NEWS (C_INFO)
{
	//npc		= alle;	//wird in ZS_Talk zugeordnet
	nr			= 1;
	condition	= DIA_Ambient_NEWS_Condition;
	information	= DIA_Ambient_NEWS_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Ambient_NEWS_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (B_GetPlayerCrime(self) != CRIME_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Ambient_NEWS_Info()
{	
	// ------ CRIME ------
	if (B_GetPlayerCrime(self) == CRIME_SHEEPKILLER)
	{
		B_Say (self,other,"$SHEEPKILLER_CRIME"); //Einfach unsere Schafe zu schlachten! Mach, daﬂ du hier wegkommst!
	};
				
	if (B_GetPlayerCrime(self) == CRIME_ATTACK)
	{
		B_Say (self,other,"$ATTACK_CRIME"); //Mit miesen Schl‰gern rede ich nicht!
	};
		
	if (B_GetPlayerCrime(self) == CRIME_THEFT)
	{
		B_Say (self,other,"$THEFT_CRIME"); //Geh mir aus den Augen, dreckiger Dieb!
	};
	
	// ------ CITY ------
	if (C_NpcBelongsToCity(self))
	{
		// ------ Player-Gilde und Petzmaster ------
		if (other.guild == GIL_PAL)
		&& (Hagen_Schulden <= 0)
		{
			B_Say (self,other,"$PAL_CITY_CRIME"); //Du bist eine Schande f¸r deinen Orden! Lord Hagen wird toben vor Wut!
		}
		else if (other.guild == GIL_MIL)
		&& (Andre_Schulden <= 0)
		{
			B_Say (self,other,"$MIL_CITY_CRIME"); //Du bist eine Schande f¸r die Stadtwache! Lord Andre wird dir das sicher austreiben!
		}
		else if (Andre_Schulden <= 0) //Spieler ist irgendwer
		{
			B_Say (self,other,"$CITY_CRIME"); //Lord Andre wird von deiner Tat erfahren!
		};
	};

	// ------ KLOSTER ------
	if (C_NpcBelongsToMonastery(self))
	&& (Parlan_Schulden <= 0)
	{
		B_Say (self,other,"$MONA_CRIME"); //Dein Frevel wird Vater Parlan sicherlich nicht erfreuen!
	};
	
	// ------ BAUERNHOF ------
	if (C_NpcBelongsToFarm(self))
	&& (Lee_Schulden <= 0)
	{
		B_Say (self,other,"$FARM_CRIME"); //Lee wird dir die Hammelbeine langziehen! Wirst schon sehen, was du davon hast!
	};
	
	// ------ OLD CAMP ------
	if (C_NpcBelongsToOldCamp(self))
	&& (Garond_Schulden <= 0)
	{
		B_Say (self,other,"$OC_CRIME"); //Kommandant Garond wird dich zur Rechenschaft ziehen!
	};
	
	// ------ Dialog beenden ------	
	AI_StopProcessInfos(self);
};


// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientNEWS (var C_NPC slf)
{
	DIA_AMBIENT_NEWS.npc = Hlp_GetInstanceID(slf);
};






	

	
	
	
	
		
		


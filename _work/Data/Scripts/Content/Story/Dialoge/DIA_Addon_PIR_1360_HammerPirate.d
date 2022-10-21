// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_HammerPirate_EXIT(C_INFO)
{
	npc 		= PIR_1360_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_HammerPirate_EXIT_Condition;
	information	= DIA_Addon_HammerPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_HammerPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Hello - PERM
// *************************************************************************
instance DIA_Addon_HammerPirate_Hello(C_INFO)
{
	npc 		= PIR_1360_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_HammerPirate_Hello_Condition;
	information	= DIA_Addon_HammerPirate_Hello_Info;
	permanent	= TRUE;
	description = "Wszystko w porz¹dku?";
};                       
func INT DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_HammerPirate_Hello_Info()
{	
	AI_Output (other, self, "DIA_Addon_HammerPirate_Hello_15_00"); //Wszystko w porz¹dku?
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (C_TowerBanditsDead() == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_01"); //Pobiliœmy ich! Skurczybyki nie mia³y ¿adnych szans!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_02"); //No, wykrztuœ to z siebie!
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_03"); //Nie mam zamiaru siê mieszaæ.
	};
};



// ************************************************************
// *** 														***
// 						Mitkommen (Henry)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_Anheuern(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_HammerPirate_Anheuern_Condition;
	information	= DIA_Addon_HammerPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Powinieneœ mi pomóc.";
};                       
FUNC INT DIA_Addon_HammerPirate_Anheuern_Condition()
{
	if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_HammerPirate_Anheuern_Info()
{	
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_00"); //Nie musisz nic mówiæ. Chcesz, ¿ebym pomóg³ ci walczyæ z bandytami?
	AI_Output (other,self ,"DIA_Addon_PIR_6_JoinHenry_15_08"); //Nie ma sprawy. Mówisz i masz.
	if (!Npc_IsDead(SawPirate))
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_01"); //Czemu nie poprosisz o pomoc kolesi pi³uj¹cych drewno?
	};
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_02"); //W sumie... Nie mam ochoty na tê ca³¹ zabawê.
};
// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_ComeOn(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_HammerPirate_ComeOn_Condition;
	information	= DIA_Addon_HammerPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "ChodŸ ze mn¹.";
};
func int DIA_Addon_HammerPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	&& (C_TowerBanditsDead() == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_HammerPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_HammerPirate_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_HammerPirate_ComeOn_15_00"); //ChodŸ ze mn¹.
	if (SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_01"); //Henry chce, ¿eby jeden z nas zosta³ tutaj. Rozumiesz?
	}
	else if (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{	
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_02"); //PójdŸmy kawa³ek w kierunku obozu.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_03"); //Tak, tak...
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_HammerPirate_GoHome(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_HammerPirate_GoHome_Condition;
	information	= DIA_Addon_HammerPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};                       
FUNC INT DIA_Addon_HammerPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_HammerPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_HammerPirate_GoHome_15_00"); //Nie potrzebujê ju¿ twojej pomocy.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_01"); //Jak sobie ¿yczysz.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); 
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_HammerPirate_TooFar(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_HammerPirate_TooFar_Condition;
	information	= DIA_Addon_HammerPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_HammerPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_HammerPirate_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_HammerPirate_TooFar_07_01"); //Je¿eli chcesz tam iœæ, to nie bêdê ciê zatrzymywaæ.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_02"); //Chyba wrócê.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};

	

// ************************************************************
// 			 				SUCCESS
// ************************************************************
INSTANCE DIA_Addon_HammerPirate_Success(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_HammerPirate_Success_Condition;
	information	= DIA_Addon_HammerPirate_Success_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_HammerPirate_Success_Condition()
{
	if (C_TowerBanditsDead() == TRUE)
	&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_HammerPirate_Success_Info()
{	
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_01"); //Wiesz co? Trochê nad tym myœla³em i chyba masz racjê!
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_02"); //Wracam do obozu. Zobaczymy siê wkrótce.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};

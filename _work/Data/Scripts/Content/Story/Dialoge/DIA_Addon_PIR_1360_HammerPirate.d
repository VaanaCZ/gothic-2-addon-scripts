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
	description = "Wszystko w porządku?";
};                       
func INT DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_HammerPirate_Hello_Info()
{	
	AI_Output (other, self, "DIA_Addon_HammerPirate_Hello_15_00"); //Wszystko w porządku?
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (C_TowerBanditsDead() == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_01"); //Pobiliśmy ich! Skurczybyki nie miały żadnych szans!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_02"); //No, wykrztuś to z siebie!
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_03"); //Nie mam zamiaru się mieszać.
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
	description = "Powinieneś mi pomóc.";
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
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_00"); //Nie musisz nic mówić. Chcesz, żebym pomógł ci walczyć z bandytami?
	AI_Output (other,self ,"DIA_Addon_PIR_6_JoinHenry_15_08"); //Nie ma sprawy. Mówisz i masz.
	if (!Npc_IsDead(SawPirate))
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_01"); //Czemu nie poprosisz o pomoc kolesi piłujących drewno?
	};
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_02"); //W sumie... Nie mam ochoty na tę całą zabawę.
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
	description	= "Chodź ze mną.";
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
	AI_Output (other, self, "DIA_Addon_HammerPirate_ComeOn_15_00"); //Chodź ze mną.
	if (SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_01"); //Henry chce, żeby jeden z nas został tutaj. Rozumiesz?
	}
	else if (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{	
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_02"); //Pójdźmy kawałek w kierunku obozu.
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
	description = "Nie potrzebuję już twojej pomocy.";
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
	AI_Output (other,self ,"DIA_Addon_HammerPirate_GoHome_15_00"); //Nie potrzebuję już twojej pomocy.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_01"); //Jak sobie życzysz.
	
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
	AI_Output (self ,other,"DIA_Addon_HammerPirate_TooFar_07_01"); //Jeżeli chcesz tam iść, to nie będę cię zatrzymywać.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_02"); //Chyba wrócę.
	
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
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_01"); //Wiesz co? Trochę nad tym myślałem i chyba masz rację!
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_02"); //Wracam do obozu. Zobaczymy się wkrótce.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};

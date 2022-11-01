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
	description = "Všechno v poâádku?";
};                       
func INT DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_HammerPirate_Hello_Info()
{	
	AI_Output (other, self, "DIA_Addon_HammerPirate_Hello_15_00"); //Všecko v pohodę?
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (C_TowerBanditsDead() == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_01"); //Jasnę, už je to hotový. Ti šmejdi jsou teë na placičku!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_02"); //Tak pojëme na to!
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_03"); //Ne! Vůbec mę to tady nebaví.
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
	description = "Męl bys mi pomoci.";
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
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_00"); //Nepovídej! Chceš, abych šel s tebou a pomoh ti zlikvidovat ty bandity.
	AI_Output (other,self ,"DIA_Addon_PIR_6_JoinHenry_15_08"); //Pâesnę tak.
	if (!Npc_IsDead(SawPirate))
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_01"); //A proč se nezeptáš toho chlápka s pilou?
	};
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_02"); //Já... tohle nezvládnu...
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
	description	= "Pojë se mnou.";
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
	AI_Output (other, self, "DIA_Addon_HammerPirate_ComeOn_15_00"); //Pojë se mnou.
	if (SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_01"); //Henry potâebuje, aby jeden z nás zůstal TADY.
	}
	else if (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{	
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_02"); //Vraăme se kousek smęrem k táboru.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_03"); //(povzdech) No jo.
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
	description = "Už tę nepotâebuju.";
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
	AI_Output (other,self ,"DIA_Addon_HammerPirate_GoHome_15_00"); //Už tę nepotâebuju.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_01"); //Když myslíš.
	
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
	AI_Output (self ,other,"DIA_Addon_HammerPirate_TooFar_07_01"); //Jestli chceš jít dál tímhle smęrem, tak teda ale beze mę.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_02"); //Myslím, že teë půjdu zpátky.
	
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
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_01"); //Víš ty co? Trochu jsem o tom pâemejšlel. Ty nejseš tak špatnej!
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_02"); //Tak já se teda vrátím do tábora. Męj se!
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};

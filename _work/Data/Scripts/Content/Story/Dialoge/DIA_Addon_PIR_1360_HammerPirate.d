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
	description = "V�echno v po��dku?";
};                       
func INT DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_HammerPirate_Hello_Info()
{	
	AI_Output (other, self, "DIA_Addon_HammerPirate_Hello_15_00"); //V�ecko v pohod�?
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (C_TowerBanditsDead() == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_01"); //Jasn�, u� je to hotov�. Ti �mejdi jsou te� na placi�ku!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_02"); //Tak poj�me na to!
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_03"); //Ne! V�bec m� to tady nebav�.
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
	description = "M�l bys mi pomoci.";
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
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_00"); //Nepov�dej! Chce�, abych �el s tebou a pomoh ti zlikvidovat ty bandity.
	AI_Output (other,self ,"DIA_Addon_PIR_6_JoinHenry_15_08"); //P�esn� tak.
	if (!Npc_IsDead(SawPirate))
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_01"); //A pro� se nezept� toho chl�pka s pilou?
	};
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_02"); //J�... tohle nezvl�dnu...
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
	description	= "Poj� se mnou.";
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
	AI_Output (other, self, "DIA_Addon_HammerPirate_ComeOn_15_00"); //Poj� se mnou.
	if (SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_01"); //Henry pot�ebuje, aby jeden z n�s z�stal TADY.
	}
	else if (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{	
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_02"); //Vra�me se kousek sm�rem k t�boru.
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
	description = "U� t� nepot�ebuju.";
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
	AI_Output (other,self ,"DIA_Addon_HammerPirate_GoHome_15_00"); //U� t� nepot�ebuju.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_01"); //Kdy� mysl�.
	
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
	AI_Output (self ,other,"DIA_Addon_HammerPirate_TooFar_07_01"); //Jestli chce� j�t d�l t�mhle sm�rem, tak teda ale beze m�.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_02"); //Mysl�m, �e te� p�jdu zp�tky.
	
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
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_01"); //V� ty co? Trochu jsem o tom p�emej�lel. Ty nejse� tak �patnej!
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_02"); //Tak j� se teda vr�t�m do t�bora. M�j se!
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};

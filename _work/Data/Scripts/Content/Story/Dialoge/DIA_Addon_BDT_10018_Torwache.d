// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Addon_BDT_10018_Torwache_EXIT (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 999;
	condition	= DIA_Addon_BDT_10018_Torwache_EXIT_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_EXIT_Info;
	permanent	= TRUE;
	description	= "Jeszcze porozmawiamy.";
};        
         
FUNC INT DIA_Addon_BDT_10018_Torwache_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_BDT_10018_Torwache_EXIT_Info()
{
	AI_Output (other, self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00"); //Jeszcze porozmawiamy.
	
	if (BDT_100018_Einmal == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01"); //Wiesz, co ci powiem.
		BDT_100018_Einmal = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02"); //Zje¿d¿aj.
	};
	AI_StopProcessInfos	(self);
};
 
		
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_10018_Checkpoint	= "BL_RAVEN_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_BDT_10018_Torwache_FirstWarn (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 1;
	condition	= DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_10018_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_FirstWarn_Info()
{
	
	if ( BDT_100018_Tells == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00"); //Hej, spokojnie! Nie mo¿esz wejœæ, wiêc zje¿d¿aj!
		AI_Output (other, self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01"); //Z drogi - muszê siê widzieæ z Krukiem.
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02"); //Nikt nie mo¿e tam wejœæ. Kruk wyda³ wyraŸny rozkaz.
		BDT_100018_Tells = TRUE;
		
		Log_CreateTopic (Topic_Addon_Tempel,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Tempel,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Tempel,"Stra¿nik u wrót œwi¹tyni nie wpuœci mnie do œrodka. Muszê znaleŸæ sposób, ¿eby siê tam dostaæ.");
	}
	else
	{	
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03"); //To znowu ty? Zaczynasz mnie dra¿niæ!
		//AI_StopProcessInfos(self);
	};			
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_BDT_10018_Torwache_SecondWarn (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 2;
	condition	= DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_10018_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00"); //Zrób jeszcze jeden krok, a bêdzie to twój ostatni.

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_BDT_10018_Torwache_Attack (C_INFO)
{
	npc			= BDT_10018_Addon_Torwache;
	nr			= 3;
	condition	= DIA_Addon_BDT_10018_Torwache_Attack_Condition;
	information	= DIA_Addon_BDT_10018_Torwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_BDT_10018_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_10018_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00"); //Za Kruka!
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
//----------------------------------------------------------------------
//	Info Wichtig
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Hi   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 2;
	condition   = DIA_Addon_10018_Torwache_Hi_Condition;
	information = DIA_Addon_10018_Torwache_Hi_Info;
	permanent   = FALSE;
	description = "To piekielnie wa¿ne! Muszê siê z nim widzieæ.";
};
FUNC INT DIA_Addon_10018_Torwache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10018_Torwache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Hi_15_00");//To piekielnie wa¿ne! Muszê siê z nim widzieæ.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Hi_04_01");//Nie. To wcale nie jest wa¿ne. Tylko Bloodwyn móg³ wejœæ do œrodka.
	
	B_LogEntry (Topic_Addon_Tempel,"Tylko Bloodwyn ma prawo przebywaæ wewn¹trz œwi¹tyni. Mo¿e jednak jakoœ siê tam dostanê.");
};
//----------------------------------------------------------------------
//	Info Bloodwyn
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Bloodwyn   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 2;
	condition   = DIA_Addon_10018_Torwache_Bloodwyn_Condition;
	information = DIA_Addon_10018_Torwache_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Bloodwyn? A on nie jest martwy?";
};
FUNC INT DIA_Addon_10018_Torwache_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_Bloodwyn_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");//Bloodwyn? A on nie jest martwy?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");//Jest silniejszy ni¿ kiedykolwiek. A jak siê dowie, ¿e ktoœ robi k³opoty, to go skasuje.
};
//----------------------------------------------------------------------
//	Info Bribe
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Bribe   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 9;
	condition   = DIA_Addon_10018_Torwache_Bribe_Condition;
	information = DIA_Addon_10018_Torwache_Bribe_Info;
	permanent   = FALSE;
	description = "Jeœli mnie przepuœcisz, dam ci tysi¹c sztuk z³ota.";
};
FUNC INT DIA_Addon_10018_Torwache_Bribe_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_Bribe_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Bribe_15_00");//Jeœli mnie przepuœcisz, dam ci tysi¹c sztuk z³ota.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Bribe_04_01");//Marnujesz czas, idioto.
};
//----------------------------------------------------------------------
//	Info Drin
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_Drin   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 90;
	condition   = DIA_Addon_10018_Torwache_Drin_Condition;
	information = DIA_Addon_10018_Torwache_Drin_Info;
	permanent   = FALSE;
	description = "Bloodwyn jest w œrodku? No to zabierz go stamt¹d!";
};
FUNC INT DIA_Addon_10018_Torwache_Drin_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_Drin_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Drin_15_00");//Bloodwyn jest w œrodku? No to zabierz go stamt¹d!
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_01");//Ha! Naprawdê wydaje ci siê, ¿e zrobi³bym coœ takiego?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_02");//Byæ mo¿e w obozie jesteœ wa¿nym cz³owiekiem. Ale twoje wp³ywy koñcz¹ siê DOK£ADNIE TU. Jasne?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_03");//IdŸ wiêc do kopalni po z³oto albo zrób coœ innego - bylebyœ siê tu nie krêci³!
	
	MIS_BloodwynRaus = LOG_RUNNING;

	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn siedzi w œwi¹tyni. Ale nie mogê siê teraz do niego dostaæ. Mo¿e powinienem znowu rozejrzeæ siê po kopalni?");
};
//----------------------------------------------------------------------
//	Info kopf
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10018_Torwache_kopf   (C_INFO)
{
	npc         = BDT_10018_Addon_Torwache;
	nr          = 90;
	condition   = DIA_Addon_10018_Torwache_kopf_Condition;
	information = DIA_Addon_10018_Torwache_kopf_Info;
	permanent   = FALSE;
	description = "(Poka¿ g³owê Bloodwyna)";
};
FUNC INT DIA_Addon_10018_Torwache_kopf_Condition()
{	
	if( Npc_HasItems (other, ItMi_Addon_Bloodwyn_Kopf) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10018_Torwache_kopf_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_kopf_15_00");//Masz! Dalej chcesz mnie powstrzymywaæ?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_01");//Czy to... Czy to... To... Bloodwyn? O rany, to jest...
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_02");//Ee, tak, echem, nie, to znaczy... Mo¿esz wejœæ.
	
	MIS_BloodwynRaus = LOG_SUCCESS;
	
	
	
	self.aivar[AIV_PASSGATE] = TRUE;	
	AI_StopProcessInfos(self);
};	
	
	
	



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
	description	= "Wir sprechen uns noch.";
};        
         
FUNC INT DIA_Addon_BDT_10018_Torwache_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_BDT_10018_Torwache_EXIT_Info()
{
	AI_Output (other, self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00"); //Wir sprechen uns noch.
	
	if (BDT_100018_Einmal == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01"); //Du kannst dir denken, was ich dir dann sagen werde ...
		BDT_100018_Einmal = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02"); //Verschwinde.
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
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00"); //Hey, langsam! Du kommst nicht rein - also verschwinde!
		AI_Output (other, self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01"); //Geh aus dem Weg - ich muss zu Raven.
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02"); //Niemand betritt diese Gemächer. Klare Anordnung von Raven persönlich.
		BDT_100018_Tells = TRUE;
		
		Log_CreateTopic (Topic_Addon_Tempel,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Tempel,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Tempel,"Die Torwache vor dem Tempel wird mich nicht reinlassen. Ich muss einen Weg finden, wie ich hineinkomme.");
	}
	else
	{	
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03"); //Du schon wieder? Du nervst!
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
	AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00"); //Mach noch einen Schritt und es ist dein Letzter!

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
	
	AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00"); //Für Raven!
	
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
	description = "Es ist verdammt wichtig das ich ihn erreiche.";
};
FUNC INT DIA_Addon_10018_Torwache_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_10018_Torwache_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Hi_15_00");//Es ist verdammt wichtig, dass ich ihn erreiche.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Hi_04_01");//Nein. Ist es nicht. Nur Bloodwyn hat die Erlaubnis, sich drin aufzuhalten.
	
	B_LogEntry (Topic_Addon_Tempel,"Nur Bloodwyn ist es erlaubt, sich im Tempel aufzuhalten. Vielleicht komme ich über ihn in den Tempel.");
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
	description = "Bloodwyn? Sollte der nicht tot sein?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");//Bloodwyn? Sollte der nicht tot sein?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");//Er ist stärker als jemals zuvor. Und wenn er erfährt, dass hier jemand Ärger macht, macht er Kleinholz aus dir.
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
	description = "Ich gebe dir tausend Goldstücke, wenn du mich reinläßt.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Bribe_15_00");//Ich gebe dir tausend Goldstücke, wenn du mich reinlässt.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Bribe_04_01");//Du verschwendest deine Zeit, Penner.
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
	description = "Bloodwyn ist drin? Dann hol ihn raus. ";
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
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_Drin_15_00");//Bloodwyn ist drin? Dann hol ihn raus.
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_01");//Ha! Glaubst du im Ernst, ich würde das tun?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_02");//Mag ja sein, dass du jetzt ein wichtiger Mann im Lager bist. Aber deine Macht endet GENAU HIER. Begriffen?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_03");//Also geh in die Mine und buddel nach Gold oder mach sonst was - aber steh hier nicht im Weg rum!
	
	MIS_BloodwynRaus = LOG_RUNNING;

	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn sitzt im Tempel. Aber ich komme hier nicht weiter. Vielleicht sollte ich mich mal in der Mine umsehen.");
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
	description = "(Bloodwyn's Kopf zeigen)";
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
	AI_Output (other, self, "DIA_Addon_BDT_10018_Torwache_kopf_15_00");//Hier! Willst du mich jetzt immer noch aufhalten!?
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_01");//Ist das ... ist das ... Bloodwyn? ... buah, das ist ja ...
	AI_Output (self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_02");//Äh ... ja, äh nein. Ich meine ... Äh ... du kannst durch ...
	
	MIS_BloodwynRaus = LOG_SUCCESS;
	
	
	
	self.aivar[AIV_PASSGATE] = TRUE;	
	AI_StopProcessInfos(self);
};	
	
	
	



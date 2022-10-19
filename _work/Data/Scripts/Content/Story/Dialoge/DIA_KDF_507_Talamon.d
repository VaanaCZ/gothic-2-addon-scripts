///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 999;
	condition   = DIA_Talamon_KAP1_EXIT_Condition;
	information = DIA_Talamon_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talamon_KAP1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// ------------------------------------------------------------
	const string KDF_507_Checkpoint		= "NW_MONASTERY_SEALROOM_01"; //Zugang zur geheimen Bibliothek
// ------------------------------------------------------------

instance DIA_KDF_507_Talamon_FirstWarn (C_INFO)
{
	npc			= KDF_507_Talamon;
	nr			= 1;
	condition	= DIA_KDF_507_Talamon_FirstWarn_Condition;
	information	= DIA_KDF_507_Talamon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_KDF_507_Talamon_FirstWarn_Condition()
{
	if ((Pyrokar_LetYouPassTalamon == FALSE)
	&&	(self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_KDF_507_Talamon_FirstWarn_04_00"); //Nie wolno ci iœæ dalej. Zawróæ!
	//AI_Output (other, self,"DIA_KDF_507_Talamon_FirstWarn_15_01"); //
	
	AI_StopProcessInfos	(self);

	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};


// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_KDF_507_Talamon_SecondWarn (C_INFO)
{
	npc			= KDF_507_Talamon;
	nr			= 2;
	condition	= DIA_KDF_507_Talamon_SecondWarn_Condition;
	information	= DIA_KDF_507_Talamon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_KDF_507_Talamon_SecondWarn_Condition()
{
	if ((Pyrokar_LetYouPassTalamon == FALSE)
	&& 	(self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven						)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,KDF_507_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_KDF_507_Talamon_SecondWarn_04_00"); //Innos ukarze ciê kl¹tw¹, jeœli nie zawrócisz!

	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_KDF_507_Talamon_Attack (C_INFO)
{
	npc			= KDF_507_Talamon;
	nr			= 3;
	condition	= DIA_KDF_507_Talamon_Attack_Condition;
	information	= DIA_KDF_507_Talamon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_KDF_507_Talamon_Attack_Condition()
{
	if ((Pyrokar_LetYouPassTalamon == FALSE)
	&&  (self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,KDF_507_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;	//wird auch in ZS_Attack resettet
	
	AI_StopProcessInfos	(self);							//dem Spieler sofort wieder die Kontrolle zurückgeben
	
	B_Attack (self, other, AR_GuardStopsIntruder, 1);
};

//#######################################################################
//##
//##		Kapitel 2
//##
//####################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 999;
	condition   = DIA_Talamon_KAP2_EXIT_Condition;
	information = DIA_Talamon_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talamon_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#######################################################################
//##
//##		Kapitel 3
//##
//####################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 999;
	condition   = DIA_Talamon_KAP3_EXIT_Condition;
	information = DIA_Talamon_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talamon_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#######################################################################
//##
//##		Kapitel 4
//##
//####################################################################### 

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 999;
	condition   = DIA_Talamon_KAP4_EXIT_Condition;
	information = DIA_Talamon_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talamon_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#######################################################################
//##
//##		Kapitel 5
//##
//####################################################################### 

///////////////////////////////////////////////////////////////////////
//	Halt! 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_KAP5_Stop   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 50;
	condition   = DIA_Talamon_KAP5_Stop_Condition;
	information = DIA_Talamon_KAP5_Stop_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Talamon_KAP5_Stop_Condition()
{
	if (Pyrokar_LetYouPassTalamon == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_KAP5_Stop_Info()
{
	AI_Output (self, other,"DIA_Talamon_KAP5_Stop_04_00"); //Nie wolno ci iœæ dalej. Zawróæ!
	AI_Output (other,self ,"DIA_Talamon_KAP5_Stop_15_01"); //Pyrokar mówi, ¿e mogê przestudiowaæ ksiêgê Xardasa.
	AI_Output (self, other,"DIA_Talamon_KAP5_Stop_04_02"); //Tak mówi. W takim razie, mo¿esz wejœæ. Ksiêga, której szukasz, znajduje siê na ³awie alchemika.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Talamon trzyma³ ksiêgê Xardasa na stole alchemicznym w piwnicy."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundSecretDoor 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_FoundSecretDoor   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 51;
	condition   = DIA_Talamon_FoundSecretDoor_Condition;
	information = DIA_Talamon_FoundSecretDoor_Info;
	permanent   = FALSE;
	description = "Znalaz³em tajemne przejœcie.";
};

FUNC INT DIA_Talamon_FoundSecretDoor_Condition()
{
	if (SecretLibraryIsOpen == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_FoundSecretDoor_Info()
{
	AI_Output (other,self ,"DIA_Talamon_FoundSecretDoor_15_00"); //Znalaz³em tajemne przejœcie.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_01"); //Jak? Gdzie?
	AI_Output (other,self ,"DIA_Talamon_FoundSecretDoor_15_02"); //Za rega³em z ksiêgami.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_03"); //Co siê za nim znajduje?
	AI_Output (other,self ,"DIA_Talamon_FoundSecretDoor_15_04"); //Wygl¹da to na star¹, podziemn¹ kryptê.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_05"); //To bardzo wa¿na informacja. Niezw³ocznie powiadomiê Pyrokara.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_06"); //W tym czasie musisz sprawdziæ, co kryj¹ piwnice.
	
	MIS_ScoutLibrary = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MIS_SCoutLibrary 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_ScoutSecretLibrary   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 51;
	condition   = DIA_Talamon_ScoutSecretLibrary_Condition;
	information = DIA_Talamon_ScoutSecretLibrary_Info;
	permanent   = TRUE;
	description = "By³em w krypcie.";
};

FUNC INT DIA_Talamon_ScoutSecretLibrary_Condition()
{
	if (MIS_SCOUTLIBRARY == LOG_RUNNING)
	&& (HeroWasInLibrary == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_ScoutSecretLibrary_Info()
{
	AI_Output (other,self ,"DIA_Talamon_ScoutSecretLibrary_15_00"); //By³em w krypcie.
	AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_01"); //I co uda³o ci siê odnaleŸæ?
	
	if (Npc_IsDead (SecretLibrarySkeleton))
	{
		AI_Output (other,self ,"DIA_Talamon_ScoutSecretLibrary_15_02"); //By³ tam szkielet wojownika, pilnowa³ jakichœ drzwi. Zabi³em go.
		AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_03"); //Dobra robota.
		AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_04"); //Kiedy ju¿ zwyciê¿ymy z³o, zajmiemy siê krypt¹.
	
		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP (XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output (other,self ,"DIA_Talamon_ScoutSecretLibrary_15_05"); //Pe³no tam ró¿nych bestii.
		AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_06"); //Coœ tam musi byæ, kontynuuj poszukiwania. A bestiom nie okazuj litoœci.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talamon_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_507_Talamon;
	nr          = 999;
	condition   = DIA_Talamon_KAP5_EXIT_Condition;
	information = DIA_Talamon_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talamon_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Talamon_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Talamon_PICKPOCKET (C_INFO)
{
	npc			= KDF_507_Talamon;
	nr			= 900;
	condition	= DIA_Talamon_PICKPOCKET_Condition;
	information	= DIA_Talamon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Talamon_PICKPOCKET_Condition()
{
	C_Beklauen (87, 140);
};
 
FUNC VOID DIA_Talamon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Talamon_PICKPOCKET);
	Info_AddChoice		(DIA_Talamon_PICKPOCKET, DIALOG_BACK 		,DIA_Talamon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Talamon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Talamon_PICKPOCKET_DoIt);
};

func void DIA_Talamon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Talamon_PICKPOCKET);
};
	
func void DIA_Talamon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Talamon_PICKPOCKET);
};



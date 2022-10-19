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
	AI_Output (self, other,"DIA_KDF_507_Talamon_FirstWarn_04_00"); //Es ist dir nicht gestattet, weiter zu gehen. Kehr um!
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
	AI_Output (self, other,"DIA_KDF_507_Talamon_SecondWarn_04_00"); //Innos wird seinen Zorn auf dich richten, wenn du nicht umkehrst!

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
	AI_Output (self, other,"DIA_Talamon_KAP5_Stop_04_00"); //Es ist dir nicht gestattet, weiter zu gehen. Kehr um!
	AI_Output (other,self ,"DIA_Talamon_KAP5_Stop_15_01"); //Pyrokar sagt, dass ich das Buch von Xardas untersuchen darf.
	AI_Output (self, other,"DIA_Talamon_KAP5_Stop_04_02"); //So, sagt er das. In Ordnung, du darfst eintreten. Das Buch, das du suchst, liegt dort drüben auf dem Alchemietisch.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Talamon bewarte Xardas Buch auf einem Alchemietisch im Keller auf."); 
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
	description = "Ich habe eine Geheimtür gefunden.";
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
	AI_Output (other,self ,"DIA_Talamon_FoundSecretDoor_15_00"); //Ich habe eine Geheimtür gefunden.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_01"); //(überrascht) Was? Wo?
	AI_Output (other,self ,"DIA_Talamon_FoundSecretDoor_15_02"); //Hinter einem Bücherregal.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_03"); //Was ist dahinter?
	AI_Output (other,self ,"DIA_Talamon_FoundSecretDoor_15_04"); //Es sieht aus wie ein altes Kellergewölbe.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_05"); //Das ist eine wichtige Neuigkeit, ich werde sofort Pyrokar davon unterrichten.
	AI_Output (self ,other,"DIA_Talamon_FoundSecretDoor_04_06"); //Du musst derweil rausfinden, was in diesem Keller ist.
	
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
	description = "Ich war im Gewölbe.";
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
	AI_Output (other,self ,"DIA_Talamon_ScoutSecretLibrary_15_00"); //Ich war im Gewölbe.
	AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_01"); //Und was hast du gefunden?
	
	if (Npc_IsDead (SecretLibrarySkeleton))
	{
		AI_Output (other,self ,"DIA_Talamon_ScoutSecretLibrary_15_02"); //Dort unten war ein Skelettkrieger, der eine Tür bewacht. Ich habe ihn getötet.
		AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_03"); //Gut gemacht.
		AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_04"); //Wir werden uns mit dem Gewölbe beschäftigen, wenn wir das Böse besiegt haben.
	
		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP (XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output (other,self ,"DIA_Talamon_ScoutSecretLibrary_15_05"); //Dort unten ist alles voller Monster.
		AI_Output (self ,other,"DIA_Talamon_ScoutSecretLibrary_04_06"); //Da muss etwas sein, suche weiter. Und lass bei diesen Viechern keine Gnade walten.
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



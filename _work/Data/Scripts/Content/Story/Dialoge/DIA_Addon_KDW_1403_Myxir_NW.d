///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_EXIT   (C_INFO)
{
	npc         = KDW_1403_Addon_Myxir_NW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_EXIT_Condition;
	information = DIA_Addon_Myxir_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1403_Addon_Myxir_NW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_LightningFlash, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Hallo		(C_INFO)
{
	npc			 = 	KDW_1403_Addon_Myxir_NW;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Myxir_Hallo_Condition;
	information	 = 	DIA_Addon_Myxir_Hallo_Info;

	description	 = 	"Wszystko w porządku?";
};

func int DIA_Addon_Myxir_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_Hallo_15_00"); //Wszystko w porządku?
	AI_Output	(self, other, "DIA_Addon_Myxir_Hallo_12_01"); //Masz dużo odwagi, pokazując się tu.
};
///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_WasMachstDu		(C_INFO)
{
	npc			 = 	KDW_1403_Addon_Myxir_NW;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Myxir_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Myxir_WasMachstDu_Info;

	description	 = 	"Co tu robisz?";
};

func int DIA_Addon_Myxir_WasMachstDu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_WasMachstDu_15_00"); //Co tu robisz?
	AI_Output	(self, other, "DIA_Addon_Myxir_WasMachstDu_12_01"); //Uczę się języka budowniczych.
	AI_Output	(self, other, "DIA_Addon_Myxir_WasMachstDu_12_02"); //Język jest kluczem do wiedzy tego starożytnego ludu.
	AI_Output	(self, other, "DIA_Addon_Myxir_WasMachstDu_12_03"); //Każdy z nas musi się go nauczyć, inaczej ta ekspedycja dobiegnie końca, zanim się zacznie.
	AI_Output	(self, other, "DIA_Addon_Myxir_WasMachstDu_12_04"); //Budowniczowie używali kamiennych tabliczek do przekazywania swojej wiedzy. Niestety, wiele z nich zniszczono lub skradziono dawno temu.
};
///////////////////////////////////////////////////////////////////////
//	Info Steintafeln
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Steintafeln		(C_INFO)
{
	npc			 = 	KDW_1403_Addon_Myxir_NW;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Myxir_Steintafeln_Condition;
	information	 = 	DIA_Addon_Myxir_Steintafeln_Info;

	description	 = 	"Co zapisano na tych kamiennych tablicach?";
};

func int DIA_Addon_Myxir_Steintafeln_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};
func void DIA_Addon_Myxir_Steintafeln_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_Steintafeln_15_00"); //Co zapisano na tych kamiennych tablicach?
	AI_Output	(self, other, "DIA_Addon_Myxir_Steintafeln_12_01"); //Zawierają w sobie całą wiedzę starożytnych.
	AI_Output	(self, other, "DIA_Addon_Myxir_Steintafeln_12_02"); //Niektórzy z nich za pomocą zaklęć zwiększali swą znajomość magii i walki.
	AI_Output	(self, other, "DIA_Addon_Myxir_Steintafeln_12_03"); //Dla kogoś, kto potrafi odczytać tablice, to prawdziwy skarb.


	Log_CreateTopic (TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Stoneplates,"Na kamiennych tablicach spisano wiedzę starożytnego ludu budowniczych. Dzięki niektórym z tych tablic można zwiększyć swoje umiejętności bojowe i znajomość magii, ale trzeba je umieć odczytać."); 
};
///////////////////////////////////////////////////////////////////////
//	Info WillYouTeachMe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_WillYouTeachMe		(C_INFO)
{
	npc		 = 	KDW_1403_Addon_Myxir_NW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information	 = 	DIA_Addon_Myxir_WillYouTeachMe_Info;

	description	 = 	"Możesz mnie nauczyć czytania w tym dawnym języku?";
};

func int DIA_Addon_Myxir_WillYouTeachMe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_WillYouTeachMe_15_00"); //Możesz mnie nauczyć czytania w tym dawnym języku?
	AI_Output	(self, other, "DIA_Addon_Myxir_WillYouTeachMe_12_01"); //Czemu nie? Przekażę ci moją wiedzę.
	Myxir_Addon_TeachPlayer = TRUE;

	Log_CreateTopic (TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Stoneplates, LogText_Addon_MyxirTeach); 

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach);
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Teach		(C_INFO)
{
	npc		 = 	KDW_1403_Addon_Myxir_NW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Naucz mnie tego dziwnego języka.";
};

var int DIA_Addon_Myxir_Teach_NoPerm;

func int DIA_Addon_Myxir_Teach_Condition ()
{
	if (Myxir_Addon_TeachPlayer == TRUE)
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_Teach);
		Info_AddChoice (DIA_Addon_Myxir_Teach,DIALOG_BACK,DIA_Addon_Myxir_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_Teach);
};
FUNC VOID DIA_Addon_Myxir_Teach_LANGUAGE_1 ()
{
	if B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1)
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X ();
	};	
	Info_ClearChoices (DIA_Addon_Myxir_Teach);
};
FUNC VOID DIA_Addon_Myxir_Teach_LANGUAGE_2 ()
{
	if B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2)
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X ();
	};	
	Info_ClearChoices (DIA_Addon_Myxir_Teach);
};
FUNC VOID DIA_Addon_Myxir_Teach_LANGUAGE_3 ()
{
	if	B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3)
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X ();
	};	
	Info_ClearChoices (DIA_Addon_Myxir_Teach);
};




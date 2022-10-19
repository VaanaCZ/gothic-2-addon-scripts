
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_CITY_EXIT   (C_INFO)
{
	npc         = KDW_140300_Addon_Myxir_CITY;
	nr          = 999;
	condition   = DIA_Addon_Myxir_CITY_EXIT_Condition;
	information = DIA_Addon_Myxir_CITY_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_CITY_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_CITY_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HelloCITY
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_CITY_HelloCITY		(C_INFO)
{
	npc		 = 	KDW_140300_Addon_Myxir_CITY;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_CITY_HelloCITY_Condition;
	information	 = 	DIA_Addon_Myxir_CITY_HelloCITY_Info;
	permanent	 = 	TRUE;

	description	 = 	"Z�stane� te� ve m�st�?";
};

func int DIA_Addon_Myxir_CITY_HelloCITY_Condition ()
{
	return TRUE;
};
var int DIA_Addon_Myxir_CITY_HelloCITY_OneTime;
func void DIA_Addon_Myxir_CITY_HelloCITY_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_CITY_HelloCITY_15_00"); //Z�stane� te� ve m�st�?
	AI_Output	(self, other, "DIA_Addon_Myxir_CITY_HelloCITY_12_01"); //Pokud Vatras odejde z m�sta, mus� tu z�stat jeden z n�s.
	
	VatrasAbloeseIstDa = TRUE;
	
	if (RavenIsDead == TRUE)
	&& (DIA_Addon_Myxir_CITY_HelloCITY_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_CITY_HelloCITY_12_02"); //Je�t� jedna v�c.
		AI_Output	(self, other, "DIA_Addon_Myxir_CITY_HelloCITY_12_03"); //To bylo v�n� hrdinsk�, jak sis vedl v Jharkendaru.
		AI_Output	(other, self, "DIA_Addon_Myxir_CITY_HelloCITY_15_04"); //Bohu�el jsem ale je�t� neskon�il se v��m, co m�m ud�lat tady v Khorinidu.
		AI_Output	(self, other, "DIA_Addon_Myxir_CITY_HelloCITY_12_05"); //Pravda, ale ty to v�echno ur�it� taky zvl�dne�, Ochr�n�e.
		AI_Output	(other, self, "DIA_Addon_Myxir_CITY_HelloCITY_15_06"); //Uvid�me.
		DIA_Addon_Myxir_CITY_HelloCITY_OneTime = TRUE;
		B_GivePlayerXP (XP_Ambient);
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_CITY_Teach		(C_INFO)
{
	npc		 = 	KDW_140300_Addon_Myxir_CITY;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_CITY_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_CITY_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nau� m� tomu jazyku.";
};

var int DIA_Addon_Myxir_CITY_Teach_NoPerm;
var int DIA_Addon_Myxir_CITY_Teach_OneTime;

func int DIA_Addon_Myxir_CITY_Teach_Condition ()
{
	if (Myxir_Addon_TeachPlayer == TRUE)
	&& (DIA_Addon_Myxir_CITY_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_CITY_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();
	
	if (DIA_Addon_Myxir_CITY_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_CITY_Teach_OneTime = TRUE;
	};	

	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_CITY_Teach);
		Info_AddChoice (DIA_Addon_Myxir_CITY_Teach,DIALOG_BACK,DIA_Addon_Myxir_CITY_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_CITY_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_CITY_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_CITY_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_CITY_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_CITY_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_CITY_Teach);
};
FUNC VOID DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_CITY_Teach);
};
FUNC VOID DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_CITY_Teach);
};
FUNC VOID DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_CITY_Teach);
};


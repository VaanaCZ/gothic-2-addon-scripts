// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_7_EXIT_Condition;
	information	= DIA_MIL_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_7_JOIN_Condition;
	information	= DIA_MIL_7_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will der Miliz beitreten!";
};                       

FUNC INT DIA_MIL_7_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Ich will der Miliz beitreten!
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Du bist ja noch nicht mal Bürger von Khorinis! Warum, denkst du, sollte dich Lord Andre aufnehmen?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //Da könnte ja jeder kommen - sich mal eben schnell 'ne Waffe und 'ne Rüstung geben lassen und dann damit verschwinden!
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Aber ich mein's ernst!
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //Dann erklär das nicht mir, sondern Lord Andre. Du findest ihn in der Kaserne.
		};
	}
	else
	{
		B_Say (self, other, "$ABS_GOOD");
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_7_PEOPLE_Condition;
	information	= DIA_MIL_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Was weißt du über die Paladine?";
};                       

FUNC INT DIA_MIL_7_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //Was weißt du über die Paladine?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Nicht viel. Keiner weiß so genau, warum sie hier sind. Auch wir von der Stadtwache nicht.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Sie haben die Kontrolle über die Stadt übernommen, den Stadthalter aus seinem Ratssaal verjagt und den Richter seines Amtes enthoben.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Wenn du mich fragst, ist das 'ne gute Sache. Diese aufgeblasenen Wichtigtuer hatten eine Lektion in Demut mal bitter nötig.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_7_LOCATION_Condition;
	information	= DIA_MIL_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Was habe ich hier in der Stadt für Möglichkeiten?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Was habe ich hier in der Stadt für Möglichkeiten?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Wenn du nicht im Hafenviertel in der Gosse enden willst, such dir 'ne ordentliche Arbeit. Frag in der Unterstadt herum - vielleicht hast du Glück.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Wenn du vorhast, länger hier in der Stadt zu bleiben, solltest du der Miliz beitreten oder dich zumindest im Kampf ausbilden lassen.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Die Kampfausbilder in der Kaserne trainieren auch normale Bürger.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Bald werden die Orks kommen und dann wirst du dich über jede Stunde freuen, die du auf dem Kasernenplatz zugebracht hast.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_7_STANDARD_Condition;
	information	= DIA_MIL_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Was gibt's Neues?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Nach und nach verschwinden hier die Bürger. Bisher haben wir aber noch nicht herausgefunden, was mit ihnen geschehen ist. Ob die Orks dahinter stecken?
			
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{		
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Es heißt, die Bauern lehnen sich auf. Jetzt, wo wir im Krieg mit den Orks sind, können wir so einen Mist nicht gebrauchen!
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Es wird Zeit, dass die Paladine den Bauernaufstand endlich beenden. Wer das Gesetzt bricht, muss bestraft werden. Gerade jetzt, wo wir im Krieg sind.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Der Söldner, der Lothar ermordet haben soll, ist angeblich unschuldig. Man hat Beweise gefunden, dass man ihm den Mord nur anhängen wollte.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Einer von Onars Söldnern hat den ehrenwerten Paladin Lothar ermordet. Aber der Mistkerl wurde gefasst und ins Gefängnis geworfen.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Einige der Söldner haben Onars Hof schon verlassen. Manche Probleme erledigen sich von selbst.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Die Drachen sind geschafft, aber es ist noch nicht vorbei. Als nächstes sind die Orks dran. Wir werden hier mal ordentlich aufräumen!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_7 (var c_NPC slf)
{
	DIA_MIL_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

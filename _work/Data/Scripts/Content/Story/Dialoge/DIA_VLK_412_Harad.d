// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Harad_EXIT   (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 999;
	condition   = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Harad_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *****************************************************
// 							Hallo
// *****************************************************
instance DIA_Harad_Hallo		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 2;
	condition	= DIA_Harad_Hallo_Condition;
	information	= DIA_Harad_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
func int DIA_Harad_Hallo_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Harad_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Harad_Hallo_12_00"); //(brummig) Was willst du?
};

// *****************************************************
// 							Arbeit
// *****************************************************
instance DIA_Harad_Arbeit		(C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Arbeit_Condition;
	information	= DIA_Harad_Arbeit_Info;
	permanent   = FALSE;
	description = "Ich suche Arbeit!";
};
func int DIA_Harad_Arbeit_Condition ()
{
	return TRUE;
};
func void DIA_Harad_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Harad_Arbeit_15_00"); //Ich suche Arbeit!
	AI_Output (self, other, "DIA_Harad_Arbeit_12_01"); //Hm - ich könnte einen neuen Lehrling gebrauchen.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_02"); //Brian wird seine Lehre bald beendet haben, und dann will er die Stadt verlassen.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_03"); //Taugst du denn was?
	AI_Output (other, self, "DIA_Harad_Arbeit_15_04"); //Wenn du meinst, ob ich schmieden kann ...
	AI_Output (self, other, "DIA_Harad_Arbeit_12_05"); //Nein. Meine ich nicht.
	AI_Output (self, other, "DIA_Harad_Arbeit_12_06"); //Über kurz oder lang werden die Orks die Stadt belagern, und dann zählen hier nur die Männer, die auch in der Lage sind, unsere Stadt zu verteidigen.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Harad_Arbeit_12_07"); //Und ich werde niemanden als Lehrling annehmen, der mir die Schande macht, mit den Frauen und Taugenichtsen aus der Stadt zu fliehen, statt hier mit den Männern die Stellung zu halten.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Wenn ich Harad überzeuge, das ich kein Taugenichts bin, wird er mich als Lehrling aufnehmen.");
};

// *****************************************************
// 						MIS_Orc
// *****************************************************
instance DIA_Harad_Taugenichts (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_Taugenichts_Condition;
	information	= DIA_Harad_Taugenichts_Info;
	permanent   = FALSE;
	description = "Ich bin kein Taugenichts!";
};
func int DIA_Harad_Taugenichts_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};
func void DIA_Harad_Taugenichts_Info ()
{
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_00"); //Ich bin kein Taugenichts!
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_01"); //Das sind große Worte! Kannst du sie auch durch große Taten beweisen?
	AI_Output (other, self, "DIA_Harad_Taugenichts_15_02"); //Wie meinst du das?
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_03"); //Bring mir die Waffe eines Orks.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_04"); //In der Nähe der Stadt sind Orks gesehen worden. Mit ein bisschen Glück musst du noch nicht mal lange suchen.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_05"); //Wenn es dir gelingt, einen von ihnen zur Strecke zu bringen, werde ich dich als Lehrling aufnehmen.
	AI_Output (self, other, "DIA_Harad_Taugenichts_12_06"); //Vorausgesetzt, die anderen Meister stimmen zu.
	
	MIS_Harad_Orc = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HaradOrk,LOG_RUNNING);
	B_LogEntry (TOPIC_HaradOrk,"Vor der Stadt wurde ein Ork gesehen. Der Schmied Harad will das ich ihn töte. Eine Orkwaffe sollte als Beweis reichen.");
};

// *****************************************************
// 						Orc Running
// *****************************************************
instance DIA_Harad_OrcRunning (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcRunning_Condition;
	information	= DIA_Harad_OrcRunning_Info;
	permanent   = FALSE;
	description = "Lass uns noch mal über die Sache mit dem Ork reden ...";
};
func int DIA_Harad_OrcRunning_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	&& (Harad_HakonMission == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Harad_OrcRunning_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_15_00"); //Lass uns noch mal über die Sache mit dem Ork reden ...
	AI_Output (self, other, "DIA_Harad_OrcRunning_12_01"); //(barsch) Was?
	
	Info_ClearChoices (DIA_Harad_OrcRunning);	
	Info_AddChoice (DIA_Harad_OrcRunning, "Dein Ork ist schon so gut wie erledigt!", DIA_Harad_OrcRunning_Done);
	Info_AddChoice (DIA_Harad_OrcRunning, "Ein Ork ist aber ein verdammt harter Gegner...", DIA_Harad_OrcRunning_TooHard);

	//AI_Output (self, other, "DIA_Harad_OrcRunning_12_02"); //Ah, ich verstehe schon. Du hast Wichtigeres zu tun. Schon in Ordnung, die Sache hat sich erledigt.
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_00"); //Ein Ork ist aber ein verdammt harter Gegner ...
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_01"); //Hm - wenn ich dich so ansehe, könntest du Recht haben. Du hast nicht viel auf den Rippen. Aber das kann ja noch werden.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_02"); //Trotzdem musst du mir beweisen, dass du den Mut zum Kämpfen hast.
	AI_Output (other, self, "DIA_Harad_OrcRunning_TooHard_15_03"); //Geht's vielleicht diesmal auch 'ne Nummer kleiner?
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_04"); //Hm - (überlegt) Hakon, der Waffenhändler am Marktplatz, hat mir erzählt, er wäre vor ein paar Tagen von Banditen überfallen worden.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_05"); //Die Mistkerle sollen sich irgendwo draußen am Osttor rumtreiben.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_06"); //Diese feigen Lumpen sollten nicht viel auf dem Kasten haben.
	AI_Output (self, other, "DIA_Harad_OrcRunning_TooHard_12_07"); //Bring die Kerle zur Strecke! Jeden einzelnen von ihnen. Dann weiß ich, dass wir dich hier in der Stadt gebrauchen können.
	
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	
	if (MIS_HakonBandits != LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Lehrling, "Harad hat mir von Banditen erzählt, die den Händler Hakon vor der Stadt überfallen haben. Wenn ich sie zur Strecke bringe, ist er von mir überzeugt. Ich sollte mal mit Hakon sprechen. Vielleicht weiß er mehr über den Aufenthaltsort dieser Banditen. ");
	}
	else
	{
		B_LogEntry (TOPIC_Lehrling, "Harad hat mir von Banditen erzählt, die den Händler Hakon vor der Stadt überfallen haben. Wenn ich sie zur Strecke bringe, ist er von mir überzeugt.");
	};
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output (other, self, "DIA_Harad_OrcRunning_Done_15_00"); //Dein Ork ist schon so gut wie erledigt!
	AI_Output (self, other, "DIA_Harad_OrcRunning_Done_12_01"); //Gut! Dann verlier keine Worte mehr, sondern lass Taten sprechen!
	
	Info_ClearChoices (DIA_Harad_OrcRunning);
};

// *****************************************************
// 						Orc Success
// *****************************************************
instance DIA_Harad_OrcSuccess (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_OrcSuccess_Condition;
	information	= DIA_Harad_OrcSuccess_Info;
	permanent   = FALSE;
	description = "Ich habe die Orkwaffe, die du wolltest.";
};
func int DIA_Harad_OrcSuccess_Condition ()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	{
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_OrcSuccess_Info ()
{
	AI_Output (other, self, "DIA_Harad_OrcSuccess_15_00"); //Ich habe die Orkwaffe, die du wolltest.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_01"); //Zeig her ...
	
		if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_01, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_02, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_03, 1);
		}
		else if (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcAxe_04, 1);
		}
		else //if (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
		{
			B_GiveInvItems (other, self, ItMw_2H_OrcSword_01, 1);
		};
	
	if (Harad_HakonMission == TRUE)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_02"); //Hast du's DOCH geschafft? Guter Mann!
	};
	
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_03"); //Es ist lange her, dass ich eine solche Waffe in den Händen hatte - damals war ich Soldat im Orkkrieg.
	AI_Output (self, other, "DIA_Harad_OrcSuccess_12_04"); //Das waren harte Zeiten, das kann ich dir sagen.
	
	if (Player_IsApprentice == APP_Harad)
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_05"); //Ich wusste schon, warum ich dich als Lehrling angenommen habe. Gut gemacht!
	}
	else if (Player_IsApprentice == APP_NONE) 
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_06"); //Hätte dir nicht zugetraut, dass du es schaffst. Ich bin beeindruckt.
	}
	else //anderer Weg
	{
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_07"); //Bedauerlich, dass du dich schon für einen anderen Weg entschieden hast.
		AI_Output (self, other, "DIA_Harad_OrcSuccess_12_08"); //Ich hätte dich gut gebrauchen können.
	};
	
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP (XP_Harad_Orc);
	B_LogEntry (Topic_Lehrling,"Harad wird mich als Lehrling aufnehmen, wenn ich die Zustimmung der anderen Meister bekomme.");
};

// *****************************************************
// 						LEHRLING	(PERM)
// *****************************************************
var int Harad_StartGuild;
// ----------------------

instance DIA_Harad_LEHRLING (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 1;
	condition	= DIA_Harad_LEHRLING_Condition;
	information	= DIA_Harad_LEHRLING_Info;
	permanent   = TRUE;
	description = "Wann kann ich bei dir als Lehrling anfangen?";
};
func int DIA_Harad_LEHRLING_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Harad_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Harad_LEHRLING_15_00"); //Wann kann ich bei dir als Lehrling anfangen?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		// ------ Harad ------
		if (MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_01"); //Einen Mann, der einen Ork besiegen kann, können wir hier gut gebrauchen.
			
			if (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_02"); //Außerdem hat mir Hakon erzählt, wie du die Sache mit den Banditen geregelt hast. Guter Mann!
			};
		}
		else //HakonBandits SUCCESS
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_03"); //Du hast zwar keinen Ork erlegt, aber Hakon hat mir erzählt, wie du die Sache mit den Banditen geregelt hast. Guter Mann!
		};
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_04"); //Wenn es nach mir geht, kannst du direkt bei mir anfangen.
				
		stimmen = stimmen + 1;
		
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_05"); //Was die anderen Meister betrifft ...
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_06"); //Thorben hat dir seinen Segen gegeben.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_07"); //Der gute alte Thorben will einfach nur, dass du dir den Segen der Götter holst. Ich halte das für eine gute Sache.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_08"); //Thorben sagt, er hat noch nie mit dir geredet.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_09"); //Bosper hat versucht, mir die Sache mit dir auszureden. Er will dich wohl selber als Lehrling haben.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_10"); //Ich hatte eine kurze aber heftige Unterhaltung mit ihm über dieses Thema.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_11"); //Am Ende hat er zugestimmt.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_12"); //Er bat mich darum, ihm zumindest die Gelegenheit zu geben, dich für seinen Beruf zu begeistern.
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_13"); //Sieh dir die Sache mal an - danach kannst du dich immer noch entscheiden. Es sei denn, du legst auf seine Stimme keinen Wert.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_14"); //Und Bosper kennt dich noch nicht.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_15"); //Constantino ist wie immer alles egal. Er sagt seinetwegen sollst du anfangen, wo du willst.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_16"); //Constantino sagt, du wärest hier in der Stadt eines Verbrechens angeklagt - stimmt das?
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_17"); //Wenn ja, dann solltest du die Sache schleunigst bereinigen!
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_18"); //Constantino hat noch nie von dir gehört.
		};
		
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_19"); //Und Matteo sagt, du hast ihm sein Gold wiedergebracht. Scheinst mir ein ehrlicher Junge zu sein.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_20"); //Und Matteo sagt, du schuldest ihm noch etwas. Ich weiß ja nicht, was da zwischen euch ist, aber du solltest die Sache ins Reine bringen.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_21"); //Und Matteo sagt, er hat noch nicht mit dir über die Sache geredet.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_22"); //Und Matteo sagt, er hat dich noch nie in seinem Laden gesehen.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_23"); //Damit hast du die Zustimmung aller Meister!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Harad_LEHRLING_12_24"); //Damit hast du die Zustimmung von vier Meistern. Das reicht aus, um als Lehrling aufgenommen zu werden.
			};
			
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_25"); //Bist du bereit, deine Lehre bei mir zu beginnen?
			
			Info_ClearChoices (DIA_Harad_LEHRLING);
			Info_AddChoice (DIA_Harad_LEHRLING, "Gut - ich denke drüber nach.", DIA_Harad_LEHRLING_Later);
			Info_AddChoice (DIA_Harad_LEHRLING, "Ich bin dabei!", DIA_Harad_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_26"); //Du brauchst die Zustimmung von mindestens vier Meistern, um in der Unterstadt als Lehrling anfangen zu können.
			AI_Output (self, other,"DIA_Harad_LEHRLING_12_27"); //Also solltest du mit allen reden, die noch nicht von dir überzeugt sind.
		};
	}
	else //Mission nicht erfüllt
	{
		AI_Output (self, other,"DIA_Harad_LEHRLING_12_28"); //Nicht, bevor du mir nicht bewiesen hast, dass du etwas taugst!
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_00"); //Ich bin dabei!
	AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_01"); //Gut! Ich werde dir beibringen, wie man ein ordentliches Schwert schmiedet.
	
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output (other, self, "DIA_Harad_LEHRLING_OK_15_02"); //Das kann ich schon!
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_03"); //Na, um so besser!
	};
	
	if (other.attribute[ATR_STRENGTH] < (T_MED-30))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_OK_12_04"); //Außerdem wird es mal Zeit, dass du etwas stärker wirst. Du fällst mir ja noch vom Fleisch!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Harad_StartGuild = other.guild;
	
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("schmied", GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry (Topic_Bonus,"Harad hat mich als Lehrling eingestellt. Ich habe nun Zugang zum oberen Viertel.");
	B_LogEntry (Topic_Bonus,"Harad kauft mir meine geschmiedeten Waffen zu einem guten Preis ab.");
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_CityTeacher, "Bei Harad kann ich das Schmieden lernen und er kann mir dabei helfen, stärker zu werden.");
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Harad_LEHRLING_Later_15_00"); //Gut - ich denke drüber nach.
	if (!Npc_IsDead (Brian))
	{
		AI_Output (self, other, "DIA_Harad_LEHRLING_Later_12_01"); //Nimm dir Zeit. Brian ist ja noch eine Weile hier.
	};
	Info_ClearChoices (DIA_Harad_LEHRLING);
};

// *****************************************************
// 						Zustimmung
// *****************************************************
instance DIA_Harad_Zustimmung		(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  2;
	condition	 = 	DIA_Harad_Zustimmung_Condition;
	information	 = 	DIA_Harad_Zustimmung_Info;
	permanent    =  TRUE;
	description	 = 	"Kann ich bei einem anderen Meister als Lehrling anfangen?";
};

func int DIA_Harad_Zustimmung_Condition ()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (Npc_KnowsInfo (other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

//------------------------------------
var int DIA_Harad_Zustimmung_Permanent;
//------------------------------------

func void DIA_Harad_Zustimmung_Info ()
{
	AI_Output (other, self, "DIA_Harad_Zustimmung_15_00"); //Kann ich bei einem anderen Meister als Lehrling anfangen?
	
	if (MIS_Harad_Orc == LOG_SUCCESS)
	|| ( (MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE) )
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_01"); //Du bist ein guter Mann.
		if (MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_02"); //Hakon hat mir erzählt, wie du mit den Banditen umgesprungen bist.
		};
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_03"); //Ich werde dir meine Zustimmung geben.
		
		if (DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP (XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		B_LogEntry (Topic_Lehrling,"Harad gibt mir seine Zustimmung, wenn ich irgendwo als Lehrling anfangen will.");
		
		if (!Npc_IsDead(Brian))
		{
			AI_Output (self, other, "DIA_Harad_Zustimmung_12_04"); //Brian wird noch 'ne Weile hier sein. Und es wird sich schon ein starker Bursche finden, der seinen Platz einnimmt.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Zustimmung_12_05"); //Schon möglich, dass die anderen Meister zustimmen. ICH werde dir meine Stimme allerdings erst geben, wenn du bewiesen hast, dass du etwas taugst!
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Harad_MILKommentar;
	var int Harad_PALKommentar;
	var int Harad_INNOSKommentar;
// ----------------------------------

instance DIA_Harad_AlsLehrling (C_INFO)
{
	npc         = VLK_412_Harad;
	nr          = 1;
	condition   = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Harad_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Harad)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Harad_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Harad_StartGuild != GIL_MIL)
	&& (Harad_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_00"); //Du bist jetzt bei der Miliz? Ich bin stolz auf dich!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_01"); //Solange du in der Armee bist, werde ich natürlich nicht von dir erwarten, dass du auch noch deine Aufgaben als Lehrling erfüllst.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_02"); //Wenn du aber etwas brauchen solltest, kannst du jederzeit zu mir kommen.
		Harad_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Harad_StartGuild != GIL_PAL)
	&& (Harad_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_03"); //Du hast es geschafft, bei den Paladinen aufgenommen zu werden!
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_04"); //Ich bin froh, dass ich dich als Lehrling aufgenommen habe. Auch wenn du wenig Zeit zum Schmieden hattest.
		
		Harad_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Harad_StartGuild != GIL_NOV)
	&& (Harad_StartGuild != GIL_KDF)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_05"); //Du bist also ins Kloster gegangen. Mir wäre es lieber gewesen, du wärst in der Stadt geblieben. Wir brauchen jeden guten Mann.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_06"); //Aber wenn du dem Ruf Innos' folgen musstest, dann ist das eben so.
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_07"); //Falls du etwas von mir brauchen solltest, bin ich für dich da.
		Harad_INNOSKommentar = TRUE;
	}
	
	else if (Harad_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Harad_MILKommentar == FALSE)
	&& (Harad_PALKommentar == FALSE)
	&& (Harad_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_08"); //Ist jetzt schon 'ne Weile her, seit du das letzte Mal da warst. Wo hast du dich schon wieder rumgetrieben, hm?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Harad_AlsLehrling_12_09"); //Da bist du ja wieder ...
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

// *****************************************************
// 					Verkaufst du Waffen?
// *****************************************************
instance DIA_Harad_Waffen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Waffen_Condition;
	information	 = 	DIA_Harad_Waffen_Info;
	permanent    =  FALSE;
	description	 = 	"Verkaufst du auch Waffen?";
};
func int DIA_Harad_Waffen_Condition ()
{	
	if (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Harad_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Waffen_15_00"); //Verkaufst du auch Waffen?
	AI_Output (self, other, "DIA_Harad_Waffen_12_01"); //Vergiss es. Alles, was ich anfertige, bekommen die Paladine oder die Miliz.
	AI_Output (self ,other, "DIA_Harad_Add_12_00"); //Ich habe einen Auftrag über 100 Schwerter von Lord Hagen bekommen. Er will damit die Stadtwache ausrüsten.
};

// *****************************************************
// 					Aufgaben als Lehrling
// *****************************************************
instance DIA_Harad_Aufgaben	(C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  1;
	condition	 = 	DIA_Harad_Aufgaben_Condition;
	information	 = 	DIA_Harad_Aufgaben_Info;
	permanent    =  FALSE;
	description	 = 	"Was sind meine Aufgaben als Lehrling?";
};

func int DIA_Harad_Aufgaben_Condition ()
{	
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};
func void DIA_Harad_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_00"); //Was sind meine Aufgaben als Lehrling?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_01"); //Dreimal darfst du raten.
	AI_Output (other, self, "DIA_Harad_Aufgaben_15_02"); //Schmieden, schmieden und schmieden?
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_03"); //Bist ja gar nicht so dumm, wie du aussiehst. Ich bezahle pro Klinge. Wenn du nicht arbeitest, gibt's auch kein Geld - so einfach ist das.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_05"); //Außerdem werde ich dir alles beibringen, was du wissen musst, um einfache Schwerter herzustellen.
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_06"); //Die Herstellung von Erzklingen ist nur etwas für einen erfahrenen Schmied - davon bist du noch weit entfernt ...
	AI_Output (self, other, "DIA_Harad_Aufgaben_12_07"); //Wenn du einen Platz zum Schlafen brauchst, kannst du bei mir im Haus pennen. Soweit alles klar?
};

// ************************************************************
// 						Klingen verkaufen
// ************************************************************
instance DIA_Harad_SellBlades (C_INFO)
{
	npc			 = VLK_412_Harad;
	nr			 = 200;
	condition	 = DIA_Harad_SellBlades_Condition;
	information	 = DIA_Harad_SellBlades_Info;
	permanent    = TRUE;
	description	 = "Ich will meine geschmiedeten Waffen verkaufen.";
};
func int DIA_Harad_SellBlades_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};
func void DIA_Harad_SellBlades_Info ()
{
	AI_Output (other, self, "DIA_Harad_SellBlades_15_00"); //Ich will meine geschmiedeten Waffen verkaufen.
	
	var C_ITEM equipWeap; equipWeap = Npc_GetEquippedMeleeWeapon(other);
	
	var int anzahl_common; anzahl_common = Npc_HasItems (other, ItMw_1H_Common_01);
	if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE) { anzahl_common = anzahl_common - 1; };
	var int anzahl_schwert1; anzahl_schwert1 = Npc_HasItems (other, ItMw_Schwert1);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) { anzahl_schwert1 = anzahl_schwert1 - 1; };
	var int anzahl_schwert4; anzahl_schwert4 = Npc_HasItems (other, ItMw_Schwert4);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE) { anzahl_schwert4 = anzahl_schwert4 - 1; };
	var int anzahl_rubinklinge; anzahl_rubinklinge = Npc_HasItems (other, ItMw_Rubinklinge);
	if (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE) { anzahl_rubinklinge = anzahl_rubinklinge - 1; };
	var int anzahl_elbastardo; anzahl_elbastardo = Npc_HasItems (other, ItMw_ElBastardo);
	if (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE) { anzahl_elbastardo = anzahl_elbastardo - 1; };
	
	var int gesamt; gesamt = (anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo);
	
    if (gesamt == 0)
	{
		if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) 
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE)  
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_01"); //Du hast nur die, die du am Gürtel trägst. Du solltest sie besser behalten.
		}
		else
		{
			AI_Output (self, other, "DIA_Harad_SellBlades_12_04"); //Dann stell welche her! Ich nehme nur einfache Schwerter an.
		};
	}
	else //(gesamt >= 1) - die verbeliebenden Klingen verkaufen ------
	{
		AI_Output (self, other, "DIA_Harad_SellBlades_12_02"); //Gut - gib her.
		
		Npc_RemoveInvItems (other, ItMw_1H_Common_01, anzahl_common);
		Npc_RemoveInvItems (other, ItMw_Schwert1, anzahl_Schwert1);
		Npc_RemoveInvItems (other, ItMw_Schwert4, anzahl_Schwert4);
		Npc_RemoveInvItems (other, ItMw_Rubinklinge, anzahl_Rubinklinge);
		Npc_RemoveInvItems (other, ItMw_ElBastardo, anzahl_ElBastardo);
		
				var string concatText;
				concatText = ConcatStrings(IntToString(gesamt), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
				AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
				
		AI_Output (self, other, "DIA_Harad_SellBlades_12_03"); //So, und hier hast du deinen Lohn.
		var int lohn;
		lohn 	= (anzahl_common * Value_Common1)
				+ (anzahl_schwert1 * Value_Schwert1)
				+ (anzahl_schwert4 * Value_Schwert4)
				+ (anzahl_rubinklinge * Value_Rubinklinge)
				+ (anzahl_elbastardo * Value_ElBastardo);
				
		lohn 	= (lohn / 3);
		
		B_GiveInvItems (self, other, itmi_gold, lohn);
	};
};
	
// ************************************************************
// 						Weapon_Common Lehrer
// ************************************************************
func void B_Harad_TeachSmith()
{
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_01"); //Es ist ganz einfach, Junge. Besorge dir ein Stück Rohstahl, halte es ins Feuer, bis es glüht.
	AI_Output (self, other, "DIA_Harad_TeachCommon_12_02"); //Dann schlägst du am Amboss die Klinge zurecht.
};
// ------------------------------------------------------------
func void B_HaradSmithChoices()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
	Info_AddChoice	(DIA_Harad_TeachSmith, DIALOG_BACK, DIA_Harad_TeachSmith_BACK);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_04))		,DIA_Harad_TeachSmith_Harad04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_03))		,DIA_Harad_TeachSmith_Harad03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_02))		,DIA_Harad_TeachSmith_Harad02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		Info_AddChoice		(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_01))		,DIA_Harad_TeachSmith_Harad01);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice	(DIA_Harad_TeachSmith, B_BuildLearnString("Schmieden lernen "	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Harad_TeachSmith_Common);
	};
};
// ------------------------------------------------------------
instance DIA_Harad_TeachSmith (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  50;
	condition	 = 	DIA_Harad_TeachSmith_Condition;
	information	 = 	DIA_Harad_TeachSmith_Info;
	permanent    =  TRUE;
	description	 = 	"Bring mir bei, wie man ein ordentliches Schwert schmiedet!";
};

func int DIA_Harad_TeachSmith_Condition ()
{	
	if (Player_IsApprentice == APP_Harad)
	{
		if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
		{
			return TRUE;
		};
	};
};
func void DIA_Harad_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Harad_TeachCommon_15_00"); //Bring mir bei, wie ich ein ordentliches Schwert schmieden kann!
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices (DIA_Harad_TeachSmith);
};
func void DIA_Harad_TeachSmith_Common()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_Common)
	{
		B_Harad_TeachSmith();
		AI_Output (self, other, "DIA_Harad_TeachCommon_12_03"); //Deine ersten Schwerter werden keine Meisterwerke, aber alles weitere kannst du ja noch später lernen.
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad01()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_01)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad02()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_02)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad03()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_03)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};
func void DIA_Harad_TeachSmith_Harad04()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_04)
	{
		B_Harad_TeachSmith();
	};
	
	B_HaradSmithChoices();
};

// ************************************************************
// 							STR Lehrer bis 50
// ************************************************************
// -------------------------
	var int Harad_Merke_STR;
// -------------------------	

INSTANCE DIA_Harad_TeachSTR (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 100;
	condition	= DIA_Harad_TeachSTR_Condition;
	information	= DIA_Harad_TeachSTR_Info;
	permanent	= 1;
	description = "Ich will stärker werden!";
};                       

FUNC INT DIA_Harad_TeachSTR_Condition()
{
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Harad_TeachSTR_Info()
{	
	AI_Output (other, self, "DIA_Harad_TeachSTR_15_00"); //Ich will stärker werden!
	
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if (Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_01"); //Du hast schon ein bisschen was zugelegt.
	};

	if (other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output (self, other, "DIA_Harad_TeachSTR_BACK_12_02"); //Komm wieder, wenn du mehr lernen willst,
	};
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};

// ------ 5 Stärke ------
func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices	(DIA_Harad_TeachSTR);
	Info_AddChoice		(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Harad_TeachSTR_1);
	Info_AddChoice		(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Harad_TeachSTR_5);
};




//############################
//##						##
//##		Kapitel 2		##
//##						##
//############################

// *****************************************************
// 					Immer noch
// *****************************************************
instance DIA_Harad_ImmerNoch (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_ImmerNoch_Condition;
	information	 = 	DIA_Harad_ImmerNoch_Info;
	permanent    =  FALSE;
	description	 = 	"Arbeitest du immer noch für die Paladine?";
};
func int DIA_Harad_ImmerNoch_Condition ()
{	
	if (Kapitel >= 2)
	{
		return TRUE;
	};	
};

func void DIA_Harad_ImmerNoch_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_01"); //Arbeitest du immer noch für die Paladine?
	AI_Output (self ,other,"DIA_Harad_Add_12_02"); //Ich habe den Auftrag von Lord Hagen beendet.
	AI_Output (self ,other,"DIA_Harad_Add_12_03"); //Ich stelle jetzt für ihn Erzklingen her - allerdings gegen Bezahlung.
	AI_Output (self ,other,"DIA_Harad_Add_12_04"); //Nebenbei habe ich aber auch wieder Zeit, ein paar Waffen für die Händler am Marktplatz anzufertigen.
	AI_Output (self ,other,"DIA_Harad_Add_12_05"); //Wenn du also ein gute Klinge suchst, solltest du mal dort vorbeischauen.
};

// *****************************************************
// 					About Erzklingen
// *****************************************************
instance DIA_Harad_AboutErzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_AboutErzklingen_Condition;
	information	 = 	DIA_Harad_AboutErzklingen_Info;
	permanent    =  FALSE;
	description	 = 	"Erzähl mir mehr über die Erzklingen!";
};
func int DIA_Harad_AboutErzklingen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};	
};

func void DIA_Harad_AboutErzklingen_Info ()
{
	AI_Output (other, self,"DIA_Harad_Add_15_06"); //Erzähl mir mehr über die Erzklingen!
	AI_Output (self, other, "DIA_Harad_Waffen_12_02"); //Erzklingen herzustellen ist ein sehr aufwendiger und teurer Prozess, aber das Ergebnis ist eine leicht zu führende Klinge, die praktisch unzerstörbar ist.
	AI_Output (self, other, "DIA_Harad_Waffen_12_03"); //Die Klinge an sich ist zwar von guter Qualität, aber erst in den Händen eines Paladins zeigt sich ihre wahre Macht.
	AI_Output (self, other, "DIA_Harad_Waffen_12_04"); //Die Schwerter der Paladine werden Innos geweiht. Dadurch wird aus der Erzklinge eine magische Waffe, die unvergleichlichen Schaden anrichtet!
};

// *****************************************************
// 					Ich möchte eine Erzklinge kaufen
// *****************************************************
instance DIA_Harad_Erzklingen (C_INFO)
{
	npc			 = 	VLK_412_Harad;
	nr			 =  3;
	condition	 = 	DIA_Harad_Erzklingen_Condition;
	information	 = 	DIA_Harad_Erzklingen_Info;
	permanent    =  TRUE;
	description	 = 	"Ich möchte eine Erzklinge kaufen";
};
func int DIA_Harad_Erzklingen_Condition ()
{	
	if (OreBladeBought == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};	
};

//---------------------------------------------

var int OreBladeBought;

//---------------------------------------------

func void DIA_Harad_Erzklingen_Info ()
{
	AI_Output (other, self, "DIA_Harad_Erzklingen_15_00"); //Ich möchte eine Erzklinge kaufen.
	if (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_01"); //Ich darf nur den Paladinen eine Erzklinge verkaufen. Und selbst dann nur eine Einzige.
	}
	else
	{
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_02"); //Ihr Paladine dürft euch glücklich schätzen, so hervorragende Klingen führen zu dürfen.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_03"); //Auf Anordnung von Lord Hagen darf ich dir nur eine einzige Erzwaffe verkaufen.
		AI_Output (self, other, "DIA_Harad_Erzklingen_12_04"); //Also, was darf ich dir anbieten?
		
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Zweihandschwert (2000 Gold)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Einhandschwert  (2000 Gold)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC void B_Harad_NotEnoughGold ()
{
	AI_Output (self ,other,"B_Harad_NotEnoughGold_12_00"); //Du hast nicht genug Gold.
};

FUNC VOID B_Harad_HaveFunWithYourSword ()
{
	AI_Output (self,other,"B_Harad_HaveGunWithYourSword_12_00"); //Pass gut auf deine neue Waffe auf. Sie ist ein Vermögen wert.
	
	OreBladeBought = TRUE;
	
	Info_ClearChoices (DIA_Harad_Erzklingen);
};

FUNC VOID DIA_Harad_Erzklingen_2h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_2h_15_00"); //Ich nehme das Zweihandschwert!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_2H_1);
		CreateInvItems (self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_2H_Blessed_01,1);
	
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Zweihandschwert (2000 Gold)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Einhandschwert  (2000 Gold)",DIA_Harad_Erzklingen_1h);
	};
};

FUNC VOID DIA_Harad_Erzklingen_1h()
{
	AI_Output (other,self ,"DIA_Harad_Erzklingen_1h_15_00"); //Ich nehme das Einhandschwert!
	
	if (Npc_HasItems (other,ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems (other,self,ItMi_Gold,Value_Blessed_1H_1);
		CreateInvItems (self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems (self ,other,ItMw_1H_Blessed_01,1);
		
		B_Harad_HaveFunWithYourSword ();
	}
	else
	{
		B_Harad_NotEnoughGold ();
		Info_ClearChoices (DIA_Harad_Erzklingen);
		Info_AddChoice (DIA_Harad_Erzklingen,DIALOG_BACK,DIA_Harad_Erzklingen_Back);
		Info_AddChoice (DIA_Harad_Erzklingen,"Zweihandschwert (2000 Gold)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice (DIA_Harad_Erzklingen,"Einhandschwert  (2000 Gold)",DIA_Harad_Erzklingen_1h);
	};
};



//############################
//##						##
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Harad_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_RepairNecklace_Condition;
	information	 = 	DIA_Harad_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kannst du Schmuckstücke reparieren?";
};

func int DIA_Harad_RepairNecklace_Condition ()
{
	if 	((MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	 ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||    (MIS_SCKnowsInnosEyeIsBroken  == TRUE))) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Harad_RepairNecklace_15_00"); //Kannst du Schmuckstücke reparieren?
	AI_Output (self	,other,"DIA_Harad_RepairNecklace_12_01"); //Ich bin Waffenschmied, kein Goldschmied. Hier in der Stadt wirst wahrscheinlich niemanden finden, der dir helfen kann.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_02"); //Die Leute haben kein Geld mehr in den Taschen, und reich wirst du hier schon lange nicht mehr.
	AI_Output (self ,other,"DIA_Harad_RepairNecklace_12_03"); //Die meisten sind doch froh, wenn sie genug zu beißen haben.
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//	Wo finde ich einen Goldschmied?
//*********************************************************************
instance DIA_Harad_Goldsmith		(C_INFO)
{
	npc		 	 = 	VLK_412_Harad;
	nr           = 	8;
	condition	 = 	DIA_Harad_Goldsmith_Condition;
	information	 = 	DIA_Harad_Goldsmith_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wo finde ich einen Goldschmied?";
};

func int DIA_Harad_Goldsmith_Condition ()
{
	if 	(Npc_KnowsInfo (other,DIA_Harad_RepairNecklace)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Harad_Goldsmith_Info ()
{
	AI_Output (other,self ,"DIA_Harad_Goldsmith_15_00"); //Wo finde ich einen Goldschmied?
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_01"); //Bei den Söldnern auf Onars Hof soll es einen guten Schmied geben.
	AI_Output (self ,other,"DIA_Harad_Goldsmith_12_02"); //Vielleicht versuchst du es da mal.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Harad_PICKPOCKET (C_INFO)
{
	npc			= VLK_412_Harad;
	nr			= 900;
	condition	= DIA_Harad_PICKPOCKET_Condition;
	information	= DIA_Harad_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Harad_PICKPOCKET_Condition()
{
	C_Beklauen (14, 35);
};
 
FUNC VOID DIA_Harad_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Harad_PICKPOCKET);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_BACK 		,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Harad_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};
	
func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Harad_PICKPOCKET);
};



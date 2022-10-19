// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //Willkommen in meinem Laden, Fremder!
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Ich bin Bosper. Ich baue Bögen und handele mit Fellen.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Was treibt dich nach Khorinis?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper baut Bögen und handelt mit Fellen. Er hat seinen Laden am östlichen Tor, in der Unterstadt.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "Ich muss ins obere Viertel ...";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Ich muss ins obere Viertel ...
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Zu den Paladinen? Das kannst du dir aus dem Kopf schlagen.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Du musst hier angesehener Bürger sein, oder zumindest eine ordentliche Arbeit haben.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Als Fremder kommst du da nicht rein.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //Hab ich auch gemerkt ...
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Um Zugang zum oberen Viertel zu bekommen, muss ich ein angesehener Bürger sein, oder eine Arbeit haben.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "Ich suche Arbeit!";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //Ich suche Arbeit!
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Mmh - ich könnte einen neuen Lehrling gebrauchen.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Dein Vorgänger hat gerade vor zwei Tagen seinen Job an den Nagel gehängt.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //Verstehst du denn was vom Jagen?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Na ja ...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Ich könnte dir beibringen, wie man Tieren das Fell abzieht.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Ich zahle gut für jedes Fell, das du mir bringst.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Ich kann dir Felle besorgen, wenn du DAS meinst.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Ausgezeichnet! Bring mir so viele Tierfelle, wie du kriegen kannst - ich werde sie dir für einen guten Preis abkaufen!.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper sucht einen neuen Lehrling. Bei ihm könnte ich anfangen.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "Ich will bei dir als Lehrling anfangen!";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Ich will bei dir als Lehrling anfangen!

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(grinst) Gut! Die Grundlagen hast du ja schon gelernt.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad hält dich für einen guten Mann.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Aber Harad ist nicht davon überzeugt, dass du etwas taugst.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Aber Harad sagt, er hat dich noch nie gesehen.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben hat dir seinen Segen gegeben. Ich bin nicht so gläubig, aber mir soll's recht sein.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben wird dir seine Zustimmung nur mit dem Segen der Götter geben.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben weiß nicht, wer du bist.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino sagt, seinetwegen sollst du anfangen, wo du willst.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino sagt, du wärest hier in der Stadt eines Verbrechens angeklagt - das kann sich doch hoffentlich nur um eine Lappalie handeln?
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Sieh zu, dass du die Sache klärst.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino hat noch nie von dir gehört.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //Und Matteo sagt, du bist Gold wert.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //Und Matteo sagte irgendwas von Schulden - was immer er meinte, du solltest mit ihm reden.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Und Matteo sagt, er hat noch nicht mit dir über die Sache geredet.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Und Matteo sagt, er hat dich noch nie in seinem Laden gesehen.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //Damit hast du die Zustimmung aller Meister!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Damit hast du die Zustimmung von vier Meistern. Das reicht aus, um als Lehrling aufgenommen zu werden.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Du kannst jederzeit bei mir anfangen, wenn du willst.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Gut - ich denke drüber nach.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Ich bin dabei!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Du brauchst die Zustimmung von mindestens vier Meistern, um in der Unterstadt als Lehrling anfangen zu können.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Also solltest du mit allen reden, die noch nicht von dir überzeugt sind.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Bevor ich dich nehme, muss ich natürlich wissen, ob du überhaupt zu was zu gebrauchen bist.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Du hast mir zwar meinen Bogen wiederbeschafft, aber das sagt noch nicht viel über dein Talent als Jäger aus.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Ich bin dabei!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Du wirst es nicht bereuen! Ich glaube, wir werden gut zusammenarbeiten.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper hat mich als Lehrling eingestellt. Ich habe nun Zugang zum oberen Viertel.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Gut - ich denke drüber nach.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Triff nicht die falsche Entscheidung! Bei mir bist du goldrichtig.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "Was ist, wenn ich bei einem der anderen Meister anfangen will?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //Was ist, wenn ich bei einem der anderen Meister anfangen will?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(brummig) Unsinn!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad und Matteo haben schon Lehrlinge.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Constantino, der Alchemist, ist ein Eigenbrötler - er hat schon seit Jahren keinen Lehrling mehr angenommen.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //Und was Thorben betrifft - jeder weiß, dass er kein Geld hat - er könnte dich vermutlich nicht mal bezahlen.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Ich hingegen brauche dringend einen Lehrling - und ich zahle auch gut.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Aber egal bei wem du anfangen willst - du brauchst die Zustimmung aller anderen Meister aus der Unterstadt ...
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "Warum hat dein Lehrling seinen Job aufgegeben?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Warum hat dein Lehrling seinen Job aufgegeben?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Mir hat er nur gesagt, es sei zu gefährlich geworden da draußen.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Wenn es dich wirklich interessiert, kannst du ihn ja selber fragen.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Er heißt Bartok und treibt sich vermutlich in der Nähe von Coragons Kneipe rum.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Geh vom Schmied aus durch die Unterführung, dann läufst du direkt darauf zu.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "Bekomme ich deine Zustimmung, um bei einem der anderen Meister anzufangen?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Bekomme ich deine Zustimmung, um bei einem der anderen Meister anzufangen?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(enttäuscht) Ich hatte gehofft, du würdest dich für mich entscheiden.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Aber wenn du es unbedingt so willst ...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Heißt das, du stimmst für mich?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Wenn keiner der anderen Meister etwas dagegen hat - ja.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Immerhin hast du mir meinen Bogen wiedergebracht.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Aber an dir ist ein guter Jäger verlorengegangen.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper gibt mir seine Zustimmung, wenn ich irgendwo als Lehrling anfangen will.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(seufzt) Nun gut! Ich werde zustimmen - aber unter einer Bedingung.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Arbeite wenigstens eine kurze Zeit lang für mich.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Dann kannst du mit Sicherheit sagen, ob dir mein Handwerk liegt oder nicht.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //Und wer weiß - vielleicht gefällt es dir am Ende ja und du bleibst bei mir.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //Wenn du gut genug bist, um bei MIR anzufangen, bist du auch gut genug für alle anderen hier.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "Was soll ich für dich machen?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Was soll ich für dich machen?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Ich werd dir beibringen, wie man Tieren das Fell abzieht und du besorgst mir - sagen wir - ein halbes Dutzend Wolfsfelle.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper kann mir beibringen, wie ich Tieren das Fell abziehe.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Besorg mir ein halbes Dutzend Wolfsfelle.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Dann weiß ich, dass du dein Handwerk beherrschst.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Wenn du dafür nicht ewig brauchst und die Felle einigermaßen in Ordnung sind, kannst du von mir aus bei mir anfangen.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Oder (seufzt) bei einem der anderen Meister - wenn du unbedingt willst.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Ich soll Bosper sechs Wolfsfelle besorgen. Dann kann ich bei ihm anfangen, oder er gibt mir seine Zustimmung, wenn ich bei anderem Meister anfangen will.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Dazu sollte ich bei ihm lernen, wie ich Tieren das Fell abziehe.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "Wegen der Wolfsfelle ...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Wegen der Wolfsfelle ...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Jetzt bist du schon Lehrling bei einem anderen Meister. Ich werde dir die Felle zum normalen Preis abkaufen.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Ich habe sie - hier.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Na bitte! Ich hab mir schon gedacht, dass du für die Arbeit geeignet bist.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Hier hast du deinen versprochenen Lohn.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //Und? Was denkst du? Ist die Arbeit nicht besser, als den ganzen Tag auf Schwertern rumzuhämmern oder im staubigen Kämmerlein Fläschchen abzufüllen?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper wird mich als Lehrling aufnehmen, wenn ich die Zustimmung der anderen Meister bekomme.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Wir hatten uns auf ein halbes Dutzend geeinigt - aber du hast ja noch Zeit - geh und besorg die Felle!
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "Bring mir bei, wie man Tieren das Fell abzieht! (5 LP)";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Bring mir bei, wie man Tieren das Fell abzieht!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //Gut. Hör zu. Es ist im Grunde ganz einfach.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Du nimmst eine scharfe Klinge und schneidest dem Vieh den Bauch auf. Noch ein paar kleine Schnitte an den Innenseiten der Beine und dann kannst du's abziehen.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Bring mir die Wolfsfelle und wir sehen weiter ...
			B_LogEntry (TOPIC_BosperWolf,"Bosper hat mir beigebracht, wie ich Tieren das Fell abziehe.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"Zeig mir deine Ware.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Zeig mir deine Ware.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Du sollst dir hier nicht meine Ware ansehen, du sollst mir die Felle besorgen!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Also sieh zu!
	};
};

// **************************************************************
// 						Von Bogen gehört
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "Ich hab gehört, du bist bestohlen worden.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //Ich hab gehört, du bist bestohlen worden.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Von wem hast du das gehört? Vermutlich Bartok, hm? Hatte wohl wieder mal nichts Besseres zu erzählen? Egal.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //Ich kann dir sagen, wenn ich den Mistkerl in die Finger bekomme, ist er dran!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //War nur kurz mal nicht im Laden. Als ich wiederkomme, sehe ich ihn gerade noch rausgehen - mit meinem Bogen über der Schulter.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Hab direkt die Wachen gerufen, aber der Mistkerl ist Richtung Hafen gerannt. Und dort ist er ihnen dann entwischt.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Daraufhin hab ich ihnen mächtig Feuer unterm Arsch gemacht, und sie haben das gesamte Hafenviertel durchsucht. Aber gefunden haben sie nichts.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Diese unfähigen Büttel!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Ich wette, mein Bogen ist noch irgendwo in der Stadt. Ich hab den Wachen an beiden Stadttoren Bescheid gesagt und die haben niemanden mit meinem Bogen rausgehen sehen.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Wenn ich den Mistkerl erwische ...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosper wurde ein Bogen gestohlen. Der Dieb ist zum Hafen gerannt, aber dort ist er entwischt. Die Miliz hat das Hafenviertel durchsucht, aber nichts gefunden, obwohl der Bogen noch irgendwo in der Stadt ist.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "Ich glaube, dieser Bogen gehört dir ...";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //Ich glaube, dieser Bogen gehört dir ...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //Mein Bogen! Wo hast du ihn gefunden?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //In einem dunklen Loch voller Ratten.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Ich hoffe, du bist nicht in Schwierigkeiten gekommen ...
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //Nein - ich habe so was schon öfter gemacht.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Hm - jedenfalls danke! Ich schulde dir was!
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wie sieht's in der Stadt aus?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Wie sieht's in der Stadt aus?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Wenn die Orks uns tatsächlich belagern sollten, wird es hier ziemlich ungemütlich.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Es gibt nur ein Schiff - und das bewachen die Paladine. Damit werden sie bestimmt nicht die Bürger retten.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Gibt es keine andere Möglichkeit, von hier wegzukommen?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Nein, ohne Schiff kann keiner von uns diese Insel verlassen.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Bisher gibt es nichts Neues. Schau später mal wieder vorbei.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Du bist zur Miliz gegangen, hm?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Mir soll's egal sein. Hauptsache, du erlegst neben Orks und Banditen noch ein paar Wölfe (grinst)
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Du hast ja 'ne steile Karriere hinter dir. Paladin des Königs!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Wo immer du auch hingehst, denk an deinen alten Meister ...
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Du bist ins Kloster gegangen, hm? Ich hoffe, sie lassen dich oft genug raus, damit du mir regelmäßig Felle bringen kannst ...
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Wo hast du dich schon wieder so lange rumgetrieben?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Ich brauche neue Felle, hast du welche dabei?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Da bist du ja wieder ...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "Was sind meine Aufgaben als Lehrling?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Was sind meine Aufgaben als Lehrling?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //Ganz einfach. Bring mir so viele Felle, wie du kriegen kannst.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Ich zahle dir dafür einen besseren Preis, als du bei jedem anderen Händler bekommst.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Ansonsten brauchst du dich hier im Laden nicht blicken zu lassen. Ich komm hier schon alleine klar.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //Und wo soll ich schlafen?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Ich hab hier keinen Platz für dich. Im Hotel am Marktplatz findest du bestimmt noch ein Bett.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper zahlt mir für Felle einen besonders guten Preis.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "Ich hab hier ein paar Felle für dich ...";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //Ich hab hier ein paar Felle für dich ...
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Schafsfell? Du hast doch nicht etwa bei irgendeinem Bauern die Schafe auf der Weide abgeschlachtet?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //Würde mir nie im Traum einfallen ...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Wolfsfell, das ist gut...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Fell von Wargen? Zähe Biester sind das ...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Ah, sogar das Fell eines Schattenläufers - ist 'ne Menge wert.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //Was zur Hölle ist DAS für ein Fell?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Das hab ich einem Troll über die Ohren gezogen.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Das ... das ist ein halbes Vermögen wert ...
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Schon wieder so ein riesiges Trollfell ... machst du Jagd auf die Viecher?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //Wenn mir mal einer begegnet, nutze ich die Gelegenheit ...
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //Sogar das Fell eines schwarzen Trolls!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Gute Arbeit. Wenn du mehr hast, komm zu mir zurück ...
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Du weißt doch - ich bin nur an Fellen von Wölfen, und Schattenläufern und dergleichen interessiert ...
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "Ich sehe, du hast Minenanteile zu verkaufen.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Ich sehe, du hast Minenanteile zu verkaufen.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Ähm. Davon weiß ich nichts. Von mir aus kannst du sie haben.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};









FUNC VOID B_DaronSegen ()
{
	Daron_Segen = TRUE;

	var string concatText;
	
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX]
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
		};
	}	 	
	else if (Daron_Spende < 250)
	&&		(Bonus_1 == FALSE)
	{
		B_RaiseAttribute (other, ATR_MANA_MAX, 2);
		
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];
				
		Bonus_1 = TRUE;
	}
	else if (Daron_Spende < 500)
	&&		(Bonus_2 == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if (Daron_Spende >= 750) 	
	&&		(Daron_Spende < 1000) 	
	&& 		(Bonus_3 == FALSE)
	{
		other.lp = (other.lp + 1);
		
		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else 
	{
		other.attribute[ATR_HITPOINTS] =  other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);
		
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
	};
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Daron_EXIT(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 999;
	condition	= DIA_Daron_EXIT_Condition;
	information	= DIA_Daron_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Daron_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Daron_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Daron_Hallo(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Hallo_Condition;
	information	= DIA_Daron_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Daron_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Was kann ich für dich tun? Suchst du geistigen Beistand?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Willst du ein Gebet an unseren Herrn Innos richten oder etwas Gold für seine Kirche spenden?
};

// ************************************************************
// 			  	Oberes Viertel - Paladine 
// ************************************************************
INSTANCE DIA_Daron_Paladine(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Paladine_Condition;
	information	= DIA_Daron_Paladine_Info;
	permanent	= FALSE;
	description = "Ich muss mit den Paladinen sprechen...";
};                       
FUNC INT DIA_Daron_Paladine_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Ich muss mit den Paladinen sprechen. Kannst du mir helfen, zu ihnen zu kommen?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//Tja, du brauchst Zugang zum oberen Viertel. Doch der ist nur den Bürgern und der Stadtwache erlaubt.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//Und natürlich uns Feuermagiern.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Wie kann ich Feuermagier werden?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Du musst unserem Orden als Novize beitreten. Wenn du eine Zeitlang gedient hast, wirst du vielleicht in die Reihen der Magier aufgenommen.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Doch bis zur Aufnahme ist es ein langer Weg des Arbeitens und Studierens.
};

// ************************************************************
// 			  				About Segen 
// ************************************************************
INSTANCE DIA_Daron_AboutSegen (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_AboutSegen_Condition;
	information	= DIA_Daron_AboutSegen_Info;
	permanent	= FALSE;
	description = "Ich will mir deinen Segen holen!";
};                       
FUNC INT DIA_Daron_AboutSegen_Condition()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_AboutSegen_Info()
{	
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //Ich will mir deinen Segen holen!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //Das ist gut, das ist gut - dann willst du vermutlich Gold an die heilige Kirche Innos spenden, ja?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //Eigentlich wollte ich deinen Segen, um als Lehrling in der Unterstadt anfangen zu können ...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Ich habe dir meinen Segen doch schon gegeben, mein Sohn.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Gehe mit Innos, mein Sohn!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Aber mein Sohn! Ohne eine bescheidene Spende an die Kirche kann ich dich unmöglich segnen.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Wie soll ich mich denn sonst deiner guten Absichten gegenüber der heiligen Kirche Innos' versichern?
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
INSTANCE DIA_Daron_Spenden(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 3;
	condition	= DIA_Daron_Spenden_Condition;
	information	= DIA_Daron_Spenden_Info;
	permanent	= FALSE;
	description	= "Wieviel ist denn eine übliche Spende?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//Wieviel ist denn eine übliche Spende?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//Nun, das kommt darauf an, welchen Teil du geben willst. Lass mich sehen, was du dabei hast.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//(guckt in Geldbeutel) Aaaah jaaa ...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Hm, du bist ein armer Schlucker, was? Behalte das bisschen, was du hast.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, der Feuermagier hat mich nicht gesegnet. Jetzt muss ich wohl Gold auftreiben und bei ihm spenden, damit er mich doch noch segnet.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//Nun, du hast nicht viel, aber arm bist du auch nicht. 10 Goldstücke für Innos - wir sind ja genügsam.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Du hast mehr als 50 goldene Münzen. Spende 25 davon Innos und empfange seinen Segen.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Du hast über hundert Goldstücke - der Herr sagt, gebt wenn ihr habt.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//Die Kirche empfängt deine großzügige Spende.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//Ich segne dich im Namen Innos'. Denn er ist das Licht und die Gerechtigkeit.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, der Feuermagier, hat mir seinen Segen gegeben.");
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
INSTANCE DIA_Daron_Woher(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Woher_Condition;
	information	= DIA_Daron_Woher_Info;
	permanent	= FALSE;
	description	= "Wo kommst du her?";
};                       
FUNC INT DIA_Daron_Woher_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Woher_Info()
{	
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//Wo kommst du her?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Ich komme aus dem Kloster der Magier, das in den Bergen liegt.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//Wir nehmen dort jeden auf, der reinen Herzens ist und den Wunsch verspürt, unserem allmächtigen Herrn Innos zu dienen.
	};
};

// ************************************************************
// 			Innos
// ************************************************************
INSTANCE DIA_Daron_Innos(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Innos_Condition;
	information	= DIA_Daron_Innos_Info;
	permanent	= FALSE;
	description	= "Erzähl mir von Innos.";
};                       
FUNC INT DIA_Daron_Innos_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Innos_Info()
{	
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//Erzähl mir von Innos.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, unser allmächtiger Herr, ist das Licht und das Feuer.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Er wählte den Mensch als sein Werkzeug und gab ihm die Magie und die Gesetze.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//In seinem Namen handeln wir. Nach seinem Willen sprechen wir Recht und sein Wort wird verkündet.
};

// ************************************************************
// 			  Kloster
// ************************************************************
INSTANCE DIA_Daron_Kloster(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Kloster_Condition;
	information	= DIA_Daron_Kloster_Info;
	permanent	= FALSE;
	description	= "Erzähl mir mehr über das Kloster.";
};                       
FUNC INT DIA_Daron_Kloster_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	|| Npc_KnowsInfo (other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Kloster_Info()
{	
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Erzähl mir mehr über das Kloster.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Wir unterrichten unsere Schüler in allen Formen der Magie. Aber nicht nur das alleine sind die Künste der Feuermagier.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Wir verstehen uns ebenso auf die Kunst der Alchimie, wie auf das Erschaffen mächtiger Runen.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//Zudem keltern wir einen hervorragenden Wein.
};

// ************************************************************
// 			 Stadt
// ************************************************************
INSTANCE DIA_Daron_Stadt(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 99;
	condition	= DIA_Daron_Stadt_Condition;
	information	= DIA_Daron_Stadt_Info;
	permanent	= FALSE;
	description	= "Was machst du in der Stadt?";
};                       
FUNC INT DIA_Daron_Stadt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Stadt_Info()
{	
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Was machst du in der Stadt?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Ich führe Gespräche mit den Paladinen und stehe den Bürgern mit meinem Rat und helfenden Worten zur Seite.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Gerade in diesen schwierigen Zeiten ist es unsere Pflicht, für das Volk da zu sein und den Bedürftigen zu helfen.
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_GuildHelp_Condition;
	information	 = 	DIA_Addon_Daron_GuildHelp_Info;

	description	 = 	"Ich habe da etwas von einer Statuette gehört...";
};

func int DIA_Addon_Daron_GuildHelp_Condition ()
{
	if (MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Daron_Stadt))
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //Ich habe da etwas von einer Statuette gehört, die du verloren haben sollst.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //Soso. Das kannst du nur von Vatras dem Wassermagier gehört haben.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Wo ist das Problem?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Dem Kloster ist eine sehr wertvolle Statuette vom Festland geschickt worden. Sie ist aber niemals im Kloster angekommen.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //Hat man das Schiff geentert?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //(beschämt) Nein. Sie ist wohlbehalten in Khorinis angekommen und ich habe sie abgeholt.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Doch sie ist einer Gruppe Goblins in die Hände gefallen, als ich auf dem Weg zum Kloster war.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //(sauer) Jetzt sieh mich nicht so an. Wir Magier sind auch nicht unfehlbar.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Du sagtest, die Goblins haben sie jetzt?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Wo hast du die Statuette verloren?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Hast du nicht versucht, die Statuette wieder zu bekommen?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Hast du nicht versucht, die Statuette wieder zu bekommen?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Oh doch! Ich habe die ganze Gegend abgesucht. Leider ohne Erfolg.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //Du sagtest, die Goblins haben sie jetzt?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Sie haben sie gestohlen und sind damit im Unterholz verschwunden.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //Ich habe sie nie wieder gesehen. Sie haben sich wahrscheinlich in irgendeinem Erdloch verkrochen.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Wo hast du die Statuette verloren?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //Ich war auf dem Weg zum Kloster. In der Nähe von Orlans Taverne.

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Ich hab genug gehört. Ich finde das Ding für dich.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Orlans Taverne? Wo ist das?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //Orlans Taverne? Wo ist das?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Du gehst hier aus dem Stadttor und folgst einfach dem Pfad, bis du ein freistehendes Haus siehst.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //Das ist Orlans Taverne. 'Zur Toten Harpie'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //Ich hab genug gehört. Ich finde das Ding für dich.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Möge Innos dich leiten und behüten vor den Gefahren, die draußen vor'm Stadttor auf dich lauern.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron wurde von einigen frechen Goblins bestohlen. Ihm fehlt seitdem eine wertvolle Statuette, die er ins Kloster bringen sollte. Die Goblins sollen sich in einem Erdloch in der Nähe der Taverne 'Zur Toten Harpie' versteckt halten."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_FoundStatue_Condition;
	information	 = 	DIA_Addon_Daron_FoundStatue_Info;

	description	 = 	"Ich habe deine Statuette gefunden.";
};

func int DIA_Addon_Daron_FoundStatue_Condition ()
{
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_FoundStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //Ich habe deine Statuette gefunden.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Innos sei Dank!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Was wirst du damit nun tun?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Gar nichts. Sie hat mir nur Unglück gebracht.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //DU wirst sie für mich in's Kloster bringen, mein Sohn.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Selbstverständlich wirst du nur eingelassen, wenn du dein restliches Leben in den Dienst des Klosters stellst.
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Aber ich bin mir sicher, um MIR einen Dienst erfüllen zu können, bist du dazu bereit, nicht wahr?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Geh mit Innos, mein Sohn!
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Daron_ReturnedStatue_Condition;
	information	 = 	DIA_Addon_Daron_ReturnedStatue_Info;

	description	 = 	"Ich habe deine Statuette ins Kloster gebracht.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_ReturnedStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //Ich hab deine Statuette ins Kloster gebracht. Du kannst dich wieder entspannen.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Da sind gute Neuigkeiten. Innos möge dich beschützen.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Nimm dies als meine kleine Anerkennung, mein Sohn.
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;		
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
INSTANCE DIA_Daron_arm(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 10;
	condition	= DIA_Daron_arm_Condition;
	information	= DIA_Daron_arm_Info;
	permanent	= FALSE;
	description	= "Ich bin bedürftig!";
};                       
FUNC INT DIA_Daron_arm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Stadt)
	&& (Npc_HasItems  (other, ItMi_Gold) < 10) 
	&& (other.guild == GIL_NONE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_arm_Info()
{	
	AI_Output (other, self,"DIA_Daron_arm_15_00");//Ich bin bedürftig!
	AI_Output (self, other,"DIA_Daron_arm_10_01");//So, du bist also verarmt. Kein Wunder in diesen Zeiten. Nimm dieses Gold, es soll dir helfen.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Aber du solltest dir eine Arbeit suchen, dann wirst du sehen, dass du schnell zu Gold kommst. Und dann darfst du der Kirche Innos spenden, so wie sie dir gespendet hat.
	
	B_GiveInvItems (self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden 
// ************************************************************
INSTANCE DIA_Daron_Spende(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 990;
	condition	= DIA_Daron_Spende_Condition;
	information	= DIA_Daron_Spende_Info;
	permanent	= TRUE;
	description	= "Ich möchte spenden...";
};      
//-------------------------------------
var int DIA_Daron_Spende_permanent;
//-------------------------------------                 
FUNC INT DIA_Daron_Spende_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo (other,DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spende_Info()
{	
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Ich möchte spenden...
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Aber ich habe nicht genug Gold dabei...(ZURÜCK)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50  Gold )",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 Gold )",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 Gold )",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//Du hast mir jetzt insgesamt über 1000 Goldstücke gespendet.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//Der Segen des Herrn Innos ist aller Zeit bei dir.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Aber ich habe nicht genug Gold dabei ...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //Das macht nichts, mein Sohn. Du kannst auch später noch so viel spenden, wie du willst.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//Ich segne dich im Namen Innos'. Denn er ist das Licht und die Gerechtigkeit.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, der Feuermagier, hat mir seinen Segen gegeben.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Du kannst jederzeit spenden, wenn du genug Gold dabei hast.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innos, du bist das Licht, das den Pfad der Gerechten erleuchtet.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//In deinem Namen segne ich diesen Mann. Möge dein Licht über ihm erstrahlen.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, der Feuermagier, hat mir seinen Segen gegeben.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//Der Herr sagt - wenn du beten willst, öffne deinen Geist. Und wenn du spenden willst, bringe deine Gabe mit.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innos segne diesen Mann. Lass dein Licht über ihn leuchten.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Schenke ihm Kraft, nach der Gerechtigkeit zu handeln.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, der Feuermagier, hat mir seinen Segen gegeben.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Wenn du so viel Gold spenden willst, solltest du auch welches mitbringen.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};


	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Daron_PICKPOCKET (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 900;
	condition	= DIA_Daron_PICKPOCKET_Condition;
	information	= DIA_Daron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen (47, 80);
};
 
FUNC VOID DIA_Daron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Daron_PICKPOCKET);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_BACK 		,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};
	
func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};











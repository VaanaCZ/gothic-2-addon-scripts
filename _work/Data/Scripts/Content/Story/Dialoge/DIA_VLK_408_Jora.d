///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "Ich muß weiter!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Hey! Was ist mit meinem Gold?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Du bist ein Sträfling aus der Minenkolonie. Dir werde ich nichts verkaufen!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Zeig mir deine Ware";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Zeig mir deine Ware.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Innos zum Gruß, Fremder, wenn du ein gutes Sortiment für Reisende suchst, dann bist du bei mir richtig.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Aber ich warne dich: Wenn du vorhast, dich bei mir zu bedienen, ohne zu bezahlen, rufe ich die Stadtwache!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Moment mal, sehe ich etwa aus wie ein Dieb?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(verächtlich) Pah! Du wärst nicht der Erste, der sich heute an meinen Sachen bereichert.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora handelt mit Waren aller Art am Marktplatz.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Du bist bestohlen worden?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //Du bist bestohlen worden?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Beweisen kann ich's nicht. Der Typ war verdammt clever. Hat sich vorgestellt als Rengaru - wenn das überhaupt sein richtiger Name war.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Treibt sich schon die ganzen letzten Tage am Marktplatz rum.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //Und jeden Abend säuft er sich einen an am Bierstand die Straße runter. Ich wette der Mistkerl versäuft MEIN Geld!
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Hab nur mal einen Moment nicht aufgepasst, und mein Geldbeutel war weg!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Pass auf - wenn du mir mein Gold von diesem Rengaru wiederbesorgst, werde ich dir sagen, was ich weiß.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich könnte dir dein Gold wiederbeschaffen...";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Ich könnte dir dein Gold wiederbeschaffen ...
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(misstrauisch) So? Und warum solltest du das tun?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Ich will einen Teil des Goldes als Belohnung!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Ich suche Hinweise auf die Diebesgilde!", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Kommt drauf an - kannst du mir helfen ins obere Viertel zu kommen?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //Kommt drauf an - kannst du mir helfen ins obere Viertel zu kommen?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(lacht) Da hast du dir den Falschen ausgesucht. Ich komme von außerhalb - so wie die meisten Händler hier am Marktplatz.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Wenn du ins obere Viertel willst, geh zu den ansässigen Händlern in der Unterstadt.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //Ich suche Hinweise auf die Diebesgilde!
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Kann schon sein, daß ich dir weiterhelfen kann.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ich werd mal sehen, was ich machen kann.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Wieviel Geld war in dem Beutel?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Warum hast du nicht die Stadtwache gerufen?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Ich will einen Teil des Goldes als Belohnung!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Sieh erstmal zu, dass du mein Geld wiederbeschaffst. DANN unterhalten wir uns über deine Belohnung!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Ich werd mal sehen, was ich machen kann.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Wieviel Geld war in dem Beutel?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Warum hast du nicht die Stadtwache gerufen?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Warum hast du nicht die Stadtwache gerufen?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Die Stadtwache reagiert nur, wenn ein Dieb auf frischer Tat ertappt wird.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //Und als ich gemerkt hab, dass mein Geldbeutel fehlt, war der Mistkerl schon wieder weg!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Wie viel Gold war in dem Beutel?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 Goldstücke - das ist 'ne verdammte Menge in diesen beschissenen Zeiten!
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Ich werd mal sehen, was ich machen kann.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Sei vorsichtig! Wenn du den Mistkerl einfach umhaust, werden die Stadtwachen eingreifen.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //In letzter Zeit ging es hier ziemlich rau zu, und seit die Paladine da sind, greifen die Wachen bei Schlägereien in der Stadt hart durch.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Also lass dir was einfallen ...
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Werd ich.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Ein Kerl namens Rengaru hat den Händler Jora bestohlen. Er treibt sich tagsüber auf dem Marktplatz herum.");
	B_LogEntry (TOPIC_Jora, "Ich soll Jora sein Gold zurückbringen.");
	B_LogEntry (TOPIC_JoraDieb, "Rengaru hat den Händler Jora bestohlen. Wenn ich ihn stelle, gibt es vielleicht ein Kopfgeld für ihn.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wegen des Diebes ... ";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //Wegen des Diebes ...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Ja, wie sieht's aus? Hast du ihn geschnappt - und noch viel wichtiger - hast du mein Gold?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Nun, er hatte einen tödlichen Unfall.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Ja, ich habe ihn erwischt.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Er ist mir entkommen.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"Ich bin noch an der Sache dran!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Ich bin noch an der Sache dran!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Dann sieh zu, dass du mein Gold wiederbeschaffst!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Er ist mir entkommen.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //Und was ist mit meinem Gold? Ist es mit ihm entkommen?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Ja, ich habe ihn erwischt. Er wird die nächste Zeit im Gefängnis verbringen.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //Was ist mit meinem Gold?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //Nun, er hatte einen tödlichen Unfall.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //Dann wird er zumindest niemanden mehr bestehlen! Innos hat seine Gerechtigkeit walten lassen.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Wo ist mein Gold?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zurückbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Hier hast du deine gestohlenen 50 Goldstücke zurück.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Hier hast du deine gestohlenen 50 Goldstücke zurück.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Innos sei gepriesen! Es gibt doch noch Gerechtigkeit in der Stadt.
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Hey, das sind keine 50 Goldstücke! Willst du mich etwa auch bestehlen?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Was weißt du über die Diebesgilde?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Was weißt du über die Diebesgilde?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //Gut - pass auf - alles was ich dir jetzt sage, hast du nicht von mir, klar?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //In der Hafenkneipe hängen oft zwielichtige Gesellen herum.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Ich wette, der Wirt weiß was...
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Wenn du vorhast die Diebe aufzuspüren, sollest du mal mit IHM reden.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //Du könntest zum Beispiel so tun, als ob du ne krumme Tour durchziehen willst. Vielleicht geht er drauf ein.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Aber sei bloß vorsichtig. Mit diesen Leuten ist garantiet nicht zu spaßen...
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich will einen Teil des Goldes als Belohnung!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Ich will einen Teil des Goldes als Belohnung!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ich habe dir doch schon einen wertvollen Hinweis gegeben.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //Das sollte dir als Belohnung reichen.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Wenn du Gold willst, dann bring die Diebe zur Strecke und kassier' das Kopfgeld bei Lord Andre.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //Ich muss mich jetzt wieder um meine Kunden kümmern ...
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik sagt, du hättest sein Schwert ...";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik sagt, du hättest sein Schwert ...
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Du meinst den abgerissenen Typen, der seine Waffe bei mir für ein paar Fackeln und Fleischbröckchen eingetauscht hat?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Genau den.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Das Schwert hab ich noch.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //Wie viel willst du dafür haben?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //Nun - für dich ...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //Ach, was soll's! Hier, nimm es. Schließlich hast du mir geholfen, mein Gold wiederzukriegen ...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //Nun - für dich - 50 Goldstücke.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(brummig) Ich hab das Teil nicht mehr! Weiß der Teufel, wo das Ding jetzt ist.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Hier sind 50 Goldstücke. Gib mir Alriks Schwert.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Hier sind 50 Goldstücke. Gib mir Alriks Schwert.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - für 50 Goldstücke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Hier hast du es - (listig) war ein gutes Geschäft.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Du hast nicht genug Gold. Aber keine Angst - ich werd das Schwert noch 'ne Weile behalten. Komm halt später noch mal wieder ...
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};










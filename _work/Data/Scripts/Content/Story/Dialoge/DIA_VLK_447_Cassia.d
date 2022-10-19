//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_EXIT   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 999;
	condition   = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Cassia_PICKME (C_INFO)
{
	npc			= VLK_447_Cassia;
	nr			= 900;
	condition	= DIA_Cassia_PICKME_Condition;
	information	= DIA_Cassia_PICKME_Info;
	permanent	= TRUE;
	description = Pickpocket_100_Female;
};                       

FUNC INT DIA_Cassia_PICKME_Condition()
{
	C_Beklauen (100, 400);
};
 
FUNC VOID DIA_Cassia_PICKME_Info()
{	
	Info_ClearChoices	(DIA_Cassia_PICKME);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_BACK 		,DIA_Cassia_PICKME_BACK);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_PICKPOCKET	,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cassia_PICKME);
};
	
func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices (DIA_Cassia_PICKME);
};
//////////////////////////////////////////////////////////////////////
//	Info Gilde
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Gilde   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Cassia_Gilde_Condition()
{	
	if (Cassia_Gildencheck == TRUE)
	&& (Join_Thiefs == TRUE)
	&& ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Gilde_Info()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Wie ich sehe, bist du zu einem K�mpfer f�r Recht und Ordnung geworden.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//Es spielt kein Rolle, dass du im Dienste Innos' stehst. Du bist einer von uns. Und ich hoffe, du siehst das genauso.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Du geh�rst also jetzt zur Kirche Innos'. Sch�n, aber du bist immer noch einer von uns - ich hoffe, du vergisst das nicht.
	};
	
	
	AI_StopProcessInfos (self);
	
};
//////////////////////////////////////////////////////////////////////
//	Info Frist abgelaufen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Abgelaufen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Cassia_Abgelaufen_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Cassia_Frist == TRUE)  
	&& (Cassia_Day < (B_GetDayPlus() -2))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Abgelaufen_Info()
{
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Deine Bedenkzeit ist vorbei. Du w�rst besser nicht zur�ckgekommen.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0); 
};
//////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_News   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Cassia_News_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_News_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Wie ich sehe, hast du unser Geschenk bekommen. Ich bin Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Okay, Cassia, dann erz�hl mir mal, warum ich hier bin.
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Wir sind auf dich aufmerksam geworden, weil du das Vertrauen einiger Freunde gewonnen hast.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//Und wir wollen dir eine Chance bieten. Du kannst uns beitreten.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//Sieh an, wer zu uns gefunden hat. Attila hat dich untersch�tzt. Diesen Fehler werde ich nicht begehen.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//Was l�uft hier eigentlich?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Du solltest sterben, weil du einen Freund ans Messer geliefert hast. Deshalb haben wir Attila geschickt.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Deine Anwesenheit hier bietet dir jedoch eine neue M�glichkeit ...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//... was willst du mir anbieten?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//Du kannst uns beitreten.
	};
	if  (Npc_GetTrueGuild (other) == GIL_NONE)
	||  (Npc_GetTrueGuild (other) == GIL_NOV)
	{	
		Cassia_Gildencheck = TRUE;
	};
	
	DG_gefunden = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Erz�hle mir mehr 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_mehr   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent   = FALSE;
	description = "Erz�hl mir mehr von euch.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Erz�hl mir mehr von euch.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Die Leute in der Stadt sind ziemlich nerv�s wegen uns. Aber niemand kennt unser Versteck.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Die paar Leute, die �berhaupt wissen, dass es die Kanalisation gibt, denken, sie w�re geschlossen und f�r niemanden zug�nglich.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//Und solange sie uns nicht finden, k�nnen wir ungest�rt arbeiten.
};

//////////////////////////////////////////////////////////////////////
//	Vermisste Leute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_MissingPeople   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent   = FALSE;
	description = "Was wei�t du �ber die verschwundenen Leute?";
};

FUNC INT DIA_Cassia_MissingPeople_Condition()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cassia_MissingPeople_Info()
{
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //Was wei�t du �ber die verschwundenen Leute?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //Warum interessiert dich das?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Ich will herausfinden, was mit ihnen passiert ist.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Wenn du aus der Kanalisation kommst, schwimm ein St�ck weit rechts runter an der K�ste entlang.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Dort wirst du deine Antworten finden...
};


//////////////////////////////////////////////////////////////////////
//	Info Was habe ich davon? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Vorteil   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent   = FALSE;
	description = "Was habe ich davon, wenn ich euch beitrete? ";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Was habe ich davon, wenn ich euch beitrete?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Du kannst bei uns spezielle Fertigkeiten lernen. Fertigkeiten, die dir ein Leben in Reichtum erm�glichen.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Aber ich muss mich dann nicht hier unten verstecken, oder?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//(lacht leise) Nein. Du musst dich nur an unsere Regeln halten. Das ist alles.
};
//////////////////////////////////////////////////////////////////////
//	Info Was kann ich bei euch lernen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Lernen  (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 4;
	condition   = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent   = FALSE;
	description = "Was kann ich bei euch lernen?";
};

FUNC INT DIA_Cassia_Lernen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Lernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Was kann ich bei euch lernen?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper ist der Meister der Lautlosigkeit. Er wird dir zeigen, wie du dich ohne ein Ger�usch bewegen kannst.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez ist ein begnadeter Einbrecher. Kein Schloss kann seinen Dietrichen widerstehen.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//Und ich kann dich im Taschendiebstahl unterweisen.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Au�erdem werde ich dir helfen, geschickter zu werden. Denn die Geschicklichkeit ist der Schl�ssel zu deinen Fertigkeiten.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia kann mich im Taschendiebstahl unterrichten und sie kann mir dabei helfen, geschickter zu werden.");
	B_LogEntry(Topic_CityTeacher,"Ramirez kann mir das Schl�sser knacken beibringen.");
	B_LogEntry(Topic_CityTeacher,"Jesper kann mir das Schleichen beibringen.");
};
//////////////////////////////////////////////////////////////////////
//	Info Regeln 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Regeln   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent   = FALSE;
	description = "Was sind eure Regeln?";
};

FUNC INT DIA_Cassia_Regeln_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Regeln_Info()
{
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//Was sind eure Regeln?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//Die erste Regel lautet: Du verlierst kein Wort �ber uns. Zu niemandem. Niemals.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Zweitens: Lass dich nicht erwischen.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Drittens: Wenn du hier unten deine Waffe ziehst und jemanden angreifst, bringen wir dich um.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//Und die vierte und letzte Regel ist: Wer uns beitritt, muss sich beweisen.
};
//////////////////////////////////////////////////////////////////////
//	Info Was passiert, wenn ich erwischt werde? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Erwischen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent   = FALSE;
	description = "Was passiert, wenn ich erwischt werde?";
};

FUNC INT DIA_Cassia_Erwischen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Erwischen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Was passiert, wenn ich erwischt werde?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Lass dich einfach nicht erwischen, okay?
};
//////////////////////////////////////////////////////////////////////
//	Info Wie muss ich mich beweisen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_beweisen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent   = TRUE;
	description = "Wie muss ich mich beweisen?";
};
//--------------------------------------
var int DIA_Cassia_beweisen_permanent;
//-------------------------------------
FUNC INT DIA_Cassia_beweisen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	&& (DIA_Cassia_beweisen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_beweisen_Info()
{
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Wie muss ich mich beweisen?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Willst du uns nun beitreten oder nicht?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Dieser st�rrische alte Alchemist - Constantino, besitzt einen sch�nen Ring.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Aber er braucht ihn gar nicht. Ich will, dass er meine Hand ziert.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia will das ich ihr den Ring von Constantino bringe.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Beitreten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Beitreten   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent   = FALSE;
	description = "Okay, ich bin dabei.";
};

FUNC INT DIA_Cassia_Beitreten_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Beitreten_Info()
{
	AI_Output (other, self, "DIA_Cassia_Beitreten_15_00");//Okay, ich bin dabei.
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Gut. Du bekommst eine Gelegenheit, dich zu beweisen. Wenn du von uns lernen willst, steht dir das frei.
	
	Join_Thiefs = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Und wenn ich euch nicht beitrete...? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Ablehnen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 9;
	condition   = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent   = FALSE;
	description = "Und wenn ich euch nicht beitrete ...? ";
};

FUNC INT DIA_Cassia_Ablehnen_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//Und wenn ich euch nicht beitrete ... ?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Du verpasst eine einmalige Chance, aber du kannst gehen.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(ernst) Und lass dir nicht einfallen, uns zu verraten. Du w�rdest es bitter bereuen.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Okay, ich bin dabei.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Ich muss mir das �berlegen.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//Dann werde ich dich t�ten.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Okay, ich bin dabei.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Dann versuch mich zu t�ten.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//Okay, ich bin dabei.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(l�chelt) Du hast klug entschieden. Wenn du dich beweisen kannst, werden wir dich in unsere Reihen aufnehmen.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Es steht dir nat�rlich frei, schon jetzt die Fertigkeiten der Diebe zu lernen - du wirst sie brauchen.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//Dann versuch, mich zu t�ten.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//Schade. Ich h�tte dich f�r schlauer gehalten.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Ich muss mir das �berlegen.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Tu das. Ich gebe dir zwei Tage Bedenkzeit. Danach bist du hier nicht mehr willkommen.
	
	Cassia_Day = B_GetDayPlus ();
	Cassia_Frist = TRUE;
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};


//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_BevorLernen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 5;
	condition   = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent   = TRUE;
	description = "Kannst du mich unterrichten?";
};
FUNC INT DIA_Cassia_BevorLernen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& ((Cassia_TeachPickpocket == FALSE)
	|| (Cassia_TeachDEX == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Kannst du mich unterrichten?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Klar, kein Problem. Sag mir einfach Bescheid, wenn du bereit bist.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Klar, Taschendiebstahl und Geschicklichkeit kosten dich jeweils 100 Goldst�cke.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Sp�ter vielleicht...(ZUR�CK)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Ich will Taschendiebstahl lernen (100 Gold zahlen)",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Ich will geschickter werden (100 Gold zahlen)",DIA_Cassia_BevorLernen_DEX);
		};
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices (DIA_Cassia_BevorLernen);
};
FUNC VOID DIA_Cassia_BevorLernen_DEX()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Ich will geschickter werden. Hier ist das Gold.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Wenn du bereit bist, k�nnen wir anfangen.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Komm wieder, wenn du das Gold dabei hast.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Ich will Taschendiebstahl lernen. Hier ist das Gold.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Wenn du bereit bist, k�nnen wir anfangen.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Komm wieder, wenn du das Gold dabei hast.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_447_Cassia;
	nr			 = 	12;
	condition	 = 	DIA_Cassia_TEACH_Condition;
	information	 = 	DIA_Cassia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will geschickter werden";
};
func int DIA_Cassia_TEACH_Condition ()
{	
	if (Cassia_TeachDEX == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_Cassia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Ich will geschickter werden.
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
};
func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Cassia_TEACH);
};
func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Pickpocket   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent   = TRUE;
	description = "Zeig mir den Taschendiebstahl. (10 LP)";
};

FUNC INT DIA_Cassia_Pickpocket_Condition()
{	
	if (Cassia_TeachPickpocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Pickpocket_Info()
{
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Zeig mir den Taschendiebstahl.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Wenn du jemandem die Taschen ausleeren willst, lenke ihn ab. Quatsch ihn einfach an, sprich mit ihm.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Beim Gespr�ch guckst du dir ihn an. Achte auf ausgebeulte Taschen, Schmuck oder Lederschn�re am Hals. Und achte vor allem darauf, wie aufmerksam der Kerl ist.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Einen betrunkenen Tagel�hner auszurauben, ist was anderes, als einen wachsamen H�ndler, klar?
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Wenn du dich nat�rlich ungeschickt anstellst, kriegt er's mit. Also immer ruhig bleiben.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Aufnahme
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Aufnahme   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent   = FALSE;
	description = "Ich habe Constantinos Ring.";
};

FUNC INT DIA_Cassia_Aufnahme_Condition()
{	
	if (MIS_CassiaRing == LOG_RUNNING)
	&& (Npc_HasItems (other, ItRi_Prot_Point_01_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Aufnahme_Info()
{
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//Ich habe Constantinos Ring.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Herzlichen Gl�ckwunsch. Du hast deine Aufnahme bei uns bestanden. Jetzt geh�rst du wirklich zu uns.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Nimm diesen Schl�ssel. Er �ffnet die T�r zum Hotel. (l�chelt) Dann musst du nicht immer schwimmen.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Weiterhin sollst du wissen, dass wir ein Erkennungszeichen haben. Ein bestimmtes Kopfnicken.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Genau. Wenn du mit den richtigen Leuten sprichst und das Zeichen machst, werden sie wissen, dass du zu uns geh�rst.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Ich bin in die Diebesgilde aufgenommen worden."); 
	B_LogEntry (Topic_Diebesgilde,"Ich kenne das Zeichen der Diebe. Wenn ich das den richtigen Leuten zeige, wissen sie das ich dazugeh�re. ");
	 
	
};
//////////////////////////////////////////////////////////////////////
//	Info Versteck
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Versteck   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent   = FALSE;
	description = "Wo habt ihr eigentlich eure Beute versteckt?";
};

FUNC INT DIA_Cassia_Versteck_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Ramirez_Beute)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Versteck_Info()
{
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Wo habt ihr eigentlich eure Beute versteckt?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Ach komm, du erwartest doch nicht, dass ich dir das erz�hle.
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Du hast genug Gelegenheit, dir selbst Beute an Land zu ziehen. Denk dran - wer zu viel will, geht am Ende leer aus.
};
//////////////////////////////////////////////////////////////////////
//	Info Blutkelche
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Blutkelche   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent   = FALSE;
	description = "Hast du einen Job f�r mich? ";
};

FUNC INT DIA_Cassia_Blutkelche_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (MIS_CassiaKelche != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Blutkelche_Info()
{
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Hast du einen Job f�r mich?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Nicht, solange du in der Stadt als Dieb gesucht wirst.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Kl�re das - bezahle deine Strafe oder beseitige die Zeugen, mir egal, wie du das machst, aber kl�re das.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Ja. Es gibt eine Reihe Kelche, die zusammengeh�ren. Sechs St�ck an der Zahl.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Sie wurden einst von K�nig Rohbar auf einem Feldzug erbeutet - aber er hat daf�r viele M�nner geopfert. Deshalb werden sie Blutkelche genannt.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Jeder Kelch alleine ist nicht von gro�em Wert - aber wenn sie vollst�ndig sind, bekommen wir ein h�bsches S�mmchen daf�r.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Wo sind diese Kelche?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Sie sind hier in der Stadt - die Gro�h�ndler im oberen Viertel besitzen sie.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Bring sie mir. Ich versuche derweil, einen K�ufer aufzutreiben.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Was springt f�r mich dabei raus?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Entweder die H�lfte vom Gewinn oder du kannst ein besonderes St�ck aus meiner Beute w�hlen.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia will, das ich ihr die sechs Blutkelche bringe. Sie sollen alle hier in der Stadt sein.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Kelche abgeben
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_abgeben   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent   = TRUE;
	description = "Wegen der Blutkelche ...  ";
};

FUNC INT DIA_Cassia_abgeben_Condition()
{	
	if (MIS_CassiaKelche == LOG_RUNNING)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_abgeben_Info()
{
	AI_Output (other, self, "DIA_Cassia_abgeben_15_00");//Wegen der Blutkelche ...
	
	if B_GiveInvItems (other, self, ItMi_BloodCup_MIS,6)
	{
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//Ich habe alle sechs Kelche zusammen.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Gute Arbeit, ich habe inzwischen einen K�ufer ausfindig gemacht.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Deine Belohnung kannst du haben. Danke, dass du diese Sache f�r mich gemacht hast.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//Mehr habe ich f�r dich nicht mehr zu tun - aber du kannst jederzeit von mir lernen - und es gibt genug auf der Insel, das du dir aneignen kannst. (l�chelt)
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Die Kelche kann ich nur zusammen loswerden. Bring mir alle sechs.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Belohung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Belohnung   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent   = FALSE;
	description = "Ich will meine Belohnung abholen.";
};

FUNC INT DIA_Cassia_Belohnung_Condition()
{	
	if (MIS_CassiaKelche == LOG_SUCCESS)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Belohnung_Info()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Ich will meine Belohnung abholen.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Was willst du haben?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 Goldst�cke.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 Elixiere der Heilung",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice (DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING ,DIA_Cassia_Belohnung_Ring);
	
};
FUNC VOID DIA_Cassia_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_02");//Gib mir das Gold.
	B_GiveInvItems (self, other, ItmI_Gold,400);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Trank()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_03");//Gib mir die Tr�nke.
	B_GiveInvItems (self, other, ItPo_Health_03,4);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Ring()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_04");//Gib mir den Ring.
	B_GiveInvItems (self, other, ItRi_Hp_01,1);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};

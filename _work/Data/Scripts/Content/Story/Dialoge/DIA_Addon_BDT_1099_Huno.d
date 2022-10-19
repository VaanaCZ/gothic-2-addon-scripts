//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Was willst du noch? Verpiss dich!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Worauf wartest du? Geh in die Kneipe!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Wie's aussieht, beherrschst du dein Handwerk.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Wie's aussieht, beherrschst du dein Handwerk.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//Das habe ich doch schon mal geh�rt ... bringst du den Stahl?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Stahl? Nein, ich denke, du verwechselst mich ...
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hm ... irgendwie kommst du mir bekannt vor. Kennen wir uns irgendwo her?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Klar, aus dem alten Lager.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Ich w��te nicht woher.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno handelt mit Schmiedezubeh�r.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Klar, aus dem alten Lager.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//Das alte Lager ... richtig ... du bist dieser neugierige Typ ... ich dachte, du w�rst tot.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Ja, das denken alle. Wer hat sonst noch �berlebt?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Wenige. Ein paar sind wie ich, mit Raven geflohen. F�r viele andere wurde das alte Lager zum Grab.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//Ich w�sste nicht, woher.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hm ... mein Ged�chtnis ist ein Sieb ... was soll's ...
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Erz�hl mir von deiner Flucht.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Erz�hl mir von deiner Flucht.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//An dem Tag als die Barriere fiel, brach Chaos aus.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Einige versteckten sich - andere flohen und �berall wurde gepl�ndert.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//Was hast du gemacht?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Ich wollte gerade das Lager verlassen, da wird es schlagartig hell und ein sengender Schmerz fra� sich durch meine Haut.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//Ein verdammter Blitz hatte mich erwischt! Es ist mir so, als k�nnte ich ihn immer noch h�ren ...
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Sp�ter erz�hlte man mir, dass Thorus mich gefunden und mitgenommen hat.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Ich brauch 'ne bessere R�stung.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Ich brauch 'ne bessere R�stung.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //So - die kannst du haben. Dass sie so teuer ist, liegt an Esteban.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Dieser verfluchte Hund kassiert n�mlich von jeder R�stung, die ich verkaufe, seinen Teil ab.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Schwere Banditenr�stung kaufen (Schutz vor Waffen: 45, Pfeilen: 45, Kosten: 2100", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk hat gesagt, du w�rdest mir 'nen guten Preis machen?
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Fisk sagst du? Hm, gut, ich schulde ihm noch einen Gefallen.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Schwere Banditenr�stung kaufen (Schutz vor Waffen: 45, Pfeilen: 45, Kosten: 1400", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Okay, ich nehme die R�stung.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Alles klar.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Kein Gold, keine R�stung.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "Wegen des Attentats auf Esteban...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(gef�hrlich) Was willst du von mir?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Ich suche den Auftraggeber ...
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //Und warum kommst du damit zu mir?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Ich hab gedacht, du wei�t vielleicht was �ber die Sache.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Wei� ich NICHT!
};


//----------------------------------------------------------------------
//	Paar Dinge geh�rt
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(seufzt) Jetzt h�r mal zu! Du bewegst jetzt deinen Arsch hier weg, bevor ich mich vergesse!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "Ich habe da ein paar Dinge �ber dich geh�rt...";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //Ich habe da ein paar Dinge �ber dich geh�rt ...
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //So?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Schon wieder? (droht) Hoffentlich ist diesmal was wichtiges dabei ...
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Ich hab geh�rt, du warst nicht an deinem Platz, als das Attentat passiert ist!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(gef�hrlich) Und weiter?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul hat gesagt, du w�rdest Esteban hassen.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(gef�hrlich) So? Hat er das? Und weiter?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio hat deinen Namen ausgespuckt! Du wei�t auf jeden Fall was �ber's Attentat!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(ruhig) Du hast dich ein bisschen mit dem alten Emilio unterhalten, was?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //Und er ist nicht er Einzige, der dich verd�chtigt!
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //Was soll das werden, hm?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Ich will mit dem Attent�ter gemeinsame Sache machen!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Wenn du hinter dem Attentat steckst, wirst du daf�r bezahlen!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Sieht so aus, als h�tte ich Huno an seinen Eiern gepackt.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(droht) Vielleicht sollte ich mich auch mal mit ihm unterhalten. Ich bin mir sicher, DANACH behauptet er genau das Gegenteil!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Weiter nichts ...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Wenn du hinter dem Attentat steckst, wirst du daf�r bezahlen!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(genervt) Du bist ja so ein Idiot! Glaubst du wirklich, du kannst dich bei Esteban einschleimen?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Mach, dass du wegkommst!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Ich will mit dem Attent�ter gemeinsame Sache machen!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Gegen Esteban? Wirklich? Dann beweise es!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //Ich warte schon zu lange auf eine Lieferung Stahl von den Piraten.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Ich vermute, dass Esteban sie abgefangen hat, um sie mir sp�ter teuer zu verkaufen.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Das macht er nat�rlich nicht selbst. Ein paar der Banditen im Sumpf stehen auf seiner Lohnliste.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Woher wei�t du das?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Betrunkene Banditen quatschen zuviel ...
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //Hat der gespr�chige Bandit auch einen Namen?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Sein Name geht dich nichts an. Aber der Kerl, den du SUCHST, hei�t Juan. Allerdings habe ich ihn schon lange nicht mehr im Lager gesehen.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Du wirst im Sumpf nach ihm suchen m�ssen.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno wartete auf eine Lieferung Stahl von den Piraten. Er glaubt das ein Kerl namens Juan sie im Auftrag von Esteban abgefangen hat. Er versteckt sich irgendwo im Sumpf.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Du verr�tst mir erst, wer der Auftraggeger ist!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Okay, ich mach die Sache f�r dich!", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //Okay, ich mache die Sache f�r dich!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Gut. Wir werden ja sehen, ob man dir trauen kann.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Du verr�tst mir erst, wer der Auftraggeber ist!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Nein. Ich traue dir nicht.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Pass auf. Die n�chste Unterhaltung, die ich f�hren werde, ist entweder mit dem Auftraggeber oder mit Esteban.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //Mit wem ich rede, ist deine Wahl.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(seufzt) Na gut. Ich werde dich mit dem Auftraggeber zusammenbringen. Aber es passiert so, wie ich es sage, klar?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Geh in die Kneipe und sprich mit dem Wirt. Alles Weitere wirst du von ihm erfahren.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno sagte mir, ich sollte mal mit Snaf sprechen.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "Ich habe den Stahl.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//Ich habe den Stahl.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //Und? War Juan auch da?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //War er.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Wusste ich es doch. Esteban, die Ratte, steckte dahinter.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Du bist doch in Ordnung. Wenn ich ehrlich bin, h�tte ich das von dir nicht erwartet.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Hier, nimm das hier als Belohnung.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //Was ist jetzt mit unserer Abmachung?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //Der Mann, mit dem du reden willst, wartet auf dich in der Kneipe. Sprich mit dem Wirt.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno sagte mir,ich sollte mal mit Snaf sprechen.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};







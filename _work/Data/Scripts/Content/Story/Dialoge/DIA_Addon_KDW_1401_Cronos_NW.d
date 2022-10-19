///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"Kann ich kurz st�ren?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Kann ich kurz st�ren?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(�berrascht) DU bist es. Dass ich dich nochmal zu Gesicht bekomme h�tte ich nicht gedacht.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Ganz sch�n mutig, dich noch mal bei uns blicken zu lassen. Es gab Zeiten, da h�tten wir dir glatt das Fell �ber die Ohren gezogen.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Du kannst froh sein, dass das schon ein paar Wochen her ist und sich alle wieder beruhigen konnten.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"Was machst du hier?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Was machst du hier?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(verwirrt) Meine Aufgabe besteht darin, mehr �ber die W�chter des Tempels herauszufinden.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Das ist schon ein harter Brocken, im wahrsten Sinne des Wortes. Diese Steinw�chter haben eine mir v�llig fremde Eigenschaft.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //In einem Moment stehen sie v�llig leblos herum, und im n�chsten Moment st�rmen sie wie besessen auf dich los.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Ich habe ihre treibende Kraft noch nicht bestimmen k�nnen, aber eins ist sicher. Sie ist magischen Ursprungs.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"Erz�hl' mir mehr �ber diese Steinw�chter.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Erz�hl' mir mehr �ber diese Steinw�chter.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(verwirrt) Viel kann ich dir bisher noch nicht sagen. Wir haben sie leider zerst�ren m�ssen. Jetzt sind sie ungef�hrlich.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Als wir hierher kamen, haben sie uns angegriffen.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Wir konnten sie nur mit vereinten Kr�ften besiegen und ich bef�rchte, dass hinter dem Portal noch mehr davon auf uns warten.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Es muss einen Weg geben, ihre treibende Kraft zu bannen, so dass sie nichts weiter sind als Statuen und das auch bleiben.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Kannst du mir ein paar Ausr�stungsgegenst�nde verkaufen?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Kannst du mir ein paar Ausr�stungsgegenst�nde verkaufen?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Warum nicht? Wenn ich mich recht erinnere, haben wir damals schon gehandelt.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Sag mir, was du brauchst.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};

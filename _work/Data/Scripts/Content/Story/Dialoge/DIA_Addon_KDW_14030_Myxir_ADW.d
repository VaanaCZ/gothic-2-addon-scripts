
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Myxir_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14030_Addon_Myxir_ADW;
	nr          = 999;
	condition   = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Myxir_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14030_Addon_Myxir_ADW;
	nr			= 900;
	condition	= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_ADWHello_Condition;
	information	 = 	DIA_Addon_Myxir_ADWHello_Info;

	description	 = 	"Schon neue Erkenntnisse?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //Schon neue Erkenntnisse?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //Die Erbauer dieser Ruinen faszinieren mich!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Nur schade, dass ihre Sprache so tot ist wie sie selbst.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(nachdenklich) Ihre mächtigen Rituale und Beschwörungen waren auch keine Rettung für sie.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Beschwörungen?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //Die Erbauer hatten eine starke Bindung zur Geisterwelt.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Wenn ich das richtig verstanden habe, dann glaubten sie, in ständigem Kontakt mit ihren Ahnen zu stehen.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Hierzu wurden regelmäßig Beschwörungen und Rituale abgehalten, um die Geister um Rat zu bitten oder Erleuchtung zu erlangen.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Wie funktionierten diese Geisterbeschwörungen?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Die Untoten, die ich kenne, hatten nie viel zu sagen.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //Wie funktionierten diese Geisterbeschwörungen?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //Die Totenwächter hatten ihre speziellen Formeln, mit denen sie die Geister besänftigten.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Die Schilderungen, die ich hier finden konnte, sind jedoch teilweise sehr verwirrend. Nur selten erhalte ich klare Antworten auf meine Fragen.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //Die Untoten, die ICH kenne, hatten nie viel zu sagen.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //Die Erbauer haben keine seelenlosen Untoten erschaffen wie Zombies oder andere böse Kreaturen.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Bei den Geistern handelt es sich um die Seelen großer Krieger, Priester und Herrscher.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Bisher habe ich keinen Zweifel daran, dass sie wirklich existieren.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Myxir_PermADW_Condition;
	information	 = 	DIA_Addon_Myxir_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wenn ich einen Geist sehe, dann sage ich dir bescheid.";
};
func int DIA_Addon_Myxir_PermADW_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Wenn ich einen Geist sehe, dann sage ich dir Bescheid.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(lacht) Ja, ich bestehe darauf.
};
///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistTafel_Condition;
	information	 = 	DIA_Addon_Myxir_GeistTafel_Info;

	description	 = 	"Saturas schickt mich.";
};

func int DIA_Addon_Myxir_GeistTafel_Condition ()
{
	if (Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistTafel_Info ()
{
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Saturas schickt mich.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Raven ist in den Tempel vorgedrungen und hat das Portal hinter sich versperrt.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas meinte, er hat seine Kenntnis über den Tempel von einem Geist erlangt!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(überwältigt) Bei Adanos!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Er muss den Hohepriester Khardimon beschworen haben, um ihn nach einem Weg in den Tempel zu fragen.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Laut den Aufzeichnungen hatte er sein Grab in den Höhlen unter der Festung!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //Du wirst es ihm gleichtun müssen.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Aber Khardimon kannst du nun nicht mehr befragen ...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //Das Grab des Kriegerfürsten Quahodron soll im Westen des Tals liegen.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Du wirst es finden müssen ... und Quahodron erwecken.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //In diesen Inschriften hier ist festgehalten, wie ein Gläubiger Adanos' einen Geist beschwören kann.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //Glaubst du, das klappt wirklich?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //Ich habe schon vieles wirres Zeug gelesen.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Zum Beispiel die Schriften von Y'Berion, dem Anführer der Bruderschaft des Schläfers.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Aber dem Verfasser DIESER Schriften glaube ich jedes Wort!
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Ist das wirklich dein Ernst?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Warum Quarhodron? Warum nicht gleich den Hohepriester Khardimon?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Die Bruderschaft des Schläfers hat nicht NUR Lügen verbreitet.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Warum Quarhodron? Warum nicht gleich den Hohepriester Khardimon?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //Raven hat mit seiner Beschwörung das Grab von Khardimon entweiht. Davon können wir ausgehen.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Wir müssen uns einen anderen Geist suchen.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //Die Bruderschaft des Schläfers hat nicht NUR Lügen verbreitet. Den Schläfer gab es wirklich.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //Es waren auch nicht ihre Lügen, die sie unglaubwürdig gemacht haben, es waren ihre Worte an sich.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Die waren mehr verworren als glaubhaft. Sie zeugten von dem übermäßigen Gebrauch des Sumpfkrauts, das sie rauchten.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Es ist die Ernsthaftigkeit und Besonnenheit in den Worten dieser Steintafel, die mich davon überzeugt, dass DIESER Mann hier die Wahrheit schreibt.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //Ist das wirklich dein Ernst?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Ich will nichts unversucht lassen.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Wenn auch nur der Hauch einer Chance für uns besteht, einem der Erbauer zu begegnen, dann müssen wir das tun.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Raven hat es ja auch geschafft.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Angenommen, ich wollte diesen Geist beschwören...", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Angenommen, ich wollte diesen Geist beschwören, was müsste ich tun?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Finde Quahodrons Grab im Westen des Tals.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Mit den Worten der Totenwächter, die ich dir hier aufgeschrieben habe, wird sein Geist herbeigerufen.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //Das wäre auch schon alles. Jetzt müsstest du nur noch das Grab finden.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Viel Erfolg, mein Sohn!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir will, dass ich den Geist des alten Kriegerfürsten Quarohodron erwecke und ihn um Rat bitte. Dazu gab er mir ein Schriftstück mit einer Zauberformel, die ich an Quarhodrons Grab im Westen laut vorlesen soll."); 

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_GeistPerm_Condition;
	information	 = 	DIA_Addon_Myxir_GeistPerm_Info;

	description	 = 	"Wie war das nochmal mit dem Kriegerfürst 'Quarhodron'?";
};

func int DIA_Addon_Myxir_GeistPerm_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_GeistPerm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Wie war das nochmal mit dem Kriegerfürst 'Quarhodron'?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Du sollst sein Grab finden und seinen Geist mit den Worten der Totenwächter herbeirufen.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Ich habe dir die Worte aufgeschrieben. Du musst sie nur noch laut ablesen.
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Myxir_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Myxir_TalkedToGhost_Info;

	description	 = 	"Ich habe mit Quarhodron gesprochen.";
};
func int DIA_Addon_Myxir_TalkedToGhost_Condition ()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Myxir_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Ich habe mit Quarhodron gesprochen.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(begeistert) Dann hast du ihn tatsächlich aus dem Reich der Toten erwecken können?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //Das ist unglaublich. Ich bewundere diese Erbauer immer mehr.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Wer weiß, was sie noch zustande gebracht hätten, wenn sie heute noch existieren würden ...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //Was hat der Geist gesagt?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Er gab mir etwas, mit dem ich in den Tempel Adanos' hinein komme.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Dann geh gleich zu Saturas. Ihn wird sicher interessieren, was du zu sagen hast.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Ich sollte Saturas davon berichten, dass ich Quarhodron erweckt habe."); 
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach		(C_INFO)
{
	npc		 = 	KDW_14030_Addon_Myxir_ADW;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Myxir_ADW_Teach_Condition;
	information	 = 	DIA_Addon_Myxir_ADW_Teach_Info;
	permanent	 = 	TRUE;

	description	 = 	"Lehre mich die fremde Sprache.";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition ()
{
	if (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)	
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Myxir_ADWHello))
		{
			return TRUE;
		};
};

func void DIA_Addon_Myxir_ADW_Teach_Info ()
{
	B_DIA_Addon_Myxir_TeachRequest ();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach); 
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};	
	
	if ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| ( PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)	
	{
		Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,DIALOG_BACK,DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL2 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		B_DIA_Addon_Myxir_TeachL3 ();
		Info_AddChoice (DIA_Addon_Myxir_ADW_Teach,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else 
	{
		B_DIA_Addon_Myxir_TeachNoMore ();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};
func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X ();
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_BACK ()
{
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1 ()
{
	if (B_TeachPlayerTalentForeignLanguage  (self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};
FUNC VOID DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3 ()
{
	if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X ();
	};
	Info_ClearChoices (DIA_Addon_Myxir_ADW_Teach);
};


















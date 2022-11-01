
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

	description	 = 	"Novità?";
};

func int DIA_Addon_Myxir_ADWHello_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //Novità?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //I costruttori delle rovine mi affascinano!
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //Peccato che la loro lingua sia morta insieme a loro.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //(riflettendo) Neppure i potenti rituali e le evocazioni sono riusciti a salvarli.
	AI_Output	(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //Evocazioni?
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //I Costruttori avevano un forte legame con gli spiriti.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //Se ho ben capito, credevano di essere costantemente in contatto con i loro antenati.
	AI_Output	(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //Avevano dei rituali che usavano per chiedere consiglio agli spiriti o per raggiungere l'illuminazione.

	Info_ClearChoices	(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "Come funzionavano queste evocazioni?", DIA_Addon_Myxir_ADWHello_wie );
	Info_AddChoice	(DIA_Addon_Myxir_ADWHello, "I non morti che ho conosciuto non avevano granché da dire.", DIA_Addon_Myxir_ADWHello_Watt );
};
func void DIA_Addon_Myxir_ADWHello_wie ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //Come funzionavano queste evocazioni?
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //I guardiani dei morti conoscevano delle formule speciali per placare gli spiriti.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //Ma le descrizioni che ho trovato sono contraddittorie, e solo raramente riesco a ricevere una risposta chiara alle mie domande.
};
func void DIA_Addon_Myxir_ADWHello_Watt ()
{
	AI_Output			(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //I non morti che conosco non hanno molto da dire.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //I Costruttori non creavano non morti privi d'anima come zombie o altre creature malvagie.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //Questi spiriti erano le anime di grandi guerrieri, sacerdoti e monarchi.
	AI_Output			(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //Finora, non ho ragione di dubitare che esistano.
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

	description	 = 	"Se vedo un fantasma te lo faccio sapere.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //Se vedo uno spirito, ti avviso.
	AI_Output	(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //(ride) Sì, ci tengo proprio.
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

	description	 = 	"Mi manda Saturas.";
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
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //Mi manda Saturas.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //Raven si è introdotto nel tempio e ha bloccato il portale dall'interno.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //Saturas è convinto di aver avuto le informazioni sul tempio da un fantasma!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //(sbalordito) Per Adanos!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //Deve aver evocato il sommo sacerdote Khardimon per chiedergli come entrare nel tempio.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //Sta scritto che la sua tomba si trovava nelle caverne sotto la fortezza!
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //Dovrai fare lo stesso.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //Ma non potrai interpellare Khardimon...
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //Si dice che la tomba del principe guerriero Quahodron si trovi a ovest della valle.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //Dovrai trovarla... e risvegliare Quahodron.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //Queste iscrizioni spiegano come un fedele di Adanos possa evocare uno spirito.
	AI_Output (other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //Pensi che funzionerà davvero?
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //Di vaneggiamenti ne ho letti tanti.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //Ad esempio gli scritti di Y'Berion, il capo della Confraternita del Dormiente.
	AI_Output (self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //Ma credo ad ogni singola parola di QUESTI scritti.
	
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Stai dicendo sul serio?", DIA_Addon_Myxir_GeistTafel_geist );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Perché Quarhodron e non il sommo sacerdote Khardimon?", DIA_Addon_Myxir_GeistTafel_Khardimon );
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "La Confraternita del Dormiente non ha diffuso SOLO menzogne.", DIA_Addon_Myxir_GeistTafel_psi );
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //Perché Quarhodron e non il sommo sacerdote Khardimon?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //È certo che, con la sua evocazione, Raven abbia profanato la tomba di Khardimon.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //Dovremo cercare un altro spirito.
};
func void DIA_Addon_Myxir_GeistTafel_psi ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //La Confraternita del Dormiente non diffondeva solo bugie: il Dormiente è esistito davvero.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //Ma non erano tanto le bugie a renderli poco plausibili, quanto le loro stesse parole.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //Erano confuse, e di certo erano state scritte sotto l'influsso di tutta quell'erba di palude che fumavano.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //Ma le parole incise su questa tavoletta di pietra sono così prudenti che sono convinto che quest'uomo scrivesse la verità.
};
func void DIA_Addon_Myxir_GeistTafel_geist ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //Stai dicendo sul serio?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //Non voglio trascurare niente.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //Anche se le nostre possibilità di incontrare uno dei Costruttori sono remote, dobbiamo provarci.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //Dopo tutto, Raven ci è riuscito.
	
	Info_AddChoice	(DIA_Addon_Myxir_GeistTafel, "Supponiamo che volessi evocare questo fantasma…", DIA_Addon_Myxir_GeistTafel_wie );
};
func void DIA_Addon_Myxir_GeistTafel_wie ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //Se volessi evocare questo fantasma.... Cosa dovrei fare?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //Trova la tomba di Quahodron a ovest della valle.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //Per evocare il suo fantasma devi pronunciare le parole dei guardiani dei morti, che ho annotato per te.
	CreateInvItems (self, ItWr_Addon_SUMMONANCIENTGHOST, 1);									
	B_GiveInvItems (self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);		
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //Questo è tutto. Ora devi solo trovare la tomba.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //Buona fortuna!

	B_LogEntry (TOPIC_Addon_Quarhodron,"Myxir vuole che risvegli il fantasma del vecchio principe guerriero Quarhodron per chiedergli consiglio. Mi ha dato un documento con una formula che dovrei leggere ad alta voce sulla tomba di Quarhodron, a ovest."); 

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

	description	 = 	"Cos'è che dicevi riguardo al principe guerriero Quarhodron?";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //Cos'è che dicevi riguardo al principe guerriero Quarhodron?
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //Devi trovare la sua tomba ed evocare il suo fantasma con le parole dei guardiani dei morti.
	AI_Output	(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //Ho annotato la formula. Non devi far altro che leggerla ad alta voce.
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

	description	 = 	"Ho parlato con Quarhodron.";
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
	AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //Ho parlato con Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //(eccitato) Sei veramente riuscito a richiamarlo dal regno dei morti?
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //È incredibile! Questi Costruttori non finiscono mai di sorprendermi.
	AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //Chissà quali traguardi avrebbero raggiunto se fossero sopravvissuti...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Addon_Myxir_GeistBeschwoeren);
	
	if (Saturas_KnowsHow2GetInTempel == FALSE)
	&&	(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //Cos'ha detto il fantasma?
		AI_Output	(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //Mi ha dato qualcosa che mi consentirà di entrare nel tempio di Adanos.
		AI_Output	(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //Allora vai subito da Saturas. Gli interesserà moltissimo sentire quello che hai da dire.

		B_LogEntry (TOPIC_Addon_Quarhodron,"Dovrei riferire a Saturas che ho risvegliato Quarhodron."); 
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

	description	 = 	"Insegnami quella lingua.";
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


















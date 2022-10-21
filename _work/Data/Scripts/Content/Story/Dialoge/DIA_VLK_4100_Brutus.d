
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brutus_EXIT   (C_INFO)
{
	npc         = VLK_4100_Brutus;
	nr          = 999;
	condition   = DIA_Brutus_EXIT_Condition;
	information = DIA_Brutus_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE ;
};

FUNC INT DIA_Brutus_EXIT_Condition()
{	
	if (Kapitel < 3)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Brutus ist ToughGuy 
///////////////////////////////////////////////////////////////////////
//	Info AFTER_FIGHT 
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_AFTER_FIGHT		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	1;
	condition	 = 	DIA_Brutus_AFTER_FIGHT_Condition;
	information	 = 	DIA_Brutus_AFTER_FIGHT_Info;
	permanent	 = 	TRUE;
	important	 =  TRUE;
};

func int DIA_Brutus_AFTER_FIGHT_Condition ()
{	
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& Npc_IsInState (self, ZS_Talk)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_AFTER_FIGHT_Info ()
{

	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (other, self, "DIA_Brutus_AFTER_FIGHT_15_00"); //Dunque, hai ancora tutti i tuoi denti?
		AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_01"); //Diamine, sei davvero forte! Non ti affronterei mai in battaglia.
	}
	else if  (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (other, self, "DIA_Brutus_AFTER_FIGHT_15_02"); //Penso tu mi abbia rotto tutte le costole.
		AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_03"); //Non ti ho neanche colpito così forte. Oh beh, non importa, mi piace la gente che sa incassare bene qualche colpo.
		
		if (Brutus_einmalig == FALSE)
		{
			AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_04"); //Questa pozioni ti aiuterà a rimetterti in piedi. Farà anche meraviglie per le tue viscere!
		
			CreateInvItems (self, ItPo_Health_01,1);
			B_GiveInvItems (self, hero, ItPo_Health_01,1); 
			Brutus_einmalig = TRUE;
		};
	}
	else //Cancel
	{
		AI_Output (self, other, "DIA_Brutus_AFTER_FIGHT_06_05"); //Non ho niente contro un buon combattimento. Ma quando inizio uno scontro, lo finisco anche.
	};
	// ------ AIVAR resetten ------
	self.aivar[AIV_LastFightComment] = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info PRISONER
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PRISONER		(C_INFO)
{
	npc		     = 	VLK_4100_Brutus;
	nr		     = 	2;
	condition	 = 	DIA_Brutus_PRISONER_Condition;
	information	 = 	DIA_Brutus_PRISONER_Info;
	description	 = 	"Qual è il tuo compito?";
};

func int DIA_Brutus_PRISONER_Condition ()
{	
	if (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_PRISONER_Info ()
{
	AI_Output (other, self, "DIA_Brutus_PRISONER_15_00"); //Qual è il tuo compito, qui?
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_01"); //Il mio lavoro? Sto allenando i ragazzi. Gli insegno come ottenere muscoli d'acciaio.
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_02"); //Mi prendo anche cura dei prigionieri. Sono come un dannato padre per quei bastardi.
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_03"); //Ma la mia vera arte è farli parlare. E credimi, ho metodi per far parlare chiunque.
	AI_Output (other, self, "DIA_Brutus_PRISONER_15_04"); //Sembra terribile...
	AI_Output (self, other, "DIA_Brutus_PRISONER_06_05"); //Ma quelle pulciose zucche vuote che abbiamo incarcerato adesso non hanno comunque molto da dire.
	
	if (MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Brutus_PRISONER_06_06"); //E non mi permetteranno di occuparmi di quel Gorn.
		
		KnowsAboutGorn = TRUE; 
	};
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PERM		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 =  90;
	condition	 = 	DIA_Brutus_PERM_Condition;
	information	 = 	DIA_Brutus_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Qualche novità?";
};

func int DIA_Brutus_PERM_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_PRISONER) 
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_PERM_Info ()
{
	AI_Output (other, self, "DIA_Brutus_PERM_15_00"); //Novità?
	AI_Output (self, other, "DIA_Brutus_PERM_06_01"); //Sembra tutto tranquillo. Nessun nuovo prigioniero, nessuno che abbia bisogno di aiuto per trovare le parole giuste... peccato.
	B_NpcClearObsessionByDMT (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Kasse
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Kasse		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	2;
	condition	 = 	DIA_Brutus_Kasse_Condition;
	information	 = 	DIA_Brutus_Kasse_Info;
	permanent	 = 	FALSE;
	description	 = 	"Vorresti addestrarmi?";
};

func int DIA_Brutus_Kasse_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_PRISONER) 
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_Kasse_Info ()
{
	AI_Output (other, self, "DIA_Brutus_Kasse_15_00"); //Vorresti addestrarmi?
	AI_Output (self, other, "DIA_Brutus_Kasse_06_01"); //Certo che posso aiutarti a diventare forte, ma non faccio niente per niente.
	AI_Output (other, self, "DIA_Brutus_Kasse_15_02"); //Quanto vuoi?
	AI_Output (self, other, "DIA_Brutus_Kasse_06_03"); //Mmmh... tu esci spesso fuori dal castello, vero? Ecco cosa suggerisco.
	AI_Output (self, other, "DIA_Brutus_Kasse_06_04"); //Il mio assistente, Den, se l'è svignata durante l'ultimo attacco. Che perdente.
	AI_Output (self, other, "DIA_Brutus_Kasse_06_05"); //Ma non è scappato a mani vuote. Ha preso con sé il contenuto del nostro forziere dell'oro.
	AI_Output (other, self, "DIA_Brutus_Kasse_15_06"); //Che forziere dell'oro?
	AI_Output (self, other, "DIA_Brutus_Kasse_06_07"); //Abbiamo un forziere qui dove teniamo la roba che... ehm... accumuliamo nel corso del tempo.
	AI_Output (self, other, "DIA_Brutus_Kasse_06_08"); //Ed era una bella somma. Il forziere conteneva 200 pezzi d'oro, più qualche gioiello prezioso.
	AI_Output (self, other, "DIA_Brutus_Kasse_06_09"); //Se mi riporti l'oro, potrai tenerti i gioielli e io sarò disposto ad allenarti.
	
	Log_CreateTopic (TopicBrutusKasse,LOG_MISSION);
	Log_SetTopicStatus (TopicBrutusKasse,LOG_RUNNING);
	B_LogEntry (TopicBrutusKasse,"Den, il socio di Brutus, è scappato con 200 pezzi d'oro e di gioielleria. Se gli porto 200 pezzi d'oro mi aiuterà a potenziare la mia forza.");
};
///////////////////////////////////////////////////////////////////////
//	Info Wo ist Den?
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Den		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	2;
	condition	 = 	DIA_Brutus_Den_Condition;
	information	 = 	DIA_Brutus_Den_Info;
	permanent	 = 	FALSE;
	description	 = 	"Sai dove si è diretto Den?";
};

func int DIA_Brutus_Den_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_Kasse) 
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_Den_Info ()
{
	AI_Output (other, self, "DIA_Brutus_Den_15_00"); //Sai dove si è diretto Den?
	AI_Output (self, other, "DIA_Brutus_Den_06_01"); //Il più lontano possibile. Penso possa aver provato ad attraversare il passo.
	AI_Output (other, self, "DIA_Brutus_Den_15_02"); //Grazie, questo mi è di grande aiuto.
	AI_Output (self, other, "DIA_Brutus_Den_06_03"); //Beh, cosa posso dirti? Non ho idea di dove sia andato.
	
	B_LogEntry (TopicBrutusKasse,"Den intendeva provare ad attraversare il passo.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Gold		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	2;
	condition	 = 	DIA_Brutus_Gold_Condition;
	information	 = 	DIA_Brutus_Gold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ho qualcosa per te (consegna 200 monete d’oro)";
};

func int DIA_Brutus_Gold_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Brutus_Kasse) 
	&& (NpcObsessedByDMT_Brutus == FALSE)
	&& (Brutus_TeachSTR == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Brutus_Gold_Info ()
{
	AI_Output (other, self, "DIA_Brutus_Gold_15_00"); //Ho qualcosa per te.
	
	if B_GiveInvItems (other,self,Itmi_Gold,200)
	{
		AI_Output (self, other, "DIA_Brutus_Gold_06_01"); //Eccellente. Posso allenarti se vuoi.
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
		B_LogEntry		(TOPIC_Teacher_OC, "Brutus può aiutarmi a migliorare la forza.");
		B_GivePlayerXP  (XP_Ambient);
	}
	else 
	{
		AI_Output (self, other, "DIA_Brutus_Gold_06_02"); //Ascolta, portami 200 pezzi d'oro. Non mi interessa dove li prendi, fintanto che avrai l'oro.
	};
};
//*******************************************
//	TechPlayer
//*******************************************
INSTANCE DIA_Brutus_Teach(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 7;
	condition	= DIA_Brutus_Teach_Condition;
	information	= DIA_Brutus_Teach_Info;
	permanent	= TRUE;
	description = "Voglio diventare più forte.";
};                       

FUNC INT DIA_Brutus_Teach_Condition()
{
	if (Brutus_TeachSTR == TRUE)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Brutus_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Brutus_Teach_15_00"); //Voglio diventare più forte.

	Info_ClearChoices (DIA_Brutus_Teach);
	Info_AddChoice		(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Brutus_Teach_STR_1);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Brutus_Teach_STR_5);
};

FUNC VOID DIA_Brutus_Teach_Back ()
{
	Info_ClearChoices (DIA_Brutus_Teach);
};

FUNC VOID DIA_Brutus_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices 	(DIA_Brutus_Teach);
	Info_AddChoice		(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Brutus_Teach_STR_1);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Brutus_Teach_STR_5);
};

FUNC VOID DIA_Brutus_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	
	Info_ClearChoices 	(DIA_Brutus_Teach);
	Info_AddChoice		(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Brutus_Teach_STR_1);
	Info_AddChoice		(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Brutus_Teach_STR_5);
	
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Brutus_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 999;
	condition	= DIA_Brutus_KAP3_EXIT_Condition;
	information	= DIA_Brutus_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brutus_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brutus_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info DuSchonWieder
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_DUSCHONWIEDER		(C_INFO)
{
	npc			 = 	VLK_4100_Brutus;
	nr			 = 	30;
	condition	 = 	DIA_Brutus_DUSCHONWIEDER_Condition;
	information	 = 	DIA_Brutus_DUSCHONWIEDER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Torturato qualcuno, oggi?";
};

func int DIA_Brutus_DUSCHONWIEDER_Condition ()
{
	if (Kapitel == 3)	
		&& (NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info ()
{
	AI_Output (other, self, "DIA_Brutus_DUSCHONWIEDER_15_00"); //Torturato qualcuno, oggi?
	AI_Output (self, other, "DIA_Brutus_DUSCHONWIEDER_06_01"); //Non vedi che sono impegnato? Torna più tardi.

	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Brutus_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 999;
	condition	= DIA_Brutus_KAP4_EXIT_Condition;
	information	= DIA_Brutus_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brutus_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brutus_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Warumnichtarbbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_WARUMNICHTARBBEIT		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	40;
	condition	 = 	DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information	 = 	DIA_Brutus_WARUMNICHTARBBEIT_Info;

	description	 = 	"Perché non sei al lavoro?";
};

func int DIA_Brutus_WARUMNICHTARBBEIT_Condition ()
{
	if (Kapitel >= 4)
		&& (NpcObsessedByDMT_Brutus == FALSE)
		&& (MIS_OCGateOpen == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Brutus_WARUMNICHTARBBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Brutus_WARUMNICHTARBBEIT_15_00"); //Perché non sei al lavoro?
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_01"); //(turbato) Ma questo è disgustoso!
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_02"); //Hai dato un'occhiata alla mia camera? Quei maledetti scarabei sono dappertutto.
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_03"); //Non so chi ci dormisse prima, ma non tornerò di certo in quel porcile.
	AI_Output			(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_04"); //Odio quelle bestie. E smettila di sogghignare come un idiota.

	Log_CreateTopic (TOPIC_BrutusMeatbugs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs, LOG_RUNNING);
	B_LogEntry (TOPIC_BrutusMeatbugs,"Brutus, l'inquisitore del castello, dice che gli innocui scarabei nella camera delle torture lo spaventano. È un osso duro."); 

};


///////////////////////////////////////////////////////////////////////
//	Info Meatbugsweg
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_MEATBUGSWEG		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	31;
	condition	 = 	DIA_Brutus_MEATBUGSWEG_Condition;
	information	 = 	DIA_Brutus_MEATBUGSWEG_Info;
	
	description	 = 	"Gli scarabei se ne sono andati.";
};

func int DIA_Brutus_MEATBUGSWEG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brutus_WARUMNICHTARBBEIT))
		&& (Npc_IsDead(Meatbug_Brutus1))
		&& (Npc_IsDead(Meatbug_Brutus2))
		&& (Npc_IsDead(Meatbug_Brutus3))
		&& (Npc_IsDead(Meatbug_Brutus4))
		&& (Kapitel >= 4)
		&& (NpcObsessedByDMT_Brutus == FALSE)
		&& (MIS_OCGateOpen == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Brutus_MEATBUGSWEG_Info ()
{
	AI_Output			(other, self, "DIA_Brutus_MEATBUGSWEG_15_00"); //Gli scarabei non ci sono più. Puoi tornare a lucidare i tuoi serrapollici, o quello che è.
	AI_Output			(self, other, "DIA_Brutus_MEATBUGSWEG_06_01"); //Sei veramente sicuro che non sia rimasto nessuno di quei mostri?
	AI_Output			(other, self, "DIA_Brutus_MEATBUGSWEG_15_02"); //Assolutamente sicuro.
	AI_Output			(self, other, "DIA_Brutus_MEATBUGSWEG_06_03"); //D'accordo, allora. Tieni, prendi quest'oro come segno della mia gratitudine.
	AI_Output			(other, self, "DIA_Brutus_MEATBUGSWEG_15_04"); //Oh, non farmi piangere.

	TOPIC_END_BrutusMeatbugs = TRUE;
	
	B_GivePlayerXP (XP_BrutusMeatbugs);
	B_NpcClearObsessionByDMT (self);

	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					

	Npc_ExchangeRoutine	(self,"Start");  
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PERM4		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	32;
	condition	 = 	DIA_Brutus_PERM4_Condition;
	information	 = 	DIA_Brutus_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Sei impazzito?";
};

func int DIA_Brutus_PERM4_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Brutus_MEATBUGSWEG))
	 	||(MIS_OCGateOpen == TRUE))
	 	&& (NpcObsessedByDMT_Brutus == FALSE)
	 {
				return TRUE;
	 };
};

func void DIA_Brutus_PERM4_Info ()
{

	if 	(
			(MIS_OCGateOpen == TRUE) 
			|| ((hero.guild == GIL_KDF)&& (Kapitel >= 5))
		)
		{						
			B_NpcObsessedByDMT (self);
		}
		else 
 		{
			AI_Output			(other, self, "DIA_Brutus_PERM4_15_00"); //Tutto bene?
			AI_Output			(self, other, "DIA_Brutus_PERM4_06_01"); //(apprensivo) E tu sei sicuro che quegli scarabei se ne siano andati?
			AI_Output			(other, self, "DIA_Brutus_PERM4_15_02"); //Ahem... guarda, ce n'è uno proprio dietro di te.
			AI_Output			(self, other, "DIA_Brutus_PERM4_06_03"); //(grida) Dove?
		
			B_NpcClearObsessionByDMT (self);
			
			
			Npc_SetTarget 		(self, other);
			
			self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (böse) Flag nicht zurückgesetzt wird 
			other.aivar[AIV_INVINCIBLE] = FALSE;
			
			AI_StartState 		(self, ZS_Flee, 0, "");
		 };		
};	

///////////////////////////////////////////////////////////////////////
//	Info bessen
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_BESSEN		(C_INFO)
{
	npc		 = 	VLK_4100_Brutus;
	nr		 = 	55;
	condition	 = 	DIA_Brutus_BESSEN_Condition;
	information	 = 	DIA_Brutus_BESSEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Sei posseduto!";
};

func int DIA_Brutus_BESSEN_Condition ()
{
 	if (NpcObsessedByDMT_Brutus == TRUE)
 		&& (NpcObsessedByDMT == FALSE)
	 {
				return TRUE;
	 };
};

func void DIA_Brutus_BESSEN_Info ()
{
	AI_Output			(other, self, "DIA_Brutus_BESSEN_15_00"); //Sei posseduto!

	if (hero.guild == GIL_KDF)
		||(hero.guild == GIL_PAL)
	{
	AI_Output			(other, self, "DIA_Brutus_BESSEN_15_01"); //Vai al monastero e fatti curare.
	AI_Output			(self, other, "DIA_Brutus_BESSEN_06_02"); //Non posso essere curato ormai. Vai via!
	B_NpcClearObsessionByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Brutus_BESSEN_15_03"); //Qualcuno deve scacciare quei demoni dalla tua testa.
	AI_Output			(self, other, "DIA_Brutus_BESSEN_06_04"); //(grida) NO!
	B_NpcClearObsessionByDMT (self);
		
	Npc_SetTarget 		(self, other);
	
	self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (böse) Flag nicht zurückgesetzt wird 
	other.aivar[AIV_INVINCIBLE] = FALSE;
			
	AI_StartState 		(self, ZS_Flee, 0, "");	
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5 und 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Brutus_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 999;
	condition	= DIA_Brutus_KAP5_EXIT_Condition;
	information	= DIA_Brutus_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brutus_KAP5_EXIT_Condition()
{
	if (Kapitel >= 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brutus_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brutus_PICKPOCKET (C_INFO)
{
	npc			= VLK_4100_Brutus;
	nr			= 900;
	condition	= DIA_Brutus_PICKPOCKET_Condition;
	information	= DIA_Brutus_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Brutus_PICKPOCKET_Condition()
{
	C_Beklauen (14, 35);
};
 
FUNC VOID DIA_Brutus_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brutus_PICKPOCKET);
	Info_AddChoice		(DIA_Brutus_PICKPOCKET, DIALOG_BACK 		,DIA_Brutus_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brutus_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brutus_PICKPOCKET_DoIt);
};

func void DIA_Brutus_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brutus_PICKPOCKET);
};
	
func void DIA_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brutus_PICKPOCKET);
};






































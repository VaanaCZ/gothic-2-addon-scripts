///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"Sei Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Tu sei Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Come fai a sapere il mio nome?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Il giudice ti sta cercando. Sei evaso dalla sua prigione.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Cos'hai fatto? Hai rubato la sua borsa?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Non la sua, quella del governatore. E per giunta l'ho fatto per lui.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Dopo che abbiamo attaccato il governatore, egli non voleva dividere il bottino con noi e ci ha fatti arrestare.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //Dato che non volevamo pendere dalla forca, siamo fuggiti.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //Credevamo che in questo modo non ci avrebbero mai trovati, e invece pare che ci siamo sbagliati.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Smettila di frignare ed estrai la tua arma.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Cosa possiamo fare contro il giudice?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Il giudice mi ha ordinato di ucciderti.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"Ho trovato Morgahard, il capo dei fuggitivi."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //Il giudice mi ha ordinato di ucciderti.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Sì, certo. Sei qui per questo, non è così?

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Cosa possiamo fare contro il giudice?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Assolutamente niente. Egli se ne sta seduto nella parte alta della città, intoccabile come un ragno sulla sua ragnatela.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Io non direi così. Abbiamo solo bisogno di prove della sua colpevolezza nella faccenda del governatore.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Hai detto prove? Le ho. Ma chi crederebbe a un criminale?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Dammi la tua parola e farò in modo che nessuno ti dia più la caccia.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Ne sei sicuro? Va bene. Tieni, prendi questa lettera. Porta la firma del giudice.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Anche se non estinguerà la mia colpa, dovrebbe essere sufficiente a confermare che egli era nostro complice.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard mi ha consegnato l'incarico del giudice. Questo pezzo di carta prova senza alcun dubbio che il giudice ha derubato il Governatore Larius. Penso che questo sia proprio il tipo di prova che Lee voleva che trovassi."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Smettila di frignare ed estrai la tua arma. Metteremo fine a questa cosa adesso.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Per me va bene, tanto non ho più niente da perdere. Quel maiale di un giudice!
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Lo vedrò pendere dalla forca un giorno.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Perché non sparisci e basta?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};



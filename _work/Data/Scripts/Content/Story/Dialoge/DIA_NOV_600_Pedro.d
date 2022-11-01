///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Benvenuto al monastero di Innos, straniero.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Sono fratello Pedro, umile servitore di Innos e guardiano del cancello per il sacro monastero.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Cosa desideri?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "Ecco, prendi una salsiccia, Fratello!";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Ecco, prendi una salsiccia, Fratello!
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //È bello da parte tua interessarti a me. Di solito tutti si dimenticano di me.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Potresti darmi un'altra salsiccia?
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //Scordatelo, non me ne rimarrebbero abbastanza.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //Ehi, si tratta di una sola salsiccia, nessuno se ne accorgerà. Ti ricompenserò per questo. Conosco un posto dove crescono alcune ortiche del fuoco.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Se le porti a Neoras, egli ti darà certamente la chiave per la biblioteca. Che ne dici?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"D'accordo, prendi un’altra salsiccia.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"No, non contarci.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Ok, prendi un’altra salsiccia.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //D'accordo. Ci sono alcune ortiche del fuoco che crescono sulla parte sinistra e destra dall'altro capo del ponte.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //No, non contarci.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Vuoi entrare nelle simpatie di Gorax, eh? È sempre la stessa storia con tutti i novizi...
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"Voglio entrare nel monastero.";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Voglio entrare nel monastero.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Solo i servi di Innos possono accedere al monastero.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Se vuoi pregare Innos trova uno dei santuari lungo la strada. Lì troverai tutta la tranquillità che ti serve per pregare.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"Cosa devo fare per essere accettato nel monastero?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Cosa devo fare per essere accettato nel monastero?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Non puoi essere ammesso nel monastero. Hai già scelto la tua strada.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Se vuoi essere accettato nella Confraternita di Innos, devi imparare e rispettare le regole del monastero.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //Inoltre, ciascun novizio deve presentare un'offerta a Innos.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Una pecora e 1000 monete d’oro.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //È parecchio oro.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //È il segno che stai iniziando una nuova vita come servo di Innos. Una volta che verrai accettato, ti verranno perdonati tutti i tuoi peccati precedenti.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //E ricordati che una volta presa la decisione di diventare un servo di Innos, non puoi tornare indietro.
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Per diventare un novizio al monastero di Innos ho bisogno di una pecora e di una grossa somma d'oro.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ho questa statuetta…";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //Ho qui una statuetta che penso appartenga al monastero.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Posso entrare adesso?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //Considerata l'eccezionalità di questa circostanza, puoi diventare un novizio, se vuoi.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Pedro, il novizio, mi ha fatto entrare nel monastero perché avevo la statuetta perduta. Dovevo consegnarla a qualcuno nel monastero."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Temo che non potrai entrare, neppure con questa preziosa gemma.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Hai già scelto un percorso diverso. La via del monastero ti è preclusa.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"Posso affidarti la statuetta?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //Posso affidarti la statuetta?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Naturalmente, me ne occuperò io. Grazie per la tua cortesia disinteressata.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"Quali sono le vostre regole di condotta?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Quali sono le vostre regole di condotta?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos è il dio della verità e della legge, dunque noi non mentiamo MAI né commettiamo crimini.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Nel caso dovessi trasgredire contro un fratello del monastero o rubare una nostra proprietà, pagherai una penale.
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos è anche il dio dell'autorità e del fuoco.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //Come novizio devi dimostrare OBBEDIENZA e RISPETTO a tutti i maghi del fuoco.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Capisco.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //Inoltre, è COMPITO di un novizio svolgere tutti i lavori all'interno del monastero per il bene della comunità.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Se sei disposto a seguire queste regole e hai un'offerta da fare a Innos, siamo disposti ad accettarti nel nostro monastero come novizio.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Voglio diventare un novizio.";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Ci penserò su ancora un po’.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Sì, voglio dedicare la mia vita a servire Innos.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Voglio diventare un novizio.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Hai già scelto la tua strada. La via della magia ti è preclusa.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //È davvero ciò che desideri? Sappi che non potrai più tornare indietro, una volta fatta la tua scelta.
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Vedo che hai con te l'offerta richiesta. Se lo desideri veramente, ora sei libero di diventare un novizio.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Tuttavia, una volta presa questa decisione non c'è modo di tornare indietro, rifletti bene dunque se è davvero questo il cammino che vuoi seguire!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Non hai portato con te l'offerta richiesta.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Sì, voglio dedicare la mia vita a servire Innos.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //Allora sei il benvenuto, fratello. Ti do la chiave del cancello del monastero.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //A dimostrazione che si tratta di una tua libera scelta, spetta a te aprire il cancello ed entrare.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Ora sei un novizio. Indossa questa veste come segno di appartenenza a questa confraternita.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //Una volta all'interno del monastero, vai da Parlan. Da ora in poi si occuperà lui di tutte le tue necessità.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //I miei peccati saranno perdonati ora?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Non ancora. Parla con padre Parlan. Egli ti benedirà e laverà via i tuoi peccati.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Ci penserò su ancora un po’.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Torna di nuovo quando sarai pronto.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Parlami ancora della vita nel monastero.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Parlami ancora della vita nel monastero.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Noi novizi viviamo e lavoriamo nel monastero per servire Innos, e studiamo i testi sacri quando ne abbiamo l'occasione.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //I maghi ci controllano e studiano le arti della magia.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
















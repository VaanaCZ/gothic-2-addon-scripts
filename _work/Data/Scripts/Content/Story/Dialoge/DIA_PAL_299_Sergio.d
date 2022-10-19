///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sergio_EXIT   (C_INFO)
{
	npc         = PAL_299_Sergio;
	nr          = 999;
	condition   = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Sergio_EXIT_Info()
{
	if (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)  // Nur wenn Sergio in der Kapelle ist M.F.  
	{
		AI_Output (self, other,"DIA_Sergio_EXIT_04_00");//Possa Innos illuminare il tuo cammino.
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WELCOME		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr 			 =  5;
	condition	 = 	DIA_Sergio_WELCOME_Condition;
	information	 = 	DIA_Sergio_WELCOME_Info;
	important	 = 	TRUE;
};

func int DIA_Sergio_WELCOME_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Sergio_Isgaroth) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Sergio_WELCOME_04_00"); //Innos sia con te. Cosa posso fare per te?
};
///////////////////////////////////////////////////////////////////////
//	Info Isgaroth
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Isgaroth		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Isgaroth_Condition;
	information	 = 	DIA_Sergio_Isgaroth_Info;
	permanent	 =  FALSE;
	important	 =  TRUE;
};
func int DIA_Sergio_Isgaroth_Condition ()
{	
	if Npc_KnowsInfo (hero,PC_PrayShrine_Paladine)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (Kapitel == 1)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Isgaroth_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Isgaroth_04_00"); //Hai pregato per i miei fratelli. Voglio ringraziarti per questo. Dimmi cosa posso fare per te.
	
	Info_ClearChoices (DIA_Sergio_Isgaroth);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Che ne dici di una piccola donazione?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice 	  (DIA_Sergio_Isgaroth,"Voglio condividere la tua esperienza di combattimento.",DIA_Sergio_Isgaroth_XP);
};	
FUNC VOID DIA_Sergio_Isgaroth_Spende()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_Spende_15_00"); //Che ne dici di una piccola donazione?
	AI_Output (self, other, "DIA_Sergio_Isgaroth_Spende_04_01"); //Possa questo oro esserti d'aiuto.
	
	B_GiveInvItems (self,other, ItMi_Gold,100);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};
FUNC VOID DIA_Sergio_Isgaroth_XP()
{
	AI_Output (other, self, "DIA_Sergio_Isgaroth_XP_15_00"); //Voglio condividere la tua esperienza di combattimento.
	AI_Output (self, other, "DIA_Sergio_Isgaroth_XP_04_01"); //Quando combatti assicurati sempre che nessuno ti attacchi alle spalle.
	
	other.HitChance[NPC_TALENT_2H] = (other.HitChance[NPC_TALENT_2H] + 2);
	PrintScreen	(PRINT_Learn2H, -1, -1, FONT_ScreenSmall, 2);
	Info_ClearChoices (DIA_Sergio_Isgaroth);
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Aufgabe		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Aufgabe_Condition;
	information	 = 	DIA_Sergio_Aufgabe_Info;
	description	 = 	"Ho bisogno di accedere alla biblioteca.";
};
func int DIA_Sergio_Aufgabe_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other,DIA_Sergio_Isgaroth))
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Aufgabe_15_00"); //Ho bisogno di accedere alla biblioteca.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_01"); //Beh, non posso garantirti l'accesso. Per quello devi prima svolgere i tuoi incarichi.
	AI_Output (self, other, "DIA_Sergio_Aufgabe_04_02"); //Ma posso aiutarti. Vai da Maestro Isgaroth e parla con lui. Ho sentito dire che ha bisogno d'aiuto, e ci andrei io, ma ti passerò questo incarico.
	
	Sergio_Sends = TRUE;
	Wld_InsertNpc (BlackWolf,"NW_PATH_TO_MONASTER_AREA_01"); //ist richtig geschrieben! 
	
	Log_CreateTopic (Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus	 (Topic_IsgarothWolf,LOG_RUNNING);
	B_LogEntry (Topic_IsgarothWolf,"Maestro Isgaroth ha bisogno di una mano al santuario. Dovrei andare a parlargli.");
};	

///////////////////////////////////////////////////////////////////////
//	Info WHAT
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHAT		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_WHAT_Condition;
	information	 = 	DIA_Sergio_WHAT_Info;
	description	 = 	"Cosa stai facendo, qui?";
};
func int DIA_Sergio_WHAT_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_WHAT_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHAT_15_00"); //Cosa stai facendo qui?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_01"); //Sto pregando Innos affinché fortifichi le mie braccia e la mia volontà.
	AI_Output (self, other, "DIA_Sergio_WHAT_04_02"); //Così sarò protetto da tutti i pericoli e potrò distruggere tutti i suoi nemici, aumentando il suo onore.
	AI_Output (other, self, "DIA_Sergio_WHAT_15_03"); //Quali nemici?
	AI_Output (self, other, "DIA_Sergio_WHAT_04_04"); //Tutti quelli che si oppongono al volere di Innos. Siano essi degli esseri umani o delle creature evocate.
};
///////////////////////////////////////////////////////////////////////
//	Info Babo
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Babo		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  3;
	condition	 = 	DIA_Sergio_Babo_Condition;
	information	 = 	DIA_Sergio_Babo_Info;
	description	 = 	"Te la senti di eseguire qualche esercizio con Babo?";
};
func int DIA_Sergio_Babo_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other, DIA_Babo_Anliegen)
	{	
		return TRUE;
	};
};
func void DIA_Sergio_Babo_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Babo_15_00"); //Te la senti di eseguire qualche esercizio con Babo?
	AI_Output (self, other, "DIA_Sergio_Babo_04_01"); //Perché non me lo chiede lui stesso?
	AI_Output (other, self, "DIA_Sergio_Babo_15_02"); //Penso sia troppo timido.
	AI_Output (self, other, "DIA_Sergio_Babo_04_03"); //Capisco. Beh, se è così importante per lui, mi allenerò con lui ogni giorno per due ore. Cominceremo alle 5, diglielo.
	
	Npc_ExchangeRoutine (self, "TRAIN");
	B_StartOtherRoutine (Babo,"TRAIN");

	B_LogEntry (Topic_BaboTrain, "Sergio ha accettato di allenarsi con Babo per due ore al giorno d'ora in poi."); 
};
///////////////////////////////////////////////////////////////////////
//	Info WHY
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHY		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  4;
	condition	 = 	DIA_Sergio_WHY_Condition;
	information	 = 	DIA_Sergio_WHY_Info;
	description	 = 	"Perché non sei insieme agli altri paladini?";
};
func int DIA_Sergio_WHY_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WELCOME)
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_WHY_Info ()
{
	AI_Output (other, self, "DIA_Sergio_WHY_15_00"); //Perché non sei insieme agli altri paladini?
	AI_Output (self, other, "DIA_Sergio_WHY_04_01"); //Potrebbe sembrarti strano che io sia qui, tuttavia i paladini servono anche i maghi, poiché essi predicano il volere di Innos.
	AI_Output (self, other, "DIA_Sergio_WHY_04_02"); //Noi paladini siamo guerrieri nel nome di Innos. Il suo volere è la nostra legge. Al momento sto aspettando nuovi ordini dai maghi.

};
///////////////////////////////////////////////////////////////////////
//	Info ORDERS
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_ORDERS		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_ORDERS_Condition;
	information	 = 	DIA_Sergio_ORDERS_Info;
	permanent	 =  TRUE;
	description	 = 	"E hai già ricevuto nuovi ordini?";
};
func int DIA_Sergio_ORDERS_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Sergio_WHY)
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE) 
	&&  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		return TRUE;
	};
};
func void DIA_Sergio_ORDERS_Info ()
{
	AI_Output (other, self, "DIA_Sergio_ORDERS_15_00"); //E hai già ricevuto nuovi ordini?
	AI_Output (self, other, "DIA_Sergio_ORDERS_04_01"); //Fino ad allora avrò il tempo di cercare nuova forza nella preghiera.
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Start
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Start		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Start_Condition;
	information	 = 	DIA_Sergio_Start_Info;
	permanent	 =  FALSE;
	description	 = 	"Devi scortarmi fino al passaggio.";
};
func int DIA_Sergio_Start_Condition ()
{	
	if  (Npc_GetDistToWP (self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	&&	(Sergio_Follow == TRUE)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Start_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Start_15_00"); //Devi scortarmi fino al passo.
	AI_Output (self, other, "DIA_Sergio_Start_04_01"); //Bene, lo farò. Conosco la strada, seguimi.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;  
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine (self,"GUIDE"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Guide		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  10;
	condition	 = 	DIA_Sergio_Guide_Condition;
	information	 = 	DIA_Sergio_Guide_Info;
	permanent	 =  TRUE;
	description	 = 	"Cosa succede?";
};
func int DIA_Sergio_Guide_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") > 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Guide_Info ()
{
	AI_Output (other, self, "DIA_Sergio_Guide_15_00"); //Come va?
	AI_Output (self, other, "DIA_Sergio_Guide_04_01"); //Ti condurrò al passo. Ma la parte pericolosa del viaggio inizia proprio lì.
	AI_Output (self, other, "DIA_Sergio_Guide_04_02"); //Ma non sprechiamo tempo. Dobbiamo andare avanti.
	
	AI_StopProcessInfos (self);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Guide Ende
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Ende		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Ende_Condition;
	information	 = 	DIA_Sergio_Ende_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Ende_Condition ()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE) 
	&& (Npc_GetDistToWP (self,"NW_TO_PASS_01") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Ende_Info ()
{
	AI_Output (self, other, "DIA_Sergio_Ende_04_00"); //Dobbiamo andare. Eccoci arrivati.
	AI_Output (other, self, "DIA_Sergio_Ende_15_01"); //Qualunque cosa ti attenda nella Valle delle Miniere, spero che riuscirai a tornare.
	AI_Output (self, other, "DIA_Sergio_Ende_04_02"); //Non temere, tornerò. Innos sia con te, possa proteggerti sempre.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE; 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START"); 
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Perm		(C_INFO)
{
	npc			 = 	PAL_299_Sergio;
	nr			 =  2;
	condition	 = 	DIA_Sergio_Perm_Condition;
	information	 = 	DIA_Sergio_Perm_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Sergio_Perm_Condition ()
{	
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Sergio_Perm_Info ()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_00"); //Per Innos, Fratello. Se sei venuto per imparare qualcosa sulla Consacrazione della Spada, allora chiedi a Marduk.
	}
	else
	{
		AI_Output (self, other, "DIA_Sergio_Perm_04_01"); //Ho sentito parlare di te, sei quel tizio delle fattorie che è stato nella Valle delle Miniere. I miei rispetti.
	};
	AI_StopProcessInfos (self);
	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sergio_PICKPOCKET (C_INFO)
{
	npc			= PAL_299_Sergio;
	nr			= 900;
	condition	= DIA_Sergio_PICKPOCKET_Condition;
	information	= DIA_Sergio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Sergio_PICKPOCKET_Condition()
{
	C_Beklauen (78, 85);
};
 
FUNC VOID DIA_Sergio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sergio_PICKPOCKET);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_BACK 		,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sergio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};
	
func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sergio_PICKPOCKET);
};




 










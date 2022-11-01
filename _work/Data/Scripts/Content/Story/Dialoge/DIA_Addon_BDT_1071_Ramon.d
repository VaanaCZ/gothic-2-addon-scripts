// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Ehi, che cos'è successo là sotto?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //Ho messo Franco al tappeto.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //E allora? Adesso tocca a TE far lavorare quei fannulloni tutti i giorni.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Ehi, non sono qui per farmi seccare dai cacciatori. Voglio entrare nel campo.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Scordatelo. Hai sconfitto Franco: ora sei tu il capo, quindi fai il tuo lavoro.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Se il capo sono io, allora decido io chi è il prossimo a entrare.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //E ho deciso che il prossimo sono IO.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(ride) Non è così facile. Non abbiamo bisogno di NESSUNO, quindi non entra NESSUNO.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus può mandare un nuovo capo dei cacciatori, e allora dentro mi mancherà una persona.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(ride) Non rinunci mai, vero? Va bene, muovi le chiappe e vieni dentro.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus farà in modo che i cacciatori non debbano vivere senza un capo.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //Cosa aspetti? E procurati un piccone.
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Ehi, che cosa vuoi? Non posso credere che tu abbia un permesso per il campo.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Mi ha mandato Franco: vuole sapere se al campo c'è bisogno di qualcuno.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Sì, abbiamo bisogno di qualcuno. Un altro ha tirato le cuoia ieri.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Quell'idiota se l'è presa con Esteban.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Chi è Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //Il capo del campo più basso. È lui che decide chi entra nella miniera.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Quindi di' a Franco che Thorus vuole un altro uomo. Chiaro?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus ha bisogno di un nuovo uomo per il campo. Franco sarà interessato.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? QUEL Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? Mai sentito nominare…",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Ehi, rallenta! Tu là dentro non ci vai, quindi sparisci!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus? QUEL Thorus?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Sì. QUEL Thorus. L'uomo che procura i nuovi arrivati.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //L'uomo che decide se e quando qualcuno può uscire dalla palude ed entrare nel campo.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //Non starai cercando di dirmi che lo conosci già?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //Beh… s
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Senti: TUTTI conoscono Thorus.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Ciò nonostante, tu non entri, e io NON gli darò alcun messaggio!
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus? Non ne ho mai sentito parlare
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Ma dai, non lo conosci? Era il capo delle guardie nel Vecchio campo.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //Di lui si fidano tutti.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //Procura gente nuova e decide se e quando uno nuovo entra nel campo.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Se vivi abbastanza a lungo, lo conoscerai.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Fai un altro passo e sarà l'ultimo!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Certa gente non impara mai
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "Sono io l'uomo nuovo.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //Sono io l'uomo nuovo.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Ehi, non cercare di prendermi in giro. È sempre Franco che decide chi di voi entra nel campo.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Mi ha mandato Franco…";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Mi ha mandato Franco
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //Non è vero. Quindi falla finita, altrimenti ti spacco le ossa
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "Tutto sotto controllo?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //Tutto sotto controllo?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Qui va tutto bene, se nessuno cerca di entrare quando NON dovrebbe.
	
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Come ti vanno le cose?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Che c'è? È stato Henry a mandarti?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Digli che avrà le sue tavole non appena avrò finito.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //Se non può aspettare, che se le tagli da solo.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "A cosa servono queste tavole?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //A cosa servono queste tavole?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //Per la palizzata, idiota!
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg pensava che sarebbe stata una buona idea fortificare il campo.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ma secondo me è tutta fatica sprecata.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Se i briganti hanno davvero intenzione di attaccarci, non sarà questa stupida palizzata a fermarli.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Non avremmo mai dovuto permettergli di restare nella nostra valle.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Se l'avessi saputo, me ne sarei rimasto a Khorinis.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "Ti aiuto a segare?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Ti aiuto a segare?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //No, posso farlo da solo.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Non è molto che mi sono arruolato, e se scaricassi il mio lavoro sugli altri non farei tanta strada.
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "Cosa stai facendo adesso?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Cosa stai facendo adesso?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Mi sto riposando.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(gongolante) Il mio lavoro ora lo fa Francis.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Che seghi legna finché gli casca il braccio!
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Sto cercando Angus e Hank.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Sto cercando Angus e Hank.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(sospira) Non ho idea di dove siano. Temo li abbiano presi i briganti.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Voi tre eravate amici, vero?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //So soltanto che dovevano incontrarsi con i briganti in una caverna non lontano da qui.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Dev'essere fuori dall'accampamento, verso est. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Ma non so di preciso dove. Non ci sono mai stato di persona.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Ti conviene chiedere ad Alligatore Jack. Lui è sempre in giro fuori dall'accampamento.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus e Hank avevano una caverna a est del campo. Alligatore Jack potrebbe saperne qualcosa di più.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "Ho trovato i tuoi amici.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Ho trovato i tuoi amici.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //E...? Dove sono?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Sono morti.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(con odio) Sono stati quei maledetti briganti!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //È possibile.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Spero che quei porci arrostiscano all'inferno.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(tra sé e sé, con odio) Se solo sapessi chi è il bastardo che ha fatto questo...
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Bill era stravolto quando gli ho parlato della morte di Angus e Hank. Vuole i nomi degli assassini.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "So chi ha ucciso Angus e Hank.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //So chi ha ucciso Angus e Hank.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(eccitato) Chi? Chi è stato?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Si chiama Juan ed è uno dei briganti.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Devi ammazzare quel bastardo, mi senti?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Non deve passarla liscia.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Dovrei uccidere Juan, per vendicare la morte di Angus e Hank.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan è spacciato.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan è spacciato.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(ansiosamente) E...? Ha sofferto?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Piantala, ragazzo!
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(sospira) Beh, l'importante è che quel porco sia morto.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan è spacciato. Bill era molto contento.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "Sei stato a Khorinis?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //Sei stato a Khorinis?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Sì. Sbarcavo il lunario borseggiando i passanti e organizzando qualche truffa.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ma arrivavano sempre meno navi, e i miei affari andavano a rotoli.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //A un certo punto mi sono stufato di rischiare la galera per un tozzo di pane.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //Allora mi sono unito a Greg. Ora sono bloccato qui.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(sospira) Tutto il giorno a segare tavole per una palizzata inutile.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "Puoi insegnarmi qualcosa?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Puoi insegnarmi qualcosa?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //Beh, potrei mostrarti come si borseggia.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ma devi essere agile, altrimenti è meglio che lasci perdere.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Mostrami come si fa a borseggiare. (10 PA)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Insegnami a borseggiare.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Per prima cosa devi fare in modo che la tua vittima si senta al sicuro.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Io attaccavo bottone - è una tecnica che funziona a meraviglia.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //A quel punto puoi tentare il colpo, ma bada che non se ne accorgano.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Qualcos'altro?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Sì, continua a coltivare la tua destrezza. Più sei agile, più opportunità noterai.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //E più in fretta riuscirai ad alleggerire la tua vittima senza farti BECCARE!
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //Questo è tutto - in teoria, almeno.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Scordatelo! Non sei abbastanza agile!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Dovrai diventare più agile, o trovarti un insegnante migliore.
	};
};


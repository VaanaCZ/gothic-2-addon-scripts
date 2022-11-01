///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Franco_EXIT   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 999;
	condition   = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_EXIT_Info()
{
	if (Franco_Exit == FALSE)
	&& (MIS_HlpLogan == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");//Non ti perdere o diventerai cibo per gli squali.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Franco_PICKPOCKET (C_INFO)
{
	npc			= BDT_1093_Addon_Franco;
	nr			= 900;
	condition	= DIA_Franco_PICKPOCKET_Condition;
	information	= DIA_Franco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Rubare il suo amuleto sarebbe molto rischioso)";
};                       

FUNC INT DIA_Franco_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)
	&& (Npc_HasItems (self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Franco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Franco_PICKPOCKET);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_BACK 		,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Franco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItAm_Addon_Franco, 1);
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Franco_PICKPOCKET);
		
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX]	= 196; //boah ey, ist ja ein super trick!
		self.attribute[ATR_HITPOINTS] 		= 196;
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
		
		
	};
};
	
func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Franco_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HI   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 1;
	condition   = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Franco_HI_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Franco_HI_Info()
{	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Se faccio un buon lavoro per Franco, mi farà entrare nel campo.");
	
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_00");//Ehi, cosa ci fai qui? Vuoi entrare nel campo.
	AI_Output (other,self,"DIA_Addon_Franco_HI_15_01");//Sì, sono...
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_02");//Non mi interessa sapere chi sei. Io sono Franco, qui sono il capo.
	AI_Output (self,other,"DIA_Addon_Franco_HI_08_03");//Allora, se qui fai un buon lavoro, ti prenderò nel campo.
	
	if (Ramon_News == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Franco_HI_08_04");//Ramon, il custode, ti dirà se hanno bisogno di gente nuova nel campo. Parlagli.
		B_LogEntry (Topic_Addon_Franco,"Dovrei chiedere a Ramon, il custode, se hanno bisogno di gente nuova nel campo.");
	};
};
//---------------------------------------------------------------------
//	Info Mission SumpfHai
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Hai   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 2;
	condition   = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent   = FALSE;
	description = "Thorus ha bisogno di un uomo nuovo.";
};
FUNC INT DIA_Addon_Franco_Hai_Condition()
{	
	if (Ramon_News == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Hai_Info()
{	
	
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_00");//Thorus ha bisogno di un uomo nuovo.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_01");//Bene. Me ne occuperò io.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_02");//Aspetta un momento, e io?
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_03");//Tu non hai fatto ancora niente.
	AI_Output (other,self,"DIA_Addon_Franco_Hai_15_04");//Ho fatto molto, invece, solo che TU non lo sai.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_05");//Va bene, vuoi una chance? Avrai la tua chance. Muovi le chiappe e vai da Logan. Gli squali di palude gli stanno alitando sul collo.
	AI_Output (self,other,"DIA_Addon_Franco_Hai_08_06");//Aiutalo a eliminare quelle bestie e ti ritroverai dritto dritto nel campo.
	
	B_LogEntry (Topic_Addon_Franco,"Franco vuole che aiuti Logan prima di mandarmi nel campo.");
};
//---------------------------------------------------------------------
//	Info Logan Wo?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Wo   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 3;
	condition   = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent   = FALSE;
	description = "Dove trovo Logan?";
};
FUNC INT DIA_Addon_Franco_Wo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	&& (!Npc_IsDead (Logan))
	&& (MIS_HlpLogan == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Wo_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Wo_15_00");//Dove trovo Logan?
	AI_Output (self,other,"DIA_Addon_Franco_Wo_08_01");//Piazzati davanti all'ingresso del campo e segui la parete di roccia a sinistra. È un po' più in là nella palude.
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Logan tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tot   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 5;
	condition   = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent   = FALSE;
	description = "Logan è morto.";
};
FUNC INT DIA_Addon_Franco_tot_Condition()
{	
	if (MIS_HlpLogan != LOG_SUCCESS)
	&&  Npc_IsDead (Logan)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tot_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tot_15_00");//Logan è morto.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_01");//Dannazione. Era il miglior cacciatore che abbiamo mai avuto là fuori. Che disdetta.
	AI_Output (self,other,"DIA_Addon_Franco_tot_08_02");//Ciò nonostante ho già inviato qualcun altro nel campo.
	
	if (MIS_HlpLogan == LOG_RUNNING)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};
//---------------------------------------------------------------------
//	Info Logan Success HAISUCCESS
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_HaiSuccess   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 6;
	condition   = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent   = FALSE;
	description = "Ho aiutato Logan…";
};
FUNC INT DIA_Addon_Franco_HaiSuccess_Condition()
{	
	if (MIS_HlpLogan == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Addon_Franco_Hai)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_HaiSuccess_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_00");//Ho aiutato Logan
	
	if Npc_IsDead (Logan)
	{
		AI_Output (other,self,"DIA_Addon_Franco_HaiSuccess_15_01");//... ma non è riuscito a sopravvivere.
	};
	AI_Output (self,other,"DIA_Addon_Franco_HaiSuccess_08_02");//Bene, e così hai combattuto contro gli squali di palude, almeno sei utile più di tanti altri, qui.
	B_GivePlayerXP (XP_Addon_HlpLogan);
	
	B_LogEntry (Topic_Addon_Franco,"A Franco non è bastato che aiutassi Logan per mandarmi nel campo.");
};

//---------------------------------------------------------------------
//	Mis 2 (Edgor)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Mis2 (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 7;
	condition   = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent   = FALSE;
	description = "Allora posso andare al campo, adesso?";
};
FUNC INT DIA_Addon_Franco_Mis2_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	|| (Npc_KnowsInfo (other, DIA_Addon_Franco_tot))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Mis2_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_MIS2_15_00");//Allora posso andare al campo, adesso?
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_01");//Senti, avrei bisogno di te per un'altra cosa.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_02");//Qualche giorno fa, ho mandato Edgor nella palude.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_03");//Avrebbe dovuto prendermi una vecchia tavoletta di pietra, ma da allora non si è più visto.
	AI_Output (self,other,"DIA_Addon_Franco_MIS2_08_04");//Cerca di scoprire che cosa sta facendo e portami quella maledetta tavoletta di pietra.
	
	MIS_HlpEdgor = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Stoneplate,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Stoneplate,"Franco vuole una tavoletta di pietra che Edgor avrebbe dovuto portargli. Ora dovrei occuparmene io.");
	
	B_LogEntry (Topic_Addon_Franco,"Franco vuole che aiuti Edgor prima di mandarmi nel campo.");
};

//---------------------------------------------------------------------
//	Info Logan While
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_While   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 8;
	condition   = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent   = FALSE;
	description = "Cosa mi dici dell'oro?";
};
FUNC INT DIA_Addon_Franco_While_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_HaiSuccess))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_While_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_While_15_00");//Cosa mi dici dell'oro?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_01");//Cosa?
	AI_Output (other,self,"DIA_Addon_Franco_While_15_02");//Il lavoro qui nelle paludi mi frutta qualcosa?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_03");//(molto cordiale) Vuoi dell'oro? Certo, quanto vuoi? Cinquanta pepite d'oro? Cento? Ti darò tutto l'oro che riesci a portare
	AI_Output (self,other,"DIA_Addon_Franco_While_08_04");//(ad alta voce) Chi ti credi di essere? Mi stai prendendo in giro?
	AI_Output (self,other,"DIA_Addon_Franco_While_08_05");//Ora fila a lavorare! Altrimenti non prenderai nemmeno una BRICIOLA D'ORO!!
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info WOEDGOR
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_WOEDGOR   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 9;
	condition   = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent   = TRUE;
	description = "Allora, DOVE posso trovare questo Edgor?";
};
FUNC INT DIA_Addon_Franco_WOEDGOR_Condition()
{	
	if (MIS_HlpEdgor == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Addon_Stone_04 ) < 1)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_WOEDGOR_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_15_00"); //(sospira) Allora, DOVE trovo questo Edgor?
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_08_01"); //Vuoi il modo più facile o quello più veloce?
	
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Prenderò la via più veloce." ,DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice (DIA_Addon_Franco_WOEDGOR, "Spiegami il modo più semplice." ,DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output (self,other,"DIA_Addon_Franco_There_08_00"); //Ci sono rovine dappertutto. È seduto lì, da qualche parte.
	AI_Output (self,other,"DIA_Addon_Franco_There_08_01"); //Suppongo sia stato abbastanza furbo da accendersi un fuoco. Dovresti riuscire a trovare QUELLO.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //Spiegami il modo più semplice.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //Segui il sentiero che porta al cancello principale. Lì dovrebbe esserci Sancho.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //Da lì vai a sinistra e segui la passerella
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output (other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //Prenderò la via più veloce.
	AI_Output (self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //D'accordo. Da qui procedi in diagonale verso sinistra dopo la passerella, nella palude.
	
	B_Addon_Franco_There();
	Info_ClearChoices (DIA_Addon_Franco_WOEDGOR);
};
//---------------------------------------------------------------------
//	Info tafel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_tafel   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 10;
	condition   = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent   = FALSE;
	description = "Ecco la tavoletta di pietra.";
};
FUNC INT DIA_Addon_Franco_tafel_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04 ) >= 1)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_tafel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_tafel_15_00");//Ecco la tavoletta di pietra.
	B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
	
	AI_Output (self,other,"DIA_Addon_Franco_tafel_08_01");//Bene, molto bene. Raven sarà contento di te.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HlpEdgor);
	
	B_LogEntry (Topic_Addon_Franco,"Ho portato a Franco la tavoletta di pietra che voleva.");
};

//---------------------------------------------------------------------
//	JemandAnderen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_JemandAnderen   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 11;
	condition   = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent   = FALSE;
	description = "Che mi dici del campo, adesso? Posso entrare, finalmente?";
};
FUNC INT DIA_Addon_Franco_JemandAnderen_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_tafel))
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_JemandAnderen_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_JemandAnderen_15_00");//Che mi dici del campo, adesso? Posso entrare, finalmente?
	
	if !Npc_IsDead (Logan)
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_01");//No, ho già fatto entrare Logan. Era davanti a te sulla lista.
		
		Logan_Inside = TRUE;
		AI_Teleport (Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine (Logan,"LAGER");
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_02");//No, ho già fatto entrare qualcun altro.
	};
	
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_03");//E al momento, non c'è bisogno di un altro uomo nel campo.
	AI_Output (self,other,"DIA_Addon_Franco_JemandAnderen_08_04");//Inoltre, ho proprio bisogno di te qui, (sogghigna) ora che Logan non c'è più.
		
	B_LogEntry (Topic_Addon_Franco,"Franco non mi manderà al campo. Penso che dovrei occuparmi del problema 'Franco'…");
};

//---------------------------------------------------------------------
//	Info Fight
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Fight   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 12;
	condition   = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent   = TRUE;
	description = "Fammi entrare SUBITO!";
};
FUNC INT DIA_Addon_Franco_Fight_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Franco_Fight_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Fight_15_00"); //Fammi entrare SUBITO!
	AI_Output (self,other,"DIA_Addon_Franco_Fight_08_01"); //(cordiale ma minaccioso) E se ti dico di no?
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Allora aspetterò ancora un po'…" ,DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice (DIA_Addon_Franco_Fight, "Te ne pentirai." ,DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Duel_15_00"); //Te ne pentirai.
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Duel_08_01"); //Mi stai minacciando? TU? Vuoi minacciare ME? È il momento di darti una lezione
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output (other,self,"DIA_Addon_Franco_Fight_Nothing_15_00"); //Allora aspetterò un pochino
	AI_Output (self,other,"DIA_Addon_Franco_Fight_Nothing_08_01"); //(beffardo) Risposta esatta.
	
	Info_ClearChoices (DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info Fight2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Franco_Pig   (C_INFO)
{
	npc         = BDT_1093_Addon_Franco;
	nr          = 13;
	condition   = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent   = TRUE;
	description = "Che maiale! Ti prenderò!";
};
FUNC INT DIA_Addon_Franco_Pig_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Franco_Pig_Info()
{	
	AI_Output (other,self,"DIA_Addon_Franco_Pig_15_00");//Che maiale! Ti prenderò!
	AI_Output (self,other,"DIA_Addon_Franco_Pig_08_01");//(teso) Sciagurato, miserabile, vuoi attaccare briga con ME? Aspetta e vedrai!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};





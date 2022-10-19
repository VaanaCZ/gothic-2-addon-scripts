//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_EXIT   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 999;
	condition   = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent   = TRUE;
	description = "Devo andare…";
};
FUNC INT DIA_Addon_Lennar_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_EXIT_Info()
{		
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lennar_PICKPOCKET (C_INFO)
{
	npc			= BDT_1096_Addon_Lennar;
	nr			= 900;
	condition	= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information	= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen (65, 100);
};
 
FUNC VOID DIA_Addon_Lennar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
	
func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hi   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 1;
	condition   = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent   = FALSE;
	description	= "Salve.";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Salve.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Salve, sono Lennar. Benvenuto nel campo degli scavatori.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Scavatori? Pensavo che questo fosse il campo dei briganti
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//Esatto, ma anche i briganti sono qui solo per scavare. (scrolla le spalle) Allora...
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Attentat   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 2;
	condition   = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent   = FALSE;
	description	= "A proposito del tentato omicidio di Esteban…";
};
FUNC INT DIA_Addon_Lennar_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(ingenuamente) Sì?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //Hai idea di chi fosse il mandante?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(entusiasta) Certo!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(agitato) Adesso te lo dico: scommetto che il mandante è Emilio!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(agitato) Corre sempre dentro alla miniera come un pazzo. Scava il più possibile.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(malizioso) Ma da quando c'è stato l'attacco, sta seduto sulla sua panchina, senza muoversi di un pelo.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(colpito da un'idea) È ovvio! Per entrare nella miniera, deve avere una pietra rossa da Esteban.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //(con fare cospirativo) Scommetto che non osa guardarlo negli occhi.

	B_LogEntry (Topic_Addon_Esteban, "Lennar sospetta Emilio perché non va più da Esteban.");
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Inspektor (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 3;
	condition   = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent   = FALSE;
	description	= "Che cosa otterrebbe Emilio dalla morte di Esteban?";
};
FUNC INT DIA_Addon_Lennar_Inspektor_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //Che cosa otterrebbe Emilio dalla morte di Esteban?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //Che ne so? Forse nella miniera ha un amico che in quel caso potrebbe prendere il posto di Esteban.
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(parla tra sé) Già, potrebbe essere
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Mine   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 4;
	condition   = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Lennar_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Hai davvero una pietra rossa per me.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Eccellente. Ora ridurrò in briciole quelle maledette rocce: so già esattamente dove andrò!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//Un'altra cosa: se vai a scavare, attento a non colpire troppo FORTE. Altrimenti il tuo piccone si conficcherà nell'oro!
	
	B_Upgrade_Hero_HackChance(10);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Gold   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 5;
	condition   = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent   = FALSE;
	description = "Puoi insegnarmi a estrarre l'oro?";
};
FUNC INT DIA_Addon_Lennar_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lennar_Hi)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //Puoi insegnarmi qualcosa sulle tecniche di estrazione dell'oro?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Certamente, ma se ti insegno qualcosa, riuscirai ad estrarre più oro.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //Te lo chiedo proprio per questo.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Certo. Ma se tu riesci ad estrarre più oro, sarebbe giusto che anch'io avessi la mia parte.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //Beh
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Potresti anche darmi la mia parte in anticipo. Diciamo
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //50 monete d’oro.
};

//---------------------------------------------------------------------
//	Train
//---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
INSTANCE DIA_Addon_Lennar_Train   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 6;
	condition   = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent   = TRUE;
	description = "Insegnami a estrarre l'oro! (50 monete d’oro)";
};
FUNC INT DIA_Addon_Lennar_Train_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Train_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Insegnami qualcosa sulle tecniche di estrazione dell'oro!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Bene. Colpi regolari ti faranno avanzare. Non esagerare, ma non lasciare che le oscillazioni ti facciano addormentare.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //E non continuare a colpire nello stesso punto: cerca di lavorare attorno a una pepita di buone dimensioni.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Se lo fai finirai per diventare un maestro scavatore.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Prima voglio la mia parte!
	};
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hacker   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 9;
	condition   = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent   = TRUE;
	Description = "Va tutto bene?"; 
};
FUNC INT DIA_Addon_Lennar_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Va tutto bene?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Colpi ben assestati e regolari: è così che si ottengono le pepite più grosse!
};



var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //È stato bello conoscerti
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "Come va?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Come va?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Vuoi sapere come va? Te lo dico io come va.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Prima di tutto dei pirati mi hanno portato qui in una notte di tempesta. Amico, ho vomitato di tutto su quel guscio di noce.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Poi Raven mi ha rinchiuso nella miniera perché degli idioti sono troppo avidi d'oro.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //E infine Franco è diventato il capo dei cacciatori e ha ucciso chiunque gli si opponesse.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Direi che va piuttosto male.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "Come ha fatto Franco a diventare il capo?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //Come ha fatto Franco a diventare il capo?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Molto semplice. Ha ucciso Fletcher, che era capo dei cacciatori prima di lui.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher era a posto. Franco non fa che farci saltare.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "Franco mi ha mandato a cercare questa tavoletta di pietra…";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franco mi ha mandato qui a cercare quella tavoletta di pietra… L'hai trovata?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Amico, non l'ho neanche cercata. Tutto quello che so è che dovrebbe trovarsi in questo vecchio edificio nel cuore della palude.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //E una vocina nella mia testa mi dice 'Edgor, stai lontano dai vecchi edifici nel cuore della palude.'
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Certamente non mi gioco l'osso del collo per quel fannullone di Franco!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor non andrà mai alla ricerca della tavoletta di pietra. Dice che è da qualche parte in un vecchio edificio nella palude.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "Dov'è esattamente questo vecchio edificio?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Dov'è esattamente questo vecchio edificio?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Gira a sinistra dopo questa grande roccia. Dopo un po' arriverai a un'altra grande roccia.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Dopo dovrai andare a sinistra o a destra, non so nient'altro, è stato troppo tempo fa.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Ma le rovine dovrebbero trovarsi su una specie di rilievo. Quasi nascoste tra le piante.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Forse sarai fortunato e non la troverai
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "Ho trovato la tavoletta di pietra!";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//(contento) Ho trovato la tavoletta di pietra!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(annoiato) Davvero? Devi essere un tipo coraggioso.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(annoiato) Allora ti sarai certamente meritato il permesso di entrare nel campo. (sbadiglia)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "Puoi insegnarmi qualcosa?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Puoi insegnarmi qualcosa?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//So tante cose sulle sanguimosche. Odio quelle bestie schifose anche più di quanto odio Franco!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Ma so come strappare i pungiglioni e le ali dai loro cadaveri. (folle) Sì, strappaglieli
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Inoltre, so come estrarre la secrezione dal pungiglione.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Se vuoi ti posso insegnare queste schifezze.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Naturalmente, qui non si fa niente per niente...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor sa molte cose delle sanguimosche e dei loro trofei.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Procurami l'oro. Voglio solo monete, non pepite.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "A proposito di quelle sanguimosche…";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//A proposito delle sanguimosche
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Che cosa vuoi sapere?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Estrai pungiglioni di sanguimosca (costo: 5 PA, 100 monete d'oro)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Strappa ali di sanguimosca (costo: 5 PA, 100 monete d'oro)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Rimuovi secrezione dal pungiglione (costo: 1 PA, 100 monete d'oro)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Come faccio a prendere i pungiglioni alle sanguimosche?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Gira le bestie morte sulla pancia e pratica un taglio a croce. Afferra le interiora e taglia i tessuti fino alla schiena.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//A quel punto puoi strappare via il pungiglione.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Come faccio con le ali?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Afferra le ali con una mano. Con l'altra mano puoi tagliarle semplicemente via insieme allo strato superficiale di pelle.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Come faccio a estrarre la secrezione dalle sanguimosche?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Taglia lo strato esterno del pungiglione nel senso della lunghezza e la secrezione curativa scorrerà all'esterno.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//In questo modo, non si corrono rischi se si vuole aspirare un pungiglione o lo si vuole usare per qualche pozione.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		



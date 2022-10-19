//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_EXIT   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 999;
	condition   = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lucia_PICKPOCKET (C_INFO)
{
	npc			= BDT_1091_Addon_Lucia;
	nr			= 900;
	condition	= DIA_Addon_Lucia_PICKPOCKET_Condition;
	information	= DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80_Female;
};                       
FUNC INT DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	C_Beklauen (80, 100);
};
 
FUNC VOID DIA_Addon_Lucia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
	
func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Hi   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent   = FALSE;
	description = "Et ? Comment ça va ?";
};
FUNC INT DIA_Addon_Lucia_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Hi_15_00");//Et ? Comment ça va ?
	AI_Output (self, other, "DIA_Addon_Lucia_Hi_16_01");//Ecoutez. Si vous voulez quelque chose à manger, allez voir Snaf. Si vous voulez quelque chose à boire, vous tombez bien.
};
//---------------------------------------------------------------------
//	Info was
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_was   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent   = FALSE;
	description = "Que boit-on ici, alors ?";
};
FUNC INT DIA_Addon_Lucia_was_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_was_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_was_15_00");//Que boit-on ici, alors ?
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_01");//Nous n'avons pas beaucoup de bière. Le peu de bière que l'on trouve sur cette île a été apportée par les paladins.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_02");//C'est à peu près tout ce que ces types ont amené de bon...
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_03");//Et sinon, nous avons de l'alcool fort - de l'eau de vie, du tafia et du rhum blanc -
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_04");//(séduit) Hmmm... vous devriez goûter ça - je tiens cette recette de Samuel. Ce gars connaît vraiment son métier.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Je peux me procurer de l'alcool auprès de Lucia.");
};
//---------------------------------------------------------------------
//	Info Khorinis
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Khorinis   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent   = FALSE;
	description = "Vous ne venez pas de Khorinis ?";
};
FUNC INT DIA_Addon_Lucia_Khorinis_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Bromor_Lucia)
	|| (Nadja_GaveLuciaInfo == TRUE)
	|| Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Khorinis_15_00");//Vous ne venez pas de Khorinis ?
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_01");//Ne m'en parlez pas ! Je menais une vie atroce dans cette ville.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_02");//Tant que les navires transportant les nouveaux condamnés arrivaient dans le port, il y avait encore un semblant d'animation en ville.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_03");//Mais tous les autres types... (Rires) Très peu pour moi. Peut-être est-ce parce qu'on est sur une île... Quoi qu'il en soit, ces beaux jours sont terminés.

	if (MIS_LuciasLetter != 0)
	|| (SC_KnowsLuciaCaughtByBandits != 0)
	|| (Nadja_GaveLuciaInfo != 0)
	{
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_06"); //J'en ai plus qu'assez de cet Elvrich !
		AI_Output (other,self , "DIA_Addon_Lucia_Khorinis_15_04"); //Pourquoi ?
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_05"); //C'est un poltron ! Quand les bandits m'ont enlevée, il n'a pas levé le petit doigt pour m'aider !
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP (XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};
//---------------------------------------------------------------------
//	Info Jetzt
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Jetzt   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent   = FALSE;
	description = "Que comptez-vous faire maintenant ?";
};
FUNC INT DIA_Addon_Lucia_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Khorinis)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Jetzt_15_00");//Que comptez-vous faire ?
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_01");//Je ne sais pas. Pour l'heure, je vais rester ici avec Snaf, Fisk et les autres.
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_02");//Vous avez déjà parlé à Thorus ? (lève les yeux au ciel) Oh Innos, quelle montagne de muscles, cet homme !
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_03");//(rit) Excusez-moi... revenons à votre question. Je n'ai aucun objectif, pour l'heure - je me laisse simplement porter par le courant.
};
//---------------------------------------------------------------------
//	Info Paladine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Paladine   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent   = FALSE;
	description = "Vous n'appréciez guère les paladins, semble-t-il ?";
};
FUNC INT DIA_Addon_Lucia_Paladine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_15_00");//Vous n'appréciez guère les paladins, semble-t-il ?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_01");//Ces meurtriers fanatiques à la solde des Magiciens du feu ? Non...
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_02");//Ce seigneur Hagen occupe la ville avec sa horde de gros bras, et tout le monde lui fait des courbettes.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_03");//Seulement, je n'ai jamais accepté de m'abaisser à ça. Il n'était pas question que j'attende qu'ils ferment la Lanterne rouge et qu'ils m'enferment dans une geôle.
	
	if (Npc_GetTrueGuild (other) != GIL_SLD)
	&& (Npc_GetTrueGuild (other) != GIL_DJG)
	{
		Info_ClearChoices (DIA_Addon_Lucia_Paladine);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Clore la discussion.",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Les paladins combattent en son nom... mais Innos choisit ses guerriers.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Les paladins sont les combattants d'Innos. Ce ne sont pas des meurtriers.",DIA_Addon_Lucia_Paladine_MURDER);
		
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WAHL_15_00");//Les paladins ne combattent pas seulement en son nom. Innos choisit ses guerriers.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_01");//Et alors ? Personnellement, je crois que chacun se choisit lui-même.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_02");//Toujours est-il que vos paroles me laissent sans voix. Vous parlez comme si vous étiez l'un d'eux.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Avez-vous déjà tué un humain ?",DIA_Addon_Lucia_Paladine_KILL);
};
FUNC VOID DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_KILL_15_00");//Avez-vous déjà tué quelqu'un ?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_01");//Non, et je m'en félicite.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_02");//Allez, arrêtons un peu d'être aussi sérieux.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_03");//Au lieu de cela, buvons un coup et profitons de chaque instant que les dieux nous accordent.
	
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WEIB_15_00");//Ainsi, jeune fille, vous récusez Innos ?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_01");//Comment le pourrais-je ? Je ne récuse que les gens qui utilisent son nom à tort.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_02");//Mais jamais je n'ai douté de la splendeur divine d'Innos.
};
FUNC VOID DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_MURDER_15_00");//Les paladins sont les guerriers d'Innos. Ils ne sont pas des meurtriers.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_01");//Et alors ? Leurs armes sont aussi tachées de sang - tout comme celles des pirates ou des bandits.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_02");//La seule différence est qu'ils le font au nom d'Innos, et non par instinct de survie.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Ainsi, jeune fille, vous récusez Innos ?",DIA_Addon_Lucia_Paladine_WEIB);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Attentat   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 9;
	condition   = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Lucia_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Lucia_Attentat_16_00");//Rien du tout.
};
//---------------------------------------------------------------------
//	Info Trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Trade   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 99;
	condition   = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = "Donnez-moi quelque chose à boire.";
};
FUNC INT DIA_Addon_Lucia_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Trade_15_00");//Donnez-moi quelque chose à boire.
	B_GiveTradeInv(self);
};
//---------------------------------------------------------------------
//	Info lernen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_lernen   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 19;
	condition   = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent   = FALSE;
	description = "Pouvez-vous m'enseigner quelque chose ?";
};
FUNC INT DIA_Addon_Lucia_lernen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_lernen_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_lernen_15_00");//Pouvez-vous m'apprendre quelque chose ?
	AI_Output (self, other, "DIA_Addon_Lucia_lernen_16_01");//(rit) Avec plaisir. Je vous apprendrai à améliorer votre dextérité.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Lucia peut m'aider à améliorer ma dextérité.");	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lucia_TEACH		(C_INFO)
{
	npc		  	 = 	BDT_1091_Addon_Lucia;
	nr			 = 	101;
	condition	 = 	DIA_Addon_Lucia_TEACH_Condition;
	information	 = 	DIA_Addon_Lucia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux devenir plus agile.";
};
func int DIA_Addon_Lucia_TEACH_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_lernen)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lucia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lucia_TEACH_15_00"); //Je veux améliorer ma dextérité.
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
};
func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_TEACH);
};
func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};
func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};




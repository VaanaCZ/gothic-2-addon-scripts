//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Attendez un peu.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Il y a un problème ?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Des foreurs. Des tas et des tas de foreurs. Nous sommes tombés sur un nid, cette fois !
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Pourquoi n'attaquons-nous pas les foreurs ?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Pourquoi n'attaque-t-on pas les foreurs ?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//J'ai posé cette question, moi aussi. Mais apparemment, les gardes ont des 'choses plus importantes' à faire.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn m'a gracieusement laissé la responsabilité de résoudre ce problème.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Je suppose que vous ne comptez pas combattre les rampants.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//Pourquoi le ferais-je ? Pour qu'on puisse atteindre l'or au fond de la grotte ?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodywn s'en attribuera la plupart de toutes façons. Et il est hors de question que je prenne autant de risques pour le peu qu'il me laisserait.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//Si vous voulez éliminer les foreurs, faites comme chez vous ! Seulement, une chose - ne les attirez pas tous ici, compris ?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Pouvez-vous m'en dire davantage sur Bloodwyn ?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Pouvez-vous m'en dire davantage sur Bloodwyn ?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Oui. Cette crapule est assoiffée d'or. Il inspecte lui-même chaque nouveau filon et chaque pépite.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Il n'y a rien qu'il ne fera pas pour de l'or. Nous, en revanche, nous ne valons pas plus à ses yeux que le contenu de ses boyaux...
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//Et sinon ?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Il est convaincu d'être le meilleur, et ne supporte pas que quelqu'un soit mieux loti que lui. Mais bon - je ne me risquerais pas à me colleter avec lui.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Restez hors de son chemin et évitez de le provoquer - à moins que vous n'ayez envie de le voir entrer en furie et devenir complètement incontrôlable...
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn quittera certainement le temple lorsqu'il entendra dire qu'un nouveau filon a été découvert dans la mine.");
	B_LogEntry (Topic_Addon_Tempel,"Lorsque Bloodwyn est contrarié, il perd très vite son sang froid. Cela me sera certainement très utile."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "Les foreurs ne sont plus qu'un souvenir.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Cette fois, ça devrait être réglé. Les foreurs ont été anéantis.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn accourt en ce moment même. C'est ce que vous vouliez, non ?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Enfin, vous avez manifestement massacré les foreurs dans le but de faire venir Bloodwyn. Alors quoi que vous comptiez faire... faites-le maintenant !
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Vous avez donné une sacrée leçon à ce crétin ! Beau travail.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Dans ce cas, je vais aller faire un tour dans la grotte.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//Whaaa, bon sang ! Y'a un sacré paquet d'or, ici !
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//Pour atteindre les morceaux là-haut, il nous faudrait une échelle.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Mais depuis la chute de la Barrière, plus personne n'utilise d'échelles... c'est vraiment dommage...
};





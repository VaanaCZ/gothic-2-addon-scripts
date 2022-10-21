//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_EXIT   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 999;
	condition   = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent   = TRUE;
	description = "Je reviendrai plus tard...";
};
FUNC INT DIA_Addon_Logan_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Logan_EXIT_Info()
{		
	AI_Output (other,self,"DIA_Addon_Logan_EXIT_15_00");//Je reviendrai...
	
	if ((!MIS_HlpLogan == LOG_RUNNING)
	|| ( !MIS_HlpLogan == LOG_SUCCESS))
	&& (Logan_Inside == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Logan_EXIT_10_01");//(grogne) Ouaaais, allez donc faire un tour. Je resterai ici et j'arrêterai tous ceux qui essaieront de s'approcher trop près.
	};
	AI_StopProcessInfos (self);
};	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Logan_PICKPOCKET (C_INFO)
{
	npc			= BDT_1072_Addon_Logan;
	nr			= 900;
	condition	= DIA_Addon_Logan_PICKPOCKET_Condition;
	information	= DIA_Addon_Logan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Logan_PICKPOCKET_Condition()
{
	C_Beklauen (59, 50);
};
 
FUNC VOID DIA_Addon_Logan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Logan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Logan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Logan_PICKPOCKET);
};
	
func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Logan_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1072_Logan_Mine   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Logan_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	&& (Npc_GetDistToWP (self, "BL_INN_CORNER_02") <= 1000) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_1072_Logan_Mine_10_00");//Alors, vous l'avez fait, hein ? Bien. C'est aimable à vous de ne pas m'avoir planté ici.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};
//---------------------------------------------------------------------
//	Info INSIDE
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_How2   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent   = FALSE;
	description	= "Comment allez-vous ?";
};
FUNC INT DIA_Addon_Logan_How2_Condition()	
{
	if (Logan_Inside == TRUE)
	&& (Npc_GetDistToWP (self,"BL_INN_CORNER_02") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_How2_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_00"); //Tout va bien pour vous ?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_01"); //Mouais. Au moins, je suis rentré. Lucia brûle de sacrés liqueurs.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_02"); //Par contre, Esteban refuse de me laisser rentrer dans la mine. Tout au moins, pour l'instant. Il m'a affecté à autre chose.
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_03"); //Et ? Que vous demande-t-il ?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_04"); //Esteban a été victime d'une tentative de meurtre. Il veut savoir qui a monté le coup.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_05"); //(doucement) Esteban pense que Snaf est impliqué. Je suis censé le garder à l'œil...

};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Attentat   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 9;
	condition   = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Logan_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&& (Logan_Inside == TRUE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_00");//Vous recherchez celui qui a organisé tout ça, hein ?
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_01");//Mais je ne sais vraiment rien à ce propos, pour l'instant. Comment le saurais-je ? J'étais dans le marais lorsque c'est arrivé...
};
//---------------------------------------------------------------------
//	Info HI 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_HI   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Logan_HI_Condition()	
{
	if (Logan_Inside == FALSE)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_HI_Info()
{
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_00");//Tiens, un nouveau visage.
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_01");//Vous allez rester là les bras ballants, ou est-ce que vous comptez m'aider à un moment ou un autre ?
	
	if Npc_KnowsInfo (other, DIA_Addon_Franco_HI) 
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_02");//C'est Franco qui m'envoie. Il m'a dit que vous aviez besoin d'aide à l'intérieur du camp. Alors, que se passe-t-il ?
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_03");//Ça dépend - pourquoi avez-vous besoin d'aide ?
	};
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_04");//Les requins des marais se font un peu trop curieux à mon goût - il serait grand temps d'en abattre quelques-uns.
	
	Log_CreateTopic (Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Logan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Logan,"Logan me propose d'aller chasser des requins des marais avec lui.");
};
//---------------------------------------------------------------------
//	Info Why
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Why   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent   = FALSE;
	description	= "Et qu'est-ce que j'ai à y gagner ?";
};
FUNC INT DIA_Addon_Logan_Why_Condition()	
{
	if Npc_KnowsInfo (other, DIA_Addon_Logan_HI)
	&& (Logan_Inside == FALSE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Why_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_Why_15_00"); //Et qu'est-ce que j'ai à y gagner ?
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_01"); //(grogne) Franco vous laissera croupir ici à tout jamais si vous ne m'aidez pas.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_02"); //Si vous voulez entrer dans le camp, vous allez devoir me donner un coup de main. Vous n'irez pas plus loin avec de belles paroles.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_03"); //De plus, je peux vous apprendre à éviscérer ces bestioles.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_04"); //Cela dit, je ne pense pas que Franco vous laisse monter au camp simplement parce qu'on se sera amusés avec quelques requins des marais ici...
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_05"); //Certaines personnes ici attendent de monter au camp depuis très longtemps...
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_06"); //Et le prochain à monter, ce sera moi... (grogne)... Ç'a tout intérêt à être moi...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Logan peut m'apprendre à me procurer des peaux, des griffes et des dents.");	
};
//---------------------------------------------------------------------
//	Info Lager
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Lager   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 3;
	condition   = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent   = FALSE;
	description	= "Qu'y a-t-il à l'intérieur du camp, au juste ?";
};
FUNC INT DIA_Addon_Logan_Lager_Condition()	
{
	if Npc_KnowsInfo (other, DIA_Addon_Logan_Why)
	&& (Logan_Inside == FALSE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_Lager_15_00");//Qu'y a-t-il à l'intérieur du camp, au juste ?
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_01");//(grogne) La question serait plutôt 'que n'y a-t-il PAS à l'intérieur du camp'. Pas de requins des marais, pas de fosses dans le marais... pas de foutu marais, tout simplement !
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_02");//Au lieu de ça, ils ont de l'alcool et de l'or. Et d'après ce que je sais, ils ont même une femme. Compris ?
};
//---------------------------------------------------------------------
//	Info von Franco geschickt (MISsion) 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_MIS   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 99;
	condition   = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent   = FALSE;
	description	= "Allons attaquer les requins des marais.";
};
FUNC INT DIA_Addon_Logan_MIS_Condition()	
{	
	if Npc_KnowsInfo (other, DIA_Addon_Logan_HI)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_MIS_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_00");//Allons attaquer les requins des marais.
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_01");//(grogne) Bien ! Vous avez compris comment prendre du galon, ici. J'en suis ravi... Pst... vous avez entendu ça ? Ouaaais, je les entends.
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_02");//Je vois - et maintenant, que faisons-nous ?
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_03");//Ils arrivent. Ils apprécient la chair humaine. Bien, on va voir qui se fait manger le premier... Allons-y.
	
	Snd_Play ("SWA_Warn");
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"JAGD");
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_RUNNING;
	
	
	Wld_InsertNpc (MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc (MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc (MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
	
};
//---------------------------------------------------------------------
//	Info Sumpfhaie TOT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_tot   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Logan_tot_Condition()	
{	
	if Npc_IsDead (MIS_Addon_Swampshark_01)
	&& Npc_IsDead (MIS_Addon_Swampshark_02)
	&& Npc_IsDead (MIS_Addon_Swampshark_03)
	&& Npc_KnowsInfo (other,DIA_Addon_Logan_MIS)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_tot_Info()
{	 
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_00");//Un bon requin des marais est un requin des marais mort. Ça servira d'avertissement à leurs frères !
	AI_Output (other, self, "DIA_Addon_Logan_tot_15_01");//Bien, est-ce qu'il y a autre chose à faire ? Sinon, je vais y aller...
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_02");//Faites toujours ça. Si vous voulez en apprendre davantage - vous savez où me trouver.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog ();
	B_LogEntry (Topic_Addon_Franco,"J'ai aidé Logan... Nous verrons bien ce qu'en dira Franco.");
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	
};

///////////////////////////////////////////////////////////////////////
//	Info Lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Logan_Lern   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 100;
	condition   = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent   = FALSE;
	description = "Apprenez-moi à éviscérer les animaux...";
};
FUNC INT DIA_Addon_Logan_Lern_Condition()
{	
 	if Npc_KnowsInfo (other, DIA_Addon_Logan_Why)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Lern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Logan_Lern_15_00");//Apprenez-moi à éviscérer les animaux...
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_01");//Si vous voulez apprendre quelque chose sur les mouches sanguines, allez voir Edgor. Il est incollable sur ces bestioles.
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_02");//Et si vous voulez éviscérer des requins des marais ou des lézards, vous devez apprendre à en retirer la peau et les dents. Je peux vous apprendre comment faire.
};
///////////////////////////////////////////////////////////////////////
//	Info Allgemeine Talente
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Logan_Allg   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 3;
	condition   = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent   = TRUE;
	description = "Je veux apprendre...";
};
FUNC INT DIA_Addon_Logan_Allg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Logan_Lern)
	&& ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices (DIA_Addon_Logan_Allg);
	Info_AddChoice (DIA_Addon_Logan_Allg,DIALOG_BACK,DIA_Addon_Logan_Allg_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Retirer les crocs",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_Logan_Allg_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Retirer les griffes",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Addon_Logan_Allg_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Ecorchage",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Addon_Logan_Allg_Fur);
	};
	
};
//------------------------------------------------------------------------------------------------
//			Allgemeine Talente
//------------------------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices (DIA_Addon_Logan_Allg);
};
FUNC VOID DIA_Addon_Logan_Allg_Teeth ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
};
FUNC VOID DIA_Addon_Logan_Allg_Claws ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws);
};
FUNC VOID DIA_Addon_Logan_Allg_Fur ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur);
};

//----------------------------------------------------------------------
var int Logan_Lohn;
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Hacker   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 9;
	condition   = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent   = TRUE;
	Description = "Comment ça se passe ?"; 
};
FUNC INT DIA_Addon_Logan_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Logan_Hacker_15_00"); //Comment ça va ?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_01"); //Hé, grâce à vous, j'y suis arrivé ! Je travaille dans la mine !
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_02"); //Je ne sais pas grand-chose de l'extraction de l'or, mais ça viendra avec le temps.
	
	if (Logan_Lohn == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_03"); //J'ai appris le principal - les jambes bien campées sur le sol, et frapper fort !
		B_Upgrade_Hero_HackChance(10); 
		Logan_Lohn = TRUE;
	};
};
	



///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_EXIT   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 999;
	condition   = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hallo   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent   = FALSE;
	description = "Qu'est-ce que vous venez faire ici ?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//Qu'est-ce que vous faites ici ?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Je viens du château. On m'a chargé d'inspecter les environs et de chercher les gens portés disparus.
};
///////////////////////////////////////////////////////////////////////
//	Info Vermisste
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Vermisste   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent   = FALSE;
	description = "Ceux qui ont disparu ?";
};

FUNC INT DIA_Jergan_Vermisste_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Vermisste_Info()
{
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//Les gens portés disparus ?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Plusieurs personnes se sont enfuies lors de l'attaque des dragons. La plupart sont mortes, ce qui n'a rien de surprenant.
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Mais s'il y a des survivants, je suis chargé de les ramener au château.
};
///////////////////////////////////////////////////////////////////////
//	Info Burg 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Burg   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent   = FALSE;
	description = "Pouvez-vous m'aider à entrer au château ?";
};

FUNC INT DIA_Jergan_Burg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Burg_Info()
{
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//Pouvez-vous m'aider à entrer au château ?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Bien sûr, mais uniquement si vous me rendez service.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Si vous arrivez au château, allez voir Oric le paladin et dites-lui que son frère est mort au col.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Quand je serai au château, je dois dire à Oric que son frère est tombé au col.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Gegend   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent   = TRUE;
	description = "Qu'ai-je besoin de savoir sur cet endroit ?";
};

FUNC INT DIA_Jergan_Gegend_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
var int Jergan_Tell;
FUNC VOID DIA_Jergan_Gegend_Info()
{
	if (Jergan_Tell == FALSE)
	{
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Que faut-il savoir au sujet de la région ?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Si vous voulez vivre, retournez là d'où vous venez.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Cela fait plusieurs semaines que les peaux vertes font le siège du château et ces sales dragons se cachent quelque part dans le coin.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//La Vallée des mines regorge d'orques. Où que vous alliez, ce ne sera pas une partie de plaisir.
	Jergan_Tell = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hilfe   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent   = FALSE;
	description = "Comment puis-je entrer au château ?";
};

FUNC INT DIA_Jergan_Hilfe_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Burg)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Hilfe_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//Comment faire pour accéder au château ?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Oubliez la voie directe. Par contre, si vous le contournez, vous pourrez peut-être entrer par l'arrière.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Evitez les sentiers et suivez le cours de la rivière. Je vous conseille même de la descendre en nageant pendant quelque temps, après quoi cela devrait être plus facile.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Les orques ont un bélier derrière le château. C'est par là qu'il vous faut passer. Approchez-vous le plus possible sans vous faire remarquer, puis courez comme le vent.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Si vous êtes assez rapide, vous passerez peut-être.
};


//2. Begegnung
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Mine   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent   = FALSE;
	description = "Que faites-vous ici ?";
};

FUNC INT DIA_Jergan_Mine_Condition()
{	
	if( Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Mine_Info()
{
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Que faites-vous ici ?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Je suis éclaireur, alors j'explore la région de part en part. Mais le moins que l'on puisse dire, c'est que les saurinides ne me facilitent pas la tâche.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//La période est propice à la récolte des trophées... à condition de savoir les prélever bien sûr.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Claw   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent   = FALSE;
	description = "Pouvez-vous m'apprendre comment faire ça ?";
};

FUNC INT DIA_Jergan_Claw_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Mine)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Claw_Info()
{
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Pouvez-vous m'apprendre comment faire ?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Je peux vous montrer comment arracher les griffes des saurinides morts.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Teach   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent   = TRUE;
	description = "(Apprendre à retirer les griffes)";
};
FUNC INT DIA_Jergan_Teach_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Claw)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Teach_Info()
{
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Montrez-moi.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Ce qu'il faut se rappeler, c'est qu'il est nécessaire de les arracher d'un coup sec. N'hésitez pas et ne cherchez pas à les découper à l'aide d'une lame.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//C'est également la méthode à appliquer pour arracher les griffes des lézards et des bêtes des ombres.
	};
};
///////////////////////////////////////////////////////////////////////
//	Diego
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Diego   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent   = FALSE;
	description = "Savez-vous où est allé Diego ?";
};

FUNC INT DIA_Jergan_Diego_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& (Npc_KnowsInfo (other, DIA_DiegoOw_Hallo) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Parcival_Diego)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Diego_Info()
{
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Savez-vous où se trouve Diego ?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego ? C'était l'un des mineurs de Silvestro, mais il se fait particulièrement discret ces temps-ci.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Je l'ai vu en compagnie de deux chevaliers portant une caisse pas trop loin d'ici.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Vous voyez la vieille tour de garde ? Dirigez-vous vers elle, puis vers le château.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Un sentier permet de franchir les rochers visibles sur la droite. C'est par là que les trois hommes sont passés.
};
///////////////////////////////////////////////////////////////////////
//	Rudelführer getötet
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Jergan_Leader   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Jergan_Leader_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_IsDead(NewMine_LeadSnapper) 
	&& Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Leader_Info()
{
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Ainsi, vous avez tué le chef de la meute. Est-ce que vous lui avez arraché ses griffes ?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Oui.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Nul doute qu'elles doivent valoir très cher. Certaines personnes les collectionnent vous savez.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Si vous trouvez un acheteur intéressé, elles vous rapporteront probablement une coquette somme.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Non.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Vous devriez le faire, je suis sûr qu'elles valent une fortune.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jergan_PICKPOCKET (C_INFO)
{
	npc			= VLK_4110_Jergan;
	nr			= 900;
	condition	= DIA_Jergan_PICKPOCKET_Condition;
	information	= DIA_Jergan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Jergan_PICKPOCKET_Condition()
{
	C_Beklauen (84, 110);
};
 
FUNC VOID DIA_Jergan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jergan_PICKPOCKET);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_BACK 		,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};
	
func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};















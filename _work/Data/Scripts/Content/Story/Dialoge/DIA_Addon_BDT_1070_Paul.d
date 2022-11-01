//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_EXIT   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 999;
	condition   = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Paul_PICKPOCKET (C_INFO)
{
	npc			= BDT_1070_Addon_Paul;
	nr			= 900;
	condition	= DIA_Addon_Paul_PICKPOCKET_Condition;
	information	= DIA_Addon_Paul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Paul_PICKPOCKET_Condition()
{
	C_Beklauen (22, 19);
};
 
FUNC VOID DIA_Addon_Paul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
	
func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Hi   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 1;
	condition   = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent   = FALSE;
	description = "Vous vendez du matériel de forgeron ?";
};
FUNC INT DIA_Addon_Paul_Hi_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Paul_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Hi_15_00"); //Vous vendez du matériel de forgeron ?
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_01"); //Huno propose de l'acier. Il ne me reste que quelques morceaux de minerai.
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_02"); //Mais je ne le cèderai pas. C'est la seule chose de valeur qu'il me reste.
};
//---------------------------------------------------------------------
//	Info Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Huno   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent   = FALSE;
	description	= "Vous travaillez pour Huno ?";
};
FUNC INT DIA_Addon_Paul_Huno_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Paul_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Huno_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Huno_15_00"); //Vous travaillez pour Huno ?
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_01"); //Je voulais gagner un peu d'or, et du coup, je me suis associé à Huno. Mais depuis, Esteban ne me donne plus rien du tout !
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_02"); //Il m'a dit qu'il ne peut plus avoir recours à mes services.
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_03"); //Du coup, je n'ai plus d'autre alternative que continuer à trimer pour Huno.
};

//---------------------------------------------------------------------
//	Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Attentat   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 3;
	condition   = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Paul_Attentat_03_00"); //Rien du tout, mon gars ! Je n'ai rien à voir avec ça ? Qu'est-ce que vous voulez de moi ?
};
	
//---------------------------------------------------------------------
//	HunoVerdacht
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoVerdacht   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 4;
	condition   = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent   = FALSE;
	description	= "On soupçonne Huno d'être lié à l'attaque...";
};
FUNC INT DIA_Addon_Paul_HunoVerdacht_Condition()
{	
	if ( (Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoVerdacht_15_00"); //Huno est soupçonné d'avoir un lien avec l'attaque...
	AI_Output (self, other, "DIA_Addon_Paul_HunoVerdacht_03_01"); //Mais moi, je ne suis au courant de rien !
};
	
//---------------------------------------------------------------------
//	Arbeitest für Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoArbeit (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent   = FALSE;
	description	= "Vous travaillez pour Huno ! Vous devez bien savoir quelque chose !";
};
FUNC INT DIA_Addon_Paul_HunoArbeit_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_Huno))
	&& (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoVerdacht))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoArbeit_15_00"); //Mais vous travaillez pour Huno ! Vous devez forcément savoir quelque chose !
	AI_Output (self, other, "DIA_Addon_Paul_HunoArbeit_03_01"); //(désespéré) Je ne sais rien, je vous le jure ! Je dois y aller, maintenant !
	Npc_ExchangeRoutine(self, "AWAY");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	Angst vor Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_FearEsteban (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent   = FALSE;
	description	= "Savez-vous ce qu'Esteban vous fera en apprenant que vous protégez Huno ?";
};
FUNC INT DIA_Addon_Paul_FearEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoArbeit))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_FearEsteban_15_00"); //Vous savez ce qu'Esteban vous fera lorsqu'il découvrira que vous protégez Huno !
	AI_Output (self, other, "DIA_Addon_Paul_FearEsteban_03_01"); //Merde, laissez-moi tranquille ! Je n'ai rien à voir avec tout ça !
	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	MaulPaul
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_MaulPaul (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent   = FALSE;
	description	= "Dites-moi ce que vous savez, et maintenant !";
};
FUNC INT DIA_Addon_Paul_MaulPaul_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_FearEsteban))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_00"); //(amicalement) Dites-moi ce que vous savez ou je vous broie la tête contre ce mur, Paul !
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_01"); //Vous pouvez pas vous défouler sur moi juste parce que vous travaillez pour le patron !
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_02"); //(gentiment) Oh, mais je le peux !
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_03"); //Arrêtez vos conneries !
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_04"); //(impatient) Paul...
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_05"); //(paniqué) Tout ce que je sais est que Huno à un compte à régler avec Esteban.
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_06"); //(paniqué) Il me parle sans cesse de ce type, Esteban. Il dit qu'il a ruiné sa petite affaire, et tout ça...
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_07"); //J'ai fait que l'écouter, et j'ai jamais rien dit !
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_08"); //Eh bien voilà ! Vous voyez, ça n'était pas si dur que ça...
	
	Npc_ExchangeRoutine(self, "START");
	
	Paul_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Paul raconte que Huno hait Esteban, car ce dernier sape son activité.");
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1070_Paul_Mine   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_1070_Paul_Mine_03_00");//Enfin ! Tenez, je vous donne mon minerai en échange.
	B_GiveInvItems (self, other, ItMi_Nugget,2);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//----------------------------------------------------------------------
//	PERM
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_PERM (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 99;
	condition   = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent   = TRUE;
	description = "Tout va bien pour vous, sinon ?";
};
FUNC INT DIA_Addon_Paul_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,  DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Paul_PERM_15_00"); //Tout va bien pour vous, sinon ?
	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output (self, other, "DIA_Addon_Paul_PERM_03_01"); //Oui, je vais extraire un paquet d'or de ce caillou !
	}
	else 
	{
		if (Paul_TellAll == TRUE)
		&& (Huno_zuSnaf == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_02"); //Je vous ai dit tout ce que je savais !
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_03"); //Je veux juste qu'on me laisse travailler, moi !
		};
	};
};





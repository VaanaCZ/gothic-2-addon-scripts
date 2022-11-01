// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sld_820_EXIT(C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_820_EXIT_Condition;
	information	= DIA_Sld_820_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Halt 
// ************************************************************

INSTANCE DIA_Sld_820_Halt (C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_820_Halt_Condition;
	information	= DIA_Sld_820_Halt_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Sld_820_Halt_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sld_820_Halt_Info()
{	
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //Où croyez-vous aller comme ça ?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //A la maison, bien sûr.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar nous paie pour empêcher les types comme vous de passer.

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Ne laissez entrer aucun milicien. Voilà ce qu'il nous a dit.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Il faut que je parle à Lee !
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Qu'est-ce que vous lui voulez ?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "Lui et moi ça remonte à loin...", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Je veux me joindre aux mercenaires !", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee est dans l'aile droite. Je vous préviens, vous n'avez pas intérêt à aller ailleurs...
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Je voudrais rejoindre les mercenaires.
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //Ah, de la chair à canon ! C'est bon, entrez.
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Mais surtout, laissez Onar tranquille ! Il déteste quand on lui parle sans qu'il l'ait demandé, et encore plus quand il s'agit d'un type comme vous.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //On se connaît depuis longtemps, lui et moi.
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //Vous, un copain de Lee ? Je n'en crois pas un mot. Mais allez-y, entrez. S'il ne vous reconnaît pas, vous vous en apercevrez rapidement... (éclate de rire)
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   PERM 
// ************************************************************

INSTANCE DIA_Sld_820_PERM(C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_820_PERM_Condition;
	information	= DIA_Sld_820_PERM_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //Comment ça se passe ?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //Entrez si vous voulez, mais ne me faites pas perdre mon temps avec vos inepties.
	AI_StopProcessInfos	(self);
};










	
	
	
	



























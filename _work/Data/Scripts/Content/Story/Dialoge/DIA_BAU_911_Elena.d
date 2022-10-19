// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Elena_EXIT   (C_INFO)
{
	npc         = BAU_911_Elena;
	nr          = 999;
	condition   = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Elena_HALLO		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 1;
	condition	= DIA_Elena_HALLO_Condition;
	information	= DIA_Elena_HALLO_Info;
	permanent	= FALSE;
	description	= "Bonjour, ma mignonne.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Bonjour, ma jolie.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Hum. D'o� vous �tes-vous �chapp� ?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //Que voulez-vous ?
	};
};


// ************************************************************
// 			  					Aufstand
// ************************************************************
instance DIA_Elena_Aufstand		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 2;
	condition	= DIA_Elena_Aufstand_Condition;
	information	= DIA_Elena_Aufstand_Info;
	permanent	= FALSE;
	description	= "Ils disent que vous vous �tes r�volt�s contre le roi ?";
};

func int DIA_Elena_Aufstand_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info ()
{
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //On raconte que vous vous �tes r�volt�s contre le roi.
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //Mon p�re a d�cid� qu'il �tait temps que nous nous d�fendions nous-m�mes
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //De toute fa�on, la milice ne nous a jamais aid�s. Ils ne viennent ici que pour piller nos r�serves.
	};
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Arbeit		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 3;
	condition	= DIA_Elena_Arbeit_Condition;
	information	= DIA_Elena_Arbeit_Info;
	permanent	= FALSE;
	description	= "Quel genre de travail peut-on trouver � la ferme ?";
};

func int DIA_Elena_Arbeit_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Quel genre de travail peut-on trouver � la ferme ?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //Mon p�re paie tous ceux qui peuvent aider � prot�ger la ferme.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //Cela vous int�resse ? Vous n'avez pas l'air de quelqu'un qui aime le travail des champs.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Quel salaire propose votre p�re ?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //Vous devrez n�gocier avec lui.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Tout ce que je sais, c'est que chaque mercenaire est pay� chaque jour.
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Regeln		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 4;
	condition	= DIA_Elena_Regeln_Condition;
	information	= DIA_Elena_Regeln_Info;
	permanent	= FALSE;
	description	= "Y a-t-il des r�gles auxquelles je dois me soumettre ?";
};

func int DIA_Elena_Regeln_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //Y a-t-il des r�gles auxquelles je doive me soumettre ?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Evitez de toucher � ce qui ne vous appartient pas.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Evitez les endroits o� vous n'avez rien � faire.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //Et si vous devez vous battre, faites-le contre des mercenaires.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Si vous vous en prenez � un fermier, vous aurez tout le monde contre vous.
};


// ************************************************************
// 			  					Aufgabe 
// ************************************************************
instance DIA_Elena_AUFGABE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 5;
	condition	= DIA_Elena_AUFGABE_Condition;
	information	= DIA_Elena_AUFGABE_Info;
	permanent 	= FALSE;
	description	= "Quel est votre travail ici ?";
};

func int DIA_Elena_AUFGABE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info ()
{
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //Quel est votre travail ici ?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Je vends ce que nous produisons. Si vous voulez acheter quelque chose, dites-le moi.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Mais je vous pr�viens, je ne tol�re ni vol ni marchandage, compris ?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"H�l�na vend des marchandises � la ferme d'Onar.");
};

// ************************************************************
// 			  					TRADE 
// ************************************************************

//---------------------------------
var int Elena_Trade_mit_mir;
//---------------------------------

instance DIA_Elena_TRADE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr          = 7;
	condition	= DIA_Elena_TRADE_Condition;
	information	= DIA_Elena_TRADE_Info;
	permanent	= TRUE;
	description	= "Montrez-moi vos marchandises !";
	trade		= TRUE;
};

func int DIA_Elena_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_AUFGABE))
	|| (Elena_Trade_mit_mir == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Montrez-moi vos marchandises !
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Que puis-je vous proposer ?
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Elena_PERM		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 900;
	condition	= DIA_Elena_PERM_Condition;
	information	= DIA_Elena_PERM_Info;
	permanent	= TRUE;
	description	= "Il s'est pass� quelque chose d'important r�cemment ?";
};

func int DIA_Elena_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //S'est-il pass� quelque chose d'int�ressant r�cemment ?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Il y a quelques jours, mon p�re a d�cr�t� que nous ne vendrions plus rien en ville.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Alors je reste � la ferme et je ne vends mes marchandises qu'aux visiteurs.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Les attaques de la milice contre les fermes avoisinantes sont de plus en plus fr�quentes. Ce n'est qu'une question de temps avant que mon p�re n'intervienne.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //La r�gion est devenue dangereuse. Plus personne ne quitte ses champs. Cela fait longtemps qu'aucun d'entre nous ne s'est rendu en ville.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //Les mercenaires sont de plus en plus impatients. Mais, depuis que Sylvio et ses gars sont partis, ils ont l'air plus d�tendus.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Tout le monde parle de l'attaque imminente des orques. Mais je n'y crois pas vraiment. Je pense que nous sommes � l'abri � la ferme.
	};
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Minenanteil
///////////////////////////////////////////////////////////////////////
instance DIA_Elena_MINENANTEIL		(C_INFO)
{
	npc		 = 	BAU_911_Elena;
	nr		 = 	2;
	condition	 = 	DIA_Elena_MINENANTEIL_Condition;
	information	 = 	DIA_Elena_MINENANTEIL_Info;

	description  =  "Vous vendez des concessions mini�res ?";
};

func int DIA_Elena_MINENANTEIL_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Elena_Hallo))
		{
				return TRUE;
		};
};

func void DIA_Elena_MINENANTEIL_Info ()
{
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Vous vendez des concessions mini�res ?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //Et alors ? J'y ai laiss� ma chemise pour les acheter.
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Elena_PICKPOCKET (C_INFO)
{
	npc			= BAU_911_Elena;
	nr			= 900;
	condition	= DIA_Elena_PICKPOCKET_Condition;
	information	= DIA_Elena_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Elena_PICKPOCKET_Condition()
{
	C_Beklauen (30, 35);
};
 
FUNC VOID DIA_Elena_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Elena_PICKPOCKET);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_BACK 		,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};
	
func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};






















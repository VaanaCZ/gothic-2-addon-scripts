// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Ne comptez pas sur moi pour me joindre à votre attaque.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Qu'est-ce que vous croyez que les autres gars vont faire quand j'aurai le dos tourné, hein ?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Quand je reviendrai, il ne restera pas une seule caisse dans ma hutte !
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Je reste ici et je garde nos provisions !
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //Tiens, voilà une nouvelle tête. J'espère que ça n'est pas une tête de bandit.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Je m'appelle Garett. Si vous avez besoin de quelque chose, demandez-moi.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Je peux tout vous avoir. Du vin, des armes, tout ce dont vous pouvez avoir besoin.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Sauf de l'alcool. Si vous voulez du tafia correct, allez plutôt voir Samuel.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "Qui est Samuel ?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Qui est Samuel ?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //C'est notre bouilleur de crû. Il a une grotte sur la plage, pas très loin du camp.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Vous ne pouvez pas la rater. Marchez vers le Nord.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Vous feriez bien d'avoir du tafia.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Certains des gars ici n'aiment pas beaucoup les nouveaux, ici.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //Une bonne rasade de tafia saura faire des merveilles !

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "Où est-ce que vous vous fournissez ?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Où est-ce que vous vous fournissez ?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip ramène toujours des tas de choses quand il se rend à Khorinis.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Il y a encore peu de temps, il faisait des affaires avec les bandits.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Mais depuis qu'on est en guerre avec eux, c'est moi qui récupère toutes ses marchandises.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "Que savez-vous au sujet des bandits ?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Que savez-vous des bandits ?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Demandez plutôt à Skip.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Je peux vous dire qu'il les a pas mal fréquentés.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg a donné des ordres. On doit éliminer tout bandit qui s'approcherait du camp.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "Votre capitaine, Greg. Il est comment ?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //Votre capitaine, Greg. Il est comment ?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //C'est un vieux dur à cuire, il n'y a pas de doute là dessus.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //Et d'une avidité !
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Il oblige Francis, notre trésorier à ne pas payer un sou plus que nécessaire pour éviter une mutinerie.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //Et si l'un d'entre-nous trouve un objet valant vraiment quelque chose, il le prend pour lui. On n'y coupe pas !
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Une fois, j'ai récupéré un compas venant d'une frégate royale.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //Ce salopard de Greg me l'a pris, bien sûr.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Bah. Il l'a sûrement enterré quelque part, comme le reste de son trésor.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "Où aurait-il pu enterrer ce compas ?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Où aurait-il pu enterrer ce compas ?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Une fois, Greg m'a dit que c'était la Mort elle-même qui veillait sur mon compas.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Autre chose ?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Il y a une plage au sud de l'île qui ne peut être atteinte que par la mer.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //On dit que Greg y va souvent. Vous trouverez peut-être quelque chose là-bas.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //J'y suis allé une fois pour voir ce que je pourrais y trouver, mais l'endroit grouille de monstres.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Si vous voulez vraiment aller là-bas, n'oubliez pas d'emporter une pioche.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg a dérobé un précieux compas à Garret. Garret le soupçonne de l'avoir enterré quelque part sur la plage sud.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Voilà votre compas.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Voilà votre compas.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(heureux) Oui, c'est lui. Je ne pensais pas le revoir un jour.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Merci, mon vieux !
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Cette fois-ci, Greg ne remettra pas la main dessus
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Tenez, prenez ce ceinturon en échange. C'est mon bien le plus précieux.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Vous m'avez déjà acheté ce ceinturon, vous vous souvenez ?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //Et vous aviez payé une belle somme - (vite) non pas qu'il ne la valait pas. Tenez, reprenez votre or.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret était très heureux de revoir son compas.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "Que pouvez-vous me dire à propos de Francis ?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Que pouvez-vous me dire à propos de Francis ?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg lui a confié le commandement pendant son absence.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Mais Francis n'a vraiment pas l'étoffe d'un chef !
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Il n'est même pas fichu de tirer ce gros fainéant de Morgan de son lit.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry et ses gars sont les seuls à travailler par ici.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Les autres s'amusent au lieu de travailler.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //J'espère que Greg va vite rentrer.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //Il va tous leur botter les fesses.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "Des nouvelles ?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Du nouveau ?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Il ne se passe plus rien depuis le départ de Greg.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Maintenant que Greg est de retour, les choses reviennent à la normale par ici.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};



// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Cipher_EXIT(C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 999;
	condition	= DIA_Cipher_EXIT_Condition;
	information	= DIA_Cipher_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cipher_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Cipher_Hello (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 1;
	condition	= DIA_Cipher_Hello_Condition;
	information	= DIA_Cipher_Hello_Info;
	permanent	= FALSE;
	description = "Qu'y a-t-il?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Comment ça va ?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Hé ! On se connaît, non ?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //Ce n'est pas impossible...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //Je vendais de l'herbe des marais à la colonie, vous vous rappelez ?
};

// ************************************************************
// 			  					TradeWhat 
// ************************************************************

instance DIA_Cipher_TradeWhat (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TradeWhat_Condition;
	information	= DIA_Cipher_TradeWhat_Info;
	permanent	= FALSE;
	description = "Et de quoi vous occupez-vous maintenant ?";
};                       

FUNC INT DIA_Cipher_TradeWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TradeWhat_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //Et maintenant, qu'est-ce que vous vendez ?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ne me le demandez pas...
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //J'ai pris de l'herbe des marais avec moi quand on a quitté la colonie minière.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Beaucoup de mercenaires aiment fumer de temps en temps, ce qui m'a permis de mettre un peu d'argent de côté.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Mais un fumier m'a volé toute l'herbe contenue dans mon coffre !
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Le mercenaire Cipher a perdu un paquet d'herbes des marais.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Je suis quasiment certain qu'il s'agit de Bodo. On partage la même chambre et il me sourit toujours comme un gros débile...
		B_LogEntry (Topic_CipherPaket, "Il soupçonne Bodo de le lui avoir volé.");
	};
	
	MIS_Cipher_Paket = LOG_RUNNING;
};

// ************************************************************
// 			  					DoWithThief 
// ************************************************************

instance DIA_Cipher_DoWithThief (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DoWithThief_Condition;
	information	= DIA_Cipher_DoWithThief_Info;
	permanent	= FALSE;
	description = "Alors qu'allez-vous faire au sujet du voleur ?";
};                       

FUNC INT DIA_Cipher_DoWithThief_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DoWithThief_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Que comptez-vous faire au sujet de ce vol ?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Un de ces jours, je l'attraperai bien en train de fumer mon herbe.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //Et à ce moment, je trouverai un coin tranquille pour lui donner une leçon qu'il n'oubliera pas de sitôt.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Si jamais je m'occupe de lui ici, les autres fermiers le verront et ça me coûtera un max.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //Comment ça ?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //C'est simple : si on touche aux fermiers, Lee nous oblige à verser une lourde amende. C'est Onar qui a fixé cette règle.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //Et plus il y a de témoins, plus l'affaire fait du bruit... et plus l'amende est élevée.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Alors, on va régler ça tranquillement, loin des regards...
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Cipher_WannaJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_WannaJoin_Condition;
	information	= DIA_Cipher_WannaJoin_Info;
	permanent	= FALSE;
	description = "Je veux me joindre aux hommes de Lee !";
};                       

FUNC INT DIA_Cipher_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Je veux rejoindre la bande de Lee.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //La bande de Lee ? Ha ! Si ça continue comme ça, elle sera bientôt plus à lui !
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Pourquoi ?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee est du genre calme. Il était déjà comme ça du temps de la colonie.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Mais il pousse le bouchon un peu loin. Tout ce qu'il veut, c'est rester ici à ne rien faire et attendre que les paladins meurent de faim.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio est de l'avis qu'on devrait ratisser ce qu'on peut au niveau des petites fermes et à l'extérieur de la ville.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //C'est vrai que ça nous changerait, et ce serait pas un mal.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //En ce moment, on passe nos journées à se tourner les pouces. Vous voulez toujours vous joindre à nous ?
};

// ************************************************************
// 			  					YesJoin 
// ************************************************************

instance DIA_Cipher_YesJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_YesJoin_Condition;
	information	= DIA_Cipher_YesJoin_Info;
	permanent	= FALSE;
	description = "Quoi qu'il m'en coûte, je veux devenir l'un des vôtres !";
};                       

FUNC INT DIA_Cipher_YesJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_YesJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Je veux devenir l'un des vôtres quoi qu'il advienne !
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Vous êtes au courant que tout le monde vote pour déterminer si les nouveaux doivent être acceptés ou pas ?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Que voulez-vous dire ?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //Eh bien, ça fait un bon moment que je n'ai plus fumé. Apportez-moi de l'herbe des marais et ma voix vous est acquise.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Je suis sûr que vous devriez pouvoir y arriver.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher votera pour moi si je lui ramène des herbes des marais.");
};

// ************************************************************
// 			  					Joints 
// ************************************************************

instance DIA_Cipher_Joints (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_Joints_Condition;
	information	= DIA_Cipher_Joints_Info;
	permanent	= TRUE;
	description = "A propos de l'herbe des marais...";
};                       

FUNC INT DIA_Cipher_Joints_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_Joints_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //A propos de l'herbe des marais...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Vous me l'avez amenée ! Excellent !
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Je voterai pour vous, pas de problème.
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher votera pour moi quand je ferai ma demande pour rejoindre les mercenaires.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist glücklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Je verrai ce que je peux faire...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Voici quelques tiges pour vous...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Je vais voir ce que je peux faire.
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //En voilà un peu.
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ah ! Vous êtes un type bien !
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Ma voix vous est acquise.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher votera pour moi quand je ferai ma demande pour rejoindre les mercenaires.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //C'est tout ? J'aurai tout fumé d'un coup !
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //Il m'en faut au moins dix joints !
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //Quoi qu'il en soit, ma voix vous est acquise.
		};
	};

	Info_ClearChoices (DIA_Cipher_Joints);
};


// ************************************************************
// 			  					TRADE
// ************************************************************

instance DIA_Cipher_TRADE (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TRADE_Condition;
	information	= DIA_Cipher_TRADE_Info;
	permanent	= TRUE;
	description = "Montrez-moi vos marchandises.";
	trade		= TRUE;
};                       

FUNC INT DIA_Cipher_TRADE_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TRADE_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Montrez-moi vos marchandises.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Pas de problème. Servez-vous.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Je n'ai pas d'herbe des marais en ce moment. Vous désirez autre chose ?
	};
};

// ************************************************************
// 			  					Dar Dieb
// ************************************************************

instance DIA_Cipher_DarDieb (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarDieb_Condition;
	information	= DIA_Cipher_DarDieb_Info;
	permanent	= FALSE;
	description = "Je sais qui a pris votre herbe.";
};                       

FUNC INT DIA_Cipher_DarDieb_Condition()
{
	if ( (Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE) )
	&& (!Npc_IsDead (Dar))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarDieb_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Je sais qui a volé votre herbe des marais.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Qui c'est, alors ? Bodo ?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Non, c'est un mercenaire. Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //Le fumier ! Où il est ?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Le retrouver ne vous servira à rien, il a vendu le paquet à Khorinis.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //OU IL EST ?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Derrière le bâtiment de la cuisine, à l'angle...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //JE VAIS L'ECRABOUILLER !
	
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Dar, AR_NONE, 0);
};

// ************************************************************
// 			  					Dar LOST
// ************************************************************

instance DIA_Cipher_DarLOST (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarLOST_Condition;
	information	= DIA_Cipher_DarLOST_Info;
	permanent	= FALSE;
	description = "On a donné à Dar ce qu'il méritait… Vous sentez-vous mieux maintenant ?";
};                       

FUNC INT DIA_Cipher_DarLOST_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarLOST_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Vous avez mis une bonne raclée à Dar. Vous vous sentez mieux, maintenant ?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //(soupire) Ouais, ça m'a fait du bien.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Pas à lui, j'imagine.
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Il n'avait qu'à pas fouiner dans mon coffre, ce pourri !
	
	B_GivePlayerXP ((XP_Ambient)*2);
};

// ************************************************************
// 			  				Kraut PAKET
// ************************************************************

instance DIA_Cipher_KrautPaket (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_KrautPaket_Condition;
	information	= DIA_Cipher_KrautPaket_Info;
	permanent	= FALSE;
	description = "Ce paquet d'herbes des marais serait-il à vous ?";
};                       

FUNC INT DIA_Cipher_KrautPaket_Condition()
{
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_KrautPaket_Info()
{	
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Ce paquet d'herbe des marais ne serait pas à vous, des fois ?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //Ça alors ! Où l'avez-vous trouvé ?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //C'est une longue histoire...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //Sans importance. Vous êtes un type bien.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Tenez, prenez ça en guise de récompense et amusez-vous bien.
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Laissez-moi en rouler quelques uns
	CreateInvItems (self, itmi_joint, 40);
	Npc_RemoveInvItems (self, ItMi_HerbPaket, 1);
	
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_CipherPaket);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_CipherSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 900;
	condition	= DIA_CipherSLD_PICKPOCKET_Condition;
	information	= DIA_CipherSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_CipherSLD_PICKPOCKET_Condition()
{
	C_Beklauen (65, 65);
};
 
FUNC VOID DIA_CipherSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_BACK 		,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};


		



		
	
//#####################################################################
//##
//##
//##						Bis - KAPITEL 3 - (danach in OW!)
//##
//##
//#####################################################################
	

	



	
/**/

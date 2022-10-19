// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Marcos_EXIT(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 999;
	condition	= DIA_Marcos_EXIT_Condition;
	information	= DIA_Marcos_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Marcos_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};	
// ************************************************************
// 			  Hallo				 
// ************************************************************
INSTANCE DIA_Marcos_Hallo(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hallo_Condition;
	information	= DIA_Marcos_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Marcos_Hallo_Condition()
{	
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//Halte, au nom d'Innos ! Je suis Marcos, paladin du roi. Dites-moi ce qui vous amène ici, et pas de mensonge !
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Les Elus d'Innos disent toujours la vérité.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Pardonnez-moi, vénéré magicien. Je n'avais pas réalisé à qui je m'adressais.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//C'est bon pour cette fois.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Si je puis me permettre... qu'est-ce qui vous amène ici ?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Détendez-vous, je suis au service du seigneur Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Vous faites partie de notre armée. Sur l'ordre de qui êtes-vous ici ?
	}
	else //SLD
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_07");//Détendez-vous, nous avons le même employeur, le seigneur Hagen.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_08");//Depuis quand le seigneur Hagen engage-t-il des mercenaires ? Parlez... qu'est-ce qui vous amène ici ?
	};

};
// ************************************************************
// 			  Hagen			 
// ************************************************************
INSTANCE DIA_Marcos_Hagen(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hagen_Condition;
	information	= DIA_Marcos_Hagen_Info;
	permanent	= FALSE;
	description	= "Je dois apporter au seigneur Hagen la preuve de l'existence des dragons.";
};                       

FUNC INT DIA_Marcos_Hagen_Condition()
{	
	if (Kapitel == 2)
	&& (Garond.aivar [AIV_TalkedToPlayer] == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hagen_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Je dois apporter la preuve que les dragons existent bel et bien au seigneur Hagen.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Dans ce cas, inutile de perdre votre temps et de risquer votre vie bêtement.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Croyez-vous vraiment trouver une écaille de dragon que vous pourrez lui ramener en ce lieu ?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Essayez d'atteindre le château et parlez au commandant Garond.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Il doit être mis au courant que vous êtes en mission pour le seigneur Hagen, et c'est lui qui se chargera de votre assignation.
};	

// ************************************************************
// 			  Garond			 
// ************************************************************
INSTANCE DIA_Marcos_Garond(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Garond_Condition;
	information	= DIA_Marcos_Garond_Info;
	permanent	= FALSE;
	description	= "Je reviens de chez Garond...";
};                       

FUNC INT DIA_Marcos_Garond_Condition()
{	
	if (Kapitel == 2)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Garond_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Je viens de la part de Garond. Il veut savoir quelle quantité de minerai est prête à être transportée.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Dites-lui qu'il m'a fallu quitter le site d'extraction, les attaques orques devenant trop dangereuses.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//J'ai essayé de rejoindre le château en compagnie de quelques hommes, mais je suis le seul survivant.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//J'ai mis le minerai en sécurité. Il y a quatre coffres au total. Dites-le à Garond lorsque vous lui ferez votre rapport.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Dites-lui que je garderai le minerai jusqu'à mon dernier souffle, mais j'ignore quand les orques finiront par me trouver.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Demandez-lui de m'envoyer des renforts.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Je lui transmettrai le message.
	
	B_LogEntry (TOPIC_ScoutMine,"Le paladin Marcos garde QUATRE caisses de minerai dans une petite vallée.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos veut que Garond lui envoie de l'aide.");
	
	MIS_Marcos_Jungs = LOG_RUNNING;
	Marcos_Ore = TRUE;
	self.flags = 0;
};	
	
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Marcos_Perm(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 9;
	condition	= DIA_Marcos_Perm_Condition;
	information	= DIA_Marcos_Perm_Info;
	permanent	= TRUE;
	description	= "Comment ça se passe ?";
};                       

FUNC INT DIA_Marcos_Perm_Condition()
{	
	if (Kapitel >= 2)
	&& (Npc_KnowsInfo (other, DIA_Marcos_Hagen)
	|| Npc_KnowsInfo (other, DIA_Marcos_Garond))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Perm_Info()
{	

	AI_Output (other, self, "DIA_Marcos_Perm_15_00");//Comment ça va ?
	
	if (self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] /2)  
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Il me faudrait une potion curative.
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Je tiendrai... en espérant que Garond m'envoie vite des renforts.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Merci de votre aide. Innos nous donnera la force de résister.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Je ne plierai pas car Innos est avec moi !
	};
	
	AI_StopProcessInfos (self);
};		
	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Marcos_PICKPOCKET (C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 900;
	condition	= DIA_Marcos_PICKPOCKET_Condition;
	information	= DIA_Marcos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Marcos_PICKPOCKET_Condition()
{
	C_Beklauen (65, 380);
};
 
FUNC VOID DIA_Marcos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Marcos_PICKPOCKET);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_BACK 		,DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};
	
func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};


	
	
	
	
	
	

	

	
	

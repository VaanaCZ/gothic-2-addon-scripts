///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Elvrich_EXIT   (C_INFO)
{
	npc         = VLK_4302_Addon_Elvrich;
	nr          = 999;
	condition   = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Elvrich_PICKPOCKET (C_INFO)
{
	npc			= VLK_4302_Addon_Elvrich;
	nr			= 900;
	condition	= DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information	= DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	C_Beklauen (62, 110);
};
 
FUNC VOID DIA_Addon_Elvrich_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
	
func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info BanditsThere
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_BanditsThere		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_BanditsThere_Condition;
	information	 = 	DIA_Addon_Elvrich_BanditsThere_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
var int DIA_Addon_Elvrich_BanditsThere_NoPerm;
func int DIA_Addon_Elvrich_BanditsThere_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_BanditsThere_Info ()
{
	if (Npc_IsDead(BDT_10307_Addon_RangerBandit_M))
	&& (Npc_IsDead(BDT_10308_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10309_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10310_Addon_RangerBandit_M))	
	{
		AI_Output	(self, other, "DIA_Addon_Elvrich_BanditsThere_04_00"); //Dieu merci, nous sommes débarrassés des bandits. Vous m'avez sauvé la vie.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Wer		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Wer_Condition;
	information	 = 	DIA_Addon_Elvrich_Wer_Info;

	description	 = 	"Qui êtes-vous ?";
};

func int DIA_Addon_Elvrich_Wer_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_00"); //Qui êtes vous ?
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_01"); //Je m'appelle Elvrich. Je viens de la ville.
	if (MIS_Thorben_BringElvrichBack == LOG_RUNNING)
	{
		AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_02"); //Maître Thorben m'a dit que vous aviez disparu.
	};
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_03"); //Ces vermines de bas étage m'ont emmené et me gardaient prisonnier.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_MissingPeople_Condition;
	information	 = 	DIA_Addon_Elvrich_MissingPeople_Info;

	description	 = 	"Il y a beaucoup de disparitions en ville.";
};

func int DIA_Addon_Elvrich_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_MissingPeople_15_00"); //Il y a beaucoup de disparitions en ville.
	AI_Output	(self, other, "DIA_Addon_Elvrich_MissingPeople_04_01"); //Je ne sais rien de ces disparitions. Je ne peux parler que de ce qui m'est arrivé.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatExactly
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhatExactly		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhatExactly_Condition;
	information	 = 	DIA_Addon_Elvrich_WhatExactly_Info;

	description	 = 	"Que vous est-il arrivé ?";
};

func int DIA_Addon_Elvrich_WhatExactly_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhatExactly_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhatExactly_15_00"); //Que vous est-il arrivé ?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_01"); //Je me rendais à un rendez-vous avec ma fiancée.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_02"); //Elle s'appelle Lucia. Nous avions pour projet d'aller vivre dans la montagne. Loin de la ville et de tous ceux qui y vivent.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_03"); //Je venais d'arriver au rendez-vous quand ces bandits ont soudain surgi des fourrés et nous ont capturés tous les deux.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_04"); //Je me suis défendu, bien sûr, mais peine perdue. Ils étaient trop nombreux. Vous ne les avez pas vus ?

	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Qu'est-ce que les bandits voulaient de vous ?", DIA_Addon_Elvrich_WhatExactly_Want );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Parlez-moi de Lucia.", DIA_Addon_Elvrich_WhatExactly_lucia );
};
func void DIA_Addon_Elvrich_WhatExactly_Want ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Want_15_00"); //Qu'est-ce que les bandits voulaient de vous ?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Want_04_01"); //Une nuit, j'ai entendu ce qu'ils disaient. Je n'ai pas tout compris mais je crois qu'ils voulaient nous réduire en esclavage.

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Où voulaient-ils vous emmener ?", DIA_Addon_Elvrich_WhatExactly_Pirates );
};
func void DIA_Addon_Elvrich_WhatExactly_Pirates ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Pirates_15_00"); //Où voulaient-ils vous emmener ?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_01"); //Dans un endroit qui se trouve ici, sur l'île de Khorinis. Mais je crois qu'on ne peut l'atteindre que par bateau.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_02"); //Ils m'ont emmené là où ils mouillaient leur bateau sur la côte. Il y avait des pirates qui campaient.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_03"); //Un des bandits s'est approché des pirates pour négocier. La discussion était animée.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_04"); //Je crois que le bandit voulait que les pirates l'emmenent quelque part, avec moi.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_05"); //Mais les pirates n'étaient pas d'accord. Alors les bandits sont repartis et depuis on traîne ici.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_06"); //Ils avaient l'air plutôt désemparé. Et puis vous êtes arrivé.
	
	Elvrich_SCKnowsPirats = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Elvrich, l'apprenti du charpentier Thorben de Khorinis, a été enlevé par des bandits. Les pirates semblent être de mèche avec les bandits."); 
	
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Des pirates à Khorinis ?", DIA_Addon_Elvrich_WhatExactly_Here );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Où est le mouillage des pirates ?", DIA_Addon_Elvrich_WhatExactly_pirat );
};
func void DIA_Addon_Elvrich_WhatExactly_Here ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Here_15_00"); //Des pirates à Khorinis ?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_01"); //Je ne sais pas grand-chose sur eux. J'ai seulement réussi à en voir un au mouillage.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_02"); //Ils se tenaient toujours en retrait. Ils sont tous recherchés à Khorinis.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_03"); //Ils ont peur du gibet. C'est pour cela que vous ne risquez pas de les rencontrer en ville.
};
func void DIA_Addon_Elvrich_WhatExactly_lucia ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_lucia_15_00"); //Parlez-moi de Lucia.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_lucia_04_01"); //C'est une fille du port. Elle travaillait pour cet affreux Bromor. Elle est très belle.
};
func void DIA_Addon_Elvrich_WhatExactly_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_pirat_15_00"); //Où est le mouillage des pirates ?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_01"); //Pas très loin du port de Khorinis.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_02"); //Quand vous êtes sur le quai et que vous regardez en direction de la mer, il suffit de prendre un bateau et de naviguer à droite, le long de la côte.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_03"); //La première crique que vous rencontrerez est le mouillage dont je vous ai parlé.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Pour se rendre au point d'amarrage des pirates, il faut aller sur le port de Khorinis. En se tenant sur le mur du quai, face à la mer, il faut nager vers la droite, en longeant la côte."); 

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, DIALOG_BACK, DIA_Addon_Elvrich_WhatExactly_Back );
};
func void DIA_Addon_Elvrich_WhatExactly_Back ()
{
	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
};

///////////////////////////////////////////////////////////////////////
//	Info Bromor
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Bromor		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Bromor_Condition;
	information	 = 	DIA_Addon_Elvrich_Bromor_Info;

	description	 = 	"Bromor dit que Lucia est partie en emportant une écuelle dorée...";
};

func int DIA_Addon_Elvrich_Bromor_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_Bromor_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_Bromor_15_00"); //Bromor prétend que Lucia s'est enfuie en lui volant un plat en or
	AI_Output	(self, other, "DIA_Addon_Elvrich_Bromor_04_01"); //Si Lucia a vraiment volé Bromor, les bandits lui auront sûrement repris son butin.

	Log_CreateTopic (TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BromorsGold,"Désormais, l'écuelle dorée de Bromor est sûrement aux mains des bandits qui rôdent dans les bois au nord de la ferme de Sekob."); 
};

///////////////////////////////////////////////////////////////////////
//	Info WhereIsLucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhereIsLucia		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information	 = 	DIA_Addon_Elvrich_WhereIsLucia_Info;

	description	 = 	"Où est Lucia ?";
};

func int DIA_Addon_Elvrich_WhereIsLucia_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_LuciasLetter != LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhereIsLucia_15_00"); //Où est Lucia ?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_01"); //Nous avons été séparés au grand carrefour de la ferme d'Onar.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_02"); //Les bandits l'ont entraînée dans la forêt derrière la ferme de Sekob.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_03"); //Qu'Innos la protège.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Lucia a été enlevée par les bandits qui rôdent dans les bois au nord de la ferme de Sekob."); 

	SC_KnowsLuciaCaughtByBandits = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWaffen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_FernandosWaffen		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information	 = 	DIA_Addon_Elvrich_FernandosWaffen_Info;

	description	 = 	"Les bandits qui vous ont capturé ont-ils reçu une cargaison d'armes ?";
};

func int DIA_Addon_Elvrich_FernandosWaffen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_FernandosWaffen_15_00"); //Est-ce les bandits qui vous retenaient prisonnier ont reçu une cargaison d'armes ?
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_01"); //Oh oui. Il y en avait tellement qu'ils pouvaient à peine les porter.
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_02"); //Ils ont emmené tout leur barda et ont disparu derrière la ferme de Sekob.
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Ce sentier me mène vers les bois au nord de la ferme de Sekob. On raconte que ces bois ont été envahis par des bandits fortement armés."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_LuciaLetter		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Elvrich_LuciaLetter_Condition;
	information	 = 	DIA_Addon_Elvrich_LuciaLetter_Info;

	description	 = 	"J'ai trouvé une lettre de votre Lucia.";
};

func int DIA_Addon_Elvrich_LuciaLetter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_LuciaLetter_15_00"); //J'ai trouvé une lettre de votre Lucia.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_01"); //(excité) Comment ? Donnez-la tout de suite !
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_02"); //(désespéré) NON ! Je ne peux pas le croire. Non, c'est impossible.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_03"); //(désespéré) Elle ne peut pas m'abandonner comme ça.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_04"); //(désespéré) Reprenez cette lettre. Je n'en veux pas. Je suis sûr qu'elle me reviendra un jour.
	
	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Elvrich se refuse à croire que Lucia ait pu suivre les bandits de son plein gré. Il attend toujours son retour, en dépit de la lettre d'adieu qu'elle lui a écrite."); 

	B_GivePlayerXP (XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info WasNun
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WasNun		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WasNun_Condition;
	information	 = 	DIA_Addon_Elvrich_WasNun_Info;
	permanent	 = 	FALSE;

	description	 = 	"Vous devriez rentrer en ville en vitesse !";
};

func int DIA_Addon_Elvrich_WasNun_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhereIsLucia))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_00"); //Vous devriez vous dépêcher de rentrer en ville !
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_01"); //Que puis-je faire d'autre ? Je retourne tout droit chez Maître Thorben.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_02"); //Allez-vous chercher les bandits ?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_03"); //Oui, je crois
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_04"); //Si vous trouvez Lucia, vous pourriez la ramener en ville ?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_05"); //Je verrai ce que je peux faire.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich est retourné voir le maître charpentier Thorben."); 

	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine	(self,"BACKINTHECITY");
	EquipItem	(self, ItMw_1h_Bau_Mace);
};

///////////////////////////////////////////////////////////////////////
// PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_PERM		(C_INFO)
{
	npc		 	= VLK_4302_Addon_Elvrich;
	nr		 	= 5;
	condition	= DIA_Addon_Elvrich_PERM_Condition;
	information	= DIA_Addon_Elvrich_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Addon_Elvrich_PERM_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (MIS_LuciasLetter != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Elvrich_PERM_Info ()
{
	AI_Output (self, other, "DIA_Addon_Elvrich_PERM_04_00"); //Merci de m'avoir sauvé !
};



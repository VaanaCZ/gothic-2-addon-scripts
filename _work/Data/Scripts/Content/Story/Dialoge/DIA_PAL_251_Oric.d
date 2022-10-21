///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Oric_EXIT   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 999;
	condition   = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Oric_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_HALLO		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_HALLO_Condition;
	information	 = 	DIA_Oric_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Quel est votre travail ?";
};

func int DIA_Oric_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Oric_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Oric_HALLO_15_00"); //Quel est votre r�le�?
	AI_Output (self, other, "DIA_Oric_HALLO_11_01"); //Je suis un officier en charge de la strat�gie de l'arm�e du roi sous les ordres de l'honorable commandant Garond.
	AI_Output (self, other, "DIA_Oric_HALLO_11_02"); //Nous sommes les derniers paladins du ch�teau. Tous les autres sont partis ou tomb�s au champ d'honneur.
	AI_Output (self, other, "DIA_Oric_HALLO_11_03"); //Nous devons veiller � ce que cette exp�dition se termine bien, il en va de notre responsabilit�. Et nous le ferons, par Innos�! Nous le ferons.

};

///////////////////////////////////////////////////////////////////////
//	Info Bruder
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Bruder		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_Bruder_Condition;
	information	 = 	DIA_Oric_Bruder_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai un message pour vous.";
};

func int DIA_Oric_Bruder_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Jergan_Burg)
	&& Npc_KnowsInfo (other, DIA_Oric_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Oric_Bruder_Info ()
{
	AI_Output (other, self, "DIA_Oric_Bruder_15_00"); //J'ai un message pour vous.
	AI_Output (self, other, "DIA_Oric_Bruder_11_01"); //Qu'y a-t-il ?
	AI_Output (other, self, "DIA_Oric_Bruder_15_02"); //Votre fr�re est mort. Il est arriv� jusqu'au col mais n'a pas r�ussi � le franchir.
	AI_Output (self, other, "DIA_Oric_Bruder_11_03"); //(murmure) Mon fr�re...
	AI_Output (self, other, "DIA_Oric_Bruder_11_04"); //C'est une terrible �preuve qu'Innos m'impose l�. Mais au moins mon fr�re est mort en le servant.
	AI_Output (self, other, "DIA_Oric_Bruder_11_05"); //Cette nouvelle est un trait qui me transperce le c�ur. Je dois aller prier pour recouvrer des forces.
	OricBruder = TRUE;
	
	B_GivePlayerXP (XP_Ambient);
};

	
//*****************************************
//	Minen Auftrag
//*****************************************

INSTANCE DIA_Oric_ScoutMine   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 1;
	condition   = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent   = FALSE;
	description = "Je dois me rendre aux sites d'extraction.";
};

FUNC INT DIA_Oric_ScoutMine_Condition()
{
	if 	(MIS_ScoutMine == LOG_RUNNING)
	&&	(Kapitel < 3)
	&& 	(Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&&  (Fajeth_Ore == FALSE)
	&&  (Marcos_Ore == FALSE)
	&&  (Silvestro_Ore == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_ScoutMine_Info()
{
	AI_Output (other,self ,"DIA_Oric_ScoutMine_15_00"); //Il faut que je me rende aux sites miniers.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_01"); //M�fiez-vous, car cela ne sera pas simple. En arrivant adressez-vous aux paladins. Ils dirigent les trois groupes.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_02"); //Si vous voulez en savoir davantage, adressez-vous � Parcival.
};	
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Perm		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	99;
	condition	 = 	DIA_Oric_Perm_Condition;
	information	 = 	DIA_Oric_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Comment �a se passe ?";
};

func int DIA_Oric_Perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Oric_Perm_Info ()
{
	
	AI_Output (other, self, "DIA_Oric_Perm_15_00"); //Comment �a va ?
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_01"); //Il faut que vous retrouviez les mineurs et le minerai. A ce moment-l�, nous essayerons de voir comment quitter cette vall�e.
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
 	{
		AI_Output (self, other, "DIA_Oric_Perm_11_02"); //Notre exp�dition pi�tine, mais nous n'abandonnerons pas, car Innos est avec nous. Il nous permettra de sortir sains et saufs de cette vall�e.
	}
	else //noch nicht angenommen
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_03"); //Votre arriv�e est une source d'espoir pour nous.
		AI_Output (self, other, "DIA_Oric_Perm_11_04"); //Nous avons besoin de vous. Allez voir Garond, il vous expliquera tout.
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Oric_KAP3_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP3_EXIT_Condition;
	information	= DIA_Oric_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Oric_KAP4_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP4_EXIT_Condition;
	information	= DIA_Oric_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*****************************************
//	Kann ich irgendwie helfen?
//*****************************************

INSTANCE DIA_Oric_IAmBack   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;

	description = "Je suis d�j� de retour.";
};

FUNC INT DIA_Oric_IAmBack_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_HALLO))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Oric_IAmBack_Info()
{
	AI_Output (other,self ,"DIA_Oric_IAmBack_15_00"); //Me revoil�.
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_01"); //Je n'aurais jamais cru vous revoir apr�s cette sc�ne qui s'est produite la derni�re fois que vous �tiez l� il y a quelques jours de �a.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_02"); //Au nom de notre ordre, je vous souhaite la bienvenue.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_03"); //Je vois que vous avez �t� nomm� magicien. Mes respects.
	};
	
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_04"); //Peut-�tre votre arriv�e est-elle un signe encourageant.
};

//***********************************************
//	Kann ich helfen?
//***********************************************

INSTANCE DIA_Oric_CanHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;

	description = "Puis-je �tre utile ?";
};

FUNC INT DIA_Oric_CanHelp_Condition()
{
	if 	(Kapitel >= 4)
	&&	(Npc_KnowsInfo (other,DIA_Oric_IAmBack))
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_15_00"); //Puis-je vous aider ?
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_01"); //Pour le moment, je pense que nous avons fait tout ce qui pouvait l'�tre d'ici.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_02"); //Mais il y a quelque chose de tr�s important que vous pourriez faire pour nous en dehors des murs du ch�teau.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_03"); //Nous avons l'intention de trancher la t�te du serpent.
	
	Info_ClearChoices (DIA_Oric_CanHelp);
	Info_AddChoice (DIA_Oric_CanHelp,"Je crois que vous devriez trouver quelqu'un d'autre.",DIA_Oric_CanHelp_NotYourMan); 
	Info_AddChoice (DIA_Oric_CanHelp,"Qu'entendez-vous par cela ?",DIA_Oric_CanHelp_WhatYouMean);

};

FUNC VOID DIA_Oric_CanHelp_NotYourMan ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_NotYourMan_15_00"); //Il serait pr�f�rable que vous trouviez quelqu'un d'autre.
	AI_Output (self ,other,"DIA_Oric_CanHelp_NotYourMan_11_01"); //J'ai besoin de tous mes hommes. Vous �tes notre seul espoir.
};

FUNC VOID DIA_Oric_CanHelp_WhatYouMean ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_00"); //Qu'entendez-vous par l� ?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_01"); //Nous connaissons l'un de leurs chefs. Il se nomme Hosh-Pak.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_02"); //C'est l'un des shamans orques les plus influents qui soient.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_03"); //Que voulez-vous que je fasse�?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_04"); //Tuez-le.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_05"); //C'est une plaisanterie�?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //Vous �tes le seul que nous puissions charger de cette mission. Nous avons besoin de tous nos chevaliers.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //Ce n'est pas ais� pour moi de vous demander cela, mais vous �tes le meilleur choix possible pour mener cette mission � bien.
	}
	else
	{	
		AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_08"); //Vous souhaitez nous aider, n'est-ce pas�? Dans ce cas...
	};
	
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_09"); //La tente d'Hosh-Pak est situ�e au-del� de l'arm�e qui nous encercle, au sommet d'une falaise qui se dresse au sud d'ici.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_10"); //On la distingue presque de la fen�tre.
	

	Info_ClearChoices (DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};

//***********************************************
//	Ich brauche noch Ausr�stung.
//***********************************************

INSTANCE DIA_Oric_NeedStuff   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 6;
	condition   = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;

	description = "J'ai toujours besoin d'�quipement.";
};

FUNC INT DIA_Oric_NeedStuff_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NeedStuff_Info()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_15_00"); //Il me faut de l'�quipement.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_01"); //Nous n'avons pas grand-chose � vous offrir.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_02"); //Je peux vous offrir ceci.
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
	Info_AddChoice (DIA_Oric_NeedStuff,"ou 1 �lixir de dext�rit�",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice (DIA_Oric_NeedStuff,"ou 1 �lixir de force",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice (DIA_Oric_NeedStuff,"ou 3 �lixirs de mana",DIA_Oric_NeedStuff_Mana);	
	Info_AddChoice (DIA_Oric_NeedStuff,"3 �lixirs m�dicinaux",DIA_Oric_NeedStuff_Health); 
};

FUNC VOID DIA_Oric_NeedStuff_Health ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Health_15_00"); //Je prends les potions curatives.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Health_11_01"); //Excellent choix. J'esp�re qu'elles vous seront utiles.
	
	CreateInvItems (self,ItPo_Health_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Mana ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Mana_15_00"); //Je prends les potions de mana.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Mana_11_01"); //J'esp�re que vous en aurez l'utilit�. Innos vous prot�ge.
	
	CreateInvItems (self,ItPo_Mana_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Strength ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Strength_15_00"); //Je prends l'�lixir de force.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Strength_11_01"); //Il vous sera sans doute utile. Bonne chance.

	CreateInvItems (self,ItPo_Perm_STR,1);
	B_GiveInvItems (self ,other,ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Dexterity ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Dexterity_15_00"); //Je prends l'�lixir de dext�rit�.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Dexterity_11_01"); //Tenez, et puissent vos fl�ches toujours trouver leur cible.

	CreateInvItems (self,ItPo_Perm_DEX,1);
	B_GiveInvItems (self ,other,ItPo_Perm_DEX,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

//***********************************************
//	ich werde keinen feigen Mord begehen.
//***********************************************

INSTANCE DIA_Oric_NoMurder   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 7;
	condition   = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;

	description = "Je refuse d'assassiner Hosh-Pak de mani�re aussi l�che.";
};

FUNC INT DIA_Oric_NoMurder_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NoMurder_Info()
{
	AI_Output (other,self ,"DIA_Oric_NoMurder_15_00"); //Il est hors de question que j'assassine Hosh-Pak�! Je ne suis pas un l�che�!
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_01"); //Avez-vous id�e de la situation d�sesp�r�e qui est la n�tre�?
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_02"); //Nous devons soutenir un si�ge men� par une arm�e d'orques qui nous est sup�rieure en nombre et il ne nous reste presque plus de provisions.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_03"); //Si nous ne parvenons pas � amener le minerai au navire, les orques ravageront le royaume.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_04"); //Tout ce pourquoi nous avons tant lutt� dispara�tra.
};

//***********************************************
//	Ich werde dir helfen
//***********************************************

INSTANCE DIA_Oric_WillHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 5;
	condition   = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent   = FALSE;
	description = "Tr�s bien. Je tuerai Hosh-Pak.";
};

FUNC INT DIA_Oric_WillHelp_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	MIS_KillHoshPak == FALSE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_WillHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_WillHelp_15_00"); //Tr�s bien, je vais tuer Hosh-Pak.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_01"); //Je suis heureux de l'entendre.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_02"); //La tente d'Hosh-Pak se dresse au sommet d'une petite falaise. Vous avez d�j� d� l'apercevoir.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_03"); //Elle se trouve non loin du chemin menant � la mine, juste dans l'ombre de la grande montagne.
	
	Log_CreateTopic (TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry (TOPIC_KillHoshPak,"Oric veut que j'�limine le chaman orque Hosh-Pak. Sa tente se dresse sur une petite falaise pas tr�s loin derri�re le ch�teau."); 

	MIS_KillHoshPak = LOG_RUNNING;
};

//***********************************************
//	Hosh-Pak ist tot!
//***********************************************

INSTANCE DIA_Oric_HoshDead   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 8;
	condition   = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent   = FALSE;
	description = "Hosh-Pak est mort !";
};

FUNC INT DIA_Oric_HoshDead_Condition()
{
	if 	(Npc_IsDead (Hosh_Pak))
	&& 	(MIS_KillHoshPak == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_HoshDead_Info()
{
	AI_Output (other,self ,"DIA_Oric_HoshDead_15_00"); //Hosh-Pak est mort.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_01"); //Splendide�! Voil� qui devrait d�sorganiser les orques. Peut-�tre avons-nous une chance apr�s tout...
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_02"); //Je pense que cela devrait nous permettre de gagner au moins une semaine...
	
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillHosh_Pak);
};



//***********************************************
//	Irgendwelche Neuigkeiten?
//***********************************************

INSTANCE DIA_Oric_AnyNews   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 9;
	condition   = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent	 = 	TRUE;

	description = "Des nouvelles ?";
};

FUNC INT DIA_Oric_AnyNews_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_AnyNews_Info()
{

	AI_Output (other,self ,"DIA_Oric_AnyNews_15_00"); //Des nouvelles ?
	
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_01"); //A part le fait que les orques ont r�ussi � entrer dans le ch�teau, vous voulez dire�?
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_02"); //Vous �tes un h�ros. Tuer tous les dragons d'un seul coup constitue un v�ritable exploit, c'est le moins que l'on puisse dire.
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_03"); //Les orques semblent avoir �t� d�stabilis�s par la mort d'Hosh-Pak.
	}
	else
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_04"); //Les orques sont de plus en plus nombreux. Ce n'est pas bon du tout...
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	3;
	condition	 = 	DIA_Oric_DragonPlettBericht_Condition;
	information	 = 	DIA_Oric_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"J'ai besoin de plus d�informations sur les dragons.";
};

func int DIA_Oric_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	&& (MIS_AllDragonsDead == FALSE)
	{
		return TRUE;
	};
};

var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;
func void DIA_Oric_DragonPlettBericht_Info ()
{
	AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_00"); //Il me faut davantage de renseignements au sujet des dragons.
	
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_01"); //J'ai d�j� tu� l'un d'eux. Pouvez-vous me dire o� trouver les autres�?
	}
	else if (MIS_KilledDragons != 0) 
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_02"); //J'ai la sensation de ne pas avoir tu� tous les dragons. Peut-�tre que quelque chose m'a �chapp�...
	};
	
	if ((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE))
	&& 	((Oric_SwampdragonInfo_OneTime == FALSE)
		||	(Oric_RockdragonInfo_OneTime == FALSE)
		||	(Oric_FiredragonInfo_OneTime == FALSE)
		||	(Oric_IcedragonInfo_OneTime == FALSE))
	{
		if ((Npc_IsDead(Swampdragon))== FALSE)
		&& (Oric_SwampdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_03"); //Un vaste marais est apparu voici deux jours � l'ouest de l'ancien ch�teau. C'est plut�t louche, ne trouvez-vous pas�?
			B_LogEntry (TOPIC_DRACHENJAGD,"Oric m'a donn� un indice : ces derniers jours un grand marais s'est form� � l'ouest du ch�teau. Il pense que ce n'est pas normal."); 
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(Rockdragon))==FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_04"); //Il y a une forteresse de pierre au sud, loin au-del� du volcan.
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_05"); //Nos espions nous indiquent qu'elle est lourdement gard�e. Peut-�tre l'un d'eux l'a-t-il faite sienne...
			B_LogEntry (TOPIC_DRACHENJAGD,"Les �claireurs des paladins ont dit � Oric que la forteresse de pierre, au-del� du volcan du sud, est fortement gard�e. Oric pense qu'un dragon s'y trouve."); 
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(FireDragon))==FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_06"); //Suite � la derni�re attaque de dragons, on a dit que l'un d'eux avait disparu � proximit� du volcan qui se dresse au sud. Vous devriez peut-�tre aller y faire un tour...
			B_LogEntry (TOPIC_DRACHENJAGD,"Apparemment, le dernier dragon qui a attaqu� le ch�teau de la Vall�e des mines a �t� aper�u pr�s du volcan."); 
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(IceDragon))==FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_07"); //Il y a une grande �tendue gel�e � l'ouest. Cela ne m'�tonnerait pas qu'un dragon s'y soit constitu� son repaire.
			B_LogEntry (TOPIC_DRACHENJAGD,"Selon Oric, la r�gion arctique � l'ouest pourrait �tre la demeure d'un dragon."); 
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_08"); //A l'heure actuelle, je n'ai rien pour vous, h�las.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Oric_KAP5_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP5_EXIT_Condition;
	information	= DIA_Oric_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Oric_KAP6_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP6_EXIT_Condition;
	information	= DIA_Oric_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Oric_PICKPOCKET (C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 900;
	condition	= DIA_Oric_PICKPOCKET_Condition;
	information	= DIA_Oric_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait terriblement difficile de lui voler son parchemin de sort)";
};                       

FUNC INT DIA_Oric_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (85 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Oric_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Oric_PICKPOCKET);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_BACK 		,DIA_Oric_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Oric_PICKPOCKET_DoIt);
};

func void DIA_Oric_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 85)
	{
		B_GiveInvItems (self, other, ITSc_PalRepelEvil, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Oric_PICKPOCKET);
	}
	else
	{	
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Oric_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Oric_PICKPOCKET);
};


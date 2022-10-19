///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Till_EXIT   (C_INFO)
{
	npc         = BAU_931_Till;
	nr          = 999;
	condition   = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Till_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Till_HALLO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	3;
	condition	 = 	DIA_Till_HALLO_Condition;
	information	 = 	DIA_Till_HALLO_Info;

	description	 = 	"Eh bien, bonhomme ?";
};

func int DIA_Till_HALLO_Condition ()
{
	if (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_15_00"); //Oui, gamin ?
	AI_Output			(self, other, "DIA_Till_HALLO_03_01"); //Un ouvrier agricole n'a pas à me parler comme ça, combien de fois devrai-je vous le répéter ?
	B_StartOtherRoutine (Till,"Start"); 

	Info_ClearChoices	(DIA_Till_HALLO);

	if (Kapitel < 5)
	{
		Info_AddChoice	(DIA_Till_HALLO, "Je ne suis pas un ouvrier agricole.", DIA_Till_HALLO_keinervoneuch );
	
		if (Npc_IsDead(Sekob)== FALSE)
		{
			Info_AddChoice	(DIA_Till_HALLO, "Etes-vous le responsable ici ?", DIA_Till_HALLO_selber );
		};
	};
};

func void DIA_Till_HALLO_selber ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_00"); //Etes-vous le responsable ici ?
	AI_Output			(self, other, "DIA_Till_HALLO_selber_03_01"); //(intimidé) Euh, non. Je ne suis que le fils de Sékob. Mais une fois que mon père ne sera plus, alors toutes ces terres que vous voyez seront à moi.
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_02"); //Fantastique !

	Info_ClearChoices	(DIA_Till_HALLO);
};

func void DIA_Till_HALLO_keinervoneuch ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_keinervoneuch_15_00"); //Je ne suis pas un ouvrier agricole.
	AI_Output			(self, other, "DIA_Till_HALLO_keinervoneuch_03_01"); //Et que venez-vous faire ici ? Nous n'avons rien. Alors autant repartir d'où vous venez.

	Info_ClearChoices	(DIA_Till_HALLO);
};


///////////////////////////////////////////////////////////////////////
//	Info feldarbeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Till_FELDARBEITER		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	4;
	condition	 = 	DIA_Till_FELDARBEITER_Condition;
	information	 = 	DIA_Till_FELDARBEITER_Info;

	description	 = 	"Est-ce ainsi que vous traitez vos ouvriers agricoles ?";
};

func int DIA_Till_FELDARBEITER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_FELDARBEITER_Info ()
{
	AI_Output			(other, self, "DIA_Till_FELDARBEITER_15_00"); //Vous traitez toujours vos ouvriers agricoles ainsi ?
	AI_Output			(self, other, "DIA_Till_FELDARBEITER_03_01"); //Naturellement, ils ont besoin de ça. Ici, ceux qui ne marchent pas au pas se font jeter. C'est comme ça que ça marche.

};


///////////////////////////////////////////////////////////////////////
//	Info Sekob
///////////////////////////////////////////////////////////////////////
instance DIA_Till_SEKOB		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	9;
	condition	 = 	DIA_Till_SEKOB_Condition;
	information	 = 	DIA_Till_SEKOB_Info;

	description	 = 	"Je dois parler à votre père.";
};

func int DIA_Till_SEKOB_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&&((Npc_KnowsInfo(other, DIA_Sekob_HALLO))== FALSE)
		&& (Kapitel < 3)
		&& (Npc_IsDead(Sekob)== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_SEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Till_SEKOB_15_00"); //Je dois parler à votre père.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_01"); //Il n'a pas le temps. Mais je suis son représentant. En quoi puis-je vous être utile ?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_02"); //En me présentant à votre père.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_03"); //Vous êtes vraiment un type robuste et un bon combattant, hein ?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_04"); //Le meilleur.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_05"); //Alors, je pense que je ferais bien d'aller le chercher.
	AI_Output			(other, self, "DIA_Till_SEKOB_15_06"); //Laissez tomber, mon garçon, je le trouverai bien moi-même.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_07"); //Si vous le dites.
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	10;
	condition	 = 	DIA_Till_WASMACHSTDU_Condition;
	information	 = 	DIA_Till_WASMACHSTDU_Info;

	description	 = 	"Alors que faites-vous ?";
};

func int DIA_Till_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_00"); //Alors que faites-vous quand vous ne jouez pas au patron à la ferme ?
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_01"); //Je monte la garde.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_02"); //Ces sales miliciens de la ville s'aventurent sur nos terres de plus en plus souvent et volent tout ce qu'ils peuvent.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_03"); //Pas plus tard que la semaine dernière, ils étaient ici et ils nous ont pris des moutons.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_04"); //Si je pouvais mettre la main sur l'un d'eux, je n'en ferais qu'une bouchée.
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_05"); //C'est évident !

};

///////////////////////////////////////////////////////////////////////
//	Info warumnichtsld
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WARUMNICHTSLD		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	11;
	condition	 = 	DIA_Till_WARUMNICHTSLD_Condition;
	information	 = 	DIA_Till_WARUMNICHTSLD_Info;

	description	 = 	"Pourquoi les mercenaires ne vous aident-ils pas contre la milice ?";
};

func int DIA_Till_WARUMNICHTSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_WASMACHSTDU))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WARUMNICHTSLD_Info ()
{
	AI_Output			(other, self, "DIA_Till_WARUMNICHTSLD_15_00"); //Pourquoi les mercenaires ne vous aident-ils pas contre la milice ?
	AI_Output			(self, other, "DIA_Till_WARUMNICHTSLD_03_01"); //Avant qu'ils soient prévenus, je les aurai déjà tous fait fuir.
};

///////////////////////////////////////////////////////////////////////
//	Info Bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	5;
	condition	 = 	DIA_Till_BRONKO_Condition;
	information	 = 	DIA_Till_BRONKO_Info;

	description	 = 	"(demander au sujet de Bronko)";
};

func int DIA_Till_BRONKO_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&& (Npc_KnowsInfo(other, DIA_Bronko_HALLO))
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKO_15_00"); //Il y a un grand type qui demande un droit de passage. Il affirme être fermier.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_01"); //(penaud) Euh. Oui. Je sais. C'est Bronko. Il n'en fait qu'à sa tête.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_02"); //Ce n'est pourtant pas faute de lui avoir mille fois rappelé de retourner au travail.
	AI_Output			(other, self, "DIA_Till_BRONKO_15_03"); //Mais ?
	AI_Output			(self, other, "DIA_Till_BRONKO_03_04"); //Il ne veut pas.
	
	if (Npc_IsDead(Sekob)== FALSE)
	{
		AI_Output			(self, other, "DIA_Till_BRONKO_03_05"); //Mon père me reproche de ne pas avoir encore réussi à le persuader de reprendre le travail.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Bronkozurarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOZURARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	6;
	condition	 = 	DIA_Till_BRONKOZURARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOZURARBEIT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Peut-être puis-je vous aider ?";
};

var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_BRONKO))
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE)
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKOZURARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_15_00"); //Je peux peut-être vous aider.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_03_01"); //Vraiment ? Très bien, écoutez. Si vous persuadez Bronko de reprendre le travail, je vous paierai… disons... 10 pièces d'or. Qu'en dites-vous ?

	Till_Angebot = 10;

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Pas de problème. Mais je veux plus d'argent.", DIA_Till_BRONKOZURARBEIT_mehr );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Très bien. Je vais voir ce que je peux faire.", DIA_Till_BRONKOZURARBEIT_ok );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Je vais y réfléchir.", DIA_Till_BRONKOZURARBEIT_nochnicht );

};

func void DIA_Till_BRONKOZURARBEIT_nochnicht ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_nochnicht_15_00"); //Je vais y réfléchir.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_nochnicht_03_01"); //Comme vous voulez...

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_ok ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_ok_15_00"); //Très bien. Je vais voir ce que je peux faire.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_ok_03_01"); //Mais faites vite.
	
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Bronkoeingeschuechtert, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert, LOG_RUNNING);
	B_LogEntry (TOPIC_Bronkoeingeschuechtert,"Till n'arrive pas à faire travailler Bronko. Il veut que j'essaie."); 

	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr ()
{
	if (Till_IchMachsNurEinmal == TRUE)
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_00"); //Je veux davantage.
		}
	else
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_01"); //Pas de problème. Mais je veux plus d'argent.
			Till_IchMachsNurEinmal = TRUE;
		};

	 if (Till_Angebot == 10)
	 	{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_02"); //Très bien. Alors, 20 pièces d'or.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "J'en veux plus.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Très bien. Je vais voir ce que je peux faire.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 20;
		}
	 else if (Till_Angebot == 20)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_03"); //30 ?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "J'en veux plus.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Très bien. Je vais voir ce que je peux faire.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 30;
		}
	 else if (Till_Angebot == 30)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_04"); //Peut-être... 50 ?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "J'en veux plus.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Très bien. Je vais voir ce que je peux faire.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 50;
		}
	 else if (Till_Angebot == 50)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_05"); //Très bien, 70 ?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "J'en veux plus.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Très bien. Je vais voir ce que je peux faire.", DIA_Till_BRONKOZURARBEIT_ok );
		Till_Angebot = 70;
		}
	 else if (Till_Angebot == 70)
		{	
	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_06"); //D'accord, d'accord ! Je vous donnerai 100 pièces d'or. Mais c'est tout de que j'ai.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Très bien. Je vais voir ce que je peux faire.", DIA_Till_BRONKOZURARBEIT_ok );

			Till_Angebot = 100;
		};
};

///////////////////////////////////////////////////////////////////////
//	Info bronkowiederanArbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOWIEDERANARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	7;
	condition	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Info;

	description	 = 	"Bronko s'est remis au travail.";
};

func int DIA_Till_BRONKOWIEDERANARBEIT_Condition ()
{
	if 	(
		(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE)
		&& (Kapitel < 5)
		)
		{
				return TRUE;
		};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_00"); //Bronko a repris le travail.
	AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_01"); //Vraiment ? C'est fantastique.
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_02"); //Oui. Et maintenant, je veux mon argent.
	
	IntToFloat	(Till_Angebot);
	
	if (Till_Angebot <= 50)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_03"); //(hésitant) Hum. Eh bien, les affaires sont les affaires, hein ?

			CreateInvItems (self, ItMi_Gold, Till_Angebot);									
			B_GiveInvItems (self, other, ItMi_Gold, Till_Angebot);
		}
	else
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_04"); //Malheureusement, je n'ai pas assez d'argent. Mais je vous suis reconnaissant pour votre aide.

			Till_HatSeinGeldBehalten = TRUE;
		};

	B_GivePlayerXP (XP_BronkoGehtAnDieArbeit);

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Till_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	99;
	condition	 = 	DIA_Till_PERMKAP1_Condition;
	information	 = 	DIA_Till_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"(embêter Till)";
};

func int DIA_Till_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	|| (Kapitel >= 5)
		{
				return TRUE;
		};
};

func void DIA_Till_PERMKAP1_Info ()
{
	if (Kapitel == 5)
		{
			if (MIS_bringRosiBackToSekob != LOG_SUCCESS)
			&& (Rosi_FleeFromSekob_Kap5 == TRUE)
			{
				AI_Output			(other, self, "DIA_Till_PERMKAP1_15_00"); //Vous êtes loin de chez vous, n'est-ce pas ? Papa ne pourra pas vous aider ici.
				AI_Output			(self, other, "DIA_Till_PERMKAP1_03_01"); //Un de ces jours, je vais vous faire fermer votre grande gueule.
			};
			
			AI_Output			(other, self, "DIA_Till_PERMKAP1_15_02"); //Espèce de minable, estimez-vous heureux si je vous épargne.
			AI_Output			(self, other, "DIA_Till_PERMKAP1_03_03"); //Alors laissez-moi tranquille.
			AI_StopProcessInfos (self);	
		}
		else
		{		
			if 	(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
				{
					AI_Output			(other, self, "DIA_Till_PERMKAP1_15_04"); //Peut-être devriez-vous manger davantage pour devenir grand et fort.
					AI_Output			(self, other, "DIA_Till_PERMKAP1_03_05"); //Vous verrez , un jour
					AI_StopProcessInfos (self);
				}
			else
				{
					if (Till_HatSeinGeldBehalten == TRUE)
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_06"); //Espèce de misérable petit...
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_07"); //Allez-vous-en.
							AI_StopProcessInfos (self);
						}			
					else
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_08"); //Personne ne vous a encore mouché le nez aujourd'hui ?
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_09"); //Laissez-moi tranquille, imbécile.
						};
				};
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Till_PICKPOCKET (C_INFO)
{
	npc			= BAU_931_Till;
	nr			= 900;
	condition	= DIA_Till_PICKPOCKET_Condition;
	information	= DIA_Till_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Till_PICKPOCKET_Condition()
{
	C_Beklauen (36, 40);
};
 
FUNC VOID DIA_Till_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Till_PICKPOCKET);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_BACK 		,DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};
	
func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};



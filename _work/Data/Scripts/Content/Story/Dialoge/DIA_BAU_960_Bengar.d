///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bengar_EXIT   (C_INFO)
{
	npc         = BAU_960_Bengar;
	nr          = 999;
	condition   = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	3;
	condition	 = 	DIA_Bengar_HALLO_Condition;
	information	 = 	DIA_Bengar_HALLO_Info;

	description	 = 	"Etes-vous le fermier ?";
};

func int DIA_Bengar_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //C'est vous le fermier ici ?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //On peut le dire mais je ne suis que locataire.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Toutes ces terres appartiennent à un seul fermier.

};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Bengar_WOVONLEBTIHR_Condition;
	information	 = 	DIA_Bengar_WOVONLEBTIHR_Info;

	description	 = 	"Comment gagnez-vous votre vie ?";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_WOVONLEBTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Comment parvenez-vous à vivre ?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //En chassant et en coupant du bois.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar m'impose tous ces ouvriers et il faut que je me débrouille pour les faire travailler. Seuls quelques-uns sont de bons chasseurs.

};


///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	6;
	condition	 = 	DIA_Bengar_TAGELOEHNER_Condition;
	information	 = 	DIA_Bengar_TAGELOEHNER_Info;

	description	 = 	"Employez-vous des ouvriers à la journée ?";
};

func int DIA_Bengar_TAGELOEHNER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_TAGELOEHNER_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Vous employez des journaliers ?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar renvoie les ouvriers dont il n'a pas besoin dans sa ferme.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Il me les envoie, je les nourris et ils travaillent pour moi.

};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bengar_MissingPeople_Info;

	description	 = 	"Est-il arrivé quelque chose d'inhabituel, récemment ?";
};

func int DIA_Addon_Bengar_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //Il n'est rien arrivé d'étrange par ici, récemment ?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Bien des choses étranges arrivent de nos jours.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Mais rien d'aussi étrange que la disparition de Pardos.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //C'est un de mes garçons de ferme et pas du tout le genre à tout laisser tomber et filer comme ça, vous savez.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Pardos, l'ouvrier du fermier Bengar, a disparu."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Pas d'indices ?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Il en avait peut-être assez.", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Qu'y a-t-il de si étrange dans sa disparition ?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Qu'y a-t-il de si étrange dans sa disparition ?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos est très timide. Il ne s'est jamais éloigné de la ferme plus loin que le bout de mes champs.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Il se sauverait en courant s'il voyait de la vermine.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Ces bestioles ne sont pas belles à voir mais on ne peut pas dire qu'elles soient dangereuses.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //(dégouté) On dit qu'il y a des gens qui en mangent. Beurk.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //On s'y fait.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Il en avait peut-être assez.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //Le travail aux champs, c'était sa vie. Je ne peux pas croire qu'il soit parti travailler dans une autre ferme.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //Il faisait ce qu'il voulait avec moi.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //Pas d'indices ?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Je crois que les bandits l'on emmené. Cela fait des jours qu'ils rôdent par ici.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Je les ai même vus emmener un habitant de la ville jusqu'à leur camp.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //On aurait dit qu'ils voulaient le réduire en esclavage.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Où est le camp des bandits ?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Où est le camp des bandits ?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Au bout de mes champs, un petit escalier conduit à une dépression. C'est là qu'ils se sont installés.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //J'irai bien chercher après Pardos là-bas mais pas question pour moi d'affronter ces types-là.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //Vous devriez passer au large. Ils ne sont pas réputés pour leur sens de l'humour.
	Bengar_ToldAboutRangerBandits = TRUE;
};
func void DIA_Addon_Bengar_MissingPeople_back ()
{
	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_ReturnPardos_Condition;
	information	 = 	DIA_Addon_Bengar_ReturnPardos_Info;

	description	 = 	"Pardos est revenu ?";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition ()
{
	if 	(MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&&  (Npc_GetDistToWP (Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Pardos est revenu ?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Oui. Il se repose à l'intérieur. Merci pour tout ce que
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //Ce n'est rien.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Attendez, je voudrais vous récompenser mais je n'ai pas
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Oubliez ça.
	
	B_GivePlayerXP (XP_Ambient);
};	

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Bengar_FernandosWeapons_Info;

	description	 = 	"Les bandits que vous avez vu passer ici portaient-ils des armes ?";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition ()
{
	if (Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Les bandits avaient-ils des armes quand ils sont passés ici ?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //En voilà une question stupide. Ça ne serait pas des bandits s'ils n'avaient pas d'armes !
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Je veux dire beaucoup d'armes. Un gros chargement.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Je vois. Maintenant que vous le dites, oui, ils en transportaient des tas.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Dans des tonneaux, dans des sacs et sur le chariot qu'ils avaient avec eux.
	 B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	8;
	condition	 = 	DIA_Bengar_REBELLIEREN_Condition;
	information	 = 	DIA_Bengar_REBELLIEREN_Info;

	description	 = 	"Que pensez-vous d'Onar ?";
};

func int DIA_Bengar_REBELLIEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Que pensez-vous d'Onar ?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //C'est un bâtard cupide qui finira bien par tous nous faire pendre.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Un de ces jours, les paladins quitteront la ville et nous feront payer pour ce qu'il a fait.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Mais je n'ai pas le choix. La milice ne vient ici que pour prendre nos réserves et pas pour nous défendre.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Si je me montrais loyal envers la ville, je me retrouverais tout seul.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Au moins, Onar envoie de temps en temps ses mercenaires pour voir comment on va.
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	9;
	condition	 = 	DIA_Bengar_PALADINE_Condition;
	information	 = 	DIA_Bengar_PALADINE_Info;

	description	 = 	"Qu'avez-vous contre les troupes royales ?";
};

func int DIA_Bengar_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) 
		{
				return TRUE;
		};
};

func void DIA_Bengar_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Qu'avez-vous contre les troupes royales ?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //C'est évident. Rien ne s'est arrangé depuis que les paladins sont arrivés en ville, bien au contraire.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Maintenant ces maudits miliciens viennent de plus en plus souvent sur nos terres et volent tout ce qu'on a et les paladins ne font rien.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Les seuls paladins que j'ai jamais vus sont les deux gardes au col.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Ils ne bougeraient même pas si les miliciens nous massacraient tous.

};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	10;
	condition	 = 	DIA_Bengar_PASS_Condition;
	information	 = 	DIA_Bengar_PASS_Info;

	description	 = 	"Le col ?";
};

func int DIA_Bengar_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Bengar_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //Le col ?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //Oui. Le col qui mène à la vieille Vallée des mines près des cascades, à l'autre bout des hauts pâturages.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Allez en parler à Malak. Il y est allé une ou deux fois ces dernières semaines.

};

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZ (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_MILIZ_Condition;
	information	= DIA_Bengar_MILIZ_Info;
	permanent 	= FALSE;
	description	= "Je suis supposé m'occuper de votre problème de milice.";
};

func int DIA_Bengar_MILIZ_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Je suis censé m'occuper de votre problème de milice.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Quoi ? J'ai dit à Onar d'envoyer deux de ses MERCENAIRES.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //C'est l'occasion pour moi de prouver ma valeur.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Fantastique. Savez-vous ce que me fera la milice si vous fichez tout par terre ?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Enfin, je commençais à croire que personne ne viendrait.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //Je l'ai déjà dit à Onar il y a plusieurs jours. Pourquoi est-ce que je paie un loyer ?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Ces salauds viennent ici une fois par semaine et ramassent les taxes pour la ville.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //C'est une bonne chose que vous veniez maintenant. Ils ne vont pas tarder.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Ils devraient arriver dans un moment.
};

// ************************************************************
// 			  				Selber vorknöpfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "Pourquoi ne pas vous occuper vous-même de la milice ?";
};

func int DIA_Bengar_Selber_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info ()
{
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Vous êtes tellement nombreux. Pourquoi ne vous dressez-vous pas contre la milice ?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //C'est vrai que nous sommes nombreux. Mais nous ne sommes pas des soldats entraînés comme les miliciens.
};		

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN		(C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information	= DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent	= FALSE;
	description	= "Eh bien, laissez venir la milice, je vais m'en occuper !";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Alors laissez la milice venir. Je vais m'en occuper !
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Je suis impatient de voir ça. Tenez les voilà. Je vous l'avais bien dit.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Ne gâchez pas tout.
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //Bon, ben bonne chance ! Faites-leur en voir.
	};

	AI_StopProcessInfos (self);
				
	Npc_ExchangeRoutine	(self,"MilComing"); 
	
	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))
	{
		Npc_ExchangeRoutine	(Rick,"MilComing");
		AI_ContinueRoutine (Rick);
	};
	if (Hlp_IsValidNpc (Rumbold))
	&& (!Npc_IsDead (Rumbold))
	{		
		Npc_ExchangeRoutine	(Rumbold,"MilComing"); 
		AI_ContinueRoutine (Rumbold);
	};
};
	
// ************************************************************
// 			  				Miliz weg 
// ************************************************************
var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZWEG_Condition;
	information	= DIA_Bengar_MILIZWEG_Info;
	permanent	= TRUE;
	description	= "Votre problème avec la milice est une affaire réglée.";
};

func int DIA_Bengar_MILIZWEG_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE)
	{
		if (Npc_IsDead (Rick) && Npc_IsDead (Rumbold))
		|| (Rumbold_Bezahlt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //Votre problème de milice appartient au passé.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Etes-vous fou ? Savez-vous ce qu'ils me feront quand vous serez parti ?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Ils traînent encore dans le coin. Dites-leur de disparaître complètement !
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //Pas mal. Peut-être qu'il nous restera quelque chose à la fin du mois pour changer. Merci.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Vous vouliez même payer pour moi. C'est très aimable à vous.
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
		};
		
		Bengar_MilSuccess = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	13;
	condition	 = 	DIA_Bengar_BALTHASAR_Condition;
	information	 = 	DIA_Bengar_BALTHASAR_Info;

	description	 = 	"Balthasar le berger n'a pas le droit de se rendre sur vos pâturages ?";
};

func int DIA_Bengar_BALTHASAR_Condition ()
{
	if 	(
		(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASAR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Balthasar le berger n'a pas le droit d'aller sur vos pâturages ?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //Ah oui ! Cette histoire. Je lui ai dit que Sékob devait me payer s'il voulait mener ses moutons sur mes pâturages.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Pour dire la vérité, c'est juste pour l'embêter. Je ne supporte pas Balthasar.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Si je veux persuader Bengar de laisser Balthasar retourner sur ses pâturages, je dois lui rendre un service. Je suis sûr qu'une occasion se présentera."); 
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	14;
	condition	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;

	description	 = 	"La milice est partie et Balthasar peut de nouveau se rendre sur vos terres.";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
		&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
		&& (Bengar_MilSuccess == TRUE)
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //La milice est partie et Balthasar peut de nouveau se rendre sur vos terres.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Pourquoi ?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(menaçant) Parce que j'en ai décidé ainsi.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Hum. Très bien, comme vous voulez.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //Qu'il trouve un endroit pour ses bêtes quelque part derrière les champs.

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	15;
	condition	 = 	DIA_Bengar_PERMKAP1_Condition;
	information	 = 	DIA_Bengar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Faites attention à vous.";
};

func int DIA_Bengar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3)
			{
					return TRUE;
			};
};

func void DIA_Bengar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Prenez soin de vous.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Vous aussi.

	AI_StopProcessInfos (self);
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

INSTANCE DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP3_EXIT_Condition;
	information	= DIA_Bengar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	30;
	condition	 = 	DIA_Bengar_ALLEIN_Condition;
	information	 = 	DIA_Bengar_ALLEIN_Info;

	description	 = 	"Comment ça se passe ?";
};

func int DIA_Bengar_ALLEIN_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_ALLEIN_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Où en est la situation ?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak a disparu avec tous ceux qui travaillaient pour moi et toutes nos affaires. Il a dit qu'il se dirigeait vers les montagnes.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Il ne supportait plus sa situation ici.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Les temps sont durs. Je ne sais pas encore combien de temps je pourrai tenir.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Les hordes de monstres qui se déversent par le col chaque jour dans les hauts pâturages m'inquiètent.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Si au moins j'avais un peu d'aide ou quelques mercenaires.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //Il y en avait un qui voulait bien m'aider mais il a changé d'avis. Je crois que son nom était Wolf.
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar est seul dans sa ferme. Son compagnon, Malak, est parti avec tous les autres. Bengar pense qu'il a fui vers les montagnes."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Désormais, sa ferme n'est plus protégée. Il a besoin d'aide. Il m'a parlé d'un mercenaire nommé Wolf. Est-ce que je ne connaîtrais pas ce type ?"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_MALAKTOT_Condition;
	information	 = 	DIA_Bengar_MALAKTOT_Info;

	description	 = 	"Malak est mort.";
};

func int DIA_Bengar_MALAKTOT_Condition ()
{
	if (Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKTOT_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak est mort.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //Alors la situation ne peut qu'empirer.
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_SLDDA_Condition;
	information	 = 	DIA_Bengar_SLDDA_Info;

	description	 = 	"Je vous ai dégoté le mercenaire que vous vouliez.";
};

func int DIA_Bengar_SLDDA_Condition ()
{
	if (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_SLDDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Je vous ai trouvé le mercenaire dont vous aviez besoin.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Je n'ai jamais vu quelqu'un comme lui ici. J'espère simplement que ça va marcher.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Tenez, prenez ceci. Je pense que cela vous sera utile.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	B_GivePlayerXP (XP_BengarsHelpingSLDArrived);
					
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	35;
	condition	 = 	DIA_Bengar_MALAKWIEDERDA_Condition;
	information	 = 	DIA_Bengar_MALAKWIEDERDA_Info;

	description	 = 	"Malak est de retour.";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition ()
{
	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS)||(NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak))==FALSE)

		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKWIEDERDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak est de retour.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Il était temps. J'ai bien cru que je ne le reverrais jamais.
	B_GivePlayerXP (XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	80;
	condition	 = 	DIA_Bengar_PERM_Condition;
	information	 = 	DIA_Bengar_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Tout ira bien.";
};

func int DIA_Bengar_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //Tout ira bien.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak est de retour mais la situation est toujours la même.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //A moins qu'il n'y ait un miracle, nous allons tous être balayés.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Wolf est un étrange individu mais je crois que ça va marcher.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Sans Malak, tout est laissé à l'abandon. S'il ne se passe pas quelque chose très vite, je vais devoir renoncer à ma ferme.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Heureusement, il reviendra bientôt.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"Start");
	B_StartOtherRoutine	(SLD_817_Soeldner,"Start");
	};
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

INSTANCE DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP4_EXIT_Condition;
	information	= DIA_Bengar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP5_EXIT_Condition;
	information	= DIA_Bengar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP5_EXIT_Info()
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


INSTANCE DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP6_EXIT_Condition;
	information	= DIA_Bengar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bengar_PICKPOCKET (C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 900;
	condition	= DIA_Bengar_PICKPOCKET_Condition;
	information	= DIA_Bengar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen (28, 50);
};
 
FUNC VOID DIA_Bengar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bengar_PICKPOCKET);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_BACK 		,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};
	
func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};



















































































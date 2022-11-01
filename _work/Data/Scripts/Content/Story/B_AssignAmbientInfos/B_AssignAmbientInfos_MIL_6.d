// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_6_EXIT_Condition;
	information	= DIA_MIL_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_6_JOIN_Condition;
	information	= DIA_MIL_6_JOIN_Info;
	permanent	= TRUE;
	description = "Que dois-je faire pour me joindre à la milice ?";
};                       

FUNC INT DIA_MIL_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Que dois-je faire pour m'engager dans la milice ?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Allez parler au seigneur André. Depuis que les paladins sont en ville, il commande la milice.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Vous pourrez le trouver dans la caserne. Il y est presque toujours.
	};
};

// *************************************************************************
// 						MissingPeople
// *************************************************************************
instance DIA_Addon_MIL_6_MissingPeople		(C_INFO)
{
	nr		 = 	2;
	condition	 = 	DIA_Addon_MIL_6_MissingPeople_Condition;
	information	 = 	DIA_Addon_MIL_6_MissingPeople_Info;
	permanent	= TRUE;
	description	 = 	"J'ai entendu dire que certains citoyens avaient disparu.";
};

func int DIA_Addon_MIL_6_MissingPeople_Condition ()
{
	if (Kapitel == 1)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_MIL_6_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //J'ai entendu dire que des citoyens avaient disparu.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //D'ailleurs, j'ai entendu beaucoup de rumeurs sur des disparitions, ces derniers temps.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //En revanche, je serais bien incapable de les expliquer.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Malheureusement, tout ce que nous pouvons faire est d'ouvrir les yeux et d'accomplir notre devoir de sentinelle.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_6_PEOPLE_Condition;
	information	= DIA_MIL_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Parlez-moi de ces paladins.";
};                       

FUNC INT DIA_MIL_6_PEOPLE_Condition()
{
	IF (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Parlez-moi de ces paladins.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Depuis que les paladins sont arrivés à Khorinis, ils se sont installés à l'autre bout de la ville, dans le haut quartier.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Ils ne laissent personne entrer sauf les citoyens de la ville et la milice, bien entendu.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Des paladins gardent également le navire au port. Mais ils ne sont pas très bavards.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_6_LOCATION_Condition;
	information	= DIA_MIL_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il à savoir au sujet de cette ville ?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Qu'y a-t-il à savoir au sujet de cette ville ?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Désormais les paladins contrôlent toute la ville. La milice est sous leurs ordres.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Le seigneur André commande la milice et fait office de juge.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Si vous deviez aller à l'encontre de la loi, c'est à lui que vous devrez en rendre compte.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Mais il se montre assez indulgent. Généralement, il se contente de donner des amendes.
	
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_6_STANDARD_Condition;
	information	= DIA_MIL_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //Dernièrement, on voit de plus en plus de racaille en ville.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Il y a de plus en plus de vols et le seigneur André pense qu'un gang en est responsable.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Il n'y pas très longtemps, on a fouillé le quartier du port de fond en comble mais nous n'avons encore rien trouvé.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Il semblerait que le problème des bandits soit presque réglé. Depuis peu, il n'y a presque plus de raids.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //C'est de pire en pire avec cette racaille en ville. La nuit dernière j'ai suivi un homme en robe noire dans le haut quartier de la ville.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Je suis sûr qu'il préparait un sale coup. Mais il a disparu à l'angle de la maison du gouverneur. C'était vraiment un étrange individu.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //On dit que le seigneur Hagen a engagé des mercenaires pour combattre les dragons. Je suis tout à fait d'accord, je ne voudrais pas avoir à combattre des dragons.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Ils disent que les dragons ont été vaincus ! Le seigneur Hagen rassemble ses forces pour repousser les dernières créatures de la Vallée des mines.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_6 (var c_NPC slf)
{
	DIA_MIL_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

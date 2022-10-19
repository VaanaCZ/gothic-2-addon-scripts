// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_12_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_12_EXIT_Condition;
	information	= DIA_PAL_12_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_12_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_12_JOIN_Condition;
	information	= DIA_PAL_12_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux devenir paladin !";
};                       

FUNC INT DIA_PAL_12_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //Je veux devenir paladin !
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Vous ? Ne me faites pas rire ! Vous n'êtes même pas membre de la garde de la ville.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //S'il n'était pas évident que vous êtes un péquenaud, je pourrais croire que vous voulez m'insulter.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Seuls les meilleurs parmi les fidèles du roi et de notre Seigneur Innos peuvent devenir des paladins.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_12_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_12_PEOPLE_Condition;
	information	= DIA_PAL_12_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_PAL_12_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //Qui commande ici ?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //C'est l'honorable seigneur Hagen. Mais le seigneur André s'occupe de tout ce qui concerne la populace.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Vous le trouverez à la caserne. Avec un peu de chance, il vous accordera quelques minutes de son précieux temps.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_12_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_12_LOCATION_Condition;
	information	= DIA_PAL_12_LOCATION_Info;
	permanent	= TRUE;
	description = "Que faites-vous à Khorinis ?";
};                       

FUNC INT DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Que faites-vous à Khorinis ?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Les gens qui posent ce genre de questions finissent pendus au gibet avant d'avoir eu le temps de dire ouf !
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //S'il est UNE chose que le seigneur André ne peut pas se permettre, c'est que des espions découvrent l'objectif de notre mission.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //Alors, faites attention aux questions que vous posez.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_12_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_12_STANDARD_Condition;
	information	= DIA_PAL_12_STANDARD_Info;
	permanent	= TRUE;
	description = "Comment ça se passe ?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //Comment ça se passe ?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Maintenant que nous savons que nous avons affaire à des dragons, notre commandant va bientôt agir.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Nous n'avons toujours pas de nouvelles de notre détachement dans la Vallée des mines. C'est très inquiétant.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //Grâces soient rendues à Innos ! La menace des dragons a été jugulée. Désormais nous n'avons plus qu'à nous occuper des orques pour accéder au minerai.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Vous ne comptez pas sérieusement que je réponde à cette question mon garçon !
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_12 (var c_NPC slf)
{
	DIA_PAL_12_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_4_EXIT_Condition;
	information	= DIA_PAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_4_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_4_JOIN_Condition;
	information	= DIA_PAL_4_JOIN_Info;
	permanent	= TRUE;
	description = "Comment faire pour devenir paladin ?";
};                       

FUNC INT DIA_PAL_4_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_JOIN_15_00"); //Comment faire pour devenir paladin ?
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_01"); //Si vous le voulez vraiment, vous devriez entrer au service des paladins.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_02"); //Allez parler au seigneur André dans la caserne et faites-vous engager par la milice.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_03"); //Vous aurez alors peut-être l'occasion de prouver votre valeur.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_4_PEOPLE_Condition;
	information	= DIA_PAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_PAL_4_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_PEOPLE_15_00"); //Qui commande ici ?
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_01"); //Le seigneur Hagen est le commandant en chef de toutes les troupes de l'île. Il occupe également le poste de gouverneur tant que nous serons ici.
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_02"); //Mais il est très occupé. Si vous avez besoin de quelque chose, allez parler au seigneur André dans la caserne.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_4_LOCATION_Condition;
	information	= DIA_PAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "Que faites-vous à Khorinis ?";
};                       

FUNC INT DIA_PAL_4_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_LOCATION_15_00"); //Que faites-vous à Khorinis ?
	AI_Output (self, other, "DIA_PAL_4_LOCATION_04_01"); //Je n'ai pas le droit de vous dire ça.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_4_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_4_STANDARD_Condition;
	information	= DIA_PAL_4_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};
                       
func INT DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_STANDARD_15_00"); //Quoi de neuf ?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_01"); //Maintenant que nous savons que nous avons affaire à des dragons, notre commandant va bientôt agir.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_02"); //Nous n'avons toujours pas de nouvelles de notre détachement dans la Vallée des mines. C'est très inquiétant.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_4_STANDARD_04_03"); //Grâces soient rendues à Innos ! La menace des dragons a été jugulée. Désormais nous n'avons plus qu'à nous occuper des orques pour accéder au minerai.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_4_STANDARD_04_04"); //Je n'ai pas le temps de m'occuper des rumeurs qui courent en ville.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_4 (var c_NPC slf)
{
	DIA_PAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

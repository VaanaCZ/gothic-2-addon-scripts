// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_6_EXIT_Condition;
	information	= DIA_SLD_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_6_JOIN_Condition;
	information	= DIA_SLD_6_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux me joindre à vous !";
};                       

FUNC INT DIA_SLD_6_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //Je veux me joindre à vous !
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_01"); //J'ai entendu parler de cette affaire concernant la milice. Torlof dit que vous avez passé le test. Vous aurez donc mon vote.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_02"); //Voler les fermiers est une chose mais se dresser contre la milice en est une autre. Mais si vous pouvez être utile à Onar, cela me va.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_03"); //Parlez à Torlof. Il vous fera voir... (rires)
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_6_PEOPLE_Condition;
	information	= DIA_SLD_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_SLD_6_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //Qui est le responsable ici ?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //La ferme appartient à Onar, si c'est ce que vous voulez savoir. Mais Lee est notre chef.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //Il était général dans l'armée royale. Mais il n'est plus aussi copain avec le roi. (rires)
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //Rappelez-vous son nom. Si vous avez des ennuis ici, il est certainement le seul qui pourra vous aider. Tous les autres voudront votre peau.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_6_LOCATION_Condition;
	information	= DIA_SLD_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Protégez-vous les fermiers ?";
};                       

FUNC INT DIA_SLD_6_LOCATION_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //Protégez-vous les fermiers ?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //Nous ne protégeons pas seulement la ferme d'Onar mais toute la vallée.
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_02"); //Onar veut que nous nous occupions de quiconque sème le désordre ici. Alors faites attention à ce que vous faites.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_6_STANDARD_Condition;
	information	= DIA_SLD_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il?";
};                       
func INT DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_01"); //Maintenant mon garçon, vous êtes l'un des nôtres !
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_02"); //Que voulez-vous ?
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_03"); //Quand j'ai entendu parler des dragons, j'ai eu du mal à le croire.
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_04"); //Un dragon ! Voilà ce que j'appelle un combat. Plus de moutons ou de milicien abruti mais un véritable adversaire.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_05"); //Alors, est-ce que le seigneur Hagen a déjà mouillé sa culotte par crainte des dragons ?
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_06"); //On dirait bien qu'en définitive, il va falloir qu'il bouge son noble postérieur et qu'il quitte la ville.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_07"); //Le seigneur Hagen peut s'estimer chanceux. Encore quelques jours et nous aurions été chercher nous-mêmes Bennet.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_08"); //S'ils ne libèrent pas très rapidement Bennet, on va aller le chercher nous-mêmes.
		};	
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_09"); //Qu'est-ce que vous faites encore ici ? N'êtes-vous pas parti vers la Vallée avec les autres ?
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_10"); //Je me fiche que vous reveniez.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_11"); //Vous devriez vous rendre dans la Vallée des mines. J'ai entendu dire que ces idiots avaient besoin de toute l'aide possible.
		};	
	};
	
	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_12"); //La première fois que vous êtes venu ici, je savais que vous alliez vous faire remarquer.
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_13"); //Mais, des dragons ? C'est quelque chose. C'est pas demain la veille que quelqu'un va vous provoquer.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_14"); //Je suis impressionné. Vous n'êtes pas dans le bon camp mais tuer des dragons ce n'est pas rien.
		};	
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_6 (var c_NPC slf)
{
	DIA_SLD_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

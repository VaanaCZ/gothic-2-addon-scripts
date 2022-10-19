// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "Comment dois-je m'y prendre pour devenir citoyen de Khorinis ?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //Que dois-je faire pour devenir citoyen de la ville ?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Vous voulez vous installer ici ? Alors que tout indique que la fin du monde est proche ?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Je ne compte pas rester pour toujours.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Si vous voulez un conseil, vous devriez ficher le camp d'ici tant que vous le pouvez encore. Mais si vous insistez, vous devriez parler à un des citoyens influents de la ville.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui sont les gens influents de Khorinis ?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Qui sont les personnages influents de Khorinis ?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Allez voir le forgeron ou le charpentier dans le bas quartier. Vous y trouverez également d'autres maîtres très respectés.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Si d'autres que les gardes ou les paladins ont voix au chapitre, c'est bien eux.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Comment puis-je m'orienter dans cette ville ?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Comment puis-je m'y retrouver en ville ?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Ce n'est pas si facile de s'y retrouver ici, n'est-ce pas ? Même les pancartes ne sont pas toujours utiles.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Si vous avez un mauvais sens de l'orientation, allez au port, si toutefois vous savez y aller, et rendez-vous chez le cartographe.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //C'est juste à côté du pub, sur le quai. Brahim aura certainement une carte de la ville.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Depuis qu'ils ont abattu la Barrière, la ville est envahie de bandits. Mais les paladins ne font rien. Qu'est-ce qu'ils viennent faire ici ?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Depuis peu, les bandits posent moins de problèmes. On dirait que quelqu'un a enfin pris les choses en main.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Ils ont laissé partir ce sale mercenaire qui a tué le paladin. On aurait mieux fait de le pendre.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //On dit qu'un des mercenaires d'Onar a tué un paladin. Ils l'ont arrêté et l'ont jeté en prison. Il sera bientôt pendu.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Je me demande s'il y a quelque chose de vrai dans ces histoires de dragons...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //On raconte que le seigneur Hagen rassemble ses hommes pour libérer la Vallée des mines. Les choses bougent enfin !
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

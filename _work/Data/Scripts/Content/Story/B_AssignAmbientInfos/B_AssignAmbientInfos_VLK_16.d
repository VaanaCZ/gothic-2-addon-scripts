// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_16_EXIT_Condition;
	information	= DIA_VLK_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_16_JOIN_Condition;
	information	= DIA_VLK_16_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux devenir citoyen de cette ville !";
};                       

FUNC INT DIA_VLK_16_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_16_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_JOIN_15_00"); //Je veux devenir citoyen de la ville !
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_01"); //Voulez-vous nous aider à défendre la ville contre les orques ?
	AI_Output (self, other, "DIA_VLK_16_JOIN_16_02"); //Si vous êtes citoyen de Khorinis, vous pouvez vous engager dans la milice. Demandez à un des gardes de la ville.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_16_PEOPLE_Condition;
	information	= DIA_VLK_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui sont les gens importants dans cette ville ?";
};                       

FUNC INT DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_PEOPLE_15_00"); //Qui sont les personnages les plus importants de la ville ?
	AI_Output (self, other, "DIA_VLK_16_PEOPLE_16_01"); //Les paladins tiennent le haut quartier.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_16_LOCATION_Condition;
	information	= DIA_VLK_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il d'intéressant à voir ici ?";
};                       

FUNC INT DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_LOCATION_15_00"); //Qu'y a-t-il d'intéressant à voir dans le coin ?
	AI_Output (self, other, "DIA_VLK_16_LOCATION_16_01"); //Il y a plein de marchandises sur les étals du marché.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_16_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_16_STANDARD_Condition;
	information	= DIA_VLK_16_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_16_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_00"); //J'espère que la milice découvrira enfin pourquoi la population de Khorinis diminue aussi rapidement.
		AI_Output (self,other,"DIA_Addon_VLK_16_STANDARD_16_01"); //Difficile de ne pas avoir peur lorsqu'on sait que tant de personnes ont disparu sans laisser de traces.
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
		SC_HearedAboutMissingPeople = TRUE;
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_01"); //Avez-vous entendu ? On a aperçu des orques aux abords de la ville. Espérons que les paladins auront assez d'hommes.
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_02"); //Je me demande si c'est pour ça que les fermiers ne viennent plus au marché.
	};
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_03"); //Le mercenaire accusé d'avoir tué Lothar est innocent. Ils ont découvert la preuve que c'était un coup monté. J'ai entendu ça au marché.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_04"); //C'est une honte. Les mercenaires du propriétaire terrien ont assassiné l'honorable Lothar en pleine rue.
			AI_Output (self,other,"DIA_VLK_16_STANDARD_16_05"); //Mais ils seront punis par Innos en personne. Nul n'a le droit de lever la main contre un combattant de notre Seigneur.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_06"); //J'ai entendu dire que les criminels fuyaient la ferme d'Onar. On raconte que par crainte des hommes du seigneur Hagen, ils vont se réfugier dans la Vallée des mines.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_16_STANDARD_16_07"); //J'ai entendu dire qu'un groupe de paladins avait réussi à vaincre ces horribles dragons de la Vallée des mines.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_16 (var c_NPC slf)
{
	DIA_VLK_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_16_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

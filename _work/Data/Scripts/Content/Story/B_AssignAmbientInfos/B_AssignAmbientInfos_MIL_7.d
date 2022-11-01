// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_7_EXIT_Condition;
	information	= DIA_MIL_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_7_JOIN_Condition;
	information	= DIA_MIL_7_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux me joindre à la milice !";
};                       

FUNC INT DIA_MIL_7_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_JOIN_15_00"); //Je veux m'engager dans la milice !
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_01"); //Vous n'êtes même pas citoyen de la ville de Khorinis ! Pourquoi croyez-vous que le seigneur André vous acceptera ?
		AI_Output (self, other, "DIA_MIL_7_JOIN_07_02"); //N'importe qui peut venir, prendre une arme et une armure puis disparaître avec !
		
		if (C_NpcIsInQuarter (self) != Q_KASERNE)
		{
			AI_Output (other, self, "DIA_MIL_7_JOIN_15_03"); //Mais je suis sérieux !
			AI_Output (self, other, "DIA_MIL_7_JOIN_07_04"); //C'est pas à moi qu'il faut expliquer ça mais au seigneur André. Vous le trouverez dans la caserne.
		};
	}
	else
	{
		B_Say (self, other, "$ABS_GOOD");
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_7_PEOPLE_Condition;
	information	= DIA_MIL_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Que savez-vous au sujet des paladins ?";
};                       

FUNC INT DIA_MIL_7_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_PEOPLE_15_00"); //Que savez-vous au sujet des paladins ?
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_01"); //Pas grand-chose. Personne ne sait exactement pourquoi ils sont ici. Pas même nous autres de la garde.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_02"); //Ils ont pris le contrôle de la ville, chassé le gouverneur de la salle du conseil et relevé le juge de ses fonctions.
	AI_Output (self, other, "DIA_MIL_7_PEOPLE_07_03"); //Si vous voulez mon avis, c'est une bonne chose. Ces imbéciles pompeux avaient bien besoin d'une leçon d'humilité.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_7_LOCATION_Condition;
	information	= DIA_MIL_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Que puis-je faire en ville ?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_LOCATION_15_00"); //Que puis-je faire en ville ?
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_01"); //Si vous ne voulez pas finir dans un caniveau du quartier du port, trouvez un travail. Renseignez-vous dans le bas quartier de la ville, vous aurez peut-être de la chance.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_02"); //Si vous comptez rester longtemps en ville, vous devriez rejoindre la milice ou, au moins, vous entraîner au combat.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_03"); //Les instructeurs de la caserne entraînent également les civils.
	AI_Output (self, other, "DIA_MIL_7_LOCATION_07_04"); //Les orques vont bientôt venir et là, vous ne regretterez pas chaque heure passée à l'entraînement.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_7_STANDARD_Condition;
	information	= DIA_MIL_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_7_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random (2);
		if (randy == 0)
		{
			AI_Output (self,other,"DIA_Addon_MIL_7_STANDARD_07_00"); //Les citoyens disparaissent de la ville les uns après les autres. A ce jour, nous sommes incapables de dire ce qu'ils sont devenus. Est-ce que ça pourrait être un coup des orques ?
			
			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
			};
			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{		
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_01"); //Ils disent que les fermiers se sont rebellés. On a vraiment pas besoin de ce genre de problème en plein milieu d'une guerre avec les orques !
		};
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_02"); //Il est temps que les paladins mettent un terme à la rébellion des fermiers. Ceux qui enfreignent la loi doivent être punis surtout quand nous sommes en guerre.
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_03"); //Il paraît que le mercenaire accusé de meurtre est innocent. Quelqu'un a trouvé la preuve qu'il a été victime d'un coup monté.
		}
		else
		{
			AI_Output (self,other,"DIA_MIL_7_STANDARD_07_04"); //Un des mercenaires d'Onar a assassiné l'honorable paladin Lothar. Mais ce bâtard s'est fait prendre et a été jeté en prison.
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_05"); //Des mercenaires ont déjà quitté la ferme d'Onar. Certains problèmes se résolvent d'eux-mêmes.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_7_STANDARD_07_06"); //Les dragons sont vaincus, mais ce n'est pas terminé. C'est au tour des orques. On va faire le ménage !
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_7 (var c_NPC slf)
{
	DIA_MIL_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

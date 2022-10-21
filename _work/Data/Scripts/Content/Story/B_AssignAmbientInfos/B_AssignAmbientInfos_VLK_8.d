// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_8_EXIT_Condition;
	information	= DIA_VLK_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_8_JOIN_Condition;
	information	= DIA_VLK_8_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux devenir citoyen de cette ville !";
};                       

FUNC INT DIA_VLK_8_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_JOIN_15_00"); //Je veux devenir citoyen de la ville !
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_01"); //Et pourquoi me dites-vous ça ? Allez voir un des maîtres artisans dans le bas quartier de la ville. Si vous avez de la chance, l'un d'eux aura besoin d'un apprenti.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_02"); //Sinon, vous devrez aller voir le gouverneur pour être enregistré comme citoyen.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_03"); //Mais, pour l'instant, ce n'est même pas la peine d'y penser. Le gouverneur a perdu son poste depuis l'arrivée des paladins.
	AI_Output (self, other, "DIA_VLK_8_JOIN_08_04"); //Et il est certain que leur chef, le seigneur Hagen, n'aura pas le temps de s'occuper de ça.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_8_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_8_PEOPLE_Condition;
	information	= DIA_VLK_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui sont les gens les plus importants dans cette ville ?";
};                       

FUNC INT DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_PEOPLE_15_00"); //Qui sont les citoyens les plus importants de la ville ?
	AI_Output (self, other, "DIA_VLK_8_PEOPLE_08_01"); //A part les paladins... les maîtres artisans du bas quartier. Ils ont tous une grande importance.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_8_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_8_LOCATION_Condition;
	information	= DIA_VLK_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il d'intéressant à voir ici ?";
};                       

FUNC INT DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_LOCATION_15_00"); //Qu'y a-t-il d'intéressant à voir dans le coin ?
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_01"); //Le grand navire à bord duquel les paladins sont arrivés se trouve au port. Il est énorme ! Vous devriez allez jeter un coup d'œil.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_02"); //Mais je doute qu'ils vous laissent monter à bord. Les paladins gardent le navire comme si c'était les bijoux de la couronne.
	AI_Output (self, other, "DIA_VLK_8_LOCATION_08_03"); //Ce n'est pas étonnant. C'est également le seul navire digne de ce nom à des lieues à la ronde.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_8_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_8_STANDARD_Condition;
	information	= DIA_VLK_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_8_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_00"); //Tout le monde est très inquiet, en ce moment.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_01"); //Comme si l'invasion de la ville par les paladins ne suffisait pas, des personnes disparaissent sans cesse de la manière la plus étrange qui soit.
		AI_Output (self,other,"DIA_Addon_VLK_8_STANDARD_08_02"); //Il serait vraiment temps que la milice réagisse à ce sujet !
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
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_01"); //Tout le monde attend que les paladins disent pourquoi ils sont là. Je crois que c'est à cause des orques. Ils vont bientôt attaquer !
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_02"); //Les paladins ont beau être bénis par Innos, on n'y coupera pas quand les orques vont débarquer.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_03"); //Il paraît que les paladins ne sont ici que pour récupérer tout le minerai de l'île. Ils disent que c'est pour la guerre sur le continent.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_04"); //Savez-vous ce que cela signifie ? Le roi se fiche éperdument que nous mourions tous quand les orques attaqueront.
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_05"); //Je ferai en sorte d'être à bord du navire quand les paladins lèveront l'ancre.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_06"); //Ils disent que les orques viennent ici à dos de dragons qui sont aussi gros que la moitié de la ville ! On n'a aucune chance !
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_8_STANDARD_08_07"); //Les gens disent que les dragons ont été vaincus. Se peut-il que ce soit vrai ?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_8 (var c_NPC slf)
{
	DIA_VLK_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

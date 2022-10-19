// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_1_EXIT_Condition;
	information	= DIA_OCVLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************

INSTANCE DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_1_PEOPLE_Condition;
	information	= DIA_OCVLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_OCVLK_1_PEOPLE_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_PEOPLE_15_00"); //Qui commande ici ?
	AI_Output (self, other, "DIA_OCVLK_1_PEOPLE_01_01"); //Le commandant Garond. Mais comme la situation n'a fait qu'empirer, cela fait longtemps qu'il n'a pas quitté la salle du trône. J'ai peur que tout cela se termine mal.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_1_LOCATION_Condition;
	information	= DIA_OCVLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Que savez-vous au sujet de la Vallée des mines ?";
};                       

FUNC INT DIA_OCVLK_1_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_LOCATION_15_00"); //Que savez-vous au sujet de la Vallée des mines ?
	AI_Output (self, other, "DIA_OCVLK_1_LOCATION_01_01"); //A ma connaissance, nous avons encore des hommes qui prospectent dans les mines.
	AI_Output (self, other, "DIA_OCVLK_1_LOCATION_01_02"); //Je n'aimerais pas être à leur place. Toute la vallée est infestée d'orques, sans parler des dragons.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_1_STANDARD_Condition;
	information	= DIA_OCVLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Comment ça se passe ?";
};                       
func INT DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_STANDARD_15_00"); //Comment ça se passe ?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_01"); //Les orques nous ont acculés là où ils le voulaient ! Sans renforts, aucun de nous ne survivra ! Je n'en reviens pas que les dragons ne nous aient pas tous tués.
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_02"); //Au moins, nous allons avoir des renforts.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_03"); //J'ai entendu dire que tous les dragons avaient été tués ? Qu'Innos soit loué !
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_04"); //Ce maudit minerai. Nous devrions jeter par-dessus les remparts toutes nos réserves. Peut-être que les orques nous laisseraient en paix.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_05"); //Ces caisses ridicules qu'ils ont empilées devant l'entrée ne ralentiront même pas les orques !
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_1 (var c_NPC slf)
{
	DIA_OCVLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_PEOPLE.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_17_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_17_EXIT_Condition;
	information	= DIA_VLK_17_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_17_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_17_JOIN_Condition;
	information	= DIA_VLK_17_JOIN_Info;
	permanent	= TRUE;
	description = "Que dois-je faire pour devenir citoyen de cette ville ?";
};                       

FUNC INT DIA_VLK_17_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_17_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //Que dois-je faire pour devenir citoyen de la ville ?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //Les ma�tres artisans du bas quartier ont une grande influence � Khorinis. Vous devriez aller parler � l'un d'eux.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_17_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_17_PEOPLE_Condition;
	information	= DIA_VLK_17_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui sont les gens les plus importants de cette ville ?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //Qui sont les personnalit�s les plus importantes de la ville ?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Depuis que les paladins sont arriv�s, ils ont pris le contr�le de toute la ville.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Le seigneur Andr� repr�sente la loi. Vous le trouverez dans la caserne.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Mais vous devez vous pr�senter devant lui uniquement si vous avez enfreint la loi ou si vous voulez vous engager dans la milice.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_17_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_17_LOCATION_Condition;
	information	= DIA_VLK_17_LOCATION_Info;
	permanent	= TRUE;
	description = "Quels sont les endroits les plus int�ressants de Khorinis ?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //Quels sont les endroits les plus int�ressants de Khorinis ?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(rires) Vous feriez mieux de demander �a � un homme. Si vous voulez vous divertir, essayez le port.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Mais si vous voulez acheter quelque chose, allez sur la place du march� ou dans le bas quartier.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_17_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_17_STANDARD_Condition;
	information	= DIA_VLK_17_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Je me demande ce que viennent faire ici les paladins. Ils contr�lent l'h�tel de ville, la caserne et le port mais, pour l'instant, ils n'ont rien fait.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //S'ils �taient ici pour les bandits ou les orques, ils auraient d�j� agi. Il doit y avoir une autre raison...
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //Je viens de comprendre ce que viennent faire les paladins. Cela concerne le minerai. Ils feraient mieux de prot�ger la ville.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //J'esp�re que ces histoires de dragons sont vraies. Comme �a le seigneur Hagen sera oblig� d'agir. Il est impossible qu'il nous livre � ces cr�atures.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Maintenant que les dragons sont morts, les paladins ne vont faire qu'une bouch�e de la racaille qui reste.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_17 (var c_NPC slf)
{
	DIA_VLK_17_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

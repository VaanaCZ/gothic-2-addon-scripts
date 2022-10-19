// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_1_EXIT_Condition;
	information	= DIA_VLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_1_JOIN_Condition;
	information	= DIA_VLK_1_JOIN_Info;
	permanent	= TRUE;
	description = "Comment puis-je devenir citoyen de la ville ?";
};                       

FUNC INT DIA_VLK_1_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //Comment puis-je devenir citoyen de la ville ?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Allez trouver un travail respectable ! Ceux qui ont un emploi stable � Khorinis sont consid�r�s comme des citoyens.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_1_PEOPLE_Condition;
	information	= DIA_VLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui sont les gens importants ici ?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //Qui sont les personnages importants ici ?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(rires) Jusqu'� r�cemment, c'�taient le gouverneur et le juge. Puis les paladins sont arriv�s et ont pris possession de la ville.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Le seigneur Hagen est leur chef. Il est plus ou moins le nouveau gouverneur.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Le seigneur Andr� est son bras droit. Il dirige la garde de la ville et fait office de juge.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Quiconque en ville est coupable d'un crime quelconque en r�pond devant lui.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_1_LOCATION_Condition;
	information	= DIA_VLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il d'int�ressant dans cette ville ?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Qu'y a-t-il d'int�ressant en ville ?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Vous pouvez y acheter presque tout ce que vous pouvez imaginer, soit aupr�s des marchands sur la place du march� soit dans le bas quartier de la ville.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Mais tout ce que vous voudrez acheter co�te cher.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Si vous n'avez pas assez d'argent, Lehmar le pr�teur sur gages pourra peut-�tre vous aider. Sa demeure se trouve � l'entr�e du quartier du port en venant du bas quartier.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_1_STANDARD_Condition;
	information	= DIA_VLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Depuis l'effondrement de la Barri�re, le commerce avec les fermiers a cess� brusquement. Qui sait ce qu'ils pr�parent. Il y a quelque chose qui sent mauvais dans cette affaire.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar va trop loin. Il refuse toujours d'alimenter la ville. Si la milice n'intervient pas bient�t, les autres fermiers vont �galement n'en faire qu'� leur t�te.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //J'ai entendu dire que les bandits s'�taient alli�s � des magiciens. De puissants magiciens en robe noire. Je suis presque s�r d'en avoir aper�u un en ville la nuit derni�re.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //J'ai entendu dire que des mercenaires � la solde d'Onar �taient partis pour tuer les dragons. Ils font enfin quelque chose d'utile.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //Ils disent que les dragons ont �t� vaincus ! Le seigneur Hagen rassemble ses forces pour d�barrasser la Vall�e des mines des derni�res cr�atures.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_1 (var c_NPC slf)
{
	DIA_VLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

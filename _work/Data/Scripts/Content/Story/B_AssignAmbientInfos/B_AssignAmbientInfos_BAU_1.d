// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Dites-m'en plus sur ces mercenaires.";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Dites-m'en plus au sujet des mercenaires.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Tout ce que je peux vous conseiller, c'est de les éviter.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Si votre tête ne revient pas à l'un d'entre eux, il peut vous casser la figure.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Après, vous pouvez vous plaindre à Lee, mais vous aurez toujours le nez cassé.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_PEOPLE_15_00"); //Qui est le responsable ici ?
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_01"); //C'est la ferme d'Onar. C'est lui qui prend toutes les décisions ici.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Laissez-moi vous donner un conseil : ne provoquez pas un combat avec ses mercenaires. Il vaut mieux ne pas se frotter à eux.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //Sylvio, en particulier, est un gredin sournois. Mais leur chef, Lee, est réglo.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Alors qu'est-ce qu'il y a dans le coin ?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_LOCATION_15_00"); //Qu'y a-t-il dans la région ?
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Juste des champs et des fermes. Et un groupe de mercenaires. Mais ils sont presque tous à l'est, dans la ferme d'Onar.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //La ferme de Sékob est au nord mais ils ne s'y rendent que pour encaisser le loyer.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //Vous trouverez la piste qui mène à la ferme de Bengar vers le sud-ouest.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_1_STANDARD_Condition;
	information	= DIA_BAU_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Onar a engagé des mercenaires pour se débarrasser des miliciens de la ville. Sinon, ils nous prendraient jusqu'à notre dernier mouton !
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Pas grand-chose. Toujours la même chose. La milice, les orques et les fléaux des champs.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Il se passe des choses étranges ici. Il y a quelques nuits, j'ai aperçu une silhouette sombre. Elle n'avait rien d'humain.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //On voit de plus en plus souvent des orques. Des fois, j'ai l'impression que lorsque l'un d'eux meurt, deux autres prennent sa place.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //Les paladins se rendent dans la Vallée des mines. Qu'est-ce que cela signifie ? Il ne va plus rester personne pour contenir la milice.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

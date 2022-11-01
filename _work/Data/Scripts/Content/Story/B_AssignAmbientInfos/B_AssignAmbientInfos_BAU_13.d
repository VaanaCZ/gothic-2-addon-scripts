// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Dites-m'en plus sur ces mercenaires !";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //Dites-m'en plus au sujet des mercenaires !
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Si vous avez des ennuis avec eux, allez voir Lee. C'est ce que, nous autres les fermiers, nous faisons. Il est assez ferme avec les siens.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Si l'un d'eux se comporte mal, il lui en fait voir.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //Qui est le responsable ici ?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Si vous voulez mon avis, ce sont les mercenaires. Bien sûr, ils sont payés par Onar mais Innos seul sait combien de temps ils lui obéiront.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //Si jamais ils estiment qu'il ne leur est plus utile, je n'aimerais pas être à sa place.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Que pouvez-vous me dire sur cet endroit ?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Que pouvez-vous me dire sur cette région ?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //Il y a trois fermes dans le coin. Celle d'Onar à l'est et celle de Sékob à l'extrémité nord de la vallée.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //Il y a une piste au sud-ouest qui mène à la haute plaine. C'est là que se trouve la ferme de Bengar.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_13_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_13_STANDARD_Condition;
	information	= DIA_BAU_13_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Les troupes de la ville ne confisquent plus notre bétail et nos récoltes ! Ils ne veulent plus jouer à ça maintenant que nous pouvons nous défendre !
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Les paladins de la ville ne se soucient pas de nous. Si les orques attaquent, on est seuls.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //Des dragons ! On raconte qu'il y a des dragons dans la Vallée des mines. Ils vont bientôt franchir le col !
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //On dit même que des bandits des montagnes se dirigent vers la Vallée des mines. Ça devient bien trop dangereux pour moi.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Quand les taxes baisseront et que nous serons payés convenablement pour notre travail, on pourra de nouveau commercer avec la ville.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

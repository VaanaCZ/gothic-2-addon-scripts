// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_6_EXIT_Condition;
	information	= DIA_OCVLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_6_PEOPLE_Condition;
	information	= DIA_OCVLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //Qui est le responsable ici ?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Garond commande tout le fort ou plutôt ce qu'il en reste.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Mais il ne s'occupe presque de rien sauf quand l'un des siens a des ennuis.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Si vous voulez de l'équipement, allez voir Engor dans la maison en face de celle de Garond.
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_6_LOCATION_Condition;
	information	= DIA_OCVLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Que pouvez-vous me dire sur la situation dans la Vallée des mines ?";
};                       

FUNC INT DIA_OCVLK_6_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //Que pouvez-vous me dire sur la situation dans la Vallée des mines ?
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Le mur d'enceinte des orques me préoccupe. Je ne veux même pas savoir ce que les orques cachent derrière.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //Au début, ils n'étaient que quelques-uns. Ils ont construit ce mur. Puis, une nuit, les engins de siège sont arrivés.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Nous avons eu de la chance et nous avons pu repousser l'attaque.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //Derrière le mur s'étend la mer. Si d'autres navires arrivent avec plus d'orques, nous n'aurons pas la moindre chance.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_6_STANDARD_Condition;
	information	= DIA_OCVLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Comment ça va ?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //Comment ça se passe ?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Engagez-vous, engagez-vous qu'ils disaient... Et maintenant regardez-moi ça.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //On n'a même plus le droit de s'approcher des réserves de vivres sous peine de mort. Garond semble craindre qu'on pille les vivres pour se barrer d'ici. (rire amer)
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //On va tous mourir de faim si ces foutus dragons ne nous tuent pas d'abord !
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //Des chasseurs de dragons. Ne me faites pas rire ! Ils n'ont pas l'ombre d'une chance.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //Ils disent que tous les dragons ont été tués ! On a une chance maintenant !
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Ce maudit minerai. Nous devrions jeter par-dessus les remparts toutes nos réserves. Peut-être que les orques nous laisseraient en paix.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //Ces caisses ridicules qu'ils ont empilées devant l'entrée ne ralentiront même pas les orques !
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_6 (var c_NPC slf)
{
	DIA_OCVLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

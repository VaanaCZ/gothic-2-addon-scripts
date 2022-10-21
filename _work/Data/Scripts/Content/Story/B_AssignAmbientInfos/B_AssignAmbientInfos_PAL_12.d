// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_12_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_12_EXIT_Condition;
	information	= DIA_PAL_12_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_12_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_12_JOIN_Condition;
	information	= DIA_PAL_12_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux devenir paladin !";
};                       

FUNC INT DIA_PAL_12_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //Je veux devenir paladin !
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Vous ? Ne me faites pas rire ! Vous n'�tes m�me pas membre de la garde de la ville.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //S'il n'�tait pas �vident que vous �tes un p�quenaud, je pourrais croire que vous voulez m'insulter.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Seuls les meilleurs parmi les fid�les du roi et de notre Seigneur Innos peuvent devenir des paladins.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_12_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_12_PEOPLE_Condition;
	information	= DIA_PAL_12_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_PAL_12_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //Qui commande ici ?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //C'est l'honorable seigneur Hagen. Mais le seigneur Andr� s'occupe de tout ce qui concerne la populace.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Vous le trouverez � la caserne. Avec un peu de chance, il vous accordera quelques minutes de son pr�cieux temps.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_12_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_12_LOCATION_Condition;
	information	= DIA_PAL_12_LOCATION_Info;
	permanent	= TRUE;
	description = "Que faites-vous � Khorinis ?";
};                       

FUNC INT DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Que faites-vous � Khorinis ?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Les gens qui posent ce genre de questions finissent pendus au gibet avant d'avoir eu le temps de dire ouf !
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //S'il est UNE chose que le seigneur Andr� ne peut pas se permettre, c'est que des espions d�couvrent l'objectif de notre mission.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //Alors, faites attention aux questions que vous posez.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_12_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_12_STANDARD_Condition;
	information	= DIA_PAL_12_STANDARD_Info;
	permanent	= TRUE;
	description = "Comment �a se passe ?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //Comment �a se passe ?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Maintenant que nous savons que nous avons affaire � des dragons, notre commandant va bient�t agir.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Nous n'avons toujours pas de nouvelles de notre d�tachement dans la Vall�e des mines. C'est tr�s inqui�tant.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //Gr�ces soient rendues � Innos ! La menace des dragons a �t� jugul�e. D�sormais nous n'avons plus qu'� nous occuper des orques pour acc�der au minerai.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Vous ne comptez pas s�rieusement que je r�ponde � cette question mon gar�on !
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_12 (var c_NPC slf)
{
	DIA_PAL_12_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

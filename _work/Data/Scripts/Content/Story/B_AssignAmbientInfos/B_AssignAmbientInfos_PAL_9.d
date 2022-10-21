// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_9_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_9_EXIT_Condition;
	information	= DIA_PAL_9_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_9_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_9_JOIN_Condition;
	information	= DIA_PAL_9_JOIN_Info;
	permanent	= TRUE;
	description = "Comment puis-je devenir paladin ?";
};                       

FUNC INT DIA_PAL_9_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_JOIN_15_00"); //Comment puis-je devenir paladin ?
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_01"); //Ceux qui prouvent leur valeur au service d'Innos ou � celui du roi seront choisis !
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_02"); //En r�sum� : seuls les meilleurs seront choisis. Mais VOUS avez un long chemin � faire pour y parvenir mon gar�on !
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_9_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_9_PEOPLE_Condition;
	information	= DIA_PAL_9_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_PAL_9_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_00"); //Qui commande ici ?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_01"); //Le seigneur Hagen.
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_02"); //Et ?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_03"); //Et personne d'autre. Le seigneur Hagen est le commandant supr�me de toute l'�le.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_9_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_9_LOCATION_Condition;
	information	= DIA_PAL_9_LOCATION_Info;
	permanent	= TRUE;
	description = "Pourquoi �tes-vous venus � Khorinis ?";
};                       

FUNC INT DIA_PAL_9_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_LOCATION_15_00"); //Pourquoi �tes-vous venus � Khorinis ?
	AI_Output (self, other, "DIA_PAL_9_LOCATION_09_01"); //Cela ne vous regarde pas, mon gars ! Contentez-vous de savoir que nous sommes au service d'Innos et du roi !
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_9_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_9_STANDARD_Condition;
	information	= DIA_PAL_9_STANDARD_Info;
	permanent	= TRUE;
	description = "Qu'y a-t-il?";
};
                       
func INT DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_STANDARD_15_00"); //Quoi de neuf ?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_01"); //Maintenant que nous savons que nous avons affaire � des dragons, notre commandant va bient�t agir.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_02"); //Nous n'avons toujours pas de nouvelles de notre d�tachement dans la Vall�e des mines. C'est tr�s inqui�tant.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_9_STANDARD_09_03"); //Gr�ces soient rendues � Innos ! La menace des dragons a �t� jugul�e. D�sormais nous n'avons plus qu'� nous occuper des orques pour acc�der au minerai.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_9_STANDARD_09_04"); //Si vous n'avez rien de plus important � dire, alors allez-vous-en, voyou !
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_9 (var c_NPC slf)
{
	DIA_PAL_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_9_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_9_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

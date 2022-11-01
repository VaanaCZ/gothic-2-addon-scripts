// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_4_EXIT_Condition;
	information	= DIA_PAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_4_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_4_JOIN_Condition;
	information	= DIA_PAL_4_JOIN_Info;
	permanent	= TRUE;
	description = "Jak bych se mohl stát paladinem?";
};                       

FUNC INT DIA_PAL_4_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_JOIN_15_00"); //Jak bych se mohl stát paladinem?
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_01"); //Pokud to myslíš vážně, měl bys nejprve vstoupit do jejich služeb.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_02"); //Zajdi do kasáren a promluv si s lordem Andrem. Nech se přijmout k domobraně.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_03"); //Pak možná dostaneš šanci ukázat, co v tobě vězí.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_4_PEOPLE_Condition;
	information	= DIA_PAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tomu tady velí?";
};                       

FUNC INT DIA_PAL_4_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_PEOPLE_15_00"); //Kdo tomu tady velí?
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_01"); //Velitelem všech jednotek na ostrově je lord Hagen. Ten také po celou dobu naší přítomnosti ve městě zastává úřad místodržícího.
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_02"); //Ale je velmi zaneprázdněný. Pokud potřebuješ něco zařídit, zajdi do kasáren za lordem Andrem.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_4_LOCATION_Condition;
	information	= DIA_PAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "Co vy paladinové děláte tady v Khorinidu?";
};                       

FUNC INT DIA_PAL_4_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_LOCATION_15_00"); //Co děláte vy, paladinové, tady v Khorinidu?
	AI_Output (self, other, "DIA_PAL_4_LOCATION_04_01"); //To ti nemůžu říct.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_4_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_4_STANDARD_Condition;
	information	= DIA_PAL_4_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};
                       
func INT DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_STANDARD_15_00"); //Co je nového?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_01"); //Teď když víme, že máme co do činění s draky, začne náš velitel určitě brzy něco dělat.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_02"); //Ještě stále nemáme žádné zprávy od našich mužů z Hornického údolí. To je velmi znepokojivé.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_4_STANDARD_04_03"); //Díky Innosovi! Dračí hrozba byla zažehnána. Teď už se musíme jen vypořádat s těmi skřety a cesta k rudě je volná.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_4_STANDARD_04_04"); //Nemám čas zabývat se každým drbem, co se po městě šíří.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_4 (var c_NPC slf)
{
	DIA_PAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

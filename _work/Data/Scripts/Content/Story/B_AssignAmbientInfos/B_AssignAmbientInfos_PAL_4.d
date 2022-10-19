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
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_01"); //Pokud to myslíš vážnê, mêl bys nejprve vstoupit do jejich služeb.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_02"); //Zajdi do kasáren a promluv si s lordem Andrem. Nech se pâijmout k domobranê.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_03"); //Pak možná dostaneš šanci ukázat, co v tobê vêzí.
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
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_01"); //Velitelem všech jednotek na ostrovê je lord Hagen. Ten také po celou dobu naší pâítomnosti ve mêstê zastává úâad místodržícího.
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_02"); //Ale je velmi zaneprázdnêný. Pokud potâebuješ nêco zaâídit, zajdi do kasáren za lordem Andrem.
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
	description = "Co vy paladinové dêláte tady v Khorinidu?";
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
	AI_Output (other, self, "DIA_PAL_4_LOCATION_15_00"); //Co dêláte vy, paladinové, tady v Khorinidu?
	AI_Output (self, other, "DIA_PAL_4_LOCATION_04_01"); //To ti nemùžu âíct.
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
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_01"); //Teë když víme, že máme co do èinêní s draky, zaène náš velitel urèitê brzy nêco dêlat.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_02"); //Ještê stále nemáme žádné zprávy od našich mužù z Hornického údolí. To je velmi znepokojivé.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_4_STANDARD_04_03"); //Díky Innosovi! Draèí hrozba byla zažehnána. Teë už se musíme jen vypoâádat s têmi skâety a cesta k rudê je volná.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_4_STANDARD_04_04"); //Nemám èas zabývat se každým drbem, co se po mêstê šíâí.
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

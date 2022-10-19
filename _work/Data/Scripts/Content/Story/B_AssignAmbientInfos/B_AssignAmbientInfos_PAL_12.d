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
	description = "Chci se stát paladinem!";
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
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //Chci se stát paladinem!
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Ty? Nenech se vysmát! Ještê nejsi ani èlenem mêstských stráží.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //Kdybych nevidêl, jakej seš tupej buran, musel bych si myslet, že ses mê pokusil urazit.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Pouze ti nejlepší z nejlepších vêrných následovníkù krále a našeho Pána Innose se mohou stát paladiny.
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
	description = "Kdo tomu tady velí?";
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
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //Kdo tomu tady velí?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //Ctihodný lord Hagen. Ale vše, co se týká prostého lidu, má na starosti lord Andre.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Najdeš ho v kasárnách. Možná budeš mít štêstí a vênuje ti pár minut svého drahocenného èasu.
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
	description = "Co vy paladinové dêláte tady v Khorinidu?";
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
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Co vy paladinové dêláte tady v Khorinidu?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Lidi, co mají takovéhle otázky, vêtšinou skonèí na šibenici dâív, než si toho staèí všimnout.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //Jestli lord Andre nêco nesnese, tak je to právê vêdomí, že naše poslání bylo vyzrazeno.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //No, mêl by sis dávat vêtší pozor, na co se ptáš.
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
	description = "Jak se vede?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //Jak se vede?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Teë když víme, že máme co do èinêní s draky, zaène náš velitel urèitê brzy nêco dêlat.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Ještê stále nemáme žádné zprávy od našich mužù z Hornického údolí. To je velmi znepokojivé.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //Díky Innosovi! Draèí hrozba byla zažehnána. Teë už se musíme jen vypoâádat s têmi skâety a cesta k rudê je volná.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Ty ve skuteènosti nechceš, abych ti na tu otázku odpovêdêl, hochu!
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

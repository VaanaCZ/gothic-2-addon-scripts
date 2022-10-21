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
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Ty? Nenech se vysmát! Ještì nejsi ani èlenem mìstských stráží.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //Kdybych nevidìl, jakej seš tupej buran, musel bych si myslet, že ses mì pokusil urazit.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Pouze ti nejlepší z nejlepších vìrných následovníkù krále a našeho Pána Innose se mohou stát paladiny.
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
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Najdeš ho v kasárnách. Možná budeš mít štìstí a vìnuje ti pár minut svého drahocenného èasu.
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
	description = "Co vy paladinové dìláte tady v Khorinidu?";
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
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Co vy paladinové dìláte tady v Khorinidu?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Lidi, co mají takovéhle otázky, vìtšinou skonèí na šibenici døív, než si toho staèí všimnout.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //Jestli lord Andre nìco nesnese, tak je to právì vìdomí, že naše poslání bylo vyzrazeno.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //No, mìl by sis dávat vìtší pozor, na co se ptáš.
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
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Teï když víme, že máme co do èinìní s draky, zaène náš velitel urèitì brzy nìco dìlat.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Ještì stále nemáme žádné zprávy od našich mužù z Hornického údolí. To je velmi znepokojivé.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //Díky Innosovi! Draèí hrozba byla zažehnána. Teï už se musíme jen vypoøádat s tìmi skøety a cesta k rudì je volná.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Ty ve skuteènosti nechceš, abych ti na tu otázku odpovìdìl, hochu!
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

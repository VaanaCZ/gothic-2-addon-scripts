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
	description = "Chciałbym zostać paladynem!";
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
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //Chciałbym zostać paladynem!
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Ty? Nie rozśmieszaj mnie! Nie należysz nawet do straży miejskiej.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //Gdybym nie widział, jaki z ciebie prostak, pewnie pomyślałbym, że chcesz mnie obrazić.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Tylko najlepsi z najlepszych poddanych Króla i sług Innosa mogą zostać paladynami.
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
	description = "Kto tu dowodzi?";
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
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //Wielmożny Lord Hagen. Jednak sprawami plebsu zajmuje się Lord Andre.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Znajdziesz go w koszarach. Może będziesz miał szczęście i Lord Andre poświęci ci kilka minut swego cennego czasu.
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
	description = "Co paladyni robią tutaj, w Khorinis?";
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
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Co robią w Khorinis paladyni?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Ludzie zadający takie pytania trafiają na szubienicę szybciej, niż to zauważą.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //Jeśli jest coś, na co Lord Andre nie może sobie pozwolić, to przejęcie planów naszej misji przez szpiegów.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //Uważaj więc lepiej na to, o co pytasz.
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
	description = "Jak leci?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //Jak się mają sprawy?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Teraz, kiedy wiemy, że musimy zmierzyć się ze smokami, jestem pewien, że nasz dowódca wkrótce podejmie słuszną decyzję.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Wciąż nie mamy żadnych informacji od oddziałów stacjonujących w Górniczej Dolinie. To bardzo niepokojące.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //Innosowi niech będą dzięki! Zagrożenie ze strony smoków zostało zażegnane. Teraz od rudy dzielą nas już tylko orkowie.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Chyba nie myślisz, że odpowiem na to pytanie!
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

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
	description = "Jak mogê zostaæ paladynem?";
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
	AI_Output (other, self, "DIA_PAL_9_JOIN_15_00"); //Jak mogê zostaæ paladynem?
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_01"); //Ci, którzy wyka¿¹ siê odwag¹ w s³u¿bie Innosowi lub Królowi, mog¹ zostaæ wybrani!
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_02"); //Mówi¹c prosto: wybrani zostan¹ najlepsi. CIEBIE czeka jednak jeszcze d³uga droga.
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
	description = "Kto tu dowodzi?";
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
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_00"); //Kto tu dowodzi?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_01"); //Lord Hagen.
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_02"); //I?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_03"); //I nikt wiêcej. Lord Hagen jest najwy¿szym urzêdnikiem i dowódc¹ na wyspie.
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
	description = "Dlaczego wy, paladyni, przybyliœcie do Khorinis?";
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
	AI_Output (other, self, "DIA_PAL_9_LOCATION_15_00"); //Dlaczego wy, paladyni, przybyliœcie do Khorinis?
	AI_Output (self, other, "DIA_PAL_9_LOCATION_09_01"); //To nie twoja sprawa, kolego! Wystarczy ci wiedzieæ, ¿e s³u¿ymy Królowi i Innosowi!
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
	description = "Co s³ychaæ?";
};
                       
func INT DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_STANDARD_15_00"); //Co s³ychaæ?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_01"); //Teraz, kiedy przysz³o nam zmierzyæ siê ze smokami, jestem pewien, ¿e nasz dowódca odpowiednio zareaguje.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_02"); //Nie mamy ¿adnych wiadomoœci od naszych oddzia³ów w Górniczej Dolinie. To bardzo niepokoj¹ce.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_9_STANDARD_09_03"); //B³ogos³awiony niech bêdzie Innos! Niebezpieczeñstwo ataku smoków zosta³o za¿egnane. ¯eby dotrzeæ do rudy, musimy siê zaj¹æ ju¿ tylko orkami.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_9_STANDARD_09_04"); //Jeœli nie masz ju¿ nic wiêcej do powiedzenia, to spadaj, prostaku.
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

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
	description = "Chcia³bym zostaæ paladynem!";
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
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //Chcia³bym zostaæ paladynem!
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Ty? Nie rozœmieszaj mnie! Nie nale¿ysz nawet do stra¿y miejskiej.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //Gdybym nie widzia³, jaki z ciebie prostak, pewnie pomyœla³bym, ¿e chcesz mnie obraziæ.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Tylko najlepsi z najlepszych poddanych Króla i s³ug Innosa mog¹ zostaæ paladynami.
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
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //Wielmo¿ny Lord Hagen. Jednak sprawami plebsu zajmuje siê Lord Andre.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Znajdziesz go w koszarach. Mo¿e bêdziesz mia³ szczêœcie i Lord Andre poœwiêci ci kilka minut swego cennego czasu.
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
	description = "Co paladyni robi¹ tutaj, w Khorinis?";
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
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Co robi¹ w Khorinis paladyni?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Ludzie zadaj¹cy takie pytania trafiaj¹ na szubienicê szybciej, ni¿ to zauwa¿¹.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //Jeœli jest coœ, na co Lord Andre nie mo¿e sobie pozwoliæ, to przejêcie planów naszej misji przez szpiegów.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //Uwa¿aj wiêc lepiej na to, o co pytasz.
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
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //Jak siê maj¹ sprawy?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Teraz, kiedy wiemy, ¿e musimy zmierzyæ siê ze smokami, jestem pewien, ¿e nasz dowódca wkrótce podejmie s³uszn¹ decyzjê.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Wci¹¿ nie mamy ¿adnych informacji od oddzia³ów stacjonuj¹cych w Górniczej Dolinie. To bardzo niepokoj¹ce.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //Innosowi niech bêd¹ dziêki! Zagro¿enie ze strony smoków zosta³o za¿egnane. Teraz od rudy dziel¹ nas ju¿ tylko orkowie.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Chyba nie myœlisz, ¿e odpowiem na to pytanie!
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

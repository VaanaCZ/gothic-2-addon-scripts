// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "W jaki spos�b mog� zosta� obywatelem tego miasta?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //W jaki spos�b mog� zosta� obywatelem tego miasta?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Chcesz si� tu osiedli�? Teraz, kiedy wszystkie znaki na niebie i ziemi zdaj� si� zwiastowa� koniec �wiata?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Nie chcia�em zosta� tu na sta�e.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Je�li chcesz zna� moje zdanie, powiniene� zwiewa� st�d, p�ki mo�esz. Jednak, je�li musisz zosta�, porozmawiaj z kt�rym� z wp�ywowych obywateli.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Znasz jakich� wp�ywowych ludzi w Khorinis?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Znasz jakich� wp�ywowych ludzi w Khorinis?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Spr�buj u kowala lub cie�li, w dolnej cz�ci miasta. Znajdziesz tam tak�e kilku szanowanych mistrz�w.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Je�li w tym mie�cie ktokolwiek opr�cz stra�y i paladyn�w ma co� do powiedzenia, to w�a�nie oni.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Jak mam si� porusza� po mie�cie, by nie straci� orientacji?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Jak mam si� porusza� po mie�cie, by nie straci� orientacji?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Nietrudno si� tu zgubi�, co? Nawet drogowskazy niewiele pomagaj�.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Je�li masz kiepsk� orientacj�, udaj si� do dzielnicy portowej. Kiedy ju� tam trafisz, id� do domu kartografa.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Jego dom znajduje si� przy pomo�cie, niedaleko knajpy. Jestem pewien, �e Brahim znajdzie dla ciebie jak�� map�.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //Co s�ycha�?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Od kiedy upad�a Bariera, w mie�cie roi si� od bandyt�w. Paladyni w og�le si� tym nie przejmuj�. Po choler� wi�c siedz� w mie�cie?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Ostatnio bandyci nie daj� si� a� tak bardzo we znaki. Wygl�da na to, �e kto� w ko�cu si� nimi zaj��.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Tego �mierdz�cego najemnika, morderc� paladyna, wypuszczono na wolno��. My�l�, �e nale�a� mu si� stryczek.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Podobno jeden z ludzi Onara zamordowa� paladyna. Z�apali go pono� i wtr�cili do paki. Nied�ugo b�dzie wisia�.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Zastanawiam si�, czy w opowie�ciach o smokach jest cho� troch� prawdy...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Powiadaj�, �e Lord Hagen zbiera wojska, by wyzwoli� G�rnicz� Dolin�. Nareszcie co� si� dzieje!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

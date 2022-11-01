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
	description = "W jaki sposób mogę zostać obywatelem tego miasta?";
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
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //W jaki sposób mogę zostać obywatelem tego miasta?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Chcesz się tu osiedlić? Teraz, kiedy wszystkie znaki na niebie i ziemi zdają się zwiastować koniec świata?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Nie chciałem zostać tu na stałe.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Jeśli chcesz znać moje zdanie, powinieneś zwiewać stąd, póki możesz. Jednak, jeśli musisz zostać, porozmawiaj z którymś z wpływowych obywateli.
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
	description = "Znasz jakichś wpływowych ludzi w Khorinis?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Znasz jakichś wpływowych ludzi w Khorinis?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Spróbuj u kowala lub cieśli, w dolnej części miasta. Znajdziesz tam także kilku szanowanych mistrzów.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Jeśli w tym mieście ktokolwiek oprócz straży i paladynów ma coś do powiedzenia, to właśnie oni.
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
	description = "Jak mam się poruszać po mieście, by nie stracić orientacji?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Jak mam się poruszać po mieście, by nie stracić orientacji?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Nietrudno się tu zgubić, co? Nawet drogowskazy niewiele pomagają.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Jeśli masz kiepską orientację, udaj się do dzielnicy portowej. Kiedy już tam trafisz, idź do domu kartografa.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Jego dom znajduje się przy pomoście, niedaleko knajpy. Jestem pewien, że Brahim znajdzie dla ciebie jakąś mapę.
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
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Od kiedy upadła Bariera, w mieście roi się od bandytów. Paladyni w ogóle się tym nie przejmują. Po cholerę więc siedzą w mieście?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Ostatnio bandyci nie dają się aż tak bardzo we znaki. Wygląda na to, że ktoś w końcu się nimi zajął.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Tego śmierdzącego najemnika, mordercę paladyna, wypuszczono na wolność. Myślę, że należał mu się stryczek.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Podobno jeden z ludzi Onara zamordował paladyna. Złapali go ponoć i wtrącili do paki. Niedługo będzie wisiał.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Zastanawiam się, czy w opowieściach o smokach jest choć trochę prawdy...
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Powiadają, że Lord Hagen zbiera wojska, by wyzwolić Górniczą Dolinę. Nareszcie coś się dzieje!
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

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_1_EXIT_Condition;
	information	= DIA_VLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_1_JOIN_Condition;
	information	= DIA_VLK_1_JOIN_Info;
	permanent	= TRUE;
	description = "W jaki sposób mogę zostać obywatelem tego miasta?";
};                       

FUNC INT DIA_VLK_1_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //W jaki sposób mogę zostać obywatelem tego miasta?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Poszukaj sobie jakiejś przyzwoitej pracy! Wszyscy, którzy mają pracę w Khorinis, są zaliczani do obywateli miasta.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_1_PEOPLE_Condition;
	information	= DIA_VLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto jest tu w okolicy najważniejszy?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //Kto jest tu w okolicy najważniejszy?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //Do niedawna gubernator i sędzia. Jednak niedawno przybyli do miasta paladyni i przejęli władzę.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Można rzec, że ich przywódca, Lord Hagen, jest teraz kimś w rodzaju gubernatora.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Jego prawą ręką jest Lord Andre. To on dowodzi strażą miejską, pełni też funkcję sędziego.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Wszyscy przestępcy w mieście odpowiadają przed nim.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_1_LOCATION_Condition;
	information	= DIA_VLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Jakie ciekawe miejsca można odwiedzić w tym mieście?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Co ciekawego można znaleźć w mieście?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Można tu kupić praktycznie wszystko. Albo od kupców na targowisku, albo w dolnej części miasta.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Zważ jednak, że za większość towarów trzeba słono zapłacić.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Jeśli nie masz zbyt dużo złota, udaj się do Lehmara, lichwiarza, może będzie mógł ci pomóc. Jego dom znajduje się u wejścia do dzielnicy portowej, w dolnej części miasta.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_1_STANDARD_Condition;
	information	= DIA_VLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Od upadku Bariery handel z najważniejszym z wieśniaków nagle się urwał. Kto wie, co on knuje. Coś mi tu śmierdzi...
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar posuwa się za daleko. Wciąż odmawia dostaw dla miasta. Jeśli straż nie zareaguje odpowiednio szybko, pozostali chłopi wkrótce też zaczną się buntować.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //Ponoć bandyci połączyli swe siły z magami. Potężni czarni magowie w czarnych szatach. Chyba nawet widziałem jednego z nich ostatniej nocy.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //Słyszałem, że jeden z najemników Onara wyruszył, aby pozabijać smoki. W końcu zajęli się czymś pożytecznym.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //Wieść niesie, że smoki zostały pokonane! Lord Hagen zbiera swe oddziały, by poprowadzić je przeciw reszcie bestii, plądrujących Górniczą Dolinę.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_1 (var c_NPC slf)
{
	DIA_VLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

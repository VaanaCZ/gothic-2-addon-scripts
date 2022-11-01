// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_6_EXIT_Condition;
	information	= DIA_MIL_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_6_JOIN_Condition;
	information	= DIA_MIL_6_JOIN_Info;
	permanent	= TRUE;
	description = "Co powinienem zrobić, aby wstąpić do straży?";
};                       

FUNC INT DIA_MIL_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Co powinienem zrobić, żeby się zaciągnąć do straży?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Porozmawiaj z Lordem Andre. Od kiedy paladyni przybyli do miasta, to właśnie on nadzoruje działania straży.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Znajdziesz go w koszarach. Praktycznie z nich nie wychodzi.
	};
};

// *************************************************************************
// 						MissingPeople
// *************************************************************************
instance DIA_Addon_MIL_6_MissingPeople		(C_INFO)
{
	nr		 = 	2;
	condition	 = 	DIA_Addon_MIL_6_MissingPeople_Condition;
	information	 = 	DIA_Addon_MIL_6_MissingPeople_Info;
	permanent	= TRUE;
	description	 = 	"Słyszałem, że zniknęli jacyś ludzie.";
};

func int DIA_Addon_MIL_6_MissingPeople_Condition ()
{
	if (Kapitel == 1)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_MIL_6_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Słyszałem, że zniknęli jacyś ludzie.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //Rzeczywiście - ostatnio często mamy doniesienia o zaginięciach.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Nie potrafię tego wyjaśnić, choć bym chciał.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Możemy tylko mieć oczy i uszy szeroko otwarte.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_6_PEOPLE_Condition;
	information	= DIA_MIL_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Opowiedz mi o tych paladynach.";
};                       

FUNC INT DIA_MIL_6_PEOPLE_Condition()
{
	IF (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Opowiedz mi o tych paladynach.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Zaraz po przybyciu do Khorinis udali się do górnego miasta.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Od tego czasu nikt poza obywatelami miasta, i oczywiście strażą, nie ma tam wstępu.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Kilku paladynów stacjonuje przy statku, w porcie. Ale nie należą do specjalnie rozmownych.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_6_LOCATION_Condition;
	information	= DIA_MIL_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Co powinienem wiedzieć o tym mieście?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Co powinienem wiedzieć o tym mieście?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Kontrolę nad miastem przejęli paladyni. Straż bezpośrednio im podlega.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre, dowódca straży, pełni także funkcję sędziego.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Jeśli zdarzy ci się złamać prawo, będziesz się musiał przed nim wytłumaczyć.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Jednak nie martw się, jest człowiekiem ugodowym. Przeważnie nakłada jedynie grzywnę.
	
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_6_STANDARD_Condition;
	information	= DIA_MIL_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       
func INT DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //W mieście coraz więcej szumowin.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Wszędzie coraz więcej złodziei. Lord Andre podejrzewa nawet, że całe to zamieszanie jest sprawką gangu.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Niedawno przetrząsnęliśmy dokładnie całą dzielnicę portową, ale niczego nie znaleźliśmy.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Wygląda na to, że problem bandytów mamy już z głowy. Ataki stały się ostatnimi czasy rzadkością.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Z dnia na dzień jest coraz gorzej, wszystko przez te szumowiny wręcz zalewające miasto. Ostatniej nocy śledziłem pewnego typka w czarnych szatach, zdążającego ku górnemu miastu.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Od początku wydał mi się podejrzany. Śledziłem go aż pod dom gubernatora. Tam zniknął. Mówię ci, dziwna to była postać.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Słyszałem, że Lord Hagen zatrudnił najemników, by zajęli się smokami. Mnie to odpowiada, nie chciałbym sam zmierzyć się z tymi bestiami.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Mówi się, że smoki zostały pokonane. Ponoć Lord Hagen zbiera siły, by ostatecznie wygnać je także z Górniczej Doliny.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_6 (var c_NPC slf)
{
	DIA_MIL_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

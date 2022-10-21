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
	description = "Co powinienem zrobi�, aby wst�pi� do stra�y?";
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
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Co powinienem zrobi�, �eby si� zaci�gn�� do stra�y?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Porozmawiaj z Lordem Andre. Od kiedy paladyni przybyli do miasta, to w�a�nie on nadzoruje dzia�ania stra�y.
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
	description	 = 	"S�ysza�em, �e znikn�li jacy� ludzie.";
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
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //S�ysza�em, �e znikn�li jacy� ludzie.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //Rzeczywi�cie - ostatnio cz�sto mamy doniesienia o zagini�ciach.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Nie potrafi� tego wyja�ni�, cho� bym chcia�.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Mo�emy tylko mie� oczy i uszy szeroko otwarte.
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
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Zaraz po przybyciu do Khorinis udali si� do g�rnego miasta.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Od tego czasu nikt poza obywatelami miasta, i oczywi�cie stra��, nie ma tam wst�pu.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Kilku paladyn�w stacjonuje przy statku, w porcie. Ale nie nale�� do specjalnie rozmownych.
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
	description = "Co powinienem wiedzie� o tym mie�cie?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Co powinienem wiedzie� o tym mie�cie?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Kontrol� nad miastem przej�li paladyni. Stra� bezpo�rednio im podlega.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre, dow�dca stra�y, pe�ni tak�e funkcj� s�dziego.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Je�li zdarzy ci si� z�ama� prawo, b�dziesz si� musia� przed nim wyt�umaczy�.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Jednak nie martw si�, jest cz�owiekiem ugodowym. Przewa�nie nak�ada jedynie grzywn�.
	
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
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //Co s�ycha�?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //W mie�cie coraz wi�cej szumowin.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Wsz�dzie coraz wi�cej z�odziei. Lord Andre podejrzewa nawet, �e ca�e to zamieszanie jest sprawk� gangu.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Niedawno przetrz�sn�li�my dok�adnie ca�� dzielnic� portow�, ale niczego nie znale�li�my.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Wygl�da na to, �e problem bandyt�w mamy ju� z g�owy. Ataki sta�y si� ostatnimi czasy rzadko�ci�.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Z dnia na dzie� jest coraz gorzej, wszystko przez te szumowiny wr�cz zalewaj�ce miasto. Ostatniej nocy �ledzi�em pewnego typka w czarnych szatach, zd��aj�cego ku g�rnemu miastu.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Od pocz�tku wyda� mi si� podejrzany. �ledzi�em go a� pod dom gubernatora. Tam znikn��. M�wi� ci, dziwna to by�a posta�.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //S�ysza�em, �e Lord Hagen zatrudni� najemnik�w, by zaj�li si� smokami. Mnie to odpowiada, nie chcia�bym sam zmierzy� si� z tymi bestiami.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //M�wi si�, �e smoki zosta�y pokonane. Pono� Lord Hagen zbiera si�y, by ostatecznie wygna� je tak�e z G�rniczej Doliny.
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

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
	description = "Co powinienem zrobiæ, aby wst¹piæ do stra¿y?";
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
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Co powinienem zrobiæ, ¿eby siê zaci¹gn¹æ do stra¿y?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Porozmawiaj z Lordem Andre. Od kiedy paladyni przybyli do miasta, to w³aœnie on nadzoruje dzia³ania stra¿y.
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
	description	 = 	"S³ysza³em, ¿e zniknêli jacyœ ludzie.";
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
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //S³ysza³em, ¿e zniknêli jacyœ ludzie.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //Rzeczywiœcie - ostatnio czêsto mamy doniesienia o zaginiêciach.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Nie potrafiê tego wyjaœniæ, choæ bym chcia³.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Mo¿emy tylko mieæ oczy i uszy szeroko otwarte.
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
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Zaraz po przybyciu do Khorinis udali siê do górnego miasta.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Od tego czasu nikt poza obywatelami miasta, i oczywiœcie stra¿¹, nie ma tam wstêpu.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Kilku paladynów stacjonuje przy statku, w porcie. Ale nie nale¿¹ do specjalnie rozmownych.
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
	description = "Co powinienem wiedzieæ o tym mieœcie?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Co powinienem wiedzieæ o tym mieœcie?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Kontrolê nad miastem przejêli paladyni. Stra¿ bezpoœrednio im podlega.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre, dowódca stra¿y, pe³ni tak¿e funkcjê sêdziego.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Jeœli zdarzy ci siê z³amaæ prawo, bêdziesz siê musia³ przed nim wyt³umaczyæ.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Jednak nie martw siê, jest cz³owiekiem ugodowym. Przewa¿nie nak³ada jedynie grzywnê.
	
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
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //Co s³ychaæ?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //W mieœcie coraz wiêcej szumowin.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Wszêdzie coraz wiêcej z³odziei. Lord Andre podejrzewa nawet, ¿e ca³e to zamieszanie jest sprawk¹ gangu.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Niedawno przetrz¹snêliœmy dok³adnie ca³¹ dzielnicê portow¹, ale niczego nie znaleŸliœmy.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Wygl¹da na to, ¿e problem bandytów mamy ju¿ z g³owy. Ataki sta³y siê ostatnimi czasy rzadkoœci¹.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Z dnia na dzieñ jest coraz gorzej, wszystko przez te szumowiny wrêcz zalewaj¹ce miasto. Ostatniej nocy œledzi³em pewnego typka w czarnych szatach, zd¹¿aj¹cego ku górnemu miastu.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Od pocz¹tku wyda³ mi siê podejrzany. Œledzi³em go a¿ pod dom gubernatora. Tam znikn¹³. Mówiê ci, dziwna to by³a postaæ.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //S³ysza³em, ¿e Lord Hagen zatrudni³ najemników, by zajêli siê smokami. Mnie to odpowiada, nie chcia³bym sam zmierzyæ siê z tymi bestiami.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Mówi siê, ¿e smoki zosta³y pokonane. Ponoæ Lord Hagen zbiera si³y, by ostatecznie wygnaæ je tak¿e z Górniczej Doliny.
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

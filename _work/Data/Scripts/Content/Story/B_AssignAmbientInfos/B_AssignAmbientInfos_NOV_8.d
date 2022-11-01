// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_8_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_8_Fegen_Condition;
	information	= DIA_NOV_8_Fegen_Info;
	permanent	= TRUE;
	description = "Potrzebuję pomocy w sprzątaniu sal nowicjuszy.";
};                       

FUNC INT DIA_NOV_8_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};
//-------------------------------
var int Feger3_Permanent;
//-------------------------------
FUNC VOID DIA_NOV_8_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Fegen_15_00"); //Potrzebuję pomocy w sprzątaniu sal nowicjuszy.
	
	if (Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self))
	{	
		if (Feger3_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_01"); //Nieźle, ledwoś przyszedł, a oni już zapędzili cię do sprzątania?
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_02"); //Nie martw się, ze mną było dokładnie tak samo. Dlatego właśnie ci pomogę. Głupio by wyglądało, gdybyśmy sobie nie poradzili.
			
			NOV_Helfer = (NOV_Helfer +1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Znalazłem nowicjusza, który zechciał mi pomóc w sprzątaniu komnat.");
		}
		else //if (Feger3_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_8_Fegen_08_03"); //Bracie, wiem dokładnie, o czym mówisz. Powiedziałem ci już, że pomogę. Przecież robię to cały czas.
		};
	};
	//-------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------
	
	if ((Hlp_GetInstanceID (Feger3) == Hlp_GetInstanceID (self)) == FALSE )
	{	
		AI_Output (self, other, "DIA_NOV_8_Fegen_08_04"); //Zrozum, zrobiłbym to, ale jestem naprawdę zajęty.
	};
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_8_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_8_Wurst_Condition;
	information	= DIA_NOV_8_Wurst_Info;
	permanent	= TRUE;
	description = "Co powiesz na pyszną baranią kiełbasę?";
};                       

FUNC INT DIA_NOV_8_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_Wurst_15_00"); //Co powiesz na pyszną baranią kiełbasę?
	AI_Output (self, other, "DIA_NOV_8_Wurst_08_01"); //Nie odmówię. Dzięki, tego właśnie było mi potrzeba.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "Co muszę zrobić, by zostać magiem?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_JOIN_15_00"); //Co muszę zrobić, by zostać magiem?
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_01"); //Zostaniesz Wybrańcem Innosa jedynie wtedy, gdy taką wolę wyrażą Najwyżsi Magowie Ognia.
	AI_Output (self, other, "DIA_NOV_8_JOIN_08_02"); //Jako nowicjuszom nie wolno nam studiować magii runicznej, zaś stare manuskrypty możemy przeglądać jedynie za zgodą magów.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kto sprawuje władzę w klasztorze?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_PEOPLE_15_00"); //Kto sprawuje władzę w klasztorze?
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_01"); //Najwyższa Rada. W jej skład wchodzą trzej najpotężniejsi magowie naszego zgromadzenia. To oni nadzorują działania klasztoru.
	AI_Output (self, other, "DIA_NOV_8_PEOPLE_08_02"); //Wszyscy Wybrańcy Innosa są magami. Innos tchnął w każdego z nich cząstkę siebie, dzięki czemu mogą stanowić jego wolę tu, w świecie śmiertelników.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Opowiedz mi coś o tym klasztorze.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_LOCATION_15_00"); //Opowiedz mi coś o tym klasztorze.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_01"); //To starożytna budowla. Pochodzi jeszcze z czasów przed Rhobarem Pierwszym.
	AI_Output (self, other, "DIA_NOV_8_LOCATION_08_02"); //Pod klasztorem znajdują się katakumby, rozciągające się do wnętrza góry.
	//AI_Output (self, other, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die höchsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_8_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_8_STANDARD_Condition;
	information	= DIA_NOV_8_STANDARD_Info;
	permanent	= TRUE;
	description = "Czy masz jakieś nowe informacje?";
};
                       
func INT DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_8_STANDARD_15_00"); //Czy masz jakieś nowe informacje?
		
	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_01"); //Można by tak powiedzieć. Od ponad stu lat żaden nowicjusz nie został tak szybko przyjęty do Kręgu Ognia.
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_02"); //Mam nadzieję, że i mnie, pewnego dnia, spotka ten zaszczyt.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_8_STANDARD_08_03"); //Do Khorinis przybyła niedawno grupa paladynów. Jeden jest tu, w klasztorze... Modli się.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_08_04"); //Wciąż nie mogę uwierzyć, że jeden z nas zdradził klasztor i zabrał Oko Innosa.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_05"); //Mieliśmy stworzyć społeczność, byliśmy jednak zbyt słabi. Dlatego właśnie Beliarowi udało się przeciągnąć jednego z nas na ścieżkę Zła.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_06"); //Jedynie nieskalana wiara w Innosa pozwoli nam odzyskać Oko z rąk wroga.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_08_07"); //Twoja odwaga jest natchnieniem dla tych, którzy zatracili się w rozpaczy, dzięki tobie może uda im się przetrwać te mroczne chwile.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_08"); //Słyszałem coś także o smokach i armii Zła. Niech Innos ma nas w swojej opiece.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_8_STANDARD_08_09"); //Sytuacja, w jakiej znaleźli się paladyni, bardzo zmartwiła Radę. Od wielu już dni nie mamy żadnych informacji z Górniczej Doliny.
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_10"); //Dziękuję za to naszemu Panu. Dzięki Oku Innosa będziemy mogli pokonać smoki!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_11"); //Tak. Pokonaliśmy smoki. Innos po raz kolejny pokazał nam, że nie wolno tracić nadziei.
		AI_Output (self,other,"DIA_NOV_8_STANDARD_08_12"); //Wciąż jednak świat osnuwają cienie, a naszym celem jest nieść światło wszędzie tam, gdzie są potrzebujący.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc					= Hlp_GetInstanceID(slf);
};

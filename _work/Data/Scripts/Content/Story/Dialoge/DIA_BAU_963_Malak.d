///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Malak_EXIT   (C_INFO)
{
	npc         = BAU_963_Malak;
	nr          = 999;
	condition   = DIA_Malak_EXIT_Condition;
	information = DIA_Malak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Malak_EXIT_Condition()
{
		if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Malak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_HALLO		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	3;
	condition	 = 	DIA_Malak_HALLO_Condition;
	information	 = 	DIA_Malak_HALLO_Info;

	description	 = 	"Wszystko w porz�dku?";
};

func int DIA_Malak_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Malak_HALLO_15_00"); //Wszystko w porz�dku?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_01"); //Kolejna osoba, kt�ra nie wie, gdzie si� podzia�? To �aden problem. Porozmawiaj z farmerem Bengarem.
		}
	else
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_02"); //Jasne.
		};

};


///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	4;
	condition	 = 	DIA_Malak_WASMACHSTDU_Condition;
	information	 = 	DIA_Malak_WASMACHSTDU_Info;

	description	 = 	"Co tu porabiasz?";
};

func int DIA_Malak_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WASMACHSTDU_15_00"); //Czym si� zajmujesz?
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_01"); //Jestem pasterzem. Nie jest to bardzo wymagaj�ca praca.
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_02"); //Jednak czasami trzeba by� naprawd� czujnym. Zw�aszcza je�li zbli�asz si� do prze��czy.

};


///////////////////////////////////////////////////////////////////////
//	Info pass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	5;
	condition	 = 	DIA_Malak_PASS_Condition;
	information	 = 	DIA_Malak_PASS_Info;

	description	 = 	"Co wiesz na temat prze��czy?";
};

func int DIA_Malak_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PASS_15_00"); //Co wiesz na temat prze��czy?
	AI_Output			(self, other, "DIA_Malak_PASS_08_01"); //Niewiele. Wiem tylko, �e prowadzi do starej G�rniczej Doliny, kt�ra jeszcze par� tygodni temu by�a otoczona przez Barier�.
	AI_Output			(self, other, "DIA_Malak_PASS_08_02"); //Kiedy� jedyn� rzecz�, jak� musieli�my si� przejmowa�, by�a comiesi�czna karawana, wioz�ca przer�ne dobra do G�rniczej Doliny.
	AI_Output			(self, other, "DIA_Malak_PASS_08_03"); //Zdarza�o si�, �e te rzezimieszki utrudnia�y nam �ycie.

};

///////////////////////////////////////////////////////////////////////
//	Info wopass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WOPASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	6;
	condition	 = 	DIA_Malak_WOPASS_Condition;
	information	 = 	DIA_Malak_WOPASS_Info;

	description	 = 	"Gdzie dok�adnie znajduje si� prze��cz wiod�ca do G�rniczej Doliny?";
};

func int DIA_Malak_WOPASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_HALLO))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WOPASS_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WOPASS_15_00"); //Gdzie dok�adnie znajduje si� prze��cz wiod�ca do G�rniczej Doliny?
	AI_Output			(self, other, "DIA_Malak_WOPASS_08_01"); //Tu� obok dw�ch wodospad�w po drugiej stronie pastwisk.

};



///////////////////////////////////////////////////////////////////////
//	Info minental
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_MINENTAL		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	7;
	condition	 = 	DIA_Malak_MINENTAL_Condition;
	information	 = 	DIA_Malak_MINENTAL_Info;

	description	 = 	"Jakie opowie�ci kr��� o G�rniczej Dolinie?";
};

func int DIA_Malak_MINENTAL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_MINENTAL_Info ()
{

	AI_Output			(other, self, "DIA_Malak_MINENTAL_15_00"); //Jakie opowie�ci kr��� o G�rniczej Dolinie?
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_01"); //Przer�ne. Podobno niekt�rzy s�yszeli tam w nocy krzyki, inni opowiadaj� o dziwnych �wiat�ach ponad g�rami.
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_02"); //Moim zdaniem, to wszystko wyssane z palca opowie�ci starych bab.

};


///////////////////////////////////////////////////////////////////////
//	Info warstduschonda
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WARSTDUSCHONDA		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	8;
	condition	 = 	DIA_Malak_WARSTDUSCHONDA_Condition;
	information	 = 	DIA_Malak_WARSTDUSCHONDA_Info;

	description	 = 	"Czy kiedykolwiek by�e� w G�rniczej Dolinie?";
};

func int DIA_Malak_WARSTDUSCHONDA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_WARSTDUSCHONDA_Info ()
{
	AI_Output			(other, self, "DIA_Malak_WARSTDUSCHONDA_15_00"); //Czy kiedykolwiek by�e� w G�rniczej Dolinie?
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_01"); //Nie. Ale od czasu do czasu zdarza mi si� przechodzi� w pobli�u prze��czy. Zawsze stoi tam na warcie dw�ch paladyn�w.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_02"); //Wygl�da to tak, jakby pilnowali, �eby nic nie wydosta�o si� z doliny.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_03"); //Kiedy� G�rnicza Dolina by�a wykorzystywana jako naturalne wi�zienie. Je�li kto� tam wszed�, nie by�o ju� powrotu.

};


///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PALADINE		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 9;
	condition	 = 	DIA_Malak_PALADINE_Condition;
	information	 = 	DIA_Malak_PALADINE_Info;

	description	 = 	"Powiedz mi co� wi�cej o paladynach.";
};

func int DIA_Malak_PALADINE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
		&& 	(Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Malak_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PALADINE_15_00"); //Opowiedz mi wi�cej o paladynach. Od kiedy tu stacjonuj�?
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_01"); //Tydzie� lub dwa... Nie pami�tam dok�adnie, kiedy si� tu pojawili.
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_02"); //Jaki� czas temu ca�y oddzia� paladyn�w przekroczy� prze��cz. Od tamtej pory ju� ich nie widzia�em.

};

///////////////////////////////////////////////////////////////////////
//	Info keineFrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_KEINEFRAUEN		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 10;
	condition	 = 	DIA_Malak_KEINEFRAUEN_Condition;
	information	 = 	DIA_Malak_KEINEFRAUEN_Info;

	description	 = 	"Nie widz� tu �adnych kobiet.";
};

func int DIA_Malak_KEINEFRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_KEINEFRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Malak_KEINEFRAUEN_15_00"); //Nie widz� tu �adnych kobiet.
	AI_Output			(self, other, "DIA_Malak_KEINEFRAUEN_08_01"); //Masz racj�. Ta farma nale�y do m�czyzn. Je�li o mnie chodzi, sprawdza si� to ca�kiem nie�le.

};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	11;
	condition	 = 	DIA_Malak_PERMKAP1_Condition;
	information	 = 	DIA_Malak_PERMKAP1_Info;
	permanent	 =  TRUE;	

	description	 = 	"Tylko si� nie przepracuj.";
};

func int DIA_Malak_PERMKAP1_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Malak_HALLO))
		&& (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
		&& (Npc_KnowsInfo(other, DIA_Malak_PASS))
		&& (Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
		&& (Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
		&& (Npc_KnowsInfo(other, DIA_Malak_PALADINE))
		&& (Npc_KnowsInfo(other, DIA_Malak_KEINEFRAUEN))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Malak_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PERMKAP1_15_00"); //Tylko si� nie przepracuj.
	AI_Output			(self, other, "DIA_Malak_PERMKAP1_08_01"); //Postaram si�.

	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Malak_KAP3_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP3_EXIT_Condition;
	information	= DIA_Malak_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info fleefromPass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_FLEEFROMPASS		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	30;
	condition	 = 	DIA_Malak_FLEEFROMPASS_Condition;
	information	 = 	DIA_Malak_FLEEFROMPASS_Info;

	description	 = 	"Co tu porabiasz?";
};

func int DIA_Malak_FLEEFROMPASS_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Malak_FLEEFROMPASS_Info ()
{
	if 	(NpcObsessedByDMT_Malak == FALSE)
	&& (hero.guild == GIL_KDF)
	{
	B_NpcObsessedByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_00"); //Co tu robisz?
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_01"); //Uciek�em z farmy Bengara. Nie chcia�em zosta� rozszarpany przez jakie� stworzenie, kt�re mo�e w ka�dej chwili przekroczy� prze��cz.
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_02"); //Nawet sobie nie wyobra�asz, jakie paskudztwa wy�oni�y si� stamt�d w ci�gu kilku ostatnich dni.
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_03"); //Chyba jednak mog� to sobie wyobrazi�.
	B_LogEntry (TOPIC_BengarALLEIN,"Malak schroni� si� na po�udniu, poniewa� obawia si� stworze� przybywaj�cych na pastwiska od strony prze��czy."); 
	B_GivePlayerXP (XP_FoundMalakFLEEFROMPASS);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_Heilung		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	55;
	condition	 = 	DIA_Malak_Heilung_Condition;
	information	 = 	DIA_Malak_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Potrzebujesz pomocy.";
};

func int DIA_Malak_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Malak == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 3)
	 {
				return TRUE;
	 };
};
var int DIA_Malak_Heilung_oneTime;
func void DIA_Malak_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Malak_Heilung_15_00"); //Potrzebujesz pomocy.

	if (DIA_Malak_Heilung_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Malak_Heilung_08_01"); //Po prostu chc� wr�ci� do domu. Do Bengara. Mam nadziej�, �e jeszcze �yje.

		B_NpcClearObsessionByDMT (self);
		Npc_ExchangeRoutine	(self,"Start");
		B_StartOtherRoutine   (BAU_962_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_964_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_965_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_966_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_967_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_968_Bauer,"Start"); 
		B_StartOtherRoutine   (BAU_969_Bauer,"Start"); 

	DIA_Malak_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Malak_Heilung_08_02"); //Zostaw mnie w spokoju, magu. Sam sobie poradz�.
		B_NpcClearObsessionByDMT (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info permcastle
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMCASTLE		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	31;
	condition	 = 	DIA_Malak_PERMCASTLE_Condition;
	information	 = 	DIA_Malak_PERMCASTLE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak ci si� tu �yje?";
};

func int DIA_Malak_PERMCASTLE_Condition ()
{
	if (Npc_GetDistToWP(self,"CASTLEMINE")<4000) 
	&& (MIS_GetMalakBack != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >=3)
		{
				return TRUE;
		};
};

func void DIA_Malak_PERMCASTLE_Info ()
{
	AI_Output			(other, self, "DIA_Malak_PERMCASTLE_15_00"); //Jak ci si� tu �yje?
	AI_Output			(self, other, "DIA_Malak_PERMCASTLE_08_01"); //Musz� tylko uwa�a� na bandyt�w. Z dwojga z�ego - wol� to.
};

///////////////////////////////////////////////////////////////////////
//	Info BacktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACKTOBENGAR		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	31;
	condition	 = 	DIA_Malak_BACKTOBENGAR_Condition;
	information	 = 	DIA_Malak_BACKTOBENGAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bengar ci� potrzebuje.";
};

func int DIA_Malak_BACKTOBENGAR_Condition ()
{
	if (MIS_GetMalakBack == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& ((Npc_IsDead(Bengar))==FALSE)
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_BACKTOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_00"); //Bengar ci� potrzebuje. Chce, aby� wr�ci� na jego farm�.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_01"); //Jeszcze nie zwariowa�em. Tam jest niebezpiecznie! Nigdzie si� st�d nie ruszam.
	
	B_LogEntry (TOPIC_BengarALLEIN,"Malak nie chce powr�ci� na farm� Bengara, poniewa� nie ma ona �adnej ochrony."); 

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_02"); //Zatrudni�em najemnika, kt�ry b�dzie pilnowa� farmy.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_03"); //To zupe�nie co innego. Ale zaraz, kto b�dzie go op�aca�?
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_04"); //To ju� m�j problem.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_05"); //Chyba odebra�e� mi wszystkie argumenty, prawda?
	
	Info_AddChoice	(DIA_Malak_BACKTOBENGAR, "Prawda.", DIA_Malak_BACKTOBENGAR_los );
	};
};

func void DIA_Malak_BACKTOBENGAR_los ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_los_15_00"); //Prawda.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_los_08_01"); //Dobrze. A zatem wr�c� na farm�. Mam nadziej�, �e ten tw�j najemnik zna si� na rzeczy.
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Malak_BACKTOBENGAR);
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine	 (self,"Start");
	B_StartOtherRoutine   (BAU_962_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_964_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_965_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_966_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_967_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_968_Bauer,"Start"); 
	B_StartOtherRoutine   (BAU_969_Bauer,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Back
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACK		(C_INFO)
{
	npc		 = 	BAU_963_Malak;
	nr		 = 	32;
	condition	 = 	DIA_Malak_BACK_Condition;
	information	 = 	DIA_Malak_BACK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Czy teraz zamieszkasz na farmie Bengara?";
};

func int DIA_Malak_BACK_Condition ()
{
	if (MIS_GetMalakBack == LOG_SUCCESS)
	&& (NpcObsessedByDMT_Malak == FALSE)	
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Malak_BACK_Info ()
{
	AI_Output			(other, self, "DIA_Malak_BACK_15_00"); //Czy teraz zamieszkasz na farmie Bengara?
	AI_Output			(self, other, "DIA_Malak_BACK_08_01"); //Pewnie. Dodatkowa para r�k na pewno si� tam przyda. Razem jako� damy sobie rad�.
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Malak_KAP4_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP4_EXIT_Condition;
	information	= DIA_Malak_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Malak_KAP5_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP5_EXIT_Condition;
	information	= DIA_Malak_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Malak_KAP6_EXIT(C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 999;
	condition	= DIA_Malak_KAP6_EXIT_Condition;
	information	= DIA_Malak_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Malak_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Malak_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Malak_PICKPOCKET (C_INFO)
{
	npc			= BAU_963_Malak;
	nr			= 900;
	condition	= DIA_Malak_PICKPOCKET_Condition;
	information	= DIA_Malak_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Malak_PICKPOCKET_Condition()
{
	C_Beklauen (43, 40);
};
 
FUNC VOID DIA_Malak_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Malak_PICKPOCKET);
	Info_AddChoice		(DIA_Malak_PICKPOCKET, DIALOG_BACK 		,DIA_Malak_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Malak_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Malak_PICKPOCKET_DoIt);
};

func void DIA_Malak_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Malak_PICKPOCKET);
};
	
func void DIA_Malak_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Malak_PICKPOCKET);
};




























































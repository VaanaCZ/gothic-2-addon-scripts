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

	description	 = 	"Wszystko w porz¹dku?";
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
	AI_Output			(other, self, "DIA_Malak_HALLO_15_00"); //Wszystko w porz¹dku?

	if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Malak_HALLO_08_01"); //Kolejna osoba, która nie wie, gdzie siê podziaæ? To ¿aden problem. Porozmawiaj z farmerem Bengarem.
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
	AI_Output			(other, self, "DIA_Malak_WASMACHSTDU_15_00"); //Czym siê zajmujesz?
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_01"); //Jestem pasterzem. Nie jest to bardzo wymagaj¹ca praca.
	AI_Output			(self, other, "DIA_Malak_WASMACHSTDU_08_02"); //Jednak czasami trzeba byæ naprawdê czujnym. Zw³aszcza jeœli zbli¿asz siê do prze³êczy.

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

	description	 = 	"Co wiesz na temat prze³êczy?";
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
	AI_Output			(other, self, "DIA_Malak_PASS_15_00"); //Co wiesz na temat prze³êczy?
	AI_Output			(self, other, "DIA_Malak_PASS_08_01"); //Niewiele. Wiem tylko, ¿e prowadzi do starej Górniczej Doliny, która jeszcze parê tygodni temu by³a otoczona przez Barierê.
	AI_Output			(self, other, "DIA_Malak_PASS_08_02"); //Kiedyœ jedyn¹ rzecz¹, jak¹ musieliœmy siê przejmowaæ, by³a comiesiêczna karawana, wioz¹ca przeró¿ne dobra do Górniczej Doliny.
	AI_Output			(self, other, "DIA_Malak_PASS_08_03"); //Zdarza³o siê, ¿e te rzezimieszki utrudnia³y nam ¿ycie.

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

	description	 = 	"Gdzie dok³adnie znajduje siê prze³êcz wiod¹ca do Górniczej Doliny?";
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
	AI_Output			(other, self, "DIA_Malak_WOPASS_15_00"); //Gdzie dok³adnie znajduje siê prze³êcz wiod¹ca do Górniczej Doliny?
	AI_Output			(self, other, "DIA_Malak_WOPASS_08_01"); //Tu¿ obok dwóch wodospadów po drugiej stronie pastwisk.

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

	description	 = 	"Jakie opowieœci kr¹¿¹ o Górniczej Dolinie?";
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

	AI_Output			(other, self, "DIA_Malak_MINENTAL_15_00"); //Jakie opowieœci kr¹¿¹ o Górniczej Dolinie?
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_01"); //Przeró¿ne. Podobno niektórzy s³yszeli tam w nocy krzyki, inni opowiadaj¹ o dziwnych œwiat³ach ponad górami.
	AI_Output			(self, other, "DIA_Malak_MINENTAL_08_02"); //Moim zdaniem, to wszystko wyssane z palca opowieœci starych bab.

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

	description	 = 	"Czy kiedykolwiek by³eœ w Górniczej Dolinie?";
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
	AI_Output			(other, self, "DIA_Malak_WARSTDUSCHONDA_15_00"); //Czy kiedykolwiek by³eœ w Górniczej Dolinie?
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_01"); //Nie. Ale od czasu do czasu zdarza mi siê przechodziæ w pobli¿u prze³êczy. Zawsze stoi tam na warcie dwóch paladynów.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_02"); //Wygl¹da to tak, jakby pilnowali, ¿eby nic nie wydosta³o siê z doliny.
	AI_Output			(self, other, "DIA_Malak_WARSTDUSCHONDA_08_03"); //Kiedyœ Górnicza Dolina by³a wykorzystywana jako naturalne wiêzienie. Jeœli ktoœ tam wszed³, nie by³o ju¿ powrotu.

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

	description	 = 	"Powiedz mi coœ wiêcej o paladynach.";
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
	AI_Output			(other, self, "DIA_Malak_PALADINE_15_00"); //Opowiedz mi wiêcej o paladynach. Od kiedy tu stacjonuj¹?
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_01"); //Tydzieñ lub dwa... Nie pamiêtam dok³adnie, kiedy siê tu pojawili.
	AI_Output			(self, other, "DIA_Malak_PALADINE_08_02"); //Jakiœ czas temu ca³y oddzia³ paladynów przekroczy³ prze³êcz. Od tamtej pory ju¿ ich nie widzia³em.

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

	description	 = 	"Nie widzê tu ¿adnych kobiet.";
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
	AI_Output			(other, self, "DIA_Malak_KEINEFRAUEN_15_00"); //Nie widzê tu ¿adnych kobiet.
	AI_Output			(self, other, "DIA_Malak_KEINEFRAUEN_08_01"); //Masz racjê. Ta farma nale¿y do mê¿czyzn. Jeœli o mnie chodzi, sprawdza siê to ca³kiem nieŸle.

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

	description	 = 	"Tylko siê nie przepracuj.";
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
	AI_Output			(other, self, "DIA_Malak_PERMKAP1_15_00"); //Tylko siê nie przepracuj.
	AI_Output			(self, other, "DIA_Malak_PERMKAP1_08_01"); //Postaram siê.

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
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_01"); //Uciek³em z farmy Bengara. Nie chcia³em zostaæ rozszarpany przez jakieœ stworzenie, które mo¿e w ka¿dej chwili przekroczyæ prze³êcz.
	AI_Output			(self, other, "DIA_Malak_FLEEFROMPASS_08_02"); //Nawet sobie nie wyobra¿asz, jakie paskudztwa wy³oni³y siê stamt¹d w ci¹gu kilku ostatnich dni.
	AI_Output			(other, self, "DIA_Malak_FLEEFROMPASS_15_03"); //Chyba jednak mogê to sobie wyobraziæ.
	B_LogEntry (TOPIC_BengarALLEIN,"Malak schroni³ siê na po³udniu, poniewa¿ obawia siê stworzeñ przybywaj¹cych na pastwiska od strony prze³êczy."); 
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
	AI_Output			(self, other, "DIA_Malak_Heilung_08_01"); //Po prostu chcê wróciæ do domu. Do Bengara. Mam nadziejê, ¿e jeszcze ¿yje.

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
		AI_Output			(self, other, "DIA_Malak_Heilung_08_02"); //Zostaw mnie w spokoju, magu. Sam sobie poradzê.
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

	description	 = 	"Jak ci siê tu ¿yje?";
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
	AI_Output			(other, self, "DIA_Malak_PERMCASTLE_15_00"); //Jak ci siê tu ¿yje?
	AI_Output			(self, other, "DIA_Malak_PERMCASTLE_08_01"); //Muszê tylko uwa¿aæ na bandytów. Z dwojga z³ego - wolê to.
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

	description	 = 	"Bengar ciê potrzebuje.";
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
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_00"); //Bengar ciê potrzebuje. Chce, abyœ wróci³ na jego farmê.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_01"); //Jeszcze nie zwariowa³em. Tam jest niebezpiecznie! Nigdzie siê st¹d nie ruszam.
	
	B_LogEntry (TOPIC_BengarALLEIN,"Malak nie chce powróciæ na farmê Bengara, poniewa¿ nie ma ona ¿adnej ochrony."); 

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_02"); //Zatrudni³em najemnika, który bêdzie pilnowa³ farmy.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_03"); //To zupe³nie co innego. Ale zaraz, kto bêdzie go op³aca³?
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_15_04"); //To ju¿ mój problem.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_08_05"); //Chyba odebra³eœ mi wszystkie argumenty, prawda?
	
	Info_AddChoice	(DIA_Malak_BACKTOBENGAR, "Prawda.", DIA_Malak_BACKTOBENGAR_los );
	};
};

func void DIA_Malak_BACKTOBENGAR_los ()
{
	AI_Output			(other, self, "DIA_Malak_BACKTOBENGAR_los_15_00"); //Prawda.
	AI_Output			(self, other, "DIA_Malak_BACKTOBENGAR_los_08_01"); //Dobrze. A zatem wrócê na farmê. Mam nadziejê, ¿e ten twój najemnik zna siê na rzeczy.
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
	AI_Output			(self, other, "DIA_Malak_BACK_08_01"); //Pewnie. Dodatkowa para r¹k na pewno siê tam przyda. Razem jakoœ damy sobie radê.
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




























































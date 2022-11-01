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
	description = "Co musím udělat, abych se mohl přidat k domobraně?";
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
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Co musím udělat, aby mě vzali do domobrany?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Zajdi za lordem Andrem a promluv si s ním. Od chvíle, kdy do města dorazili paladinové, velí celé domobraně on.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Najdeš ho v kasárnách. Je tam vlastně pořád.
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
	description	 = 	"Slyšel jsem, že tu zmizeli nějací lidé.";
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
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Slyšel jsem, že tu zmizeli nějací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //Vlastně jsem taky poslední dobou slyšel, že tu zmizeli nějací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Ale ani za boha to nevysvětlím.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Ale nemůžeme dělat nic jiného než mít oči otevřené a hlídat, jak nám káže povinnost.
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
	description = "Prozraď mi něco o těch paladinech.";
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
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Pověz mi něco o těch paladinech.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Jakmile přijeli do Khorinidu, obsadili horní část města.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Nikoho dalšího už tam nechtějí pouštět. Samozřejmě kromě občanů města a domobrany.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Také tu je několik paladinů, kteří hlídají jejich loď dole v přístavu. Ale ti mají do ukecanosti hodně daleko.
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
	description = "Co bych měl vědět o tomhle městě?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Co bych měl vědět o tomhle městě?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Paladinové převzali kontrolu nad celým městem. Zodpovídají se jim i všichni členové domobrany.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre je velitel domobrany - a zároveň zastává i funkci soudce.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Pokud by ses snad někdy dostal do konfliktu se zákonem, budeš se muset ospravedlnit přímo před ním.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Ale ke členům vojska je docela shovívavý. Obvykle to vyřeší nějaká pokuta.
	
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
	description = "Co je nového?";
};                       
func INT DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //Do města se poslední dobou stahuje víc a víc lůzy.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Loupeže se pomalu stávají běžnou záležitostí a lord Andre to přičítá na vrub nějaké větší skupiny.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Není to tak dlouho, co jsme vyčistili celou přístavní čtvrť, ale nenašli jsme ani jedinou ukradenou věc.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Vypadá to, že teď máme problém s lupiči víceméně pod kontrolou. Přepady se dotýkaly úplně všech, ale nedávno to ustalo.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Od té doby, co se lůza stahuje do města, to jde od desíti k pěti. Minulou noc jsem v horní části města sledoval muže v černé róbě.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Jsem si jistý, že neměl za lubem nic dobrého. Ale když jsem za ním šel kolem domu místodržícího, prostě zmizel. Pochybná existence...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Říká se, že lord Hagen najal žoldnéře na boj proti drakům. Mně to docela vyhovuje, nechtěl bych s těma potvorama bojovat sám osobně.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Povídá se, že se ty draky podařilo porazit! Lord Hagen shromažďuje svoje muže, aby Hornické údolí zbavili i všech ostatních nestvůr.
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

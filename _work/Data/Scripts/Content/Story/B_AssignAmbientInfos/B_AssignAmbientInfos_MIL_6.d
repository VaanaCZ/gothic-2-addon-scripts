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
	description = "Co musím udęlat, abych se mohl pâidat k domobranę?";
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
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Co musím udęlat, aby mę vzali do domobrany?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Zajdi za lordem Andrem a promluv si s ním. Od chvíle, kdy do męsta dorazili paladinové, velí celé domobranę on.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Najdeš ho v kasárnách. Je tam vlastnę poâád.
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
	description	 = 	"Slyšel jsem, že tu zmizeli nęjací lidé.";
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
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Slyšel jsem, že tu zmizeli nęjací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //Vlastnę jsem taky poslední dobou slyšel, že tu zmizeli nęjací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Ale ani za boha to nevysvętlím.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Ale nemůžeme dęlat nic jiného než mít oči otevâené a hlídat, jak nám káže povinnost.
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
	description = "Prozraë mi nęco o tęch paladinech.";
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
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Povęz mi nęco o tęch paladinech.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Jakmile pâijeli do Khorinidu, obsadili horní část męsta.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Nikoho dalšího už tam nechtęjí pouštęt. Samozâejmę kromę občanů męsta a domobrany.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Také tu je nękolik paladinů, kteâí hlídají jejich loë dole v pâístavu. Ale ti mají do ukecanosti hodnę daleko.
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
	description = "Co bych męl vędęt o tomhle męstę?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Co bych męl vędęt o tomhle męstę?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Paladinové pâevzali kontrolu nad celým męstem. Zodpovídají se jim i všichni členové domobrany.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre je velitel domobrany - a zároveŕ zastává i funkci soudce.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Pokud by ses snad nękdy dostal do konfliktu se zákonem, budeš se muset ospravedlnit pâímo pâed ním.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Ale ke členům vojska je docela shovívavý. Obvykle to vyâeší nęjaká pokuta.
	
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
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //Do męsta se poslední dobou stahuje víc a víc lůzy.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Loupeže se pomalu stávají bęžnou záležitostí a lord Andre to pâičítá na vrub nęjaké vętší skupiny.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Není to tak dlouho, co jsme vyčistili celou pâístavní čtvră, ale nenašli jsme ani jedinou ukradenou vęc.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Vypadá to, že teë máme problém s lupiči víceménę pod kontrolou. Pâepady se dotýkaly úplnę všech, ale nedávno to ustalo.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Od té doby, co se lůza stahuje do męsta, to jde od desíti k pęti. Minulou noc jsem v horní části męsta sledoval muže v černé róbę.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Jsem si jistý, že nemęl za lubem nic dobrého. Ale když jsem za ním šel kolem domu místodržícího, prostę zmizel. Pochybná existence...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Âíká se, že lord Hagen najal žoldnéâe na boj proti drakům. Mnę to docela vyhovuje, nechtęl bych s tęma potvorama bojovat sám osobnę.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Povídá se, že se ty draky podaâilo porazit! Lord Hagen shromažëuje svoje muže, aby Hornické údolí zbavili i všech ostatních nestvůr.
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

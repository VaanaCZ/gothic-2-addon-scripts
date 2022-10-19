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
	description = "Co musím udêlat, abych se mohl pâidat k domobranê?";
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
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Co musím udêlat, aby mê vzali do domobrany?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Zajdi za lordem Andrem a promluv si s ním. Od chvíle, kdy do mêsta dorazili paladinové, velí celé domobranê on.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Najdeš ho v kasárnách. Je tam vlastnê poâád.
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
	description	 = 	"Slyšel jsem, že tu zmizeli nêjací lidé.";
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
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Slyšel jsem, že tu zmizeli nêjací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //Vlastnê jsem taky poslední dobou slyšel, že tu zmizeli nêjací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Ale ani za boha to nevysvêtlím.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Ale nemùžeme dêlat nic jiného než mít oèi otevâené a hlídat, jak nám káže povinnost.
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
	description = "Prozraë mi nêco o têch paladinech.";
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
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Povêz mi nêco o têch paladinech.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Jakmile pâijeli do Khorinidu, obsadili horní èást mêsta.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Nikoho dalšího už tam nechtêjí pouštêt. Samozâejmê kromê obèanù mêsta a domobrany.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Také tu je nêkolik paladinù, kteâí hlídají jejich loë dole v pâístavu. Ale ti mají do ukecanosti hodnê daleko.
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
	description = "Co bych mêl vêdêt o tomhle mêstê?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Co bych mêl vêdêt o tomhle mêstê?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Paladinové pâevzali kontrolu nad celým mêstem. Zodpovídají se jim i všichni èlenové domobrany.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre je velitel domobrany - a zároveà zastává i funkci soudce.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Pokud by ses snad nêkdy dostal do konfliktu se zákonem, budeš se muset ospravedlnit pâímo pâed ním.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Ale ke èlenùm vojska je docela shovívavý. Obvykle to vyâeší nêjaká pokuta.
	
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
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //Do mêsta se poslední dobou stahuje víc a víc lùzy.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Loupeže se pomalu stávají bêžnou záležitostí a lord Andre to pâièítá na vrub nêjaké vêtší skupiny.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Není to tak dlouho, co jsme vyèistili celou pâístavní ètvrã, ale nenašli jsme ani jedinou ukradenou vêc.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Vypadá to, že teë máme problém s lupièi víceménê pod kontrolou. Pâepady se dotýkaly úplnê všech, ale nedávno to ustalo.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Od té doby, co se lùza stahuje do mêsta, to jde od desíti k pêti. Minulou noc jsem v horní èásti mêsta sledoval muže v èerné róbê.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Jsem si jistý, že nemêl za lubem nic dobrého. Ale když jsem za ním šel kolem domu místodržícího, prostê zmizel. Pochybná existence...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Âíká se, že lord Hagen najal žoldnéâe na boj proti drakùm. Mnê to docela vyhovuje, nechtêl bych s têma potvorama bojovat sám osobnê.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Povídá se, že se ty draky podaâilo porazit! Lord Hagen shromažëuje svoje muže, aby Hornické údolí zbavili i všech ostatních nestvùr.
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

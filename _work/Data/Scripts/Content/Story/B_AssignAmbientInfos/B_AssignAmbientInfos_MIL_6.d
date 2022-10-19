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
	description = "Co musím udìlat, abych se mohl pøidat k domobranì?";
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
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //Co musím udìlat, aby mì vzali do domobrany?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Zajdi za lordem Andrem a promluv si s ním. Od chvíle, kdy do mìsta dorazili paladinové, velí celé domobranì on.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Najdeš ho v kasárnách. Je tam vlastnì poøád.
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
	description	 = 	"Slyšel jsem, že tu zmizeli nìjací lidé.";
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
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //Slyšel jsem, že tu zmizeli nìjací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //Vlastnì jsem taky poslední dobou slyšel, že tu zmizeli nìjací lidé.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //Ale ani za boha to nevysvìtlím.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Ale nemùžeme dìlat nic jiného než mít oèi otevøené a hlídat, jak nám káže povinnost.
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
	description = "Prozraï mi nìco o tìch paladinech.";
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
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //Povìz mi nìco o tìch paladinech.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //Jakmile pøijeli do Khorinidu, obsadili horní èást mìsta.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //Nikoho dalšího už tam nechtìjí pouštìt. Samozøejmì kromì obèanù mìsta a domobrany.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Také tu je nìkolik paladinù, kteøí hlídají jejich loï dole v pøístavu. Ale ti mají do ukecanosti hodnì daleko.
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
	description = "Co bych mìl vìdìt o tomhle mìstì?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //Co bych mìl vìdìt o tomhle mìstì?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Paladinové pøevzali kontrolu nad celým mìstem. Zodpovídají se jim i všichni èlenové domobrany.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre je velitel domobrany - a zároveò zastává i funkci soudce.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Pokud by ses snad nìkdy dostal do konfliktu se zákonem, budeš se muset ospravedlnit pøímo pøed ním.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Ale ke èlenùm vojska je docela shovívavý. Obvykle to vyøeší nìjaká pokuta.
	
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
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //Do mìsta se poslední dobou stahuje víc a víc lùzy.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Loupeže se pomalu stávají bìžnou záležitostí a lord Andre to pøièítá na vrub nìjaké vìtší skupiny.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Není to tak dlouho, co jsme vyèistili celou pøístavní ètvr, ale nenašli jsme ani jedinou ukradenou vìc.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Vypadá to, že teï máme problém s lupièi víceménì pod kontrolou. Pøepady se dotýkaly úplnì všech, ale nedávno to ustalo.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //Od té doby, co se lùza stahuje do mìsta, to jde od desíti k pìti. Minulou noc jsem v horní èásti mìsta sledoval muže v èerné róbì.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Jsem si jistý, že nemìl za lubem nic dobrého. Ale když jsem za ním šel kolem domu místodržícího, prostì zmizel. Pochybná existence...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Øíká se, že lord Hagen najal žoldnéøe na boj proti drakùm. Mnì to docela vyhovuje, nechtìl bych s tìma potvorama bojovat sám osobnì.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //Povídá se, že se ty draky podaøilo porazit! Lord Hagen shromažïuje svoje muže, aby Hornické údolí zbavili i všech ostatních nestvùr.
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

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_16_EXIT_Condition;
	information	= DIA_BAU_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_16_JOIN_Condition;
	information	= DIA_BAU_16_JOIN_Info;
	permanent	= TRUE;
	description = "Povêz mi víc o têch žoldnéâích!";
};                       

FUNC INT DIA_BAU_16_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_JOIN_15_00"); //Âekni mi víc o têch žoldnéâích!
	AI_Output (self, other, "DIA_BAU_16_JOIN_16_01"); //Celé dny se poflakují kolem farmy, mlátêj se mezi sebou jen tak, aby si zkrátili dlouhou chvíli, a myslej si, jaká je to sranda.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_16_PEOPLE_Condition;
	information	= DIA_BAU_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_PEOPLE_15_00"); //Kdo tady tomu velí?
	AI_Output (self, other, "DIA_BAU_16_PEOPLE_16_01"); //Když se na to ptáš, tak žoldáci.
	AI_Output (self, other, "DIA_BAU_16_PEOPLE_16_02"); //Onar je sice platí, ale vêtšina z nich si dêlá, co se jim zachce.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_16_LOCATION_Condition;
	information	= DIA_BAU_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mi mùžeš âíct o tomhle místê?";
};                       

FUNC INT DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_LOCATION_15_00"); //Co mi mùžeš âíct o tomhle místê?
	AI_Output (self, other, "DIA_BAU_16_LOCATION_16_01"); //Jsou tu tâi farmy. Onarova na východê a Sekobova na severním konci údolí.
	AI_Output (self, other, "DIA_BAU_16_LOCATION_16_02"); //Po cestê se dostaneš na náhorní planinu na jihovýchodê. Tam je Bengarova farma.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_16_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_16_STANDARD_Condition;
	information	= DIA_BAU_16_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_16_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_16_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_01"); //Vojáci z mêsta už nám nebudou odvádêt náš dobytek a brát úrodu! Teë, když už se mùžeme bránit, nêjak ztratili zájem!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_02"); //Âíká se, že se v Hornickém údolí shromažëuje obâí armáda. Za chvíli tady budou.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_03"); //Zaslechl jsem nêjaké zvêsti o tom, že jsou v Hornickém údolí draci. Stêží tomu mùžu uvêâit.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_04"); //Nêkteâí že žoldnéâù zmizeli. Nevím, jestli to mám považovat ze dobrou, nebo špatnou vêc.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_16_STANDARD_16_05"); //Paladinové na tažení do Hornického údolí - co to všechno má znamenat?
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_16 (var c_NPC slf)
{
	DIA_BAU_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

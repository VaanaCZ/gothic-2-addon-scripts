// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Povìz mi víc o tìch žoldnéøích!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //Øekni mi víc o tìch žoldnéøích!
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Pokud jsi s nima ještì nemìl žádný problémy, zajdi za Leem. On je ten, pro koho my farmáøi dìláme. Je na svý lidi vážnì pøísnej.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Když kdokoli z nich udìlá nìco špatnì, nechá mu to pìknì sežrat.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //Kdo tady tomu velí?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Když to chceš vìdìt, tak žoldáci. Jasnì, Onar je platí, ale jen Innos ví, jak dlouho se jim bude ještì chtít poslouchat jeho rozkazy.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //Až si žoldáci vzpomenou, že už jim tady k nièemu neni, nechtìl bych bejt v jeho kùži.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mi mùžeš øíct o tomhle místì?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Co mi mùžeš øíct o tomhle místì?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //Jsou tady tøi farmy. Onarova na východì a Sekobova na severním konci údolí.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //Po cestì se dostaneš na náhorní planinu na jihovýchodì. Tam je Bengarova farma.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_13_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_13_STANDARD_Condition;
	information	= DIA_BAU_13_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Vojáci z mìsta už nám nebudou odvádìt náš dobytek a brát úrodu! Teï, když už se mùžeme bránit, nìjak ztratili zájem!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Paladinùm ve mìstì jsme my farmáøi úplnì ukradený. Jestli skøeti zaútoèí, musíme se spolehnout jen sami na sebe.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //Draci! Proslýchá se, že se v Hornickém údolí objevili draci. Urèitì se brzo dostanou pøes bránu!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //Už vidìli nìkolik banditù z hor, jak míøí do Hornickýho údolí. To je pro mì moc nebezpeèný.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Jestli se sníží danì a my dostaneme za svou práci odpovídající odmìnu, pak mùžeme s mìstem zaèít znovu obchodovat.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

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
	description = "Povęz mi víc o tęch žoldnéâích!";
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
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //Âekni mi víc o tęch žoldnéâích!
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Pokud jsi s nima ještę nemęl žádný problémy, zajdi za Leem. On je ten, pro koho my farmáâi dęláme. Je na svý lidi vážnę pâísnej.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Když kdokoli z nich udęlá nęco špatnę, nechá mu to pęknę sežrat.
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
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Když to chceš vędęt, tak žoldáci. Jasnę, Onar je platí, ale jen Innos ví, jak dlouho se jim bude ještę chtít poslouchat jeho rozkazy.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //Až si žoldáci vzpomenou, že už jim tady k ničemu neni, nechtęl bych bejt v jeho kůži.
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
	description = "Co mi můžeš âíct o tomhle místę?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Co mi můžeš âíct o tomhle místę?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //Jsou tady tâi farmy. Onarova na východę a Sekobova na severním konci údolí.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //Po cestę se dostaneš na náhorní planinu na jihovýchodę. Tam je Bengarova farma.
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
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Vojáci z męsta už nám nebudou odvádęt náš dobytek a brát úrodu! Teë, když už se můžeme bránit, nęjak ztratili zájem!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Paladinům ve męstę jsme my farmáâi úplnę ukradený. Jestli skâeti zaútočí, musíme se spolehnout jen sami na sebe.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //Draci! Proslýchá se, že se v Hornickém údolí objevili draci. Určitę se brzo dostanou pâes bránu!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //Už vidęli nękolik banditů z hor, jak míâí do Hornickýho údolí. To je pro mę moc nebezpečný.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Jestli se sníží danę a my dostaneme za svou práci odpovídající odmęnu, pak můžeme s męstem začít znovu obchodovat.
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

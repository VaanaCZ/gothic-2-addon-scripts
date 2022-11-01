// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_7_EXIT_Condition;
	information	= DIA_BAU_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_7_JOIN_Condition;
	information	= DIA_BAU_7_JOIN_Info;
	permanent	= TRUE;
	description = "Co víš o tęch žoldnéâích?";
};                       

FUNC INT DIA_BAU_7_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_JOIN_15_00"); //Co víš o tęch žoldnéâích?
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_01"); //Onar si je najal, aby chránili jeho farmu.
	AI_Output (self, other, "DIA_BAU_7_JOIN_07_02"); //Vętšina se jich chová, jako by jim farma snad patâila. Ale v každém pâípadę nás chrání.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_7_PEOPLE_Condition;
	information	= DIA_BAU_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_PEOPLE_15_00"); //Kdo tady tomu velí?
	AI_Output (self, other, "DIA_BAU_7_PEOPLE_07_01"); //Ta velká farma patâí Onarovi. Stejnę jako ty malý okolo. Ale ty jsou teë v pronájmu.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_7_LOCATION_Condition;
	information	= DIA_BAU_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Povęz mi o tomhle místę nęco víc.";
};                       

FUNC INT DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_LOCATION_15_00"); //Âekni mi víc o tomhle místę.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_01"); //Ta velká farma tady na východę údolí patâí Onarovi. Sekobova leží na severu.
	AI_Output (self, other, "DIA_BAU_7_LOCATION_07_02"); //A Bengarova farma je na náhorní plošinę na jihovýchodę. Z údolí se tam dostaneš celkem snadno - vedou tam velké kamenné schody.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_7_STANDARD_Condition;
	information	= DIA_BAU_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_7_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_01"); //Vyhlásili jsme nezávislost - už nebudeme męstu dál odvádęt danę. Král pro nás nehne ani prstem - už jsme toho męli prostę dost!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_02"); //Teë se tady toho moc nedęje.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_03"); //Začaly se tu proslýchat zvęsti o dracích! Král si vždycky vymyslí nęco novýho, jen aby mohl z lidí vymáčknout další peníze.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_04"); //Dávej si pozor, poslední dobou se sem pâes bránu dostává strašnę moc temnejch postav a divoký zvęâe.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_7_STANDARD_07_05"); //Teë, když jsou draci mrtví, se konečnę pánové paladinové uráčili odtáhnout z męsta. Už je načase, aby se sem vrátila spravedlnost.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_7 (var c_NPC slf)
{
	DIA_BAU_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

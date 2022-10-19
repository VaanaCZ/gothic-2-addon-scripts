// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_1_EXIT_Condition;
	information	= DIA_BAU_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_1_JOIN_Condition;
	information	= DIA_BAU_1_JOIN_Info;
	permanent	= TRUE;
	description = "Øekni mi víc o tìch žoldnéøích.";
};                       

FUNC INT DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Povìz mi víc o tìch žoldnéøích.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Jediný, co ti mùžu poradit, je, aby ses jim zdaleka vyhnul.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Jestli se nìkterýmu z nich nebude zamlouvat tvùj ksicht, prostì ti krapet vylepší nos.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Pak si mùžeš u Leeho stìžovat, ale ten nos už stejnì zùstane zlomenej.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_1_PEOPLE_Condition;
	information	= DIA_BAU_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_PEOPLE_15_00"); //Kdo tady tomu velí?
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_01"); //Tohle je Onarova farma. On tady má všechno pod palcem.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Dovol, abych ti dal menší radu: moc ty žoldáky neprovokuj. S tìmahle není radno si zahrávat.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //Sylvio je takovej zkorumpovanej mizera. Ale jejich vùdce, Lee, je docela v klidu.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_1_LOCATION_Condition;
	information	= DIA_BAU_1_LOCATION_Info;
	permanent	= TRUE;
	description = "A co je tady poblíž dalšího?";
};                       

FUNC INT DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_LOCATION_15_00"); //A co je tady poblíž dalšího?
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Jen pole a farmy. A spousta žoldákù. Ale vìtšina jich je na východì na Onarovì farmì.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //Na sever leží Sekobova farma, ale tam chodí jen vybírat nájem.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //Na jihozápadì narazíš na cestu k Bengarovì farmì.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_1_STANDARD_Condition;
	information	= DIA_BAU_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_1_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Onar si najal žoldáky, aby udrželi domobranu ve mìstì. Jinak by nám odvedli i tu poslední ovci!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Nic moc. Poøád ty samý problémy. Domobrana, skøeti a polní škùdci.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Zaèaly se tu dít divný vìci. Pøed pár dny jsem v noci zahlídl èernou siluetu. A nebyl to èlovìk.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //Èím dál tím èastìjc tu vídáme skøety. Obèas mám dojem, jako by se jich za každýho mrtvýho objevilo nìkolik dalších.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //Paladinové vyrazili do Hornickýho údolí. Co to všechno má znamenat? Nemùžeme si dovolit ztratit jedinýho muže, abysme udrželi domobranu na uzdì.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_1 (var c_NPC slf)
{
	DIA_BAU_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

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
	description = "Âekni mi víc o tęch žoldnéâích.";
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
	AI_Output (other, self, "DIA_BAU_1_JOIN_15_00"); //Povęz mi víc o tęch žoldnéâích.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_01"); //Jediný, co ti můžu poradit, je, aby ses jim zdaleka vyhnul.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_02"); //Jestli se nękterýmu z nich nebude zamlouvat tvůj ksicht, prostę ti krapet vylepší nos.
	AI_Output (self, other, "DIA_BAU_1_JOIN_01_03"); //Pak si můžeš u Leeho stęžovat, ale ten nos už stejnę zůstane zlomenej.
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
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_02"); //Dovol, abych ti dal menší radu: moc ty žoldáky neprovokuj. S tęmahle není radno si zahrávat.
	AI_Output (self, other, "DIA_BAU_1_PEOPLE_01_03"); //Sylvio je takovej zkorumpovanej mizera. Ale jejich vůdce, Lee, je docela v klidu.
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
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_01"); //Jen pole a farmy. A spousta žoldáků. Ale vętšina jich je na východę na Onarovę farmę.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_02"); //Na sever leží Sekobova farma, ale tam chodí jen vybírat nájem.
	AI_Output (self, other, "DIA_BAU_1_LOCATION_01_03"); //Na jihozápadę narazíš na cestu k Bengarovę farmę.
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
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_01"); //Onar si najal žoldáky, aby udrželi domobranu ve męstę. Jinak by nám odvedli i tu poslední ovci!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_02"); //Nic moc. Poâád ty samý problémy. Domobrana, skâeti a polní škůdci.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_03"); //Začaly se tu dít divný vęci. Pâed pár dny jsem v noci zahlídl černou siluetu. A nebyl to človęk.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_04"); //Čím dál tím častęjc tu vídáme skâety. Občas mám dojem, jako by se jich za každýho mrtvýho objevilo nękolik dalších.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_1_STANDARD_01_05"); //Paladinové vyrazili do Hornickýho údolí. Co to všechno má znamenat? Nemůžeme si dovolit ztratit jedinýho muže, abysme udrželi domobranu na uzdę.
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

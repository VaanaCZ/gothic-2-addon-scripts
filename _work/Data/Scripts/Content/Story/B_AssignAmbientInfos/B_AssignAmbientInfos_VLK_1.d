// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_1_EXIT_Condition;
	information	= DIA_VLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_1_JOIN_Condition;
	information	= DIA_VLK_1_JOIN_Info;
	permanent	= TRUE;
	description = "Jak se mùžu stát obèanem mìsta?";
};                       

FUNC INT DIA_VLK_1_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //Jak se mùžu stát obèanem mìsta?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Najdi si slušnou práci! Každý, kdo je v Khorinidu zamìstnán, je považován za obèana mìsta.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_1_PEOPLE_Condition;
	information	= DIA_VLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady zastává dùležité funkce?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //Kdo tady zastává dùležité funkce?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(smích) Až donedávna to byl místodržící a soudce. Ale pak pøijeli paladinové a pøevzali nad mìstem moc.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Jejich velitelem je lord Hagen. Je také novým místodržícím, víceménì.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Lord Andre je jeho pravou rukou. Velí mìstské stráži a také zastává roli soudce.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Každý, kdo se ve mìstì nìèím proviní, se zodpovídá pøímo jemu.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_1_LOCATION_Condition;
	information	= DIA_VLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Je v tomhle mìstì nìco zajímavého?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Co je ve mìstì zajímavého?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Mùžeš tu koupit témìø vše, na co si vzpomeneš. Buï od obchodníkù na tržišti, nebo v dolní èásti mìsta.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Ale taky skoro všechno, co si mùžeš koupit, nìco stojí.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Pokud nemáš dost penìz, mùže ti pomoct lichváø Lehmar. Pokud pùjdeš k dokùm z dolní èásti mìsta, narazíš na jeho dùm hned u vstupu do pøístavní ètvrti.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_1_STANDARD_Condition;
	information	= DIA_VLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Od té doby, co bariéra vzala za své, se náhle pøerušil obchod s velkými farmáøi. Kdo ví, co mají za lubem.  Chystá se nìjaká levárna.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar zašel moc daleko. Poøád odmítá zásobovat mìsto. Jestli domobrana brzy nezasáhne, zaènou si i ostatní farmy dìlat, co se jim zlíbí.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //Slyšel jsem, že se žoldnéøi spojili s mágy. Mocnými temnými mágy v èerných róbách. Pøísahal bych, že jsem jednoho z nich minulou noc zahlédl ve mìstì.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //Slyšel jsem, že se nìkteøí z Onarových žoldnéøù vydali zabít draky. Koneènì zaèali dìlat nìco užiteèného!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //Øíká se, že draci byli poraženi! Lord Hagen shromažïuje své muže, aby v Hornickém údolí skoncovali i se zbývajícími nestvùrami.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_1 (var c_NPC slf)
{
	DIA_VLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

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
	description = "Jak se můžu stát občanem města?";
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
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //Jak se můžu stát občanem města?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Najdi si slušnou práci! Každý, kdo je v Khorinidu zaměstnán, je považován za občana města.
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
	description = "Kdo tady zastává důležité funkce?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //Kdo tady zastává důležité funkce?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(smích) Až donedávna to byl místodržící a soudce. Ale pak přijeli paladinové a převzali nad městem moc.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Jejich velitelem je lord Hagen. Je také novým místodržícím, víceméně.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Lord Andre je jeho pravou rukou. Velí městské stráži a také zastává roli soudce.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Každý, kdo se ve městě něčím proviní, se zodpovídá přímo jemu.
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
	description = "Je v tomhle městě něco zajímavého?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Co je ve městě zajímavého?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Můžeš tu koupit téměř vše, na co si vzpomeneš. Buď od obchodníků na tržišti, nebo v dolní části města.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Ale taky skoro všechno, co si můžeš koupit, něco stojí.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Pokud nemáš dost peněz, může ti pomoct lichvář Lehmar. Pokud půjdeš k dokům z dolní části města, narazíš na jeho dům hned u vstupu do přístavní čtvrti.
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
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Od té doby, co bariéra vzala za své, se náhle přerušil obchod s velkými farmáři. Kdo ví, co mají za lubem.  Chystá se nějaká levárna.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar zašel moc daleko. Pořád odmítá zásobovat město. Jestli domobrana brzy nezasáhne, začnou si i ostatní farmy dělat, co se jim zlíbí.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //Slyšel jsem, že se žoldnéři spojili s mágy. Mocnými temnými mágy v černých róbách. Přísahal bych, že jsem jednoho z nich minulou noc zahlédl ve městě.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //Slyšel jsem, že se někteří z Onarových žoldnéřů vydali zabít draky. Konečně začali dělat něco užitečného!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //Říká se, že draci byli poraženi! Lord Hagen shromažďuje své muže, aby v Hornickém údolí skoncovali i se zbývajícími nestvůrami.
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

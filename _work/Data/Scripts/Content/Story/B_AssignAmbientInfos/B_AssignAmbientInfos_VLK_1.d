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
	description = "Jak se můžu stát občanem męsta?";
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
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //Jak se můžu stát občanem męsta?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Najdi si slušnou práci! Každý, kdo je v Khorinidu zamęstnán, je považován za občana męsta.
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
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(smích) Až donedávna to byl místodržící a soudce. Ale pak pâijeli paladinové a pâevzali nad męstem moc.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Jejich velitelem je lord Hagen. Je také novým místodržícím, víceménę.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Lord Andre je jeho pravou rukou. Velí męstské stráži a také zastává roli soudce.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Každý, kdo se ve męstę nęčím proviní, se zodpovídá pâímo jemu.
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
	description = "Je v tomhle męstę nęco zajímavého?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Co je ve męstę zajímavého?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Můžeš tu koupit témęâ vše, na co si vzpomeneš. Buë od obchodníků na tržišti, nebo v dolní části męsta.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Ale taky skoro všechno, co si můžeš koupit, nęco stojí.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Pokud nemáš dost penęz, může ti pomoct lichváâ Lehmar. Pokud půjdeš k dokům z dolní části męsta, narazíš na jeho dům hned u vstupu do pâístavní čtvrti.
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
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Od té doby, co bariéra vzala za své, se náhle pâerušil obchod s velkými farmáâi. Kdo ví, co mají za lubem.  Chystá se nęjaká levárna.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar zašel moc daleko. Poâád odmítá zásobovat męsto. Jestli domobrana brzy nezasáhne, začnou si i ostatní farmy dęlat, co se jim zlíbí.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //Slyšel jsem, že se žoldnéâi spojili s mágy. Mocnými temnými mágy v černých róbách. Pâísahal bych, že jsem jednoho z nich minulou noc zahlédl ve męstę.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //Slyšel jsem, že se nękteâí z Onarových žoldnéâů vydali zabít draky. Konečnę začali dęlat nęco užitečného!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //Âíká se, že draci byli poraženi! Lord Hagen shromažëuje své muže, aby v Hornickém údolí skoncovali i se zbývajícími nestvůrami.
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

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_17_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_17_EXIT_Condition;
	information	= DIA_VLK_17_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_17_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_17_JOIN_Condition;
	information	= DIA_VLK_17_JOIN_Info;
	permanent	= TRUE;
	description = "Co musím udêlat, abych se mohl stát obèanem mêsta?";
};                       

FUNC INT DIA_VLK_17_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_17_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //Co musím udêlat, abych se mohl stát obèanem mêsta?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //Tady v Khorinidu mají velké slovo âemeslniètí mistâi z dolní èásti mêsta. Mêl by sis s jedním z nich promluvit.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_17_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_17_PEOPLE_Condition;
	information	= DIA_VLK_17_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo v tomhle mêstê požívá nejvêtší vážnosti?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //Kdo v tomhle mêstê požívá nejvêtší vážnosti?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Jakmile dorazili paladinové do mêsta, pâevzali velení nad celým Khorinidem.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Lord Andre tu pâedstavuje zákon. Nalezneš ho v kasárnách.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Ale má smysl k nêmu chodit jen tehdy, pokud se dostaneš do konfliktu se zákonem nebo se budeš chtít pâidat k domobranê.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_17_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_17_LOCATION_Condition;
	information	= DIA_VLK_17_LOCATION_Info;
	permanent	= TRUE;
	description = "Je tady v Khorinidu nêjaké zajímavé místo?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //Je tady v Khorinidu nêjaké zajímavé místo?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(smích) Možná by ses na to mêl radêji zeptat nêjakého chlapa. Pokud máš na mysli zábavu, zkus se podívat do pâístavu.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Ale pokud chceš nêco koupit, zajdi na trh u východní brány nebo do dolní èásti mêsta.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_17_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_17_STANDARD_Condition;
	information	= DIA_VLK_17_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Zajímalo by mê, proè tady ti paladinové vlastnê jsou. Zabrali radnici, kasárna i pâístav, ale zatím neudêlali vùbec nic.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //Pokud pâijeli kvùli skâetùm a banditùm, mêli zakroèit už pâed drahnou dobou. Musí mít ještê jiný dùvod.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //Už mi došlo, proè tu ti paladinové jsou - je to kvùli rudê. Udêlali by líp, kdyby místo toho radêji bránili naše mêsto.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //Doufám, že je na têch draèích povídaèkách nêco pravdy. V tom pâípadê totiž bude muset lord Hagen zaèít nêco dêlat. Nemùže nás pâece jen tak nechat drakùm napospas.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Teë, když jsou ti draci mrtví, zatoèí paladinové snadno i ostatním neâádstvem.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_17 (var c_NPC slf)
{
	DIA_VLK_17_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_17_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_17_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

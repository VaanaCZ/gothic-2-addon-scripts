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
	description = "Co musím udęlat, abych se mohl stát občanem męsta?";
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
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //Co musím udęlat, abych se mohl stát občanem męsta?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //Tady v Khorinidu mají velké slovo âemeslničtí mistâi z dolní části męsta. Męl by sis s jedním z nich promluvit.
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
	description = "Kdo v tomhle męstę požívá nejvętší vážnosti?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //Kdo v tomhle męstę požívá nejvętší vážnosti?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Jakmile dorazili paladinové do męsta, pâevzali velení nad celým Khorinidem.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Lord Andre tu pâedstavuje zákon. Nalezneš ho v kasárnách.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Ale má smysl k nęmu chodit jen tehdy, pokud se dostaneš do konfliktu se zákonem nebo se budeš chtít pâidat k domobranę.
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
	description = "Je tady v Khorinidu nęjaké zajímavé místo?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //Je tady v Khorinidu nęjaké zajímavé místo?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(smích) Možná by ses na to męl radęji zeptat nęjakého chlapa. Pokud máš na mysli zábavu, zkus se podívat do pâístavu.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Ale pokud chceš nęco koupit, zajdi na trh u východní brány nebo do dolní části męsta.
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
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Zajímalo by mę, proč tady ti paladinové vlastnę jsou. Zabrali radnici, kasárna i pâístav, ale zatím neudęlali vůbec nic.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //Pokud pâijeli kvůli skâetům a banditům, męli zakročit už pâed drahnou dobou. Musí mít ještę jiný důvod.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //Už mi došlo, proč tu ti paladinové jsou - je to kvůli rudę. Udęlali by líp, kdyby místo toho radęji bránili naše męsto.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //Doufám, že je na tęch dračích povídačkách nęco pravdy. V tom pâípadę totiž bude muset lord Hagen začít nęco dęlat. Nemůže nás pâece jen tak nechat drakům napospas.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Teë, když jsou ti draci mrtví, zatočí paladinové snadno i ostatním neâádstvem.
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

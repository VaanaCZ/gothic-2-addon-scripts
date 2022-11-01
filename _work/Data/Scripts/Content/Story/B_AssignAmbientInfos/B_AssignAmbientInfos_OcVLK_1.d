// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_1_EXIT_Condition;
	information	= DIA_OCVLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************

INSTANCE DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_1_PEOPLE_Condition;
	information	= DIA_OCVLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tomu tady velí?";
};                       

FUNC INT DIA_OCVLK_1_PEOPLE_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_PEOPLE_15_00"); //Kdo tomu tady velí?
	AI_Output (self, other, "DIA_OCVLK_1_PEOPLE_01_01"); //Velitel Garond. Ale od chvíle, co se tu situace zhoršila, ho nikdo nevidęl jinde než v trůnním sálu. Je mi líto, že to vzalo tak špatný konec.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_1_LOCATION_Condition;
	information	= DIA_OCVLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Co víš o Hornickém údolí?";
};                       

FUNC INT DIA_OCVLK_1_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_LOCATION_15_00"); //Co víš o Hornickém údolí?
	AI_Output (self, other, "DIA_OCVLK_1_LOCATION_01_01"); //Nękolik z našich hochů je ještę stále v dolech a snaží se tęžit. Teda alespoŕ co vím.
	AI_Output (self, other, "DIA_OCVLK_1_LOCATION_01_02"); //Nechtęl bych s nimi męnit. Celé údolí se hemží skâety. A to se ani nezmiŕuju o dracích.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_1_STANDARD_Condition;
	information	= DIA_OCVLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};                       
func INT DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_1_STANDARD_15_00"); //Jak se vede?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_01"); //Skâeti nás mají pâesnę tam, kde nás chtęli mít! Bez posil se dlouho neudržíme! Docela mę pâekvapuje, že nás draci jednoduše nedodęlali všechny.
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_02"); //Tak se konečnę pâece jen dočkáme posil.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_03"); //Slyším dobâe, že všichni draci byli zabiti? Díky Innosovi!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_04"); //Tahle zpropadená ruda. Męli bysme ji všechnu shodit dolů z cimbuâí. Pak by nás skâeti možná nechali na pokoji.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_1_STANDARD_01_05"); //Ty smęšné bedny, které tak nedbale naházeli pâed vchod, nemůžou skâetům nijak pâekazit jejich plány!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_1 (var c_NPC slf)
{
	DIA_OCVLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_PEOPLE.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

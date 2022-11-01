// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCVLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCVLK_6_EXIT_Condition;
	information	= DIA_OCVLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCVLK_6_PEOPLE_Condition;
	information	= DIA_OCVLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCVLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //Kdo tady tomu velí?
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //Garond má velení nad celou pevností - nebo alespoň nad tím, co z ní zbylo.
	AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //Ale sám se prakticky o nic nestará - leda když se některý z jeho mužů dostane do potíží.
	if (Npc_IsDead (Engor) == FALSE)
	{
		AI_Output (self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //Pokud chceš nějaké vybavení, měl bys zajít za Engorem. Najdeš ho v budově naproti Garondovi.
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCVLK_6_LOCATION_Condition;
	information	= DIA_OCVLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mi můžeš říct o situaci v Hornickém údolí?";
};                       

FUNC INT DIA_OCVLK_6_LOCATION_Condition()
{
	if (Kapitel <= 4)
	&& (MIS_KilledDragons < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_OCVLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_LOCATION_15_00"); //Co mi můžeš říct o situaci v Hornickém údolí?
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_01"); //Ta skřetí palisáda mi dělá starosti. Raději ani nechci vědět, co za ní skřeti skrývají.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_02"); //Nejdřív se jich tu potulovalo jen pár - postavili palisádu. Pak jedné noci přitáhli i s obléhacími stroji.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_03"); //Měli jsme štěstí a podařilo se nám útok odrazit.
	AI_Output (self, other, "DIA_OCVLK_6_LOCATION_06_04"); //Za tou zdí se rozprostírá moře. Pokud připlujou další lodě se skřety na palubě, nebudeme mít žádnou šanci.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCVLK_6_STANDARD_Condition;
	information	= DIA_OCVLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};                       
func INT DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_OCVLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCVLK_6_STANDARD_15_00"); //Jak se vede?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_01"); //Vstup do armády a bude se ti dobře dařit, říkali. A teď tohle.
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_02"); //Teď je pod trestem smrti zakázáno se jen přiblížit k zásobám potravin. Zdá se, že se Garond bojí, že bychom mohli vyplenit zásoby a pak vzít kramle. (zatrpklý smích)
		AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_03"); //Všichni pochcípeme hlady, pokud nás teda dřív neusmaží ti zatracení draci!
	};
	
	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_04"); //Drakobijci. Nenech se vysmát! Ti nic nezmůžou.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_05"); //Říká se, že všichni draci jsou mrtví! Teď máme šanci!
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_06"); //Tahle zpropadená ruda. Měli bysme jí všechnu shodit dolů z cimbuří. Pak by nás skřeti možná nechali na pokoji.
		}
		else
		{
			AI_Output (self,other,"DIA_OCVLK_6_STANDARD_06_07"); //Ty směšné bedny, které tak nedbale naházeli před vchod, nemůžou skřetům nijak překazit jejich plány!
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCVLK_6 (var c_NPC slf)
{
	DIA_OCVLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_6_EXIT_Condition;
	information	= DIA_VLK_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_6_JOIN_Condition;
	information	= DIA_VLK_6_JOIN_Info;
	permanent	= TRUE;
	description = "Jak se můžu stát občanem tohoto męsta?";
};                       

FUNC INT DIA_VLK_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //Jak se můžu stát občanem tohoto męsta?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Chceš se tu usadit? Teë? Když všechno smęâuje ke konci svęta?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Nechci tu zůstat napoâád.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Fajn, pokud stojíš o moji radu, męl bys odsud upalovat nejdál, co můžeš. Ale když na tom trváš, męl by sis promluvit s jedním z vlivných męšăanů.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_6_PEOPLE_Condition;
	information	= DIA_VLK_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kde najdu vlivné občany Khorinidu?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Kde najdu vlivné občany Khorinidu?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Zkus to u kováâe nebo truhláâe v dolní části męsta. Najdeš tam i nękolik dalších vážených mistrů.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Pokud tady má kromę męstské stráže a paladinů nękdo nęjaké slovo, jsou to tihle muži.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_6_LOCATION_Condition;
	information	= DIA_VLK_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Jak se mám ve męstę vyznat?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Jak se mám ve męstę vyznat?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Není tak snadné najít správný smęr, co? Ani ty ukazatele nedokážou pomoct úplnę vždycky.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Pokud máš špatný orientační smysl, męl bys zajít dolů do pâístavu - teda pokud tam trefíš - a poohlédnout se po domku kartografa.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Je to hned za hospodou v pâístavišti. Brahim pro tebe určitę bude nęjakou mapu męsta mít.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_6_STANDARD_Condition;
	information	= DIA_VLK_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Od té doby, co bariéra vzala za své, je tohle męsto plné banditů. Ale paladinové nedęlají vůbec nic. Tak proč tu ksakru vůbec jsou?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Poslední dobou už to s tęmi bandity není tak zlé. Skoro to vypadá, že s tím nękdo začal nęco dęlat.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Nechali jít toho mizernýho žoldáka, co zabil paladina. Nebylo by od vęci, kdyby ho místo toho radęji obęsili.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Âíká se, že jeden z Onarových žoldáků zabil paladina. Toho chlápka chytili a zavâeli do žaláâe. Už brzo se bude houpat.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Rád bych vędęl, co je na tęch dračích povídačkách pravdy.
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Âíká se, že lord Hagen shromažëuje své muže, aby osvobodili Hornické údolí. Konečnę se začaly vęci hýbat!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_6 (var c_NPC slf)
{
	DIA_VLK_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};

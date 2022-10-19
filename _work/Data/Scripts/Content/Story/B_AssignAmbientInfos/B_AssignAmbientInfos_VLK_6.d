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
	description = "Jak se mùžu stát obèanem tohoto mêsta?";
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
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //Jak se mùžu stát obèanem tohoto mêsta?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Chceš se tu usadit? Teë? Když všechno smêâuje ke konci svêta?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Nechci tu zùstat napoâád.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Fajn, pokud stojíš o moji radu, mêl bys odsud upalovat nejdál, co mùžeš. Ale když na tom trváš, mêl by sis promluvit s jedním z vlivných mêšãanù.
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
	description = "Kde najdu vlivné obèany Khorinidu?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Kde najdu vlivné obèany Khorinidu?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Zkus to u kováâe nebo truhláâe v dolní èásti mêsta. Najdeš tam i nêkolik dalších vážených mistrù.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Pokud tady má kromê mêstské stráže a paladinù nêkdo nêjaké slovo, jsou to tihle muži.
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
	description = "Jak se mám ve mêstê vyznat?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Jak se mám ve mêstê vyznat?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Není tak snadné najít správný smêr, co? Ani ty ukazatele nedokážou pomoct úplnê vždycky.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Pokud máš špatný orientaèní smysl, mêl bys zajít dolù do pâístavu - teda pokud tam trefíš - a poohlédnout se po domku kartografa.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Je to hned za hospodou v pâístavišti. Brahim pro tebe urèitê bude nêjakou mapu mêsta mít.
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
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Od té doby, co bariéra vzala za své, je tohle mêsto plné banditù. Ale paladinové nedêlají vùbec nic. Tak proè tu ksakru vùbec jsou?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Poslední dobou už to s têmi bandity není tak zlé. Skoro to vypadá, že s tím nêkdo zaèal nêco dêlat.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Nechali jít toho mizernýho žoldáka, co zabil paladina. Nebylo by od vêci, kdyby ho místo toho radêji obêsili.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Âíká se, že jeden z Onarových žoldákù zabil paladina. Toho chlápka chytili a zavâeli do žaláâe. Už brzo se bude houpat.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Rád bych vêdêl, co je na têch draèích povídaèkách pravdy.
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Âíká se, že lord Hagen shromažëuje své muže, aby osvobodili Hornické údolí. Koneènê se zaèaly vêci hýbat!
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

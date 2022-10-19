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
	description = "Jak se mùžu stát obèanem tohoto mìsta?";
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
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //Jak se mùžu stát obèanem tohoto mìsta?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Chceš se tu usadit? Teï? Když všechno smìøuje ke konci svìta?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Nechci tu zùstat napoøád.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Fajn, pokud stojíš o moji radu, mìl bys odsud upalovat nejdál, co mùžeš. Ale když na tom trváš, mìl by sis promluvit s jedním z vlivných mìšanù.
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
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Zkus to u kováøe nebo truhláøe v dolní èásti mìsta. Najdeš tam i nìkolik dalších vážených mistrù.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Pokud tady má kromì mìstské stráže a paladinù nìkdo nìjaké slovo, jsou to tihle muži.
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
	description = "Jak se mám ve mìstì vyznat?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Jak se mám ve mìstì vyznat?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Není tak snadné najít správný smìr, co? Ani ty ukazatele nedokážou pomoct úplnì vždycky.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Pokud máš špatný orientaèní smysl, mìl bys zajít dolù do pøístavu - teda pokud tam trefíš - a poohlédnout se po domku kartografa.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Je to hned za hospodou v pøístavišti. Brahim pro tebe urèitì bude nìjakou mapu mìsta mít.
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
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Od té doby, co bariéra vzala za své, je tohle mìsto plné banditù. Ale paladinové nedìlají vùbec nic. Tak proè tu ksakru vùbec jsou?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Poslední dobou už to s tìmi bandity není tak zlé. Skoro to vypadá, že s tím nìkdo zaèal nìco dìlat.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Nechali jít toho mizernýho žoldáka, co zabil paladina. Nebylo by od vìci, kdyby ho místo toho radìji obìsili.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //Øíká se, že jeden z Onarových žoldákù zabil paladina. Toho chlápka chytili a zavøeli do žaláøe. Už brzo se bude houpat.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //Rád bych vìdìl, co je na tìch draèích povídaèkách pravdy.
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //Øíká se, že lord Hagen shromažïuje své muže, aby osvobodili Hornické údolí. Koneènì se zaèaly vìci hýbat!
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

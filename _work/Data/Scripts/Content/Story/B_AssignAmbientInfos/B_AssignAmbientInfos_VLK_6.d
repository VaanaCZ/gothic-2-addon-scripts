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
	description = "Jak se m��u st�t ob�anem tohoto m�sta?";
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
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_00"); //Jak se m��u st�t ob�anem tohoto m�sta?
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_01"); //Chce� se tu usadit? Te�? Kdy� v�echno sm��uje ke konci sv�ta?
	AI_Output (other, self, "DIA_VLK_6_JOIN_15_02"); //Nechci tu z�stat napo��d.
	AI_Output (self, other, "DIA_VLK_6_JOIN_06_03"); //Fajn, pokud stoj� o moji radu, m�l bys odsud upalovat nejd�l, co m��e�. Ale kdy� na tom trv�, m�l by sis promluvit s jedn�m z vlivn�ch m욝an�.
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
	description = "Kde najdu vlivn� ob�any Khorinidu?";
};                       

FUNC INT DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_PEOPLE_15_00"); //Kde najdu vlivn� ob�any Khorinidu?
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_01"); //Zkus to u kov��e nebo truhl��e v doln� ��sti m�sta. Najde� tam i n�kolik dal��ch v�en�ch mistr�.
	AI_Output (self, other, "DIA_VLK_6_PEOPLE_06_02"); //Pokud tady m� krom� m�stsk� str�e a paladin� n�kdo n�jak� slovo, jsou to tihle mu�i.
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
	description = "Jak se m�m ve m�st� vyznat?";
};                       

FUNC INT DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_LOCATION_15_00"); //Jak se m�m ve m�st� vyznat?
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_01"); //Nen� tak snadn� naj�t spr�vn� sm�r, co? Ani ty ukazatele nedok�ou pomoct �pln� v�dycky.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_02"); //Pokud m� �patn� orienta�n� smysl, m�l bys zaj�t dol� do p��stavu - teda pokud tam tref� - a poohl�dnout se po domku kartografa.
	AI_Output (self, other, "DIA_VLK_6_LOCATION_06_03"); //Je to hned za hospodou v p��stavi�ti. Brahim pro tebe ur�it� bude n�jakou mapu m�sta m�t.
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
	description = "Co je nov�ho?";
};                       
func INT DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_6_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_01"); //Od t� doby, co bari�ra vzala za sv�, je tohle m�sto pln� bandit�. Ale paladinov� ned�laj� v�bec nic. Tak pro� tu ksakru v�bec jsou?
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_02"); //Posledn� dobou u� to s t�mi bandity nen� tak zl�. Skoro to vypad�, �e s t�m n�kdo za�al n�co d�lat.
	};
	
	if (Kapitel == 3)
	{
		if MIS_RescueBennet == LOG_SUCCESS
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_03"); //Nechali j�t toho mizern�ho �old�ka, co zabil paladina. Nebylo by od v�ci, kdyby ho m�sto toho rad�ji ob�sili.
		}
		else
		{
			AI_Output (self,other,"DIA_VLK_6_STANDARD_06_04"); //��k� se, �e jeden z Onarov�ch �old�k� zabil paladina. Toho chl�pka chytili a zav�eli do �al��e. U� brzo se bude houpat.
		};
	};
	
	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_05"); //R�d bych v�d�l, co je na t�ch dra��ch pov�da�k�ch pravdy.
	};

	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_6_STANDARD_06_06"); //��k� se, �e lord Hagen shroma��uje sv� mu�e, aby osvobodili Hornick� �dol�. Kone�n� se za�aly v�ci h�bat!
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

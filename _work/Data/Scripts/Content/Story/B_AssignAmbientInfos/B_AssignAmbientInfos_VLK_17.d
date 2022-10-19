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
	description = "Co mus�m ud�lat, abych se mohl st�t ob�anem m�sta?";
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
	AI_Output (other, self, "DIA_VLK_17_JOIN_15_00"); //Co mus�m ud�lat, abych se mohl st�t ob�anem m�sta?
	AI_Output (self, other, "DIA_VLK_17_JOIN_17_01"); //Tady v Khorinidu maj� velk� slovo �emeslni�t� mist�i z doln� ��sti m�sta. M�l by sis s jedn�m z nich promluvit.
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
	description = "Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?";
};                       

FUNC INT DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_PEOPLE_15_00"); //Kdo v tomhle m�st� po��v� nejv�t�� v�nosti?
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_01"); //Jakmile dorazili paladinov� do m�sta, p�evzali velen� nad cel�m Khorinidem.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_02"); //Lord Andre tu p�edstavuje z�kon. Nalezne� ho v kas�rn�ch.
	AI_Output (self, other, "DIA_VLK_17_PEOPLE_17_03"); //Ale m� smysl k n�mu chodit jen tehdy, pokud se dostane� do konfliktu se z�konem nebo se bude� cht�t p�idat k domobran�.
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
	description = "Je tady v Khorinidu n�jak� zaj�mav� m�sto?";
};                       

FUNC INT DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_17_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_LOCATION_15_00"); //Je tady v Khorinidu n�jak� zaj�mav� m�sto?
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_01"); //(sm�ch) Mo�n� by ses na to m�l rad�ji zeptat n�jak�ho chlapa. Pokud m� na mysli z�bavu, zkus se pod�vat do p��stavu.
	AI_Output (self, other, "DIA_VLK_17_LOCATION_17_02"); //Ale pokud chce� n�co koupit, zajdi na trh u v�chodn� br�ny nebo do doln� ��sti m�sta.
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
	description = "Co je nov�ho?";
};                       
func INT DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_17_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_17_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel == 1)
	|| (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_01"); //Zaj�malo by m�, pro� tady ti paladinov� vlastn� jsou. Zabrali radnici, kas�rna i p��stav, ale zat�m neud�lali v�bec nic.
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_02"); //Pokud p�ijeli kv�li sk�et�m a bandit�m, m�li zakro�it u� p�ed drahnou dobou. Mus� m�t je�t� jin� d�vod.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_03"); //U� mi do�lo, pro� tu ti paladinov� jsou - je to kv�li rud�. Ud�lali by l�p, kdyby m�sto toho rad�ji br�nili na�e m�sto.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_04"); //Douf�m, �e je na t�ch dra��ch pov�da�k�ch n�co pravdy. V tom p��pad� toti� bude muset lord Hagen za��t n�co d�lat. Nem��e n�s p�ece jen tak nechat drak�m napospas.
	};
	
	if (Kapitel == 5)
	{
		AI_Output (self,other,"DIA_VLK_17_STANDARD_17_05"); //Te�, kdy� jsou ti draci mrtv�, zato�� paladinov� snadno i ostatn�m ne��dstvem.
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

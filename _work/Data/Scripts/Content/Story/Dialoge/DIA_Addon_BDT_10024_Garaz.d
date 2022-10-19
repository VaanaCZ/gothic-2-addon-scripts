//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Po�kej chvilku.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//M� n�jakej probl�m?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//D�ln� �ervi. Velk� spousta d�ln�ch �erv�. Narazili jsme tady na hn�zdo.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Pro� ty �ervy nepob�t?";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//A pro� na n� teda neza�to��me?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//To jsem se taky ptal, ale str�e pr� maj� na pr�ci 'd�le�it�j�� v�ci'.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn poslal m�, abych se o to postaral.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Ty s t�ma �ervama asi bojovat nebude�.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//A pro�? Abysme se dostali ke zlatu v jeskyni?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Bloodwyn si stejn� nejv�c urve pro sebe. A j� pro p�r nugget� nem�n�m riskovat krk.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//Jestli ale chce� bojovat s t�ma �ervama, nebudu ti br�nit. Akor�t koukej, a� je sem v�ecky nenal�k�, jasn�?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "M��e� mi o Bloodwynovi prozradit n�co bli���ho?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//M��e� mi pov�d�t v�c o Bloodwynovi?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Jo, je to �mejd, co netou�� po ni�em jin�m ne� po zlat�. Prohl�� ka�dou novou ��lu i ka�dej nugget.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//S takovou hami�nost� si jednou p�kn� nabije dr�ku. A na n�s zvysoka sere.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//A jinak?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Hraje si na velk�ho machra a nesnese, kdy� je n�kdo lep�� ne� von. No, j� bych proti n�mu ne�el.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Rad�i mu uh�bej z cesty a neprovokuj ho � pokud ho teda nechce� tot�ln� vyto�it. Pak nev�, co d�l�.
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn definitivn� odejde z chr�mu teprve tehdy, a� se v dole najde nov� zlat� ��la.");
	B_LogEntry (Topic_Addon_Tempel,"Kdy� se Bloodwyn na�tve, �pln� se p�estane ovl�dat. Toho bych mohl n�jak vyu��t."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "S t�mi �ervy u� je to vy��zen�.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//Tak tohle bysme m�li. �ervi u� jsou bradou vzh�ru.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn u� je na cest�. Tak jsi to cht�l, ne?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//No, pobil jsi �ervy, tak�e Bloodwyn tu bude cobydup. Tak�e jestli m� n�co v pl�nu, mus� to ud�lat HNED.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//P�kn� jsi mu to uk�zal. V�born�.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Tak to se jdu porozhl�dnout po jeskyni.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//�ove�e, ur�it� je tu spousta zlata!
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//K t�m nugget�m tamhle naho�e se ale d� dostat jenom po �eb��ku.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Jen�e od p�du bari�ry u� nikdo ��dn� �eb��ky nepou��v�. To je v�n� pech!
};





// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_BL_BDT_13_EXIT_Condition;
	information	= DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_13_EXIT_Info()
{	
	BDT_13_Nerver = 0;
	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Chef(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_BL_BDT_13_Chef_Condition;
	information	= DIA_Addon_BL_BDT_13_Chef_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu vel�?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_BL_BDT_13_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Chef_15_00");//Kdo to tady vede?
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_01");//(nad�en�) N� slavnej velitel Thorus. Ud�l� z n�s ze v�ech boh��e!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_02");//N� slavnej velitel... no, vlastn� nev�m.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Chef_13_03");//(nad�en�) N� slavnej velitel Havran. Ud�l� z n�s ze v�ech boh��e!
			
	};
};
// *************************************************************************
// 									Lager
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_13_Lager_Condition;
	information	= DIA_Addon_BL_BDT_13_Lager_Info;
	permanent	= TRUE;
	description = "Co bys mi �ekl o t�bo�e?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_BL_BDT_13_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Lager_15_00");//Co v� o t�bo�e?
	AI_Output (self, other, "DIA_Addon_BL_BDT_13_Lager_13_01");//Jestli hled� informace, promluv si se Snafem. Ten kucha� toho v� spoustu.
	AI_Output (self, other, "DIA_Addon_BL_BDT_13_Lager_13_02");//Pokud chce� nakupovat, zajdi za Fiskem. Prod�v� v�ecko mo�n� i nemo�n�.
};
// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_13_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_BL_BDT_13_News_Condition;
	information	= DIA_Addon_BL_BDT_13_News_Info;
	permanent	= TRUE;
	description = "N�co nov�ho?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_13_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_News_15_00");//N�co nov�ho?
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_01");//Havran je mrtv�. Te� u� se z tohohle ostrova NIKDY nedostanem!
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_02");//Pir�ti sedli na lo� a odjeli.
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_03");//Na pl�i z�stalo sed�t jen p�r debil�, kte�� ani nemaj po��dnou lo�.
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_News_13_04");//Ani Beliar nev�, jak bysme se z tohohle ostrova dostali.
	};
};
// *************************************************************************
// 									Gold
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Gold(C_INFO)
{
	nr			= 5;
	condition	= DIA_Addon_BL_BDT_13_Gold_Condition;
	information	= DIA_Addon_BL_BDT_13_Gold_Info;
	permanent	= TRUE;
	description = "Jak bych si rychle vyd�lal pen�ze?";
};                       

FUNC INT DIA_Addon_BL_BDT_13_Gold_Condition()
{	
	if (MIS_Send_Buddler != LOG_RUNNING)
	|| (MIS_Send_Buddler != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_13_Gold_Info()
{	
	BDT_13_Nerver = (BDT_13_Nerver +1);
	
	AI_Output (other, self, "DIA_Addon_BL_BDT_13_Gold_15_00");//Jak m��u rychle z�skat hromadu zlata?
	
	if (BDT_13_Nerver <= 2)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_01");//To je dobr� ot�zka. Copak tu proto nejsme v�ichni?
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_02");//Prost� si u Thoruse vyzvedni �ervenej k�men a pak u� m��e� j�t do dolu.
	}
	else if (BDT_13_Kill == FALSE)
	{
		BDT_13_Nerver = 0;
		BDT_13_Kill = TRUE;
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_03");//Si d�l� kozy, ne? Jdi do prdele!
		AI_StopProcessInfos (self);
	}
	else 
	{
		BDT_13_Nerver = 0;
		AI_Output (self, other, "DIA_Addon_BL_BDT_13_Gold_13_04");//��dn� srandi�ky ani jin� skopi�iny!
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);
	};
};
FUNC VOID B_AssignAmbientInfos_Addon_BL_BDT_13 (var c_NPC slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc					= Hlp_GetInstanceID(slf);
};

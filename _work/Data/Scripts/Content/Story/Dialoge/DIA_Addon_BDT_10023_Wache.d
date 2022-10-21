//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hele, kam se to sype�? To chce� j�t do t�hle chodby?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//No jasn�, pro� ne?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Tam vzadu jsou je�t� dal�� otroci. Pro m� za m� si tam klidn� zalez, ale moc je nemla�, a� je�t� m��ou makat.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Stejn� nechcem, aby tu jen tak posed�vali. Maj dolovat zlato.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Ch�pu, a kdo to rozk�zal?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//To sou p��m� rozkazy od Bloodwyna.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//J� myslel, �e tady ��fuje Havran.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//To m� recht, jen�e on v�ecky otroky p�edal Bloodwynovi. U� je na nic nepot�eboval.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Havran u� pro otroky nem� vyu�it�. Nyn� n�le�ej� Bloodwynovi."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "Nech ty otroky j�t!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Nech ty otroky j�t!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Hele, tady to ��d� Bloodwyn. Otroci pat�ej jemu, tak�e propustit je m��e jenom on.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//A taky m� do toho co mluvit Thorus. A co ty?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Pouze Bloodwyn a Thorus maj� pr�vo pustit otroky na svobodu.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//TY do toho m� taky co mluvit?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(uk�zat Bloodwynovu hlavu)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"J� rozhoduju, kdo p�jde do dolu.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//J� rozhoduju, kdo p�jde do dolu.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//D�l� Estebanovu pr�ci, tak�e tady nem� co kecat ABSOLUTN� do ni�eho. Odprejskni.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Sta�� ti tohle?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(bl���) Dej to pry�, NIC TAKOV�HO nechci vid�t.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Bylo by lep��, kdybys ty otroky propustil. HNED.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Po�kej p�ece. Bloodwyn nen� jedinej, kdo tu m� ��k� slovo. Dokud nedostanu rozkaz vod Thoruse, nikoho nepropust�m.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Ale pr�v� jsi ��kal, �e otroci pat�� Bloodwynovi.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//To jo, ale taky jsem �ek, �e nikoho nepropustim, dokud mi to nenak�e Thorus.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Ty by ses bez rozkazu ani nevysral, co?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Jo, ale taky jsem �ek...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...no jo, u� toho rad�i nech.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Mluvil jsem s Thorusem. Podle jeho rozkazu maj� b�t otroci propu�t�ni.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//No dob�e, kdy� to teda rozk�zal Thorus. Ale nech�pu, pro� n�co takov�ho dovolil...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//...ale za ot�zky nejsi placen�.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Dobr�, dobr�, evidentn� u� m� tu nikdo nepot�ebuje, tak�e si jdu d�t n�co na zub.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};

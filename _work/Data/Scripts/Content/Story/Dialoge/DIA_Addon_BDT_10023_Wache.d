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
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hele, kam se to sypeš? To chceš jít do týhle chodby?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//No jasnì, proè ne?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Tam vzadu jsou ještì další otroci. Pro mì za mì si tam klidnì zalez, ale moc je nemla, a ještì mùžou makat.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Stejnì nechcem, aby tu jen tak posedávali. Maj dolovat zlato.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Chápu, a kdo to rozkázal?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//To sou pøímý rozkazy od Bloodwyna.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Já myslel, že tady šéfuje Havran.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//To máš recht, jenže on všecky otroky pøedal Bloodwynovi. Už je na nic nepotøeboval.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Havran už pro otroky nemá využití. Nyní náležejí Bloodwynovi."); 
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
	description = "Nech ty otroky jít!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Nech ty otroky jít!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Hele, tady to øídí Bloodwyn. Otroci patøej jemu, takže propustit je mùže jenom on.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//A taky má do toho co mluvit Thorus. A co ty?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Pouze Bloodwyn a Thorus mají právo pustit otroky na svobodu.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//TY do toho máš taky co mluvit?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(ukázat Bloodwynovu hlavu)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Já rozhoduju, kdo pùjde do dolu.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//JÁ rozhoduju, kdo pùjde do dolu.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//Dìláš Estebanovu práci, takže tady nemáš co kecat ABSOLUTNÌ do nièeho. Odprejskni.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Staèí ti tohle?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(blééé) Dej to pryè, NIC TAKOVÝHO nechci vidìt.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Bylo by lepší, kdybys ty otroky propustil. HNED.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Poèkej pøece. Bloodwyn není jedinej, kdo tu má òáký slovo. Dokud nedostanu rozkaz vod Thoruse, nikoho nepropustím.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Mluvil jsem s Thorusem.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Ale právì jsi øíkal, že otroci patøí Bloodwynovi.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//To jo, ale taky jsem øek, že nikoho nepropustim, dokud mi to nenakáže Thorus.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Ty by ses bez rozkazu ani nevysral, co?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Jo, ale taky jsem øek...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...no jo, už toho radši nech.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Mluvil jsem s Thorusem. Podle jeho rozkazu mají být otroci propuštìni.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//No dobøe, když to teda rozkázal Thorus. Ale nechápu, proè nìco takovýho dovolil...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//...ale za otázky nejsi placený.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Dobrá, dobrá, evidentnì už mì tu nikdo nepotøebuje, takže si jdu dát nìco na zub.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};

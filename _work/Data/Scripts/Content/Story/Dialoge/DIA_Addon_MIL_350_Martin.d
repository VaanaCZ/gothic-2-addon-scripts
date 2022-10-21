///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Martin_EXIT   (C_INFO)
{
	npc         = Mil_350_Addon_Martin;
	nr          = 999;
	condition   = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Martin_PICKPOCKET (C_INFO)
{
	npc			= Mil_350_Addon_Martin;
	nr			= 900;
	condition	= DIA_Addon_Martin_PICKPOCKET_Condition;
	information	= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen (65, 77);
};
 
FUNC VOID DIA_Addon_Martin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};
	
func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Martin_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Martin_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //Tak�e ty jsi ten novej?
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //B� nap�ed za Vatrasem, snad na tebe bude m�t �as.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Hallo_Condition;
	information	 = 	DIA_Addon_Martin_Hallo_Info;
	
	important	 = 	TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Hej ty, tady nem� co d�lat. Sem m��ou jenom paladinov� a my, �lenov� domobrany.
};


///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Martin_WasMachstDu_Info;

	description	 = 	"Co se to tu teda d�je?";
};

func int DIA_Addon_Martin_WasMachstDu_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //Tak co se tu d�je?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Tohle je sklad paladinsk�ch kr�lovsk�ch str��.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Jsem zdej�� skladn�k. Zodpov�d�m za to, aby se neztratilo nic z paladinsk�ch z�sob. A ty tu nem� co d�lat.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Tak�e ruce pry�, nebo o n� p�ijde�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_PreTrade_Condition;
	information	 = 	DIA_Addon_Martin_PreTrade_Info;

	description	 = 	"M��e� mi prodat n�co ze z�sob paladin�?";
};

func int DIA_Addon_Martin_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_PreTrade_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //M��e� mi prodat n�co z paladinsk�ch z�sob?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Chce� nakupovat? Hm, �ekn�me, �e kdybys mi dok�zal vynahradit probl�my, pramen�c� z toho, �e se tu paladin�m ztr�cej� v�ci, mo�n� bysme se mohli dohodnout.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //A ty v�ci se tu ztr�cej� �asto?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Pokud skladn�k tvrd�, �e je v�echno v po��dku, pak ne.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //Ch�pu.
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Farim_Condition;
	information	 = 	DIA_Addon_Martin_Farim_Info;

	description	 = 	"Ryb�� Farim m� probl�my s domobranou.";
};

func int DIA_Addon_Martin_Farim_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Farim_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Ryb�� Farim m� probl�my s domobranou. Chlapi mu po��d n�co kradou.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //A co s t�m m�m co d�lat j�?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Ur�it� m� na paladiny aspo� trochu vliv.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim pot�ebuje, abys ho ochr�nil. Je ochoten ti za to d�t ��st ze sv�ho �lovku.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Ch�pu, co t�m mysl�.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //(pohrdav�) Ryby! Jako bych tu m�l m�lo jinejch kr�m�!
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Vy�i� sv�mu k�mo�ovi, a� p�ijde za mnou a �ekne mi konkr�tn�, co mu domobrana prov�d�.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Postar�m se o to.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"Intendant Martin u� se o to postar�."); 

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP (XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	80;
	condition	 = 	DIA_Addon_Martin_Trade_Condition;
	information	 = 	DIA_Addon_Martin_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Co m� na prodej?";
};

func int DIA_Addon_Martin_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};
var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info ()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader, LogText_Addon_MartinTrade); 
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //Co mi m��e� nab�dnout?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Tak d�vej pozor.
};


///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Rangerhelp_Condition;
	information	 = 	DIA_Addon_Martin_Rangerhelp_Info;

	description	 = 	"Poslal m� Lares.";
};

func int DIA_Addon_Martin_Rangerhelp_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};		
};

func void DIA_Addon_Martin_Rangerhelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Pos�l� m� Lares. Tvrdil, �e bys mi mohl pomoct.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Tak? Opravdu? Tak spus�, co po mn� chce?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Chci se p�idat k domobran�.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //(sm�je se) To by se ti l�bilo, co? Jen�e my mezi sebe nevezmem jen tak kdejak�ho otrhance, pokud k tomu nem�me dobrej d�vod.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //To bys nejsp� m�l.
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Nech si kecy na koledu a rad�i mi pov�z, co m�m ud�lat, abych se k v�m mohl p�idat.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //(p�ekvapen�) No dob�e, tak d�vej pozor.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //D�lat skladn�ka je peklo, to ti teda pov�m. Sta�� u� jen starat se o v�ecky tyhle bedny a pytle
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //A poka�d�, kdy� ve�er zajdu do hospody ke Kardiffovi, si s t�mahle bednama n�kdo hraje. Kdy� se druh� den r�no vr�t�m, v�dycky n�co chyb�.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //(roz�ilen�) A co je je�t� divn�j��, paladinov� nikdy nic nevid�.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //(na�tvan�) Se z toho asi zbl�zn�m. Nem��u tu p�eci st�t celou noc jak blbec!
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Ale na druhou stranu, ty bys to ud�lat mohl.
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //Ch�pu. M�m tu hl�dat, zat�mco ty se bude� potloukat po hospod�ch.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //Ber, nebo nech b�t.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"M�m dohl�dnout na bedny intendanta Martina. Poda��-li se mi chytit n�koho, kdo by se kolem nich motal, pom��e mi Martin vstoupit do �ad domobrany."); 

}; 

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Auftrag_Condition;
	information	 = 	DIA_Addon_Martin_Auftrag_Info;

	description	 = 	"Dneska ve�er ti ohl�d�m ty tv� bedny.";
};

func int DIA_Addon_Martin_Auftrag_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Tak j� ti dneska ve�er ty z�soby pohl�d�m.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //(pot�en�) To je mil�.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //Tak j� jdu do hospody ke Kardiffovi. A a� se vr�t�m, b�da ti, jestli bude n�co chyb�t.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Dob�e, tak se ve�er vra� a dohl�dni tady na ty v�ci. J� si zat�m odsko��m ke Kardiffovi.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(v�ce)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartOtherRoutine	(MIL_321_Rangar,"PalCampKlau");
};



// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_FromVatras_Condition;
	information	= DIA_Addon_Martin_FromVatras_Info;

	description	= "P�tr� po tom, kdo prod�v� zbran� bandit�m?";
};
func int DIA_Addon_Martin_FromVatras_Condition ()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_FromVatras_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Ty hled� toho chlapa, co prod�v� ty zbran� bandit�m?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //Kdo ti to �ek?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Hm, a co ty o tom v�?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Nic moc, ale m��u zjistit v�c.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //(ch�pe) No, kdy� je to tak...
};	
///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_TellAll_Condition;
	information	= DIA_Addon_Martin_TellAll_Info;

	description	= "Pov�z mi, co v� o tom obchodn�ku se zbran�mi?";
};
func int DIA_Addon_Martin_TellAll_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_TellAll_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Pov�z, co v� o tom prodejci zbran�?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Tak poslouchej. V�me, �e za t�m mus� b�t n�jak� vlivn� ob�an z horn� �tvrti.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //A n�kter� zbran� dokonce poch�zej� ze z�sob domobrany.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Ale st�le nev�m, kdo p�esn� to m� na sv�dom�.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Pokud m� �aludek na to, aby ses dok�zal vypo��dat s nejm�� p�ti banditama, mo�n� to zjist�.
	B_LogEntry (TOPIC_Addon_BanditTrader,"Podle Martina mus� ty zbran� prod�vat n�jak� vlivn� ob�an z horn� �tvrti."); 
};	
///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_AboutBandits_Condition;
	information	= DIA_Addon_Martin_AboutBandits_Info;

	description	= "A co ti banditi?";
};
func int DIA_Addon_Martin_AboutBandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_AboutBandits_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //A co ti banditi?
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //V�me, �e banditi zrovna blokujou cesty, kter� spojuj� sedl�ky s m�stem.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //Krom� toho jim v posledn�ch p�r dnech musela p�ij�t n�jak� z�silka zbran�.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Snad u t�ch bandit� najde� n�jak� stopy, kter� by vedly k tomu, kdo je t�mi zbran�mi z�sobuje.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Cestu mezi p��stavem a statky obsadili banditi. Snad tam najdu n�jak� vod�tko, kter� mi pom��e vyp�trat toho tajemn�ho obchodn�ka se zbran�mi."); 
};	

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Fernando_Condition;
	information	 = 	DIA_Addon_Martin_Fernando_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co se t��e toho obchodn�ka se zbran�mi...";
};

func int DIA_Addon_Martin_Fernando_Condition ()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //No, co se t��e toho obchodn�ka se zbran�mi...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Tak ven s t�m, co m�?
	
		var int FernandoHints;
		FernandoHints = 0;
		
		if 	(
			(Npc_HasItems (other,ItMw_Addon_BanditTrader))
			||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
			||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
			)
			{
				
				if (Npc_HasItems (other,ItMw_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //U bandit� jsem na�el tenhle rap�r. Je na n�m vylept�no p�smeno F.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //Banditi m�li tenhle prsten, kter� poukazuje na n�jak�ho z�mo�sk�ho obchodn�ka.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Tady je seznam dod�vek zbran� a dal��ch v�c� pro bandity. Podepsal to jist� Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //A onen Fernando, star� obchodn�k z horn� �tvrti, se p�iznal, �e s bandity obchodoval.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando p�iznal, �e bandity z�sobuje zbran�mi.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //Mysl�m, �e to sta��. Tak�e Fernando? No, dostane, co si zaslou��.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //A to se v�dycky tv��� jako zt�lesn�n� ctnost.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Dohl�dnu, aby ho zav�eli, a� z�ern�.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Mus�m ��ct, �e to bylo skv�le provedeno.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras tuhle novinu r�d usly��.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin se postar�, aby byl Fernando ��dn� potrest�n. M�l bych o tom pov�d�t Vatrasovi."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //A co d�l?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //To je v�echno.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //Je sice hezk�, �e to p�izn�v�, ale bez hmotn�ho d�kazu bohu�el nem��u d�lat nic.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Nechci, aby se mi lord Hagen vysm�l. Bude� toho muset naj�t v�c.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //To nesta��. To m��e b�t skoro ka�d� z horn� �tvrti.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Vypad� to, �e budeme muset j�t je�t� d�l po stop� bandit� a dod�vek zbran�, dokud nezjist�me, kdo za t�m v�z�.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Snad by sis m�l znovu promluvit s Vatrasem.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Je�t� jednou, kdo to byl?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Posly�, m� zjistit, kdo m� na sv�dom� ty dod�vky zbran� pro bandity a p�in�st mi d�kaz.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Ale mus� to b�t n�co doopravdy usv�d�uj�c�ho, jinak toho chlapa nebudu moct zatknout.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Martin_Perm_Condition;
	information	 = 	DIA_Addon_Martin_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jsou tu po��d v�echny bedny?";
};

func int DIA_Addon_Martin_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Jsou tu po��d v�ecky bedny?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //(na�tvan�) Ty hajzle, m�ls hl�dat m� bedny! A te� se ztratilo je�t� n�co dal��ho!

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //(nahlas) B� p��mo do z�sob�rny v p��stavu a p�ive� mi toho parchanta, co mi to ukrad, kapi�to?
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //A a� dneska ve�er odejdu, koukej d�vat v�t�� pozor, jasn�?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Jen se sm�j. Tak si zkus st�t celej den na molu a dohl�et na celej ten binec.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Paladinov� sem dot�hli takovejch kr�m�, a� to nen� p�kn�.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Ni�eho se nedot�kej, jinak zavol�m str�e, kapi�to?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GotRangar_Condition;
	information	 = 	DIA_Addon_Martin_GotRangar_Info;

	description	 = 	"Chytil jsem toho zlod�je.";
};

func int DIA_Addon_Martin_GotRangar_Condition ()
{
	if (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GotRangar_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //Chytil jsem toho zlod�je.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //Na tv� z�soby ti chodil Rangar.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //No kone�n�. Aspo� u� v�m, na koho si m�m d�vat bacha. Ten hajzl! Jestli ho p�istihnu, bude z toho po��dn� rva�ka.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //V�dycky jsem se divil, pro� nikdo z paladin� nikdy nic nevid�.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //A pro� tedy?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //To je jasn�. Ti debilov� nerozpoznaj jednoho �lena domobrany od druh�ho. P�ipad�me jim v�ichni stejn�.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //To byla dobr� pr�ce, k�mo.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Kdybys ode m� n�co pot�eboval, sta�� ��ct.

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GetMiliz_Condition;
	information	 = 	DIA_Addon_Martin_GetMiliz_Info;

	description	 = 	"V�dy� v�, co po tob� chci.";
};

func int DIA_Addon_Martin_GetMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_GotRangar))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GetMiliz_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //V�ak v�, co po tob� chci.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //No jo, ty ses cht�l p�idat k domobran�, �e jo?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //U� jsi mi dok�zal, �e za n�co stoj�.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //No, �ekn�me, �e budu rad�i, kdy� bude� na m� stran�, ne� aby ses p�idal k n�komu jin�mu.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //A proto ti pom��u. Tady m� ode m� doporu�uj�c� dopis a uka� ho na�emu paladinsk�mu veliteli Andremu.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Najde� ho v kas�rn�ch. Ur�it� tvou pomoc vyu�ije.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin mi dal doporu�uj�c� dopis pro velitele paladin� lorda Andreho, kter� m� tak p�ijme do �ad domobrany. Andreho najdu v kas�rn�ch."); 
};



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
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //Takže ty jsi ten novej?
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //Bêž napâed za Vatrasem, snad na tebe bude mít èas.
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
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Hej ty, tady nemáš co dêlat. Sem mùžou jenom paladinové a my, èlenové domobrany.
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

	description	 = 	"Co se to tu teda dêje?";
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
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //Tak co se tu dêje?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Tohle je sklad paladinských královských stráží.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Jsem zdejší skladník. Zodpovídám za to, aby se neztratilo nic z paladinských zásob. A ty tu nemáš co dêlat.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Takže ruce pryè, nebo o nê pâijdeš.
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

	description	 = 	"Mùžeš mi prodat nêco ze zásob paladinù?";
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
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //Mùžeš mi prodat nêco z paladinských zásob?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Chceš nakupovat? Hm, âeknême, že kdybys mi dokázal vynahradit problémy, pramenící z toho, že se tu paladinùm ztrácejí vêci, možná bysme se mohli dohodnout.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //A ty vêci se tu ztrácejí èasto?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Pokud skladník tvrdí, že je všechno v poâádku, pak ne.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //Chápu.
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

	description	 = 	"Rybáâ Farim má problémy s domobranou.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Rybáâ Farim má problémy s domobranou. Chlapi mu poâád nêco kradou.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //A co s tím mám co dêlat já?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Urèitê máš na paladiny aspoà trochu vliv.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim potâebuje, abys ho ochránil. Je ochoten ti za to dát èást ze svého úlovku.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Chápu, co tím myslíš.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //(pohrdavê) Ryby! Jako bych tu mêl málo jinejch krámù!
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Vyâië svýmu kámošovi, aã pâijde za mnou a âekne mi konkrétnê, co mu domobrana provádí.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Postarám se o to.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"Intendant Martin už se o to postará."); 

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

	description	 = 	"Co máš na prodej?";
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
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //Co mi mùžeš nabídnout?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Tak dávej pozor.
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

	description	 = 	"Poslal mê Lares.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Posílá mê Lares. Tvrdil, že bys mi mohl pomoct.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Tak? Opravdu? Tak spusã, co po mnê chce?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Chci se pâidat k domobranê.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //(smêje se) To by se ti líbilo, co? Jenže my mezi sebe nevezmem jen tak kdejakýho otrhance, pokud k tomu nemáme dobrej dùvod.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //To bys nejspíš mêl.
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Nech si kecy na koledu a radši mi povêz, co mám udêlat, abych se k vám mohl pâidat.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //(pâekvapenê) No dobâe, tak dávej pozor.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //Dêlat skladníka je peklo, to ti teda povím. Staèí už jen starat se o všecky tyhle bedny a pytle
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //A pokaždý, když veèer zajdu do hospody ke Kardiffovi, si s têmahle bednama nêkdo hraje. Když se druhý den ráno vrátím, vždycky nêco chybí.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //(rozèilenê) A co je ještê divnêjší, paladinové nikdy nic nevidí.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //(naštvanê) Se z toho asi zblázním. Nemùžu tu pâeci stát celou noc jak blbec!
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Ale na druhou stranu, ty bys to udêlat mohl.
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //Chápu. Mám tu hlídat, zatímco ty se budeš potloukat po hospodách.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //Ber, nebo nech být.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Mám dohlédnout na bedny intendanta Martina. Podaâí-li se mi chytit nêkoho, kdo by se kolem nich motal, pomùže mi Martin vstoupit do âad domobrany."); 

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

	description	 = 	"Dneska veèer ti ohlídám ty tvé bedny.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Tak já ti dneska veèer ty zásoby pohlídám.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //(potêšenê) To je milý.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //Tak já jdu do hospody ke Kardiffovi. A až se vrátím, bêda ti, jestli bude nêco chybêt.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Dobâe, tak se veèer vraã a dohlídni tady na ty vêci. Já si zatím odskoèím ke Kardiffovi.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(více)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít");
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

	description	= "Pátráš po tom, kdo prodává zbranê banditùm?";
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
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Ty hledáš toho chlapa, co prodává ty zbranê banditùm?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //Kdo ti to âek?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Hm, a co ty o tom víš?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Nic moc, ale mùžu zjistit víc.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //(chápe) No, když je to tak...
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

	description	= "Povêz mi, co víš o tom obchodníku se zbranêmi?";
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
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Povêz, co víš o tom prodejci zbraní?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Tak poslouchej. Víme, že za tím musí být nêjaký vlivný obèan z horní ètvrti.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //A nêkteré zbranê dokonce pocházejí ze zásob domobrany.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Ale stále nevím, kdo pâesnê to má na svêdomí.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Pokud máš žaludek na to, aby ses dokázal vypoâádat s nejmíà pêti banditama, možná to zjistíš.
	B_LogEntry (TOPIC_Addon_BanditTrader,"Podle Martina musí ty zbranê prodávat nêjaký vlivný obèan z horní ètvrti."); 
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
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Víme, že banditi zrovna blokujou cesty, které spojují sedláky s mêstem.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //Kromê toho jim v posledních pár dnech musela pâijít nêjaká zásilka zbraní.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Snad u têch banditù najdeš nêjaký stopy, který by vedly k tomu, kdo je têmi zbranêmi zásobuje.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Cestu mezi pâístavem a statky obsadili banditi. Snad tam najdu nêjaké vodítko, které mi pomùže vypátrat toho tajemného obchodníka se zbranêmi."); 
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

	description	 = 	"Co se týèe toho obchodníka se zbranêmi...";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //No, co se týèe toho obchodníka se zbranêmi...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Tak ven s tím, co máš?
	
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
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //U banditù jsem našel tenhle rapír. Je na nêm vyleptáno písmeno F.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //Banditi mêli tenhle prsten, který poukazuje na nêjakého zámoâského obchodníka.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Tady je seznam dodávek zbraní a dalších vêcí pro bandity. Podepsal to jistý Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //A onen Fernando, starý obchodník z horní ètvrti, se pâiznal, že s bandity obchodoval.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando pâiznal, že bandity zásobuje zbranêmi.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //Myslím, že to staèí. Takže Fernando? No, dostane, co si zaslouží.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //A to se vždycky tváâí jako ztêlesnêná ctnost.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Dohlídnu, aby ho zavâeli, až zèerná.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Musím âíct, že to bylo skvêle provedeno.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras tuhle novinu rád uslyší.
			B_StartOtherRoutine	(Fernando,"Vêzení");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin se postará, aby byl Fernando âádnê potrestán. Mêl bych o tom povêdêt Vatrasovi."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //A co dál?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //To je všechno.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //Je sice hezký, že to pâiznává, ale bez hmotného dùkazu bohužel nemùžu dêlat nic.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Nechci, aby se mi lord Hagen vysmál. Budeš toho muset najít víc.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //To nestaèí. To mùže být skoro každý z horní ètvrti.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Vypadá to, že budeme muset jít ještê dál po stopê banditù a dodávek zbraní, dokud nezjistíme, kdo za tím vêzí.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Snad by sis mêl znovu promluvit s Vatrasem.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Ještê jednou, kdo to byl?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Poslyš, máš zjistit, kdo má na svêdomí ty dodávky zbraní pro bandity a pâinést mi dùkaz.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Ale musí to být nêco doopravdy usvêdèujícího, jinak toho chlapa nebudu moct zatknout.
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

	description	 = 	"Jsou tu poâád všechny bedny?";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Jsou tu poâád všecky bedny?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //(naštvanê) Ty hajzle, mêls hlídat mý bedny! A teë se ztratilo ještê nêco dalšího!

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //(nahlas) Bêž pâímo do zásobárny v pâístavu a pâiveë mi toho parchanta, co mi to ukrad, kapišto?
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //A až dneska veèer odejdu, koukej dávat vêtší pozor, jasný?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Jen se smêj. Tak si zkus stát celej den na molu a dohlížet na celej ten binec.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Paladinové sem dotáhli takovejch krámù, až to není pêkný.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Nièeho se nedotýkej, jinak zavolám stráže, kapišto?
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

	description	 = 	"Chytil jsem toho zlodêje.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //Chytil jsem toho zlodêje.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //Na tvé zásoby ti chodil Rangar.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //No koneènê. Aspoà už vím, na koho si mám dávat bacha. Ten hajzl! Jestli ho pâistihnu, bude z toho poâádná rvaèka.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Vždycky jsem se divil, proè nikdo z paladinù nikdy nic nevidí.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //A proè tedy?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //To je jasný. Ti debilové nerozpoznaj jednoho èlena domobrany od druhýho. Pâipadáme jim všichni stejní.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //To byla dobrá práce, kámo.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Kdybys ode mê nêco potâeboval, staèí âíct.

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

	description	 = 	"Vždyã víš, co po tobê chci.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Však víš, co po tobê chci.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //No jo, ty ses chtêl pâidat k domobranê, že jo?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //Už jsi mi dokázal, že za nêco stojíš.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //No, âeknême, že budu radši, když budeš na mý stranê, než aby ses pâidal k nêkomu jinýmu.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //A proto ti pomùžu. Tady máš ode mê doporuèující dopis a ukaž ho našemu paladinskýmu veliteli Andremu.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Najdeš ho v kasárnách. Urèitê tvou pomoc využije.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin mi dal doporuèující dopis pro velitele paladinù lorda Andreho, který mê tak pâijme do âad domobrany. Andreho najdu v kasárnách."); 
};



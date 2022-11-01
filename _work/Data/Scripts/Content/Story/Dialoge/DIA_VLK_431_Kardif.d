///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_EXIT   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 999;
	condition   = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kardif_EXIT_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Kardif_PICKPOCKET (C_INFO)
{
	npc			= VLK_431_Kardif;
	nr			= 900;
	condition	= DIA_Kardif_PICKPOCKET_Condition;
	information	= DIA_Kardif_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kardif_PICKPOCKET_Condition()
{
	C_Beklauen (55, 85);
};
 
FUNC VOID DIA_Kardif_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kardif_PICKPOCKET);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_BACK 		,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
	
func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hi		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hi_Condition;
	information	 = 	DIA_Kardif_Hi_Info;
	permanent    =  FALSE;
	description	 = 	"Jak to jde?";
};
func int DIA_Kardif_Hi_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hi_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //Jak se vede?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Jestli chceš něco k pití, musíš si to objednat.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif prodává v přístavní krčmě nápoje.");
};	
	
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hallo		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hallo_Condition;
	information	 = 	DIA_Kardif_Hallo_Info;
	permanent    =  FALSE;
	description	 = 	"Počítám, že tady zaslechneš spoustu věcí...";
};
func int DIA_Kardif_Hallo_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Kardif_Hi)
	&& (Kardif_Deal == 0)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Počítám, že tady zaslechneš spoustu věcí.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //Jo, a co je ti po tom?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Nové zprávy vždycky vítám s otevřenou náručí.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //A je stejně otevřená i tvoje peněženka?
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Každá informace, kterou ti dám, tě bude stát 10 zlaťáků.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, hospodský z přístavní krčmy, prodává krom kořalky i informace.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nedám ti za informaci víc než 5 zlaťáků.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Zapomeň na to - najdu si je jinde.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No dobře, souhlasím.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //No dobře, souhlasím.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Umíš dobře smlouvat (usměje se). Jsem ti vždycky k službám.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //Nedám ti za informaci víc než 5 zlaťáků.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //Cože, 5 zlaťáků? Chceš mě ožebračit? (krátce se zamyslí) Tak to zaokrouhleme na 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Ne, takhle to nefunguje. Řekněme 6.",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"OK, 7 zlaťáků zní rozumně.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Zapomeň na to - najdu si informace jinde.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //No dobrá, dobrá... slevím tedy na 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"OK, 7 zlaťáků zní rozumně.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Ne, ty tvé informace vlastně až tak nutně nepotřebuji.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Fajn, 7 zlaťáků zní rozumně.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //(zazubí se) To je moudré rozhodnutí. Takže až budeš něco potřebovat, klidně se mě zeptej.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //Ne, ty tvé informace vlastně až tak nutně nepotřebuji.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Hej, počkej... (povzdech) - dobrá, 5 zlaťáků, ale to je moje poslední nabídka!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"A proč jsi to neřekl hned?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //A proč jsi to neřekl hned?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Ále, prostě nejsem úplně fit. Ale ať je to, jak chce, už jsme se dohodli.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //Ne, takhle to nefunguje. Řekněme 6.
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Ty jsi pěkný lump, víš to? No, když na tom trváš, tak řekněme 6 zlaťáků za každou informaci.
	Kardif_Deal = 6;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TRADE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TRADE_Condition;
	information	 = 	DIA_Kardif_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Rád bych si dal něco k pití.";
};

func int DIA_Kardif_TRADE_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //Rád bych si dal něco k pití.
};
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TradeInfo		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TradeInfo_Condition;
	information	 = 	DIA_Kardif_TradeInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Potřebuju nějaké informace.";
};

func int DIA_Kardif_TradeInfo_Condition ()
{
	if (Kardif_OneQuestion == FALSE)
	&& (Kardif_Deal > 0)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_TradeInfo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Potřebuji informace.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Vrať se, až budeš mít dost zlata.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"Kdo patří mezi nejvlivnější občany tohoto města?";
};
//-------------------------------------------
var int DIA_Kardif_Buerger_permanent;
//-------------------------------------------
func int DIA_Kardif_Buerger_Condition ()
{	
	if (DIA_Kardif_Buerger_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Buerger_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //Kdo patří mezi nejvlivnější občany tohoto města?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //Tady dole v přístavu nenajdeš nikoho. Jediný zdejší mocný muž je Lehmar.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //Lichvář není zrovna populární, ale má zlato a pár jiných vlivných měšťanů mu dluží peníze.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Kupci a řemeslníci mají také dost velký vliv - až moc velký, řekl bych.
		
		
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

// *****************************************************
//						Lehmar
// *****************************************************

instance DIA_Kardif_Lehmar	(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lehmar_Condition;
	information	 = 	DIA_Kardif_Lehmar_Info;
	permanent    =  TRUE;
	description	 = 	"Kdo všechno Lehmarovi něco dluží?";
};
//-------------------------------------------
var int DIA_Kardif_Lehmar_permanent;
//-------------------------------------------
func int DIA_Kardif_Lehmar_Condition ()
{	
	if (DIA_Kardif_Lehmar_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Buerger_permanent == TRUE) //(Knows perm Info)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lehmar_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //Kdo všechno Lehmarovi něco dluží?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //(směje se) Jestli to chceš zjistit, měl bys nahlédnout do jeho účetní knihy.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Akorát určitě nebude snadné tam jen tak nepozorovaně nakouknout.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Pokud vím, vždycky ji nosí u sebe.
		
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};



///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Arbeit		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Arbeit_Condition;
	information	 = 	DIA_Kardif_Arbeit_Info;
	permanent    =  TRUE;
	description	 = 	"Kde bych mohl najít práci?";
};
//-------------------------------------------
var int DIA_Kardif_Arbeit_permanent;
//-------------------------------------------
func int DIA_Kardif_Arbeit_Condition ()
{	
	if (DIA_Kardif_Arbeit_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Arbeit_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //Kde bych mohl najít práci?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //Tady v přístavu práci asi jen tak nenajdeš. Budeš muset zajít za řemeslníky v dolní části města.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Ale jestli máš trochu slušný meč, můžeš zkusit vyzvat na souboj Alrika. Bije se za peníze - najdeš ho za skladištěm.
			
	DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Kardif_MissingPeople		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Addon_Kardif_MissingPeople_Condition;
	information	 = 	DIA_Addon_Kardif_MissingPeople_Info;
	permanent    =  TRUE;
	description	 = 	"Co víš o těch pohřešovaných lidech?";
};
//-------------------------------------------
var int DIA_Addon_Kardif_MissingPeople_permanent;
//-------------------------------------------
func int DIA_Addon_Kardif_MissingPeople_Condition ()
{	
	if (DIA_Addon_Kardif_MissingPeople_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Kardif_MissingPeople_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //Víš něco o těch pohřešovaných lidech z města?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Vím jenom to, že za posledních pár dní tu nějací lidé zmizeli.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Tady v přístavu je to prej nejhorší. Možná bys to tu mohl trochu obhlídnout.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //A pár případů bylo i v dolní části města.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Jestli chceš vědět víc, promluv si s Coragonem.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Má hospodu v dolní části města a leccos se doslechne.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //A Halvor, obchodník s rybami dole u mola, by taky mohl vědět něco zajímavého. Pořád tam za ním někdo chodí.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif mi poradil, že na pohřešované lidi bych se měl zeptat hospodského Coragona, který má krčmu dole ve městě, a obchodníka s rybami Halvora."); 

		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Lernen		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lernen_Condition;
	information	 = 	DIA_Kardif_Lernen_Info;
	permanent    =  TRUE;
	description	 = 	"Kdo mě tady může něco naučit?";
};
//-------------------------------------------
var int DIA_Kardif_Lernen_permanent;
//-------------------------------------------
func int DIA_Kardif_Lernen_Condition ()
{	
	if (DIA_Kardif_Lernen_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lernen_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //Kdo mě tady může něco naučit?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Tady v přístavišti najdeš pár schopných lidí.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Kovář Carl je pořádný silák. Vsadím se, že s jeho pomocí si můžeš zvýšit sílu.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Alrik toho ví spoustu o boji a Lares je prohnaný lump. Někdy ho můžeš najít i tady v přístavu.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //A jestli jsi dostatečně praštěný, zastav se u starého Ignaze - ví všechno o tuhlecté aleche... almich... o lektvarech.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //Kde bych je všechny našel?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //(mručí) Hochu, než bych ti to vysvětlil, tak by král vyhrál celou tuhle válku proti skřetům.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Prostě se porozhlédni po přístavní čtvrti a musíš je najít. A pokud to tu moc neznáš, stav se u Brahima a kup si od něj mapu.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //JEHO najdeš snadno. Má chýši hned vedle mé hospody. (mručí) Za tohle bych si měl účtovat dvojnásobek.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, kovář z přístavní čtvrti, mi může pomoci vylepšit sílu.");
		B_LogEntry (Topic_CityTeacher,"Lares mi vylepší obratnost.");
		B_LogEntry (Topic_CityTeacher,"Alrik mě vycvičí v boji jednoručními zbraněmi. Potlouká se kdesi za skladištěm v přístavní čtvrti.");
		B_LogEntry (Topic_CityTeacher,"Ignaz mi ukáže některé recepty na míchání lektvarů. Žije v přístavní čtvrti.");
	
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brahim kreslí a prodává mapy. Bydlí poblíž přístavu.");
		
		
	DIA_Kardif_Lernen_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk_Condition;
	information	 = 	DIA_Kardif_Diebeswerk_Info;
	permanent    =  TRUE;
	description	 = 	"Můžu dostat třeba nějakou 'zvláštní' práci?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk_Condition ()
{	
	if (DIA_Kardif_Diebeswerk_permanent == FALSE)
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	//&& (other.guild == GIL_NONE) 
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //Můžu dostat třeba nějakou "zvláštní" práci, abych mohl rychle přijít k nějakým penězům?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //Něco zvláštního říkáš? Hmmmm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //...tak si zkus promluvit s Nagurem, možná ti pomůže.
	
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk2		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk2_Condition;
	information	 = 	DIA_Kardif_Diebeswerk2_Info;
	permanent    =  TRUE;
	description	 = 	"Máš pro mě nějakou 'zvláštní' práci?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk2_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk2_Condition ()
{	
	if (DIA_Kardif_Diebeswerk2_permanent == FALSE)
	&& (DIA_Kardif_Diebeswerk_permanent == TRUE) //andere Info
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	&& (other.guild != GIL_KDF) 
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk2_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //Máš pro mě nějakou "zvláštní" práci?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //Něco pro tebe mám - ale to tě bude zajímat jenom tehdy, pokud jsi opravdu všestranný.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //Co máš?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //No, Zuris, co prodává na tržišti lektvary, má zrovna u sebe hosta - mága ohně Darona.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //A?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Tesař Thorben mu zvlášť vyrobil novou truhlu.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //A ten Daron mu prý přinesl spoustu cenného zboží. Ale nic jsi ode mě neslyšel, rozumíš?
		
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's ich will doch keine Info kaufen 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zurueck		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Zurueck_Condition;
	information	 = 	DIA_Kardif_Zurueck_Info;
	permanent    =  TRUE;
	description	 = 	DIALOG_BACK;
};
func int DIA_Kardif_Zurueck_Condition ()
{	
	if (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Zurueck_Info ()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices (DIA_Kardif_Zurueck);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DOPE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_DOPE_Condition;
	information	 = 	DIA_Kardif_DOPE_Info;
	permanent    =  TRUE;
	description	 = 	"Kde bych tu koupil nějakou trávu?";
};
var int DIA_Kardif_DOPE_perm;
func int DIA_Kardif_DOPE_Condition ()
{
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&&  (DIA_Kardif_DOPE_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_DOPE_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //Kde bych tu koupil nějakou trávu?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Určitě ne tady - s takovými věcmi nechci nic mít.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Určitě ne tady.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //A kde tedy?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Být tebou, promluvím si s Meldorem - ten hulí od rána do večera.
		
		DIA_Kardif_DOPE_perm = TRUE;
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Paket		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  3;
	condition	 = 	DIA_Kardif_Paket_Condition;
	information	 = 	DIA_Kardif_Paket_Info;
	permanent	 =  TRUE;
	description	 = 	"Co víš o balíku trávy z bažin?";
};
var int DIA_Kardif_Paket_perm;
func int DIA_Kardif_Paket_Condition ()
{
	if 	(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Paket_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Paket_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //Co víš o balíku trávy z bažin?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Ten, kdo takový balík má, je boháč. A nejspíš je taky těžce v pohodě!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //Nesnaž se mě oblbnout. Ty něco víš, tak to vyklop!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //Nojo, nojo - takový chlápek ke mně onehdá přišel. Patřil k žoldákům.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Že prý v přístavu prodal balík trávy z bažin, ale samozřejmě byl totálně zhulený. Víc nevím.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif hovořil s žoldnéřem, který se snažil prodat balík trávy z bažin.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info SendAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_SENDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_SENDATTILA_Condition;
	information	 = 	DIA_Kardif_SENDATTILA_Info;
	important	 = 	TRUE;
};

func int DIA_Kardif_SENDATTILA_Condition ()
{
	if (MIS_ThiefGuild_sucked == TRUE)
	|| (Diebesgilde_Okay >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kardif_SENDATTILA_Info ()
{
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Hej ty, pojď sem. Něco pro tebe mám.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //Jeden chlápek tu s tebou chtěl mermomocí mluvit.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Když tě tu nezastihl, nechal tu pro tebe vzkaz.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Chce se s tebou sejít. Za Halvorovým obchodem s rybami.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Tahle informace je zadarmo - to je ale výjimka, hochu! Všecko ostatní tě zase bude něco stát.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //Jak ten chlápek vypadal?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //To ti můžu říct, ale napřed za to musíš zaplatit, kámo. (zašklebí se)
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Každá informace, kterou ti dám, tě bude stát 10 zlaťáků.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc (VLK_494_Attila, "NW_CITY_ENTRANCE_01");
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Kerl		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_Kerl_Condition;
	information	 = 	DIA_Kardif_Kerl_Info;
	permanent    =  TRUE;
	description	 = 	"Jak ten chlápek vypadal?";
};
//----------------------------------
var int DIA_Kardif_Kerl_permanent;
//----------------------------------
func int DIA_Kardif_Kerl_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_SENDATTILA)
	&& (Attila.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //Jak ten chlápek vypadal?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //No, byl poměrně vysoký, silný a měl tmavou pleť - ale žádnou uniformu. Působil tak nějak... hrozivě.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //A jeho tvář?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //Tvář? Když se na mě podíval, byl jsem rád, že si nepřišel pro mě.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Z očí mu koukala děsná zloba - ale i tak bys za ním měl zajít. Určitě to bude zajímavé.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //Ale otázkou je pro koho.
		
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DEFEATEDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_DEFEATEDATTILA_Condition;
	information	 = 	DIA_Kardif_DEFEATEDATTILA_Info;
	permanent    =  FALSE;
	description	 = 	"Ten bastard se mě snažil zabít!";
};

func int DIA_Kardif_DEFEATEDATTILA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info ()
{
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //Ten bastard se mě snažil zabít!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Hele, já za to přece nemůžu! Já ti jenom předal informaci!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Jestli ti někdo šlape na paty, pak k tomu má nejspíš své důvody.

	B_GivePlayerXP (XP_Kardif_Blame4Attila);
	
	B_KillNpc	(Attila);
	Npc_RemoveInvItem	(Attila, ItMi_OldCoin);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Zeichen   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 2;
	condition   = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent   = FALSE;
	description = "(Předvést zlodějský signál.)";
};

FUNC INT DIA_Kardif_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Aha, ty ses zapletl s tím gangem. No dobře, v tom případě tu pro tebe něco mám.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//(tiše) Když budeš potřebovat nějaké paklíče, přijď za mnou, pár jich tu ještě mám. A stačí, když si řekneš o něco k pití.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
};

//###########################
//##
//##	Kapitel 5
//##
//###########################

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Crew   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 51;
	condition   = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent   = FALSE;
	description = "Ještě pořád potřebuji pár námořníků.";
};

FUNC INT DIA_Kardif_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Crew_Info()
{
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//Ještě pořád potřebuji pár námořníků.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//Časy jsou zlé, příteli. V celém Khorinidu asi dost námořníků neseženeš - většina z nich z města odešla.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Ale když si najdeš dobrého kapitána, posádku seženeš celkem rychle - pár chytrých chlápků se tu vždycky najde.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//Kde bych našel kapitána?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//To se neptáš toho nepravého, já jenom vedu tuhle hospodu.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif mě poslal ke starému Jackovi, který mi nejspíš může pomoci.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Promluv si se starým Jackem. Bloumá tu po přístavu už hezky dlouho. Když přijde na námořnictví, je to tvůj muž.
	};
};





























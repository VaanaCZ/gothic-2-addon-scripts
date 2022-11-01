///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_EXIT   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 999;
	condition   = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Halvor_PICKPOCKET (C_INFO)
{
	npc			= VLK_469_Halvor;
	nr			= 900;
	condition	= DIA_Halvor_PICKPOCKET_Condition;
	information	= DIA_Halvor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Halvor_PICKPOCKET_Condition()
{
	C_Beklauen (78, 150);
};
 
FUNC VOID DIA_Halvor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Halvor_PICKPOCKET);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_BACK 		,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
	
func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Hallo		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Hallo_Condition;
	information	 = 	DIA_Halvor_Hallo_Info;
	permanent    =  FALSE;
	important	 =  TRUE;
};

func int DIA_Halvor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Wld_IsTime (05,00,20,00))
	{
			return TRUE;
	};
};
func void DIA_Halvor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Hallo_06_00"); //Hej, nepotřebuješ nějaké ryby? Vyber si tady, čerstvé, přímo z mořských hlubin!
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Halvor prodává v přístavu ryby.");
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_TRADE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_TRADE_Condition;
	information	 = 	DIA_Halvor_TRADE_Info;
	permanent	 =  TRUE;
	trade		 =  TRUE;
	description	 = 	"Ukaž mi své ryby.";
};

func int DIA_Halvor_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Halvor_Hallo)
	&& (Wld_IsTime (05,00,20,00))
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Halvor_TRADE_15_00"); //Ukaž mi své ryby.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Night
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Night		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Night_Condition;
	information	 = 	DIA_Halvor_Night_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};
func int DIA_Halvor_Night_Condition ()
{
	if (Wld_IsTime (20,00,00,00))
	&& Npc_IsInState (self, ZS_Talk)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_Night_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Night_06_00"); //Hej, jestli máš zájem o mé ryby, přijď k mému stánku zítra, dobrá?
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Halvor_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_469_Halvor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Halvor_MissingPeople_Condition;
	information	 = 	DIA_Addon_Halvor_MissingPeople_Info;

	description	 = 	"Nevíš něco o těch pohřešovaných lidech?";
};

func int DIA_Addon_Halvor_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	&& (Halvor_Ausgeliefert == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Halvor_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Halvor_MissingPeople_15_00"); //Můžeš mi říct něco o těch zmizelých lidech?
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_01"); //O zmizelých lidech? Tady jsi v přístavu, kámo. Takový věci se tu stávají.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_02"); //Moře je zrádný a to prostě sem tam někoho stojí i život.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_03"); //Kapitáni velkých lodí si v přístavech, jako je Khorinis, vždycky doplňují posádku.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_04"); //A když nenajdou žádné dobrovolníky, prostě někoho na loď odvlečou i proti jeho vůli. A takoví lidi se pak pohřešujou.
	
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, DIALOG_BACK, DIA_Addon_Halvor_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "Jaká loď?", DIA_Addon_Halvor_MissingPeople_schiff );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "Nevíš o někom, kdo se pohřešuje?", DIA_Addon_Halvor_MissingPeople_wer );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "A ty sám také někoho postrádáš?", DIA_Addon_Halvor_MissingPeople_you );
};
func void DIA_Addon_Halvor_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
};
func void DIA_Addon_Halvor_MissingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_wer_15_00"); //Víš o někom, kdo se pohřešuje?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_wer_06_01"); //Nemám páru. Na to se zeptej spíš loďařů.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Prodavač ryb Halvor mi pouze poradil, že bych se měl poptat u loďařů."); 
};
func void DIA_Addon_Halvor_MissingPeople_schiff ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_schiff_15_00"); //Jaká loď by to mohla být?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_schiff_06_01"); //To je dobrá otázka. Poslední dobou do Khorinidu moc lodí nepřiplouvá, to je fakt.
};
func void DIA_Addon_Halvor_MissingPeople_you ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_you_15_00"); //A TY sám nikoho nepostrádáš?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_you_06_01"); //Já? Ne.
};

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_MESSAGE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_MESSAGE_Condition;
	information	 = 	DIA_Halvor_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Mám dojem, že tenhle kousek papíru patří tobě...";
	trade		 =  FALSE;
};

func int DIA_Halvor_MESSAGE_Condition ()
{	
	if (Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_MESSAGE_Info ()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_15_00"); //Mám dojem, že tenhle kousek papíru patří tobě.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_01"); //Co...? Ukaž, podívám se.
	B_UseFakeScroll 	();
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_02"); //(potí se) Ehm... Dobrá, nikomu o tom ani muk - ehm... poslouchej. Musím se zbavit zboží, co jsem získal od banditů.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_03"); //(uspěchaně) Ale není žádný důvod jít přímo za domobranou, jasný? Jsem si jist, že se nějak dohodneme, co?
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Tak to mi udělej nabídku.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Vypadá to, že patříš do basy.",DIA_Halvor_MESSAGE_PRISON);

};
FUNC VOID DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_OFFER_15_00"); //Tak to mi udělej nabídku.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_01"); //Dobrá. Něco ti povím. Prodávám víc než jen ryby.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_03"); //Když mi dáš ten směšný kousek papíru a, ehm... zapomeneš na tu věc, můžeme se stát obchodními partnery.
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"No dobře, souhlasím.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Vypadá to, že patříš do basy.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Vážně? Co by to tak mohlo být za zboží?",DIA_Halvor_MESSAGE_DEAL);
};	
FUNC VOID DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_00"); //Vypadá to, že patříš do basy.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_01"); //Ne, počkej, to nemůžeš udělat! Vždyť přece nejsem, vždyť víš... nic jinýho než malá ryba.
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_02"); //To sis měl rozmyslet dřív. Teď mám v úmyslu tě nahlásit lordu Andremu.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_03"); //Toho budeš litovat.
	
	Betrayal_Halvor = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_00"); //Vážně? Co by to tak mohlo být za zboží?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_01"); //Dobrá, můžu ti nabídnout docela zvláštní ryby, však víš. Ne jenom ty obyčejné, co se jedí.
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_02"); //Máš na mysli takové, ve kterých jsou ukryté tvé tajné zprávy?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_03"); //Jo, trefils. Mám pár takových... rybek.
	
};
FUNC VOID DIA_Halvor_MESSAGE_Okay()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_Okay_15_00"); //Dobrá, dohodnuto. Necháme si to malé tajemství pro sebe.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_Okay_06_01"); //Díky. Zase se zastav, až budeš poblíž. Určitě pro tebe budu mít něco zajímavýho.
	
	B_GiveInvItems 	   (other, self, ItWr_HalvorMessage,1);
	Npc_RemoveInvItems (self, ItWr_HalvorMessage,1);
	
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
	//------------------------------------------------------
	CreateInvItems 	   (self,ItSe_ErzFisch , 1);
	CreateInvItems 	   (self,ItSe_GoldFisch, 1);
	CreateInvItems 	   (self,ItSe_Ringfisch , 1);
	CreateInvItems 	   (self,ItSe_LockpickFisch , 1);
	//------------------------------------------------------
	Info_ClearChoices (DIA_Halvor_MESSAGE);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Zeichen   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent   = FALSE;
	description = "(Předvést zlodějský signál.)";
};

FUNC INT DIA_Halvor_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (Betrayal_Halvor ==  FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_00");//Vím. Nepřišel jsi jen nakupovat ryby.
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_01");//(potichu) Udělám ti nabídku. Jestli máš nějaké stříbrné tácy nebo poháry, vezmu si je od tebe za dobrou cenu.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
	
	Log_CreateTopic (Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Halvor nakupuje stříbrné talíře a kalichy za daleko lepší cenu než ostatní obchodníci.");
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Hehlerei   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent   = TRUE;
	description = "(Prodat staré talíře a kalichy.)";
};

FUNC INT DIA_Halvor_Hehlerei_Condition()
{
	if Npc_KnowsInfo (other,DIA_Halvor_Zeichen)
	&& (Betrayal_Halvor == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0; //resetten
	
	if  (Halvor_Day != Wld_GetDay())
	{
		
		if (Npc_HasItems (other,ItMi_SilverPlate) >= 1)
		|| (Npc_HasItems (other,ItMi_SilverCup) >= 1)
		{
			Halvor_Score =  (Npc_HasItems (other,ItMi_SilverPlate) * (Value_SilverPlate/2)) + (Npc_HasItems (other,ItMi_SilverCup) * (Value_SilverCup/2));
			
			if (Halvor_Score <=  1000)  //weil sonst kein B_Say_Gold mehr...
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_05");//Za všechno, co máš, ti dám...
				B_Say_Gold (self, other, Halvor_Score);
			
				Info_ClearChoices (DIA_Halvor_Hehlerei);
				Info_AddChoice (DIA_Halvor_Hehlerei,"Dobrá, prodáno.",DIA_Halvor_Hehlerei_Annehmen);
				Info_AddChoice (DIA_Halvor_Hehlerei,"Budu o tom přemýšlet.",DIA_Halvor_Hehlerei_Ablehnen);
			}
			else 
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_06");//Přinesl jsi moc zboží. Nemůžu ti dát tolik zlata nejednou.
				Info_ClearChoices (DIA_Halvor_Hehlerei);
			};
		}
		else 
		{
			AI_Output (self, other, "DIA_Halvor_Zeichen_06_02");//Vrať se, až budeš mít nějaké stříbrné podnosy nebo poháry.
			Info_ClearChoices (DIA_Halvor_Hehlerei);
		};
	}
	else if (Wld_GetDay() == 0)
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_03");//Můžeš se toho stříbra zbavit zítra. Dneska je moc brzo.
	}
	else 
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_04");//Lituju, dneska už žádné obchody. Vrať se zítra, dobrá?
	};

};
FUNC VOID DIA_Halvor_Hehlerei_Annehmen()
{
	/*
	CreateInvItems (other, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)));//Für Textausgabe -> ist ziemlich dreckig, aber wie sonst? 
	B_GiveInvItems (other, self, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ); 
 	*/
 	
 	//--------- Patch 2.5a-----------------------------------------
 	var int amount;
 	var string concatText;
 	amount = (Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ;
 	
 	concatText = ConcatStrings(IntToString(amount), PRINT_ItemsGegeben);
 	AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
 	
 	//------------------------------------------------------------
 	
 	Npc_RemoveInvItems (other, ItMi_SilverCup,Npc_HasItems (other, ItMi_SilverCup));
 	Npc_RemoveInvItems (other, ItMi_SilverPlate, Npc_HasItems (other, ItmI_SilverPlate));
 	
 	B_GiveInvItems (self, other, ItMi_Gold, Halvor_Score);
 	
 	AI_Output (other, self, "DIA_Halvor_Zeichen_Annehmen_15_00");//Dobrá, prodáno.
 	AI_Output (self, other, "DIA_Halvor_Zeichen_Annehmen_06_01");//Udělali jsme dneska dobrej kšeft. Lepší to bude nejdřív zítra, jinak by někdo mohl dostat podezření, však víš.
	
	Halvor_Day = Wld_GetDay ();
	Info_ClearChoices (DIA_Halvor_Hehlerei);
}; 
FUNC VOID DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices (DIA_Halvor_Hehlerei);
};

//#############################################
//##
//##	Kapitel 5
//##
//#############################################

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Crew		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	51;
	condition	 = 	DIA_Halvor_Crew_Condition;
	information	 = 	DIA_Halvor_Crew_Info;
	permanent    =  FALSE;
	description	 =  "Sháním posádku.";
};

func int DIA_Halvor_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
			return TRUE;
	};
};
func void DIA_Halvor_Crew_Info ()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_15_00"); //Sháním posádku.
	AI_Output (self ,other,"DIA_Halvor_Crew_06_01"); //Ale jak se chceš odsud dostat?
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,"To je čistě moje věc.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice (DIA_Halvor_Crew,"Hodlám získat loď.",DIA_Halvor_Crew_StealShip);
	
};

FUNC VOID DIA_Halvor_Crew_MyThing()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_MyThing_15_00"); //To je čistě moje věc.
	AI_Output (self ,other,"DIA_Halvor_Crew_MyThing_06_01"); //Jak je libo. To opravdu není moje věc.

	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"Tak jdeš do toho?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice (DIA_Halvor_Crew,"Můžeš mi pomoct?",DIA_Halvor_Crew_HelpMe); 
};

FUNC VOID DIA_Halvor_Crew_StealShip()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_StealShip_15_00"); //Hodlám získat loď.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_01"); //Jo, jasně. Jinak seš zdravej? Paladinové s tebou udělaj krátkej proces, až na to přijdou.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_02"); //Jak je libo - neriskuješ můj život.
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"Tak jdeš do toho?",DIA_Halvor_Crew_JoinMe);
	if (Npc_IsDead (JACK) == FALSE)
	{
		Info_AddChoice (DIA_Halvor_Crew,"Můžeš mi pomoct?",DIA_Halvor_Crew_HelpMe); 
	};
};

FUNC VOID DIA_Halvor_Crew_JoinMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_JoinMe_15_00"); //Tak jdeš do toho?
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_01"); //Ne, mám dojem, že ne. Mám tady spoustu práce a upřímně, netoužím zrovna po tom, abych potkal otrokářskou galéru plnou skřetů.
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_02"); //Ale přeju ti hodně štěstí.
};

FUNC VOID DIA_Halvor_Crew_HelpMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_HelpMe_15_00"); //Můžeš mi pomoct?
	AI_Output (self ,other,"DIA_Halvor_Crew_HelpMe_06_01"); //Já na tohle nejsem ten pravej člověk. Ale zajdi si promluvit s Jackem. Měl by se poflakovat někde tady po přístavu. On bude vědět nejlíp, co na tu plavbu budeš potřebovat.
};

FUNC VOID DIA_Halvor_Crew_Back()
{
	Info_ClearChoices (DIA_Halvor_Crew);
};





///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hakon_EXIT   (C_INFO)
{
	npc         = VLK_407_Hakon;
	nr          = 999;
	condition   = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Sperre_Condition;
	information	 = 	DIA_Hakon_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Hakon_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	{
		return TRUE;
	};
	//return FALSE;
};
func void DIA_Hakon_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Hakon_Sperre_12_00"); //Ztraă se, ty kriminálníku! Canthar mi âekl, jakej mizernej bastard seš!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 =  3;
	condition	 = 	DIA_Hakon_Hallo_Condition;
	information	 = 	DIA_Hakon_Hallo_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Hakon_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Hallo_Info ()
{
	AI_Output (self ,other,"DIA_Hakon_Add_12_00"); //Jsem Hakon, prodavač zbraní.
	AI_Output (self ,other,"DIA_Hakon_Add_12_01"); //V tyhle dny by męl mít každý muž u sebe zbraŕ. Zvlášă když se vydá za hradby.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Hakon prodává na tržišti zbranę.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	99;
	condition	 = 	DIA_Hakon_Trade_Condition;
	information	 = 	DIA_Hakon_Trade_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Ukaž mi své zboží.";
};
func int DIA_Hakon_Trade_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Hakon_Trade_15_00"); //Ukaž mi své zboží.
	
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF)
	{
		AI_Output (self,other,"DIA_Hakon_Trade_12_01"); //Je pro mę velkou ctí, když se o mé zboží zajímá pâedstavitel svaté církve.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_407_Hakon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Hakon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Hakon_MissingPeople_Info;

	description	 = 	"Co víš o tęch pohâešovaných lidech z Khorinidu?";
};

func int DIA_Addon_Hakon_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Hakon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //Víš nęco o tęch zmizelých občanech Khorinidu?
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //Hodnę jsem jich vidęl procházet východní męstskou bránou.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //Nękteré jsem v životę nevidęl, ale spousta z tęch, co vyšla ven, už se nikdy nevrátila.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //Ale nedávno se stalo nęco vážnę divného.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //Pâišel sem jeden chlápek - myslím, že se jmenuje Joe. Chlubil se, že si brzo pâijde na pękný peníze.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //Tvrdil, že ví, jak se dostat do jedné z męstských vęží, kde domobrana skladuje zbranę.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //Od té doby jsem ho nevidęl, pâitom jsem na nęj pâedtím narážel vždycky ve stejnou dobu.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //Ohlásil jsem to domobranę. Âíkal jsem si, že ho tâeba chytili a vsadili do želez.
	AI_Output	(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //Jenže lord Andre netušil, o čem to mluvím. Prý toho chlapa ani nezná.

	Log_CreateTopic (TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Joe,"Khorinidský obchodník Halon tvrdí, že nęjaký Joe prostę beze stopy zmizel. Tenhle Joe prý vędęl, jak se dostat do jedné z męstských vęží, kde domobrana uchovává zbranę."); 

	B_GivePlayerXP (XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_OutOfTown_Condition;
	information	 = 	DIA_Hakon_OutOfTown_Info;
	permanent	 = 	FALSE;
	description	 = 	"Povęz mi nęco o okolí męsta.";
};
func int DIA_Hakon_OutOfTown_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_OutOfTown_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_02"); //Âekni mi nęco o okolí męsta.
	AI_Output (self ,other,"DIA_Hakon_Add_12_03"); //Je to tam čím dál nebezpečnęjší.
	AI_Output (self ,other,"DIA_Hakon_Add_12_04"); //Jednak kvůli banditům, a taky kvůli divoké zvęâi.
	AI_Output (self ,other,"DIA_Hakon_Add_12_05"); //Vypadá to, jako by ani zvíâata v tęchhle zatracených časech nemęla čím zahnat hlad.
	AI_Output (self ,other,"DIA_Hakon_Add_12_06"); //Odvažují se k męstu stále blíž.
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	3;
	condition	 = 	DIA_Hakon_Paladine_Condition;
	information	 = 	DIA_Hakon_Paladine_Info;
	permanent	 = 	FALSE;
	description	 = 	"Víš nęco o paladinech?";
};
func int DIA_Hakon_Paladine_Condition ()
{	
	return TRUE;
};
func void DIA_Hakon_Paladine_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_07"); //Víš nęco o paladinech?
	AI_Output (self ,other,"DIA_Hakon_Add_12_08"); //Ano! Ti chlapi mi maâí moje obchody!
	AI_Output (self ,other,"DIA_Hakon_Add_12_09"); //Všechno, co si pâi nejlepší vůli můžeš v tomhle męstę koupit, je krátký meč.
	AI_Output (self ,other,"DIA_Hakon_Add_12_10"); //Seberou všechno, co je delší než stopu a půl.
	AI_Output (self ,other,"DIA_Hakon_Add_12_11"); //(jízlivę) A na oplátku se teë můžu v hostinci válet zadarmo, eh.
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_WoWaffen_Condition;
	information	 = 	DIA_Hakon_WoWaffen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Odkud bereš své zbranę?";
};
func int DIA_Hakon_WoWaffen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};
func void DIA_Hakon_WoWaffen_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_12"); //Odkud bereš své zbranę?
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_13"); //Odnikud! Až doteë byl mým dodavatelem Harad.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_14"); //Až doteë byl mým dodavatelem kováâ Harad.
	};
	AI_Output (self ,other,"DIA_Hakon_Add_12_15"); //Nedęlá teë na ničem jiném než na zakázce pro paladiny.
	AI_Output (self ,other,"DIA_Hakon_Add_12_16"); //Pracuje pro ty chlápky dnem i nocí jako magor bez nároku na odmęnu. Má dojem, že to jeho povinnost.
	AI_Output (self ,other,"DIA_Hakon_Add_12_17"); //Všechno, co ti můžu nabídnout, jsou zbytky mých zásob.
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_HaradBandits_Condition;
	information	 = 	DIA_Hakon_HaradBandits_Info;
	permanent	 = 	FALSE;
	description	 = 	"Harad se zmínil o útoku banditů...";
};
func int DIA_Hakon_HaradBandits_Condition ()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Hakon_HaradBandits_Info ()
{
	AI_Output (other, self,"DIA_Hakon_Add_15_18"); //Harad mi âekl o útoku banditů.
	AI_Output (self ,other,"DIA_Hakon_Add_12_19"); //Hm? A?
	AI_Output (other, self,"DIA_Hakon_Add_15_20"); //Dá mi souhlas pro pâijetí do učení, když se vypoâádám s tęmi bandity.
	AI_Output (self ,other,"DIA_Hakon_Add_12_21"); //(smích) Starý dobrý Harad. To asi bude způsob, jakým se mi chtęl omluvit za to, že pro mę nemůže dęlat žádné zbranę.
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Banditen_Condition;
	information	 = 	DIA_Hakon_Banditen_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co víš o banditech?";
};
func int DIA_Hakon_Banditen_Condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo (hero, DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};
func void DIA_Hakon_Banditen_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_15_00"); //Co víš o banditech?
	AI_Output (self, other, "DIA_Hakon_Banditen_12_01"); //Co o nich vím? Cestou do męsta mę oloupili!
	AI_Output (self, other, "DIA_Hakon_Banditen_12_02"); //A nejsem jediný. To se jen tak nezmęní.
	AI_Output (self, other, "DIA_Hakon_Banditen_12_03"); //Domobrana se je snaží vyslídit, ale nęjak se to nedaâí.

	MIS_HakonBandits = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HakonBanditen,LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen,"Hakona, obchodníka se zbranęmi, okradli za męstem bandité." );
};


///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	6;
	condition	 = 	DIA_Hakon_Wieviel_Condition;
	information	 = 	DIA_Hakon_Wieviel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Můžu se o to postarat...";
};
func int DIA_Hakon_Wieviel_Condition ()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wieviel_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //Můžu se o to postarat.
	AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //Co, TY se chceš pustit do banditů? To jako ty sám? Ty jsi asi dost dobrý bojovník, co?
	AI_Output (other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //Jak moc ti na tom záleží?
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_25"); //(potutelnę) Chceš se dostat k Haradovým biblím, co?
		AI_Output (self ,other,"DIA_Hakon_Add_12_26"); //Nemyslím, že bych ti za to męl platit.
	}
	else
	{
		AI_Output (self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //Je to pęknę nebezpečné.
		AI_Output (self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //No, mnę to nevadí. Jestli ty bandity pâemůžeš, dám ti 100 zlaăáků.
		MIS_HakonBanditsPay = TRUE;
	};
	
	Info_ClearChoices (DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	4;
	condition	 = 	DIA_Hakon_Miliz_Condition;
	information	 = 	DIA_Hakon_Miliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Víš, kdo z domobrany se účastnil vyšetâování?";
};

func int DIA_Hakon_Miliz_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Miliz_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Miliz_15_00"); //Nemáš ponętí, kdo z domobrany se pátrání účastnil?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_01"); //Jo, ten chlapík se jmenoval Pablo. On a pár ostatních po banditech pátrali, ale nikoho nenašli.
	AI_Output (other, self, "DIA_Hakon_Miliz_15_02"); //A nevíš, kde bych toho Pabla našel?
	AI_Output (self, other, "DIA_Hakon_Miliz_12_03"); //Je na stráži ve męstę. Buë ho potkáš v chrámové uličce, nebo v dolní čtvrti.
	
	B_LogEntry(TOPIC_HakonBanditen,"Neúspęšného pátrání po banditech se účastnil i Pablo, pâíslušník męstské gardy." );
};
///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	5;
	condition	 = 	DIA_Hakon_Wo_Condition;
	information	 = 	DIA_Hakon_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde tę pâepadli?";
};

func int DIA_Hakon_Wo_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hakon_Wo_Info ()
{
	AI_Output (other, self, "DIA_Hakon_Wo_15_00"); //Kde tę pâepadli?
	AI_Output (self, other, "DIA_Hakon_Wo_12_01"); //U Akilova statku. Když odsud vyjdeš męstskou branou a pak se dáš cestou doprava, nemůžeš to minout.
	AI_Output (self, other, "DIA_Hakon_Wo_12_02"); //Za chvíli narazíš na pár schodů - a právę odtamtud se na mę ti bastardi vyâítili. Vsadím se, že nękde v tęch lesích mají doupę.
};
///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success		(C_INFO)
{
	npc			 = 	VLK_407_Hakon;
	nr			 = 	2;
	condition	 = 	DIA_Hakon_Success_Condition;
	information	 = 	DIA_Hakon_Success_Info;
	permanent	 = 	FALSE;
	description	 = 	"Postaral jsem se o ty bandity.";
};

func int DIA_Hakon_Success_Condition ()
{	
	if (MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead (Bandit_1))
	&& (Npc_IsDead (Bandit_2))
	&& (Npc_IsDead (Bandit_3))
	
	{
		return TRUE;
	};
};
func void DIA_Hakon_Success_Info ()
{
	
	AI_Output (other, self, "DIA_Hakon_Success_15_00"); //Postaral jsem se o ty bandity.
	AI_Output (self ,other,"DIA_Hakon_Add_12_27"); //Opravdu? To by mohl âíct každý. Máš nęjaký důkaz?
	AI_Output (other, self,"DIA_Hakon_Add_15_28"); //(povzdech) To se tam mám vrátit a usekat jim hlavy, nebo co?
	AI_Output (self ,other,"DIA_Hakon_Add_12_29"); //(rychle) Ne - to snad ani nebude nutné. Vęâím ti.
	AI_Output (self, other, "DIA_Hakon_Success_12_01"); //Prokázal jsi męstským obchodníkům nesmírnou službu.
	
	if (Npc_KnowsInfo (other, DIA_Hakon_HaradBandits))
	{
		AI_Output (self ,other,"DIA_Hakon_Add_12_30"); //Harad bude spokojený - aspoŕ myslím.
	};
		
	if (MIS_HakonBanditsPay == TRUE)
	{	
		AI_Output (self, other, "DIA_Hakon_Success_12_02"); //A tady máš slíbenou odmęnu.
		B_GiveInvItems (self, other, ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Hakon_Bandits); 
	
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Hakon_Minenanteil (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 3;
	condition	= DIA_Hakon_Minenanteil_Condition;
	information	= DIA_Hakon_Minenanteil_Info;
	permanent	= FALSE;
	description = "Kde jsi sehnal ty důlní akcie, které prodáváš?";
};   
                    
FUNC INT DIA_Hakon_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hakon_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Hakon_Minenanteil_15_00"); //Kde jsi sehnal ty důlní akcie, které prodáváš?
	AI_Output (self, other, "DIA_Hakon_Minenanteil_12_01"); //Je mi líto, ale to ti nemůžu prozradit. Je to moc nebezpečné.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hakon_PICKPOCKET (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 900;
	condition	= DIA_Hakon_PICKPOCKET_Condition;
	information	= DIA_Hakon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen (45, 65);
};
 
FUNC VOID DIA_Hakon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hakon_PICKPOCKET);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_BACK 		,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};
	
func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hakon_PICKPOCKET);
};


// ************************************************************
// 			  				Kapitel2
// ************************************************************

INSTANCE DIA_Hakon_Kapitel2 (C_INFO)
{
	npc			= VLK_407_Hakon;
	nr			= 5;
	condition	= DIA_Hakon_Kapitel2_Condition;
	information	= DIA_Hakon_Kapitel2_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Hakon_Kapitel2_Condition()
{
	if (Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hakon_Kapitel2_Info()
{	
	AI_Output (self ,other,"DIA_Hakon_Add_12_22"); //Už zase TY!
	AI_Output (self ,other,"DIA_Hakon_Add_12_23"); //Harad konečnę skončil s tou zatrachtilou prací pro paladiny.
	AI_Output (self ,other,"DIA_Hakon_Add_12_24"); //To značí, že ti teë můžu nabídnout nové zbranę. Máš zájem?
};

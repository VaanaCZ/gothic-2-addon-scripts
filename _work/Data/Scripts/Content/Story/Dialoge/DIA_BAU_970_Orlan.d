///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Orlan_EXIT   (C_INFO)
{
	npc         = BAU_970_Orlan;
	nr          = 999;
	condition   = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wein
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Wein		(C_INFO)
{
	npc			 = 	BAU_970_Orlan;
	nr			 = 	3;
	condition	 = 	DIA_Orlan_Wein_Condition;
	information	 = 	DIA_Orlan_Wein_Info;
	permanent 	 =  FALSE;
	description	 = 	"Pâinesl jsem víno z kláštera.";
};
func int DIA_Orlan_Wein_Condition ()
{	
	if (MIS_GoraxWein == LOG_RUNNING)
	&& (Npc_HasItems (other, ItFo_Wine) >= 12)
	{
		return TRUE;
	};
};
func void DIA_Orlan_Wein_Info ()
{
	AI_Output (other, self, "DIA_Orlan_Wein_15_00"); //Pâinesl jsem víno z kláštera.
	AI_Output (self, other, "DIA_Orlan_Wein_05_01"); //Výbornę. To je to, na co jsem čekal.
	AI_Output (self, other, "DIA_Orlan_Wein_05_02"); //Už jsem pâistoupil na Goraxovu cenu. Hned teë ti dám 100 zlatých.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	
	Info_AddChoice (DIA_Orlan_Wein,"Dobrá, tak mi dej to zlato.",DIA_Orlan_Wein_JA);
	Info_AddChoice (DIA_Orlan_Wein,"Snažíš se mę napálit? Cena je 240 zlaăáků.",DIA_Orlan_Wein_NEIN);
};
FUNC VOID DIA_Orlan_Wein_JA()
{
	AI_Output (other, self, "DIA_Orlan_Wein_JA_15_00"); //Dobrá, tak mi dej to zlato.
	AI_Output (self, other, "DIA_Orlan_Wein_JA_05_01"); //Tady máš. Bylo mi potęšením s tebou obchodovat.
	
	B_GiveInvItems (self, other, ItmI_Gold, 100);
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_NEIN()
{
	AI_Output (other, self, "DIA_Orlan_Wein_NEIN_15_00"); //Pokoušíš se mę obrat? Cena je 240 zlatých.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_01"); //Gorax tę varoval, co? Dobrá, možná bychom na tom mohli vydęlat oba. Hele - dám ti za to víno 100 zlatých.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_02"); //Âekneš Goraxovi, že jsem tę natáhl, a já ti dám ČTYÂI magické svitky.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	Info_AddChoice (DIA_Orlan_Wein,"Hej, prostę mi dej 240 zlatých.",DIA_Orlan_Wein_Nie);
	Info_AddChoice (DIA_Orlan_Wein,"Dobrá, to zní docela férovę. Dej mi ty svitky.",DIA_Orlan_Wein_Okay);
	Info_AddChoice (DIA_Orlan_Wein,"Co to je za svitky?",DIA_Orlan_Wein_Was);
};
FUNC VOID DIA_Orlan_Wein_Nie()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Nie_15_00"); //Hej, prostę mi dej 240 zlatých.
	AI_Output (self, other, "DIA_Orlan_Wein_Nie_05_01"); //Copak na tom nechceš vydęlat? (povzdych) Dobrá, tady je zlato.
	
	B_GiveInvItems (self, other, ItmI_Gold, 240);
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_Okay()
{
	var string Text;
		
	Text = ConcatStrings( "4" , PRINT_ItemsErhalten);		
	PrintScreen	(Text, -1, -1, FONT_ScreenSmall, 2);
	
	B_GiveInvItems (self, other, ItmI_Gold, 100);
	
	AI_Output (other, self, "DIA_Orlan_Wein_Okay_15_00"); //Dobrá, to zní docela férovę. Dej mi ty svitky.
	AI_Output (self, other, "DIA_Orlan_Wein_Okay_05_01"); //Tady jsou svitky a zlato.
	
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	
	CreateInvItems  (hero,ITSC_Light,2);
	CreateInvItems  (hero,ItSc_LightHeal,1);
	CreateInvItems  (hero,ItSc_SumGobSkel,1);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_Was()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Was_15_00"); //Co to je za svitky?
	AI_Output (self, other, "DIA_Orlan_Wein_Was_05_01"); //Netuším - o tomhle já nic nevím. Jsou od hosta, co... ehm... je tady zapomnęl, jo.
};
///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WERBISTDU		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	2;
	condition	 = 	DIA_Orlan_WERBISTDU_Condition;
	information	 = 	DIA_Orlan_WERBISTDU_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Orlan_WERBISTDU_Condition ()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_WERBISTDU_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_01"); //Jsem Orlan, majitel téhle skromné hospody.
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_02"); //Co sháníš, cizinče? Možná poâádný meč nebo snad kus dobrého brnęní?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_03"); //Doušek nęčeho dobrého z venkovských palíren, nebo jen nęjakou informaci?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_04"); //Můžu ti to nabídnout všechno a dokonce ještę víc, pokud jsou tvé mince pravé.

};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Greg		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Orlan_Greg_Condition;
	information	 = 	DIA_Addon_Orlan_Greg_Info;

	description	 = 	"Znáš toho chlápka s páskou pâes oko?";
};

func int DIA_Addon_Orlan_Greg_Condition ()
{
	if (SC_SawGregInTaverne == TRUE)
	&& (Kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
		{
			return TRUE;
		};
};

func void DIA_Addon_Orlan_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_Greg_15_00"); //Znáš toho chlápka s páskou pâes oko?
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_01"); //Už jsem ho tu vidęl. Je pęknę nepâíjemný.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_02"); //Onehdá si do jednoho z mých pokojů nahoâe odnesl velkou bednu.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_03"); //Poâád jsem ho uhánęl, aby za ten pokoj zaplatil, ale on si jednom hledęl svýho.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_04"); //A pak jednoho dne prostę zmizel i s tou bednou. S takovými jako on nechci nic mít.
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Ranger		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Orlan_Ranger_Condition;
	information	 = 	DIA_Addon_Orlan_Ranger_Info;

	description	 = 	"Zdá se mi to, nebo furt zíráš na můj prsten?";
};
func int DIA_Addon_Orlan_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
	&& (SCIsWearingRangerRing == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Orlan_Ranger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_15_00"); //To se mi zdá, nebo poâád zíráš na můj prsten?
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_05_01"); //Nęjak nevím, co si o tom myslet.

	Orlan_KnowsSCAsRanger = TRUE;

	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "Ale no tak! Já patâím ke kruhu vody!", DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "Je to akvamarín. Už jsi nękdy nęjaký vidęl?", DIA_Addon_Orlan_Ranger_Aqua);
};
func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Aqua_15_00"); //To je akvamarín. Už jsi nękdy takový vidęl?
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_01"); //Ano, vidęl. Tak vítej v našem hlavním stanu, bratâe z kruhu.
	if (Npc_KnowsInfo (other, DIA_Addon_Orlan_NoMeeting)) //verrissen
	{
		AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_02"); //...i když zrovna nevypadáš, že bys šel na oltáâ zapalovat svíčky.
	};
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_03"); //Co pro tebe můžu udęlat?
	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP (XP_Ambient);
};
func void DIA_Addon_Orlan_Ranger_Idiot ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Lares_15_00"); //Človęče! Já patâím ke kruhu vody!
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_01"); //Vážnę? Tęžko se vęâí, že by mezi sebe vzali takovýho hŕupa.
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_02"); //Co chceš?
	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);	
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Teleportstein		(C_INFO)
{
	npc		 	= BAU_970_Orlan;
	nr		 	= 2;
	condition	= DIA_Addon_Orlan_Teleportstein_Condition;
	information	= DIA_Addon_Orlan_Teleportstein_Info;

	description	= "Už jsi nękdy používal teleportační kámen?";
};

func int DIA_Addon_Orlan_Teleportstein_Condition ()
{
	if (Orlan_KnowsSCAsRanger == TRUE)
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
		{
			return TRUE;
		};
};

func void DIA_Addon_Orlan_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_Teleportstein_15_00"); //Už jsi nękdy používal teleportační kámen?
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_01"); //Zbláznil ses? Nikdo z vodních mágů se nemůže zaručit, že je to úplnę bez rizika, takže se k podobným vęcem ani nepâibližuju.
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_02"); //Jen mi rozkázali, abych jeden z tęch teleportačních kamenů ukryl, jinak bych se od nich držel dál.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "Můžu se podívat na tenhle teleportační kámen?:", DIA_Addon_Orlan_Teleportstein_sehen );
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "Kde je ten teleportační kámen?", DIA_Addon_Orlan_Teleportstein_wo );
};
func void DIA_Addon_Orlan_Teleportstein_sehen ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_sehen_15_00"); //A můžu se na ten teleportační kámen mrknout?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_sehen_05_01"); //Mnę je to fuk. Tady máš klíč - zablokoval jsem vchod.
	CreateInvItems (self, ITKE_ORLAN_TELEPORTSTATION, 1);									
	B_GiveInvItems (self, other, ITKE_ORLAN_TELEPORTSTATION, 1);
	
	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Orlan umístil teleportační kámen do jeskynę jihozápadnę od jeho hospody."); 
};

func void DIA_Addon_Orlan_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_wo_15_00"); //Kde je ten teleportační kámen?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_wo_05_01"); //Kousek na jih od mojí hospody je jeskynę. Tam mágové vody jednu z tęch vęcí našli.
};

///////////////////////////////////////////////////////////////////////
//	Info Meeting OHNE RING
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_NoMeeting (C_INFO)
{
	npc		 	= BAU_970_Orlan;
	nr		 	= 2;
	condition	= DIA_Addon_Orlan_NoMeeting_Condition;
	information	= DIA_Addon_Orlan_NoMeeting_Info;

	description	= "Jsem tu, abych se pâipojil ke 'kruhu vody'!";
};
func int DIA_Addon_Orlan_NoMeeting_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
	&& (!Npc_KnowsInfo (other, DIA_Addon_Orlan_Ranger))
	&& (SCIsWearingRangerRing == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Orlan_NoMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_NoMeeting_15_00"); //Pâišel jsem se pâidat ke kruhu vody!
	AI_Output (self, other, "DIA_Addon_Orlan_NoMeeting_05_01"); //(úsečnę) Nevidím žádný prsten. Mohu vám nabídnout pití, cizinče?
};

///////////////////////////////////////////////////////////////////////
//	Info WhenRangerMeeting
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_WhenRangerMeeting		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information	 = 	DIA_Addon_Orlan_WhenRangerMeeting_Info;

	description	 = 	"Slyšel jsem, že 'kruh' se schází právę ve tvé hospodę.";
};

func int DIA_Addon_Orlan_WhenRangerMeeting_Condition ()
{
	if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
 	&& (Npc_KnowsInfo (other, DIA_Addon_Orlan_Ranger))
 	{
		return TRUE;
 	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_15_00"); //Slyšel jsem, že se v tvé hospodę brzy sejde celý kruh.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_01"); //To je pravda, za chvíli už by męli začít.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_02"); //Co jim to tak dlouho trvá?

	B_GivePlayerXP (XP_Ambient);
	B_Addon_Orlan_RangersReadyForcoming ();
	self.flags = 0;

	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "Za chvíli by tu męli být.", DIA_Addon_Orlan_WhenRangerMeeting_theyCome );
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "On je ten sraz dneska?", DIA_Addon_Orlan_WhenRangerMeeting_Today );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_Today ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00"); //Ono je to setkání dneska?
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01"); //Ano, aspoŕ pokud si vzpomínám.
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02"); //Doufám, že už se nikdy takhle nezpozdí.
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(více)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00"); //Už tu męli dávno být.
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01"); //Uvidíme.
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(více)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_Los ()
{
	AI_StopProcessInfos (self);
	B_Addon_Orlan_ComingRanger ();
};

//-----------------------------------------------------
// BESSERE RÜSTUNG
//-----------------------------------------------------

instance DIA_Orlan_RUESTUNG		(C_INFO)
{
	npc		= 	BAU_970_Orlan;
	nr		= 	5;
	condition	 = 	DIA_Orlan_RUESTUNG_Condition;
	information	 = 	DIA_Orlan_RUESTUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jakou zbroj mi můžeš nabídnout?";
};

var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		&& (DIA_Orlan_RUESTUNG_noPerm == FALSE)
		&& (hero.guild == GIL_NONE)
		)
		{
				return TRUE;
		};
};

func void DIA_Orlan_RUESTUNG_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_RUESTUNG_15_00"); //Jakou zbroj mi můžeš nabídnout?
	AI_Output			(self, other, "DIA_Orlan_RUESTUNG_05_01"); //Mám tady jeden velmi pękný kousek, který se ti určitę bude líbit.

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);

	Info_AddChoice			(DIA_Orlan_RUESTUNG, DIALOG_BACK	,	DIA_Orlan_RUESTUNG_BACK);	
	Info_AddChoice			(DIA_Orlan_RUESTUNG, "Kožená zbroj. Ochrana: zbranę 25, šípy 20, oheŕ 5 (250 zlaăáků)" , DIA_Orlan_RUESTUNG_Buy);	
};  

func void DIA_Orlan_RUESTUNG_Buy ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_Buy_15_00"); //Chtęl bych si koupit lehkou zbroj.

	if (B_GiveInvItems		(other, self, ItMi_Gold, VALUE_ITAR_Leather_L))
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_01"); //Moudré rozhodnutí.

			CreateInvItems 		(self, ItAr_Leather_L, 1);
			B_GiveInvItems		(self, other, ItAr_Leather_L, 1);
			AI_EquipBestArmor	(other);
			DIA_Orlan_RUESTUNG_noPerm = TRUE;
		}
	else
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_02"); //Je mi líto. Dokud nemáš peníze, žádné obchody nebudou.
		};

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_BACK_15_00"); //Budu o tom pâemýšlet.
	AI_Output				(self, other,"DIA_Orlan_RUESTUNG_BACK_05_01"); //Jak chceš. Ale neotálej pâíliš dlouho.

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_TRADE		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	70;
	condition	 = 	DIA_Orlan_TRADE_Condition;
	information	 = 	DIA_Orlan_TRADE_Info;
	trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Ukaž mi své zboží.";
};

func int DIA_Orlan_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		{
				return TRUE;
		};
};

func void DIA_Orlan_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_TRADE_15_00"); //Ukaž mi své zboží.
	B_GiveTradeInv (self);
	
		//ADDON>
		if ((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE)||(SCIsWearingRangerRing == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_TRADE_05_00"); //Jasnę, bratr z 'kruhu'.
				Orlan_KnowsSCAsRanger = TRUE;
			}
		//ADDON<
		else if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_01"); //Samozâejmę. Je to pro mę velká čest, pâijmout tak důležitý úkol.
			}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_02"); //Zajisté, pane.
			}
		else
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_03"); //Pokud na to máš.
			};
};


///////////////////////////////////////////////////////////////////////
//	Info HotelZimmer
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_HotelZimmer		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	6;
	condition	 = 	DIA_Orlan_HotelZimmer_Condition;
	information	 = 	DIA_Orlan_HotelZimmer_Info;
	permanent	 = 	TRUE;

	description	 = 	"Kolik si účtuješ za pokoj?";
};
var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;
func int DIA_Orlan_HotelZimmer_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	&& (Orlan_SCGotHotelZimmer == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Orlan_HotelZimmer_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_15_00"); //Kolik si účtuješ za pokoj?
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)|| (SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
		{
			//ADDON>
			if ((SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_HotelZimmer_05_00"); //Bratrovi z 'kruhu'? Nic.
				Orlan_RangerHelpZimmer = TRUE;
				Orlan_KnowsSCAsRanger = TRUE;
			}
			//ADDON<
			else if (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_01"); //Pro královy rytíâe mám vždycky volný pokoj. Samozâejmę zdarma.
			}
			else
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_02"); //Nikdy bych si nedovolil brát peníze od zástupců Innose.
			};
			
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_03"); //Tady je klíč od hoâejších pokojů. Jeden z nich si zaber.
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmer = TRUE;
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_04"); //Dej mi 50 zlatých na týden a můžeš si vybrat nękterý z pokojů.
		
			Info_ClearChoices	(DIA_Orlan_HotelZimmer);
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "To je zatracenę drahé.", DIA_Orlan_HotelZimmer_nein );
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "Dobrá. Tady jsou prachy.", DIA_Orlan_HotelZimmer_ja );
		};	
};
func void DIA_Orlan_HotelZimmer_ja ()
{
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(other, self, "DIA_Orlan_HotelZimmer_ja_15_00"); //Dobrá. Tady jsou prachy.
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_01"); //Tady máš klíč. Pokoje jsou nahoâe nad schody. Ale moc to tam nezamaž a plaă včas, jasné?
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Orlan_SCGotHotelZimmer = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_02"); //Nemáš 50 babek. Nejdâív peníze, pak zábava.
		};
	Info_ClearChoices	(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_nein_15_00"); //Tak to je zatracenę drahý.
	AI_Output			(self, other, "DIA_Orlan_HotelZimmer_nein_05_01"); //Tak to by ses męl poohlédnout po nęčem jiném, pâíteli.
	Info_ClearChoices	(DIA_Orlan_HotelZimmer);
};

///////////////////////////////////////////////////////////////////////
//	Info MieteFaellig
///////////////////////////////////////////////////////////////////////

var int Orlan_AngriffWegenMiete;
////////////////////////////////

instance DIA_Orlan_MieteFaellig		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	10;
	condition	 = 	DIA_Orlan_MieteFaellig_Condition;
	information	 = 	DIA_Orlan_MieteFaellig_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

var int DIA_Orlan_MieteFaellig_NoMore;
func int DIA_Orlan_MieteFaellig_Condition ()
{
	//ADDON>
	if ((SC_IsRanger == TRUE)|| (Orlan_RangerHelpZimmer == TRUE))
	{
		return FALSE;
	};
	//ADDON<
	
	// GEFRUDEL wegen kein Labern nach Kampf!
	
	if (Orlan_AngriffWegenMiete == TRUE)
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE)
	{	
		// ------ keine Miete, wenn Kampf verloren ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		
		// ------ wenn gewonnen, Gold genommen --> Miete in 7 Tagen ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	
	// CONDITION
	
	if (Orlan_SCGotHotelZimmer == TRUE)
	&& (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay()-7))
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Orlan_MieteFaellig_Info ()
{
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_00"); //(úlisnę) Jsem potęšen tvou ctihodnou návštęvou. Zůstaŕ tu tak dlouho, jak budeš chtít. Je to pro mę čest.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_01"); //Kdy konečnę dostanu nájem?
	
		Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "Zapomeŕ na to, už ti nedám ani zlámanou grešli.", DIA_Orlan_MieteFaellig_nein );
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "Tady je tvých 50 zlatých.", DIA_Orlan_MieteFaellig_ja );
	};
};

var int DIA_Orlan_MieteFaellig_OneTime;
func void DIA_Orlan_MieteFaellig_ja ()
{
		AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_00"); //Tady je tvých 50 zlatých.
	
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_01"); //Fajn, už bylo načase.

			if (DIA_Orlan_MieteFaellig_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_02"); //Kde ses celý den toulal?
				AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_03"); //Do toho ti nic není.
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_04"); //Mmh. Dobrá, stejnę to není moje vęc.
				DIA_Orlan_MieteFaellig_OneTime = TRUE;
			};
			
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_05"); //Hele, pokoušíš se mę podvést? Nemáš dost penęz ani na to, abys zaplatil tohle jídlo. Já ti ukážu, ty, ty...
			AI_StopProcessInfos (self);
			B_Attack (self, other, AR_NONE, 1);
		};
};

func void DIA_Orlan_MieteFaellig_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_MieteFaellig_nein_15_00"); //Zapomeŕ na to. Už ti nezaplatím.
	AI_Output			(self, other, "DIA_Orlan_MieteFaellig_nein_05_01"); //Fajn, já ti ukážu, ty mizernej podvodníku.
	Orlan_AngriffWegenMiete = TRUE;
	
	Info_ClearChoices	(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info WettkampfLaeuft
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WETTKAMPFLAEUFT		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	7;
	condition	 = 	DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information	 = 	DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important	 = 	TRUE;
	 
};

func int DIA_Orlan_WETTKAMPFLAEUFT_Condition ()
{
	if 	(
		(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
		&& (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay()-2))
		)
			{
					return TRUE;
			};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info ()
{
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_00"); //Tak pâece ses ukázal. Čekal jsem na tebe.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_01"); //Co se stalo?
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_02"); //Soutęž v pití skončila.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_03"); //Kdo vyhrál?
	
			if 	(
				((Mob_HasItems	("CHEST_RUKHAR", ItFo_Booze)) == FALSE)
				&& ((Mob_HasItems	("CHEST_RUKHAR", ItFo_Water)) == TRUE)
				)
					{
						AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_04"); //Tentokrát Randolph. Rukhar musel mít špatnej den.
					}
				else
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_05"); //Rukhar to už zase Randolphovi nandal. To se dalo jen očekávat.
					Rukhar_Won_Wettkampf = TRUE;
				};
			
			if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_06"); //Tak dobrá, doufám, že to bylo naposledy. O takovéhle pozdvižení ve svém lokále nestojím, zapište si to všichni za uši.
				};
			
			B_GivePlayerXP (XP_Rukhar_WettkampfVorbei);	

			AI_StopProcessInfos (self);
		
			Npc_ExchangeRoutine	(self,"Začít"); 
			B_StartotherRoutine	(Randolph,"Začít");

			if (Hlp_IsValidNpc (Rukhar))
				{
				 if (Rukhar_Won_Wettkampf == TRUE)
				 	{
						B_StartotherRoutine (Rukhar,"WettkampfRukharWon");
					}
					else
					{
						B_StartotherRoutine (Rukhar,"WettkampfRukharLost");
					};
				};		
			
			MIS_Rukhar_Wettkampf = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Eingebrockt
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_EINGEBROCKT		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	8;
	condition	 = 	DIA_Orlan_EINGEBROCKT_Condition;
	information	 = 	DIA_Orlan_EINGEBROCKT_Info;
	important	 = 	TRUE;
};

func int DIA_Orlan_EINGEBROCKT_Condition ()
{
	if 	(
		(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
		&& (MIS_Rukhar_Wettkampf == LOG_RUNNING)
		)
			{
					return TRUE;
			};
};

func void DIA_Orlan_EINGEBROCKT_Info ()
{
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_00"); //Tos mę dostal do pękné kaše. Teë abych Rukharovi ještę nalil.
			AI_Output	(other, self, "DIA_Orlan_EINGEBROCKT_15_01"); //Proč?
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_02"); //Dokud si tady poâádá ty své soutęže, je lepší, aby se o tom nikdo z venku nedozvędęl. Není to dobré pro obchod, jasný?
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Perm		(C_INFO)
{
	npc			 = 	BAU_970_Orlan;
	nr			 = 	99;
	condition	 = 	DIA_Orlan_Perm_Condition;
	information	 = 	DIA_Orlan_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co tvá hospoda? Jak to jde?";
};

func int DIA_Orlan_Perm_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		{
				return TRUE;
		};
};

func void DIA_Orlan_Perm_Info ()
{
	AI_Output (other, self, "DIA_Orlan_Perm_15_00"); //Jak to jde s hospodou?
	
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_01"); //Už to bylo lepší, však víš.
		AI_Output (self, other, "DIA_Orlan_Perm_05_02"); //Lidé už nesahají do svých męšců tak ochotnę, jak by męli.
	}
	else if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_03"); //Snad ty černý mágové brzy odtáhnou, jinak můžu hospodu zavâít.
		AI_Output (self, other, "DIA_Orlan_Perm_05_04"); //Už se skoro nikdo neodváží zajít až sem.
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Orlan_Minenanteil (C_INFO)
{
	npc			= BAU_970_Orlan;
	nr			= 3;
	condition	= DIA_Orlan_Minenanteil_Condition;
	information	= DIA_Orlan_Minenanteil_Info;

	description = "Prodáváš důlní akcie?";
};   
                    
FUNC INT DIA_Orlan_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Orlan_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Orlan_Minenanteil_15_00"); //Prodáváš důlní akcie?
	AI_Output (self, other, "DIA_Orlan_Minenanteil_05_01"); //Jasnę. Ode mę dostaneš všechno, tedy pokud na to máš.
	B_GivePlayerXP (XP_Ambient);
};	

 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Orlan_PICKPOCKET (C_INFO)
{
	npc			= BAU_970_Orlan;
	nr			= 900;
	condition	= DIA_Orlan_PICKPOCKET_Condition;
	information	= DIA_Orlan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Orlan_PICKPOCKET_Condition()
{
	C_Beklauen (89, 260);
};
 
FUNC VOID DIA_Orlan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Orlan_PICKPOCKET);
	Info_AddChoice		(DIA_Orlan_PICKPOCKET, DIALOG_BACK 		,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Orlan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Orlan_PICKPOCKET);
};
	
func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Orlan_PICKPOCKET);
};








			


























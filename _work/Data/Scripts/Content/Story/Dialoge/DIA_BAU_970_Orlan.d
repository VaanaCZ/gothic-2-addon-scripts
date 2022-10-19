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
	description	 = 	"Przynoszê wino z klasztoru.";
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
	AI_Output (other, self, "DIA_Orlan_Wein_15_00"); //Przynoszê wino z klasztoru.
	AI_Output (self, other, "DIA_Orlan_Wein_05_01"); //Doskonale, w³aœnie na nie czeka³em.
	AI_Output (self, other, "DIA_Orlan_Wein_05_02"); //Ustali³em ju¿ cenê z Mistrzem Goraxem. Zap³acê ci od rêki 100 sztuk z³ota.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	
	Info_AddChoice (DIA_Orlan_Wein,"W porz¹dku, daj to z³oto.",DIA_Orlan_Wein_JA);
	Info_AddChoice (DIA_Orlan_Wein,"Myœlisz, ¿e trafi³eœ na idiotê?",DIA_Orlan_Wein_NEIN);
};
FUNC VOID DIA_Orlan_Wein_JA()
{
	AI_Output (other, self, "DIA_Orlan_Wein_JA_15_00"); //W porz¹dku, daj to z³oto.
	AI_Output (self, other, "DIA_Orlan_Wein_JA_05_01"); //Oto ono. Interesy z tob¹ to prawdziwa przyjemnoœæ.
	
	B_GiveInvItems (self, other, ItmI_Gold, 100);
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_NEIN()
{
	AI_Output (other, self, "DIA_Orlan_Wein_NEIN_15_00"); //Myœlisz, ¿e trafi³eœ na idiotê? Cena wynosi 240 sztuk z³ota.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_01"); //Widzê, ¿e Gorax ostrzeg³ ciê przede mn¹, co? Dobra, pos³uchaj, mo¿e ubilibyœmy ma³y interesik. Zap³acê ci 100 sztuk z³ota za wino.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_02"); //Ty powiesz Goraxowi, ¿e ciê oszuka³em, a ja dam ci CZTERY magiczne zwoje.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	Info_AddChoice (DIA_Orlan_Wein,"Hej, po prostu dawaj 240 sztuk z³ota!",DIA_Orlan_Wein_Nie);
	Info_AddChoice (DIA_Orlan_Wein,"Brzmi nieŸle. Daj mi te magiczne zwoje.",DIA_Orlan_Wein_Okay);
	Info_AddChoice (DIA_Orlan_Wein,"Co to za zwoje?",DIA_Orlan_Wein_Was);
};
FUNC VOID DIA_Orlan_Wein_Nie()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Nie_15_00"); //Hej, po prostu dawaj 240 sztuk z³ota!
	AI_Output (self, other, "DIA_Orlan_Wein_Nie_05_01"); //Nie interesuje ciê wspó³praca, hê? Niech bêdzie, oto twoje z³oto.
	
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
	
	AI_Output (other, self, "DIA_Orlan_Wein_Okay_15_00"); //Brzmi nieŸle. Daj mi te magiczne zwoje.
	AI_Output (self, other, "DIA_Orlan_Wein_Okay_05_01"); //Oto zwoje i z³oto.
	
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	
	CreateInvItems  (hero,ITSC_Light,2);
	CreateInvItems  (hero,ItSc_LightHeal,1);
	CreateInvItems  (hero,ItSc_SumGobSkel,1);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_Was()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Was_15_00"); //Co to za zwoje?
	AI_Output (self, other, "DIA_Orlan_Wein_Was_05_01"); //Nie mam pojêcia. Jeden z goœci po prostu... po prostu je tutaj zostawi³, taak.
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

	description	 = 	"Kim jesteœ?";
};

func int DIA_Orlan_WERBISTDU_Condition ()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_WERBISTDU_15_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_01"); //Mam na imiê Orlan, jestem w³aœcicielem tej mi³ej gospody.
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_02"); //Czego ci potrzeba, wêdrowcze? Szukasz mo¿e miecza albo przyzwoitej zbroi?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_03"); //Jakiejœ odmiany po rozmowach z tymi wiejskimi sztywniakami, a mo¿e po prostu informacji?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_04"); //Jeœli siêgniesz po sakiewkê, dam ci to, a mo¿e i wiêcej.

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

	description	 = 	"Znasz goœcia z zas³oniêtym okiem?";
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
	AI_Output	(other, self, "DIA_Addon_Orlan_Greg_15_00"); //Znasz goœcia z zas³oniêtym okiem?
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_01"); //Widzia³em go ju¿ kiedyœ. Twardziel.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_02"); //Wynajmowa³ kiedyœ u mnie pokój przez jakiœ czas. Mia³ ze sob¹ olbrzymi kufer...
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_03"); //Gdybym go ci¹gle nie mêczy³, pewnie w ogóle by mi za ten pokój nie p³aci³. I tak specjalnie siê z tym nie spieszy³.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_04"); //A pewnego dnia nagle znikn¹³ razem ze swoim kufrem. Nie chcê mieæ nic wspólnego z takimi jak on.
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

	description	 = 	"Hmm... Odnoszê wra¿enie, ¿e gapisz siê na mój pierœcieñ.";
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
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_15_00"); //Hmm... Odnoszê wra¿enie, ¿e gapisz siê na mój pierœcieñ.
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_05_01"); //Nie wiem do koñca, co o nim s¹dziæ.

	Orlan_KnowsSCAsRanger = TRUE;

	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "Stary! Ale jazda! Nale¿ê do Wodnego Krêgu!", DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "To akwamaryn. Znasz ten kamieñ?", DIA_Addon_Orlan_Ranger_Aqua);
};
func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Aqua_15_00"); //To akwamaryn. Znasz ten kamieñ?
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_01"); //Owszem. Witaj w kwaterze g³ównej, bracie pierœcienia.
	if (Npc_KnowsInfo (other, DIA_Addon_Orlan_NoMeeting)) //verrissen
	{
		AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_02"); //...choæ inteligencj¹, jak siê wydaje, nie grzeszysz.
	};
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_03"); //Czym mogê s³u¿yæ?
	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP (XP_Ambient);
};
func void DIA_Addon_Orlan_Ranger_Idiot ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Lares_15_00"); //Stary! Ale jazda! Nale¿ê do Wodnego Krêgu!
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_01"); //Rozumiem. Taaaak... Ale sobie znaleŸli os³a...
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_02"); //Czego chcesz?
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

	description	= "Zdarzy³o ci siê kiedyœ korzystaæ z kamienia teleportacyjnego?";
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
	AI_Output	(other, self, "DIA_Addon_Orlan_Teleportstein_15_00"); //Zdarzy³o ci siê kiedyœ korzystaæ z kamienia teleportacyjnego?
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_01"); //A tobie zamieniæ z kretynem na mózgi?! Dopóki Mag Wody nie powie, ¿e to ustrojstwo jest niegroŸne, nawet siê do niego nie zbli¿ê!
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_02"); //Przydzielono mnie do pilnowania jednego z takich kamieni - to mi w zupe³noœci wystarczy.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "Mo¿na rzuciæ okiem na ten kamieñ teleportacyjny?", DIA_Addon_Orlan_Teleportstein_sehen );
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "Gdzie znajdê kamieñ teleportacyjny?", DIA_Addon_Orlan_Teleportstein_wo );
};
func void DIA_Addon_Orlan_Teleportstein_sehen ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_sehen_15_00"); //Mo¿na rzuciæ okiem na ten kamieñ teleportacyjny?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_sehen_05_01"); //Jasne, a co mi tam... Masz, oto klucz. Wejœcie zabarykadowa³em.
	CreateInvItems (self, ITKE_ORLAN_TELEPORTSTATION, 1);									
	B_GiveInvItems (self, other, ITKE_ORLAN_TELEPORTSTATION, 1);
	
	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Orlan ukry³ kamieñ teleportacyjny w jaskini, na po³udniowy zachód od swojej gospody."); 
};

func void DIA_Addon_Orlan_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_wo_15_00"); //Gdzie znajdê kamieñ teleportacyjny?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_wo_05_01"); //Niedaleko na po³udnie od mojej gospody znajduje siê jaskinia, w której Magowie Wody odnaleŸli taki kamieñ.
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

	description	= "Mam tu wst¹piæ do Wodnego Krêgu!";
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
	AI_Output (other, self, "DIA_Addon_Orlan_NoMeeting_15_00"); //Mam tu wst¹piæ do Wodnego Krêgu!
	AI_Output (self, other, "DIA_Addon_Orlan_NoMeeting_05_01"); //Nie widzê u ciebie ¿adnego pierœcienia. Napijesz siê czegoœ?
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

	description	 = 	"Chodz¹ s³uchy o spotkaniu Krêgu w twojej gospodzie.";
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
	AI_Output	(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_15_00"); //Chodz¹ s³uchy o spotkaniu Krêgu w twojej gospodzie.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_01"); //Zgadza siê... Powinno siê ju¿ by³o zacz¹æ.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_02"); //Ciekawi mnie, co ich wstrzymuje.

	B_GivePlayerXP (XP_Ambient);
	B_Addon_Orlan_RangersReadyForcoming ();
	self.flags = 0;

	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "Z pewnoœci¹ wkrótce siê pojawi¹.", DIA_Addon_Orlan_WhenRangerMeeting_theyCome );
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "Spotkanie zaplanowano na dziœ?", DIA_Addon_Orlan_WhenRangerMeeting_Today );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_Today ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00"); //Spotkanie zaplanowano na dziœ?
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01"); //O ile dobrze pamiêtam...
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02"); //Mam nadziejê, ¿e nie przeci¹gnie siê jak zwykle.
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(DALEJ)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00"); //Z pewnoœci¹ wkrótce siê pojawi¹.
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01"); //Zobaczymy...
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(DALEJ)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
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

	description	 = 	"Jakie zbroje mo¿esz mi zaoferowaæ?";
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
	AI_Output			(other, self, "DIA_Orlan_RUESTUNG_15_00"); //Jakie zbroje mo¿esz mi zaoferowaæ?
	AI_Output			(self, other, "DIA_Orlan_RUESTUNG_05_01"); //Mam tu jedn¹, która na pewno ci siê spodoba.

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);

	Info_AddChoice			(DIA_Orlan_RUESTUNG, DIALOG_BACK	,	DIA_Orlan_RUESTUNG_BACK);	
	Info_AddChoice			(DIA_Orlan_RUESTUNG, "Skórzany pancerz. Ochrona: broñ 25, strza³y 20, ogieñ 5. (250 sztuk z³ota)" , DIA_Orlan_RUESTUNG_Buy);	
};  

func void DIA_Orlan_RUESTUNG_Buy ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_Buy_15_00"); //Kupiê ten skórzany pancerz.

	if (B_GiveInvItems		(other, self, ItMi_Gold, VALUE_ITAR_Leather_L))
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_01"); //M¹dra decyzja.

			CreateInvItems 		(self, ItAr_Leather_L, 1);
			B_GiveInvItems		(self, other, ItAr_Leather_L, 1);
			AI_EquipBestArmor	(other);
			DIA_Orlan_RUESTUNG_noPerm = TRUE;
		}
	else
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_02"); //Przykro mi. Dopóki nie masz czym zap³aciæ, z interesu nici.
		};

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_BACK_15_00"); //Pomyœlê o tym.
	AI_Output				(self, other,"DIA_Orlan_RUESTUNG_BACK_05_01"); //Jak chcesz. Ale nie zastanawiaj siê zbyt d³ugo.

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

	description	 = 	"Poka¿ mi swoje towary.";
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
	AI_Output			(other, self, "DIA_Orlan_TRADE_15_00"); //Poka¿ mi swoje towary.
	B_GiveTradeInv (self);
	
		//ADDON>
		if ((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE)||(SCIsWearingRangerRing == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_TRADE_05_00"); //Oczywiœcie, bracie pierœcienia.
				Orlan_KnowsSCAsRanger = TRUE;
			}
		//ADDON<
		else if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_01"); //Oczywiœcie. To dla mnie zaszczyt, goœciæ tu kogoœ takiego.
			}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_02"); //Oczywiœcie, Panie.
			}
		else
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_03"); //Jeœli mo¿esz zap³aciæ.
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

	description	 = 	"Ile bierzesz za pokój?";
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
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_15_00"); //Ile bierzesz za pokój?
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)|| (SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
		{
			//ADDON>
			if ((SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_HotelZimmer_05_00"); //Dla brata pierœcienia? Zupe³nie nic.
				Orlan_RangerHelpZimmer = TRUE;
				Orlan_KnowsSCAsRanger = TRUE;
			}
			//ADDON<
			else if (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_01"); //Dla rycerzy Króla zawsze znajdzie siê jakiœ pokój, oczywiœcie za darmo.
			}
			else
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_02"); //Nie œmia³bym wzi¹æ op³aty za pokój od ziemskiego przedstawiciela Innosa.
			};
			
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_03"); //Oto klucz od pokoi na piêtrze. Wybierz, który zechcesz.
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmer = TRUE;
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_04"); //Jeœli zap³acisz 50 sztuk z³ota, bêdziesz móg³ mieszkaæ w wybranym pokoju przez nastêpny tydzieñ.
		
			Info_ClearChoices	(DIA_Orlan_HotelZimmer);
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "Drogie to jak cholera...", DIA_Orlan_HotelZimmer_nein );
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "W porz¹dku, oto pieni¹dze.", DIA_Orlan_HotelZimmer_ja );
		};	
};
func void DIA_Orlan_HotelZimmer_ja ()
{
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(other, self, "DIA_Orlan_HotelZimmer_ja_15_00"); //W porz¹dku, oto pieni¹dze.
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_01"); //Oto klucz. Pokoje s¹ na piêtrze, tylko pamiêtaj - staraj siê wszystkiego nie zapaskudziæ i p³aæ regularnie czynsz.
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Orlan_SCGotHotelZimmer = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_02"); //Nie masz 50 sztuk z³ota. Najpierw pieni¹dze, potem przyjemnoœæ.
		};
	Info_ClearChoices	(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_nein_15_00"); //Cholernie drogo.
	AI_Output			(self, other, "DIA_Orlan_HotelZimmer_nein_05_01"); //W takim razie, przyjacielu, poszukaj gdzie indziej.
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
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_00"); //Twa wizyta bardzo mnie raduje, proszê, zostañ, jak d³ugo zechcesz.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_01"); //Kiedy w koñcu dostanê mój czynsz?
	
		Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "Daruj sobie. Nie dostaniesz nic wiêcej.", DIA_Orlan_MieteFaellig_nein );
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "Oto twoje 50 sztuk z³ota.", DIA_Orlan_MieteFaellig_ja );
	};
};

var int DIA_Orlan_MieteFaellig_OneTime;
func void DIA_Orlan_MieteFaellig_ja ()
{
		AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_00"); //Oto twoje 50 sztuk z³ota.
	
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_01"); //Ach... Czas najwy¿szy.

			if (DIA_Orlan_MieteFaellig_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_02"); //Gdzie¿ ty siê podziewasz ca³ymi dniami?
				AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_03"); //Nie chcesz wiedzieæ.
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_04"); //Mmh. Có¿, to nie moja sprawa.
				DIA_Orlan_MieteFaellig_OneTime = TRUE;
			};
			
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_05"); //S³uchaj no, próbujesz zrobiæ ze mnie idiotê? Nie staæ ciê nawet, ¿eby zap³aciæ za jedzenie. Ju¿ ja ci poka¿ê ty, ty...
			AI_StopProcessInfos (self);
			B_Attack (self, other, AR_NONE, 1);
		};
};

func void DIA_Orlan_MieteFaellig_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_MieteFaellig_nein_15_00"); //Daruj sobie. Ju¿ nic wiêcej nie dostaniesz.
	AI_Output			(self, other, "DIA_Orlan_MieteFaellig_nein_05_01"); //Ju¿ ja ciê nauczê, ty ¿a³osny oszuœcie.
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
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_00"); //No, jesteœ nareszcie. Czeka³em na ciebie.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_01"); //Co siê sta³o?
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_02"); //Konkurs picia w³aœnie siê zakoñczy³.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_03"); //Kto wygra³?
	
			if 	(
				((Mob_HasItems	("CHEST_RUKHAR", ItFo_Booze)) == FALSE)
				&& ((Mob_HasItems	("CHEST_RUKHAR", ItFo_Water)) == TRUE)
				)
					{
						AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_04"); //Tym razem zwyciê¿y³ Randolph. Rukhar chyba mia³ z³y dzieñ.
					}
				else
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_05"); //Rukhar po raz kolejny nie da³ Randolphowi szans. Mo¿na siê by³o tego spodziewaæ.
					Rukhar_Won_Wettkampf = TRUE;
				};
			
			if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_06"); //Mam nadziejê, ¿e to ju¿ ostatni raz. Nie chcê tu wiêcej takich podejrzanych zabaw.
				};
			
			B_GivePlayerXP (XP_Rukhar_WettkampfVorbei);	

			AI_StopProcessInfos (self);
		
			Npc_ExchangeRoutine	(self,"Start"); 
			B_StartotherRoutine	(Randolph,"Start");

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
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_00"); //NieŸleœ mnie urz¹dzi³. Bêdê musia³ dalej uwa¿aæ na Rukhara.
			AI_Output	(other, self, "DIA_Orlan_EINGEBROCKT_15_01"); //Jak to?
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_02"); //Lepiej, ¿eby nikt siê nie dowiedzia³ o jego ma³ym konkursie. To Ÿle wp³ywa na interesy.
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
	description	 = 	"Jak id¹ interesy?";
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
	AI_Output (other, self, "DIA_Orlan_Perm_15_00"); //Jak id¹ interesy?
	
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_01"); //Wiesz, bywa³o lepiej.
		AI_Output (self, other, "DIA_Orlan_Perm_05_02"); //Ludzie niezbyt ochoczo wydaj¹ teraz pieni¹dze.
	}
	else if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_03"); //Mam nadziejê, ¿e czarni magowie wkrótce siê st¹d wynios¹, inaczej bêdê musia³ zamkn¹æ gospodê.
		AI_Output (self, other, "DIA_Orlan_Perm_05_04"); //Ludzie boj¹ siê tu przychodziæ.
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

	description = "Sprzedajesz udzia³y w kopalni?";
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
	AI_Output (other, self, "DIA_Orlan_Minenanteil_15_00"); //Sprzedajesz udzia³y w kopalni?
	AI_Output (self, other, "DIA_Orlan_Minenanteil_05_01"); //Jasne. U mnie dostaniesz wszystko, czego dusza zapragnie.
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








			


























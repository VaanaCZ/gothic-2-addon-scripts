// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "Wyruszê w drogê najszybciej, jak siê tylko da!";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Wyruszê w drogê najszybciej, jak siê da!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Œwietnie! I jeszcze coœ: nie zdradŸ nikomu, ¿e ze mn¹ rozmawia³eœ. A ju¿ w ¿adnym wypadku nie mów o tym ¿adnemu magowi.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Odk¹d obra³em w³asn¹ œcie¿kê, Kr¹g Ognia ma mnie za zmar³ego, i niech tak pozostanie.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: muß auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Aha! Jesteœ ju¿. A ja straci³em nadziejê, ¿e siê jeszcze kiedyœ spotkamy.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //Czujê siê... Czujê siê, jakbym kilka tygodni le¿a³ pod stert¹ g³azów.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //Hmm... Dok³adnie tak by³o. ¯ycie zawdziêczasz tylko i wy³¹cznie swemu magicznemu pancerzowi. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //Ba³em siê, ¿e nie zdo³am ciê wydostaæ z ruin œwi¹tyni...
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Ale doœæ ju¿ o tym.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Musimy zaj¹æ siê nowym niebezpieczeñstwem gro¿¹cym tej okolicy.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Mamy na to wystarczaj¹co du¿o czasu. Œni¹cy zosta³ wygnany.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "O jakim NOWYM zagro¿eniu mówisz?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Musisz siê z nimi sprzymierzyæ! Tylko w ten sposób zdo³amy powstrzymaæ Beliara!
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Mam na to wystarczaj¹co du¿o czasu. W koñcu zwyciê¿y³em! Œni¹cy zosta³...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //...wygnany z naszego œwiata. Przepêdzi³eœ go, to prawda, ale powstrzymanie nadci¹gaj¹cej wojny nie le¿y ju¿ w naszej mocy.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Swym ostatnim krzykiem rozpaczy Œni¹cy przywo³a³ potê¿n¹ armiê z³a.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //By³ to wyraŸny rozkaz dla wszystkich istot ciemnoœci. Potê¿ne s³owo magii, któremu nie mog³y odmówiæ.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Jego ostatni rozkaz brzmia³ 'PRZYBYWAJCIE'. I przyby³y wszystkie... nawet smoki.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //Smoki!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Tak, nawet te potê¿ne, prastare istoty. Wyczuwam ich obecnoœæ tak¿e tutaj.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Smoki zebra³y wokó³ siebie liczn¹ armiê s³u¿¹cych im istot.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Gdzie jest teraz ta armia?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Zaleg³a obozem ca³kiem blisko st¹d, w Górniczej Dolinie, niedaleko Khorinis. Teraz przygotowuje siê do ostatecznego ataku.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //Zosta³o nam niewiele czasu.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Ale to nie wszystko... Niedawno dosz³y mnie s³uchy o jeszcze innym zagro¿eniu.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "O jakim INNYM zagro¿eniu mówisz?", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Zatem wynoœmy siê st¹d czym prêdzej!";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Zatem wynoœmy siê st¹d czym prêdzej!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Jeœli nawet zdo³amy teraz uciec, smoki w koñcu nas odnajd¹.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //Ale z pomoc¹ tutejszych ¿o³nierzy i magów, mo¿emy je jeszcze powstrzymaæ, nim zbytnio urosn¹ w si³ê.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Lepszej szansy chyba ju¿ nie dostaniemy.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Co mo¿emy zrobiæ?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Co mo¿emy zrobiæ?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Tym razem sami sobie nie poradzimy. W walce ze smokami mo¿e nam pomóc tylko moc Innosa.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //W pobliskim mieœcie Khorinis stacjonuje oddzia³ paladynów.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //W ich posiadaniu znajduje siê pewien potê¿ny artefakt, dziêki któremu mo¿emy pokonaæ paskudne gady.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //Nazywaj¹ go 'Okiem Innosa'. Musisz koniecznie zdobyæ to Oko.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Ostrze¿ paladynów o smokach i za wszelk¹ cenê przekonaj ich dowódcê, by nam pomóg³.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //Gdy tylko z nim porozmawiasz, musisz odszukaæ artefakt Beliara.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //To odpowiednik Oka Innosa - nie wolno dopuœciæ, aby wpad³ w rêce s³ug z³a.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"W mieœcie Khorinis przebywa grupa paladynów. Maj¹ ze sob¹ potê¿ny artefakt, Oko Innosa, którego moc pomo¿e nam pokonaæ smoki. Muszê tylko przekonaæ paladynów, aby wsparli nasz¹ sprawê."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"Co mi mo¿esz powiedzieæ o tej kamiennej tablicy?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //Co mi mo¿esz powiedzieæ o tej kamiennej tablicy?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //S¹dzi³em, ¿e to jakiœ magiczny artefakt. Okaza³o siê jednak, ¿e jej znaczenie jest znacznie mniejsze.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Nie uda³o mi siê do koñca rozszyfrowaæ wyrytych na niej znaków, ale wydaj¹ siê one przekazywaæ historiê prastarej kultury.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //WeŸ j¹, jeœli chcesz, do niczego mi siê nie przyda.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "Mag wody odkry³ portal prowadz¹cy do nieznanej dot¹d czêœci wyspy.";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Mag Wody odkry³ portal prowadz¹cy do nieznanej dot¹d czêœci wyspy.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //To ciekawe...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Zg³oœ siê do mnie, gdy tylko znajdziesz cokolwiek, co mo¿e nam naprawdê pomóc.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //Mo¿e ukryto tam artefakt Beliara? Odszukaj go!
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "Co do niezbadanej dot¹d czêœci wyspy...";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //Co do niezbadanej dot¹d czêœci wyspy...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Nie mêcz mnie zbêdnymi szczegó³ami. Wróæ, gdy bêdziesz mieæ coœ przydatnego.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "Przeszuka³em nieznan¹ czêœæ wyspy.";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //Przeszuka³em nieznan¹ czêœæ wyspy.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //Z jakim rezultatem?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Wszystko wydaje siê obracaæ wokó³ potê¿nego artefaktu znanego jako Szpon Beliara.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //Szpon Beliara? Gdzie on jest? Masz go przy sobie?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Owszem.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //To bardzo ciekawe...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Ta broñ mo¿e siê nam bardzo przydaæ, jest jednak równie¿ niezwykle niebezpieczna.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Zachowaj ostro¿noœæ i pod ¿adnym pozorem jej nie zgub!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Nie, ju¿ nie.
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Przekaza³em go Magom Wody, aby wrzucili go do morza.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //Oszala³eœ?! Wiesz chocia¿, czego siê pozby³eœ lekk¹ rêk¹?!
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Ta broñ mog³a siê nam ogromnie przys³u¿yæ!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //S¹dzê, ¿e tak bêdzie lepiej.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //Niezbadane s¹ wyroki bogów...
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Potrzebujê broni.";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Potrzebujê broni.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Mogê ci daæ tylko to, co znajdziesz w mojej wie¿y.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Rozejrzyj siê tu trochê. Cokolwiek uznasz za przydatne, nale¿y do ciebie.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Czym dok³adnie jest 'Oko Innosa'?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Czym dok³adnie jest 'Oko Innosa'?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //To magiczny amulet. Legenda g³osi, ¿e sam Innos wla³ weñ czêœæ swojej boskiej mocy.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Dziêki niemu odzyskasz czêœæ dawnych si³ i bêdziesz móg³ stawiæ czo³a smokom.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Oko ma te¿ inne, tajemnicze w³aœciwoœci, ale o nich opowiem ci, gdy ju¿ zdobêdziesz amulet.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Dlaczego paladyni mieliby mi daæ Oko Innosa?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Dlaczego paladyni mieliby mi daæ Oko Innosa?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Bo twoim przeznaczeniem jest nosiæ ten amulet.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Sk¹d ta pewnoœæ?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Jest kilka przes³anek. Najwa¿niejsz¹ z nich jest fakt, ¿e pokona³eœ Œni¹cego. Gdybyœ nie by³ ulubieñcem bogów, ju¿ dawno byœ nie ¿y³.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Za³ó¿my, ¿e masz racjê i rzeczywiœcie pisane mi jest posiadanie Oka Innosa. Jak mam o tym przekonaæ paladynów?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //Oko Innosa samo wybiera swojego posiadacza. Jeœli uda ci siê je zdobyæ i za³o¿yæ, paladyni bêd¹ musieli uznaæ prawdziwoœæ twoich s³ów.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Jak siê dostaæ do miasta?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Jak siê dostaæ do miasta?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //IdŸ po prostu w dó³ œcie¿ki prowadz¹cej od drzwi mojej wie¿y. Miasto jest du¿e, z pewnoœci¹ je zauwa¿ysz.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Tylko uwa¿aj! Droga do miasta naje¿ona jest niebezpieczeñstwami, a ty nie jesteœ tak silny jak kiedyœ.
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"Gdzie my w ogóle jesteœmy?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //Gdzie my w ogóle jesteœmy?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //Mówi³em ci ju¿ - niedaleko miasta Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Odbudowa³em tutaj moj¹ wie¿ê.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Przecie¿ nie min¹³ miesi¹c, odk¹d widzieliœmy siê w Górniczej Dolinie!
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //S³udzy, których wezwa³em do budowy mojej wie¿y, uwinêli siê bardzo sprawnie...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Trudno zaprzeczyæ.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Gdzie mogê znaleŸæ lepsze wyposa¿enie?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Gdzie mogê znaleŸæ lepsze wyposa¿enie?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //Jeœli chcesz kupiæ broñ i pancerz, musisz pewnie udaæ siê do Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Ale w dolinie znajdziesz lecznicze zio³a, które przywróc¹ ci si³y utracone w walce.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Wybierz siê te¿ nad jezioro, tu¿ przed moj¹ wie¿¹. Znajdziesz tam ukryte przejœcie do doliny.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"Rozmawia³eœ ju¿ z Lesterem?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Rozmawia³eœ ju¿ z Lesterem?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Tak, zasypa³em go pytaniami. Du¿o siê od niego dowiedzia³em. Jest teraz kompletnie wyczerpany.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //To prawdziwy cud, ¿e w ogóle prze¿y³ tê ucieczkê. Kaza³em mu trochê odpocz¹æ.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Czego siê od niego dowiedzia³eœ?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Niestety, niczego dobrego. Nie doœæ, ¿e widzia³ smoka, to spotka³ te¿ ludzi w czarnych kapturach.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //To takie wa¿ne?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Jeœli ci ludzie rzeczywiœcie istniej¹, bêd¹ dla nas powa¿nym zagro¿eniem.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //Niepokoi mnie to. Proszê, weŸ mój pierœcieñ. Bêdzie ciê chroni³ przed magi¹.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"By³em w mieœcie...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //By³em w mieœcie...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //Uda³o ci siê porozmawiaæ z przywódc¹ paladynów?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Nie. Nie chc¹ mnie dopuœciæ przed jego oblicze...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //G³upcy! Musi byæ jakiœ sposób, byœ do niego dotar³.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Gdyby nie by³o innego wyjœcia, dostañ siê do klasztoru i zostañ magiem.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Mo¿e to trochê moralnie dwuznaczne, ale przynajmniej osi¹gniesz swój cel.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Gdybyœ by³ magiem, przywódca paladynów musia³by siê z tob¹ spotkaæ.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wiêc co mam teraz robiæ?";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Wiêc co mam teraz robiæ?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Postêpujmy dalej zgodnie z planem. Chwilowo nie widzê innej drogi.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Postaraj siê zdobyæ Oko Innosa. Ja w tym czasie poszukam odpowiedzi na moje pytania.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Dlaczego Kr¹g Ognia nie mo¿e siê o tobie dowiedzieæ?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Dlaczego Kr¹g Ognia nie mo¿e siê o tobie dowiedzieæ?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//Kiedyœ by³em wysoko w hierarchii krêgu. Jednak ju¿ wtedy podejrzewa³em, ¿e kluczem do Bariery jest magia demonów.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Oczywiœcie nigdy nie uda³o mi siê przekonaæ o tym pozosta³ych magów.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Dlatego opuœci³em Kr¹g i odda³em siê badaniu tajemnic mrocznych sztuk.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //To zbrodnia, której 'Bogobojni Wyznawcy Innosa', 'Dobrzy' i 'Cnotliwi' Magowie Ognia nigdy mi nie wybacz¹.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Zapewne wiedz¹, ¿e wci¹¿ ¿yjê, ale nie maj¹ pojêcia, gdzie mnie szukaæ. I niech tak pozostanie.
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"Wracam z Górniczej Doliny.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Wracam z Górniczej Doliny.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Najwy¿szy czas. Co tam widzia³eœ?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Mia³eœ racjê. W dolinie stacjonuje potê¿na armia nieprzyjaciela.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Orkowie oblegaj¹ zamek, a smoki pustosz¹ okoliczne tereny.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Jeœli siê nie mylê, wkrótce ca³a armia ruszy na Khorinis.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"Co siê tu do diab³a dzia³o pod moj¹ nieobecnoœæ?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester powiedzia³, ¿e chcesz siê ze mn¹ widzieæ.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Co siê tu do diab³a dzia³o pod moj¹ nieobecnoœæ?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //Nasz przeciwnik dowiedzia³ siê, kim jesteœ naprawdê, i ¿e zamierzasz zdobyæ Oko Innosa.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Zda³ sobie sprawê z zagro¿enia, wiêc postanowi³ wyjœæ z ukrycia i zaatakowaæ otwarcie.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Zabawa w chowanego ju¿ siê skoñczy³a. Jeszcze wczoraj nikt nie wiedzia³, z której strony nadejdzie cios. Dziœ nie ma co do tego ¿adnych w¹tpliwoœci.

	B_LogEntry (TOPIC_INNOSEYE, "Wróg dowiedzia³ siê, ¿e szukam Oka Innosa. Muszê je jak najszybciej znaleŸæ, zanim bêdzie za póŸno.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Zaatakowali mnie magowie w czarnych szatach.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Wreszcie uda³o mi siê zdobyæ dowód dla Lorda Hagena.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Zaatakowali mnie magowie w czarnych szatach.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //Wróg ma wiele twarzy. Poszukiwacze to w³aœnie jedna z nich. Ale oni tylko przygotowuj¹ teren na przybycie prawdziwego przeciwnika.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Zajêli ju¿ pozycje w strategicznych miejscach. Teraz czekaj¹ tylko na dogodn¹ okazjê, by zacisn¹æ pêtlê side³.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Trzymaj siê od nich z dala. To potê¿ne, magiczne istoty, które za wszelk¹ cenê spróbuj¹ ciê powstrzymaæ.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas wie o odzianych na czarno mê¿czyznach. Wygl¹da na to, ¿e tak naprawdê to Poszukiwacze poci¹gaj¹ za sznurki, i s¹ bardzo niebezpiecznymi przeciwnikami."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Znalaz³em wreszcie dowód, którego domaga³ siê Lord Hagen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //Co to za dowód?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //Otrzyma³em list od Garonda, dowódcy paladynów w Górniczej Dolinie. Prosi w nim o posi³ki.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //To powinno wystarczyæ, by przekonaæ Hagena. Dobra robota.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Co mam teraz robiæ?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Co mam teraz robiæ?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Zanieœ Hagenowi list od Garonda. Z takim dowodem w rêku zostaniesz dopuszczony do Oka Innosa.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Potem udaj siê do Pyrokara. To on da ci Oko.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Musisz koniecznie zabraæ ten artefakt w bezpieczne miejsce.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //IdŸ ju¿, zanim bêdzie za póŸno. Wróg te¿ spróbuje zdobyæ amulet dla siebie.
	B_LogEntry (TOPIC_INNOSEYE, "Oko znajduje siê w klasztorze Magów Ognia. Mam nadziejê, ¿e Lord Hagen pozwoli mi siê do niego dostaæ, kiedy dostarczê mu wiadomoœæ od Lorda Garonda. Mag Ognia Pyrokar nie dopuœci mnie w pobli¿e amuletu, jeœli nie bêdê mia³ poparcia Hagena.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"Oko Innosa zosta³o zniszczone.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //Oko Innosa zosta³o zniszczone.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Jak to mo¿liwe? Zniszczone?!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Znalaz³em je w pó³nocnych lasach. Niestety, uda³o mi siê odzyskaæ tylko kawa³ki.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //To by³a nasza jedyna szansa na pokonanie tych smoków! Wszystko stracone.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Co teraz?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Co teraz?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //To straszliwy cios. Nieprêdko siê po nim podniesiemy. Muszê przemyœleæ ca³¹ sprawê w spokoju.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //W miêdzyczasie powinieneœ udaæ siê do miasta i porozmawiaæ z Magiem Wody imieniem Vatras. Mo¿e on bêdzie wiedzia³, co wypada czyniæ dalej.

	B_LogEntry (TOPIC_INNOSEYE, "Xardas nie by³ zachwycony, kiedy dowiedzia³ siê, ¿e Oko Innosa zosta³o zniszczone. Jedyn¹ nasz¹ nadziej¹ jest Vatras, Mag Wody z miasta Khorinis.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"Vatras przys³a³ mnie do ciebie.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Vatras przys³a³ mnie do ciebie.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //To dobrze. Co ci powiedzia³?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Wspomnia³ coœ o rytuale odwrócenia, który nale¿y odprawiæ w S³onecznym Krêgu.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //Ten stary wyga! Chyba wiem, co planuje. Przybywasz, by przekazaæ mi jego zaproszenie?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //Na to wygl¹da. Kiedy wyruszysz?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Bezzw³ocznie. Ty musisz jeszcze wype³niæ swoje zadania. Potem znów siê spotkamy.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas zgodzi³ siê przyjœæ do S³onecznego Krêgu na rytua³.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Pomogê przy odprawianiu rytua³u, dopiero gdy bêdê mia³ pewnoœæ, ¿e jesteœ gotów stawiæ czo³a smokom.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"Dlaczego nie pójdziesz do Vatrasa od razu?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Dlaczego od razu nie pójdziesz do Vatrasa?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //Czasem ciê po prostu nie rozumiem.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //Nigdy nie zwracaj siê do mnie tym tonem! Gdyby nie JA, twoje szcz¹tki gni³yby teraz w œwi¹tyni Œni¹cego!

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Mniejsza z tym. Powiedz tylko, co mam zrobiæ.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Wiêc wyjaœnij mi chocia¿, dlaczego siê wahasz.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Wiêc wyjaœnij mi chocia¿, dlaczego siê wahasz.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Odk¹d opuœci³em Magów Ognia, stara³em siê trzymaæ od nich mo¿liwie daleko.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //I nie zamierzam tego zmieniaæ, tak d³ugo, jak to mo¿liwe.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Wiêc zanim znów stanê przed mymi dawnymi towarzyszami, chcê mieæ absolutn¹ pewnoœæ, ¿e nie robiê tego na darmo. Musisz byæ gotów do walki ze smokami!
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //Z takim wyposa¿eniem daleko jednak nie zajdziesz. Wróæ do mnie, gdy bêdziesz wystarczaj¹co silny.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Mniejsza z tym. Powiedz tylko, co mam zrobiæ.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Jesteœ jeszcze zbyt s³aby, by zmierzyæ siê ze smokiem.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Wróæ, gdy bêdziesz odpowiednio przygotowany. Wtedy udam siê na spotkanie z Vatrasem.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"Jestem gotów, by zmierzyæ siê ze smokami.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Jestem gotów, by zmierzyæ siê ze smokami.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //Zatem nie ma czasu do stracenia. Natychmiast wyruszam w drogê do S³onecznego Krêgu. Wype³nij swoje zadania. Spotkamy siê na miejscu.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas zgodzi³ siê przyjœæ do S³onecznego Krêgu na rytua³.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Czy ten rytua³ odwrócenia ma szansê siê powieœæ?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Czy ten rytua³ odwrócenia ma szansê siê powieœæ?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //Nie mo¿emy mieæ pewnoœci. Wszystko zale¿y od szczegó³ów planu Vatrasa.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"Pyrokar nie chce siê stawiæ na spotkanie.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar nie chce siê stawiæ na spotkanie.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Domaga siê dowodu, ¿e mo¿na ci zaufaæ.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //Czy¿by? Pyrokar, tak? To ciekawe.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Ten stary cap zaczyna mnie irytowaæ. Ale chyba mam tu coœ, co mo¿e go przekonaæ.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Opuszczaj¹c Zakon Magów Ognia, zabra³em ze sob¹ kilka drobiazgów.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Nie chcê, by oddzia³ paladynów i magów przetrz¹sn¹³ moj¹ wie¿ê i znalaz³ te rzeczy.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Dlatego ukry³em je w bezpiecznym miejscu, w którym magowie nigdy nie bêd¹ ich szukaæ.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //Gdzie dok³adnie?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Czêœæ z nich le¿y zamkniêta w skrzyni na farmie Sekoba.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Ufasz temu Sekobowi?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Nie, ale mo¿na go kupiæ, a wtedy nie zadaje niewygodnych pytañ. Poza tym - skrzynia jest zamkniêta. Oto klucz.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Znajdziesz tam miêdzy innymi pewn¹ star¹ ksiêgê. Gdy Pyrokar j¹ zobaczy, bêdzie wiedzia³, ¿e to prezent ode mnie.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Ja ju¿ nie bêdê mia³ z niej po¿ytku, wiêc przynajmniej tobie na coœ siê przyda.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas da³ mi klucz do kufra na farmie Sekoba. W œrodku znajdê ksi¹¿kê, któr¹ mam wrêczyæ Pyrokarowi.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Teraz, gdy Oko Innosa zosta³o naprawione, musisz stawiæ czo³a smokom.
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Wszystkie one s¹ s³ugami Beliara, boga ciemnoœci.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Ale bezpoœrednie rozkazy musz¹ otrzymywaæ z tego œwiata. Tyle uda³o mi siê do tej pory ustaliæ.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Dowiedz siê, co jest Ÿród³em ich potêgi.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Potem wracaj czym prêdzej do mnie.
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Start");
  	B_StartOtherRoutine	(Vatras,"Start");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Oko Innosa zosta³o naprawione. Co teraz?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //Oko Innosa zosta³o naprawione. Co teraz?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //Pamiêtaj, by zak³adaæ je za ka¿dym razem, gdy przyjdzie ci walczyæ ze smokiem.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Nie traæ czasu. ZejdŸ teraz do Górniczej Doliny i rozpraw siê ze smokami.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //IdŸ do Pyrokara. Niech ci wyjaœni, jak pos³ugiwaæ siê Okiem.
	};
};		


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co nowego?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //Co nowego?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Poszukiwacze nadal krêc¹ siê w pobli¿u. Nie spoczn¹, póki nie przeci¹gn¹ ciê na swoj¹ stronê.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Zabij smoki z Górniczej Doliny i dowiedz siê, kto stoi za tymi atakami. W przeciwnym wypadku ich si³a jeszcze wzroœnie!

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




























































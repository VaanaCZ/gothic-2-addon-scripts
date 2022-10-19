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
	description = "Wyrusz� w drog� najszybciej, jak si� tylko da!";
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
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Wyrusz� w drog� najszybciej, jak si� da!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //�wietnie! I jeszcze co�: nie zdrad� nikomu, �e ze mn� rozmawia�e�. A ju� w �adnym wypadku nie m�w o tym �adnemu magowi.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Odk�d obra�em w�asn� �cie�k�, Kr�g Ognia ma mnie za zmar�ego, i niech tak pozostanie.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: mu� auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
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
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Aha! Jeste� ju�. A ja straci�em nadziej�, �e si� jeszcze kiedy� spotkamy.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //Czuj� si�... Czuj� si�, jakbym kilka tygodni le�a� pod stert� g�az�w.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //Hmm... Dok�adnie tak by�o. �ycie zawdzi�czasz tylko i wy��cznie swemu magicznemu pancerzowi. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //Ba�em si�, �e nie zdo�am ci� wydosta� z ruin �wi�tyni...
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Ale do�� ju� o tym.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Musimy zaj�� si� nowym niebezpiecze�stwem gro��cym tej okolicy.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Mamy na to wystarczaj�co du�o czasu. �ni�cy zosta� wygnany.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "O jakim NOWYM zagro�eniu m�wisz?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Musisz si� z nimi sprzymierzy�! Tylko w ten spos�b zdo�amy powstrzyma� Beliara!
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Mam na to wystarczaj�co du�o czasu. W ko�cu zwyci�y�em! �ni�cy zosta�...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //...wygnany z naszego �wiata. Przep�dzi�e� go, to prawda, ale powstrzymanie nadci�gaj�cej wojny nie le�y ju� w naszej mocy.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Swym ostatnim krzykiem rozpaczy �ni�cy przywo�a� pot�n� armi� z�a.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //By� to wyra�ny rozkaz dla wszystkich istot ciemno�ci. Pot�ne s�owo magii, kt�remu nie mog�y odm�wi�.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Jego ostatni rozkaz brzmia� 'PRZYBYWAJCIE'. I przyby�y wszystkie... nawet smoki.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //Smoki!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Tak, nawet te pot�ne, prastare istoty. Wyczuwam ich obecno�� tak�e tutaj.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Smoki zebra�y wok� siebie liczn� armi� s�u��cych im istot.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Gdzie jest teraz ta armia?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Zaleg�a obozem ca�kiem blisko st�d, w G�rniczej Dolinie, niedaleko Khorinis. Teraz przygotowuje si� do ostatecznego ataku.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //Zosta�o nam niewiele czasu.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Ale to nie wszystko... Niedawno dosz�y mnie s�uchy o jeszcze innym zagro�eniu.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "O jakim INNYM zagro�eniu m�wisz?", DIA_Addon_Xardas_Hello_Man );
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
	description	 = 	"Zatem wyno�my si� st�d czym pr�dzej!";
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
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Zatem wyno�my si� st�d czym pr�dzej!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Je�li nawet zdo�amy teraz uciec, smoki w ko�cu nas odnajd�.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //Ale z pomoc� tutejszych �o�nierzy i mag�w, mo�emy je jeszcze powstrzyma�, nim zbytnio urosn� w si��.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Lepszej szansy chyba ju� nie dostaniemy.
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
	description	 = 	"Co mo�emy zrobi�?";
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
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Co mo�emy zrobi�?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Tym razem sami sobie nie poradzimy. W walce ze smokami mo�e nam pom�c tylko moc Innosa.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //W pobliskim mie�cie Khorinis stacjonuje oddzia� paladyn�w.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //W ich posiadaniu znajduje si� pewien pot�ny artefakt, dzi�ki kt�remu mo�emy pokona� paskudne gady.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //Nazywaj� go 'Okiem Innosa'. Musisz koniecznie zdoby� to Oko.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Ostrze� paladyn�w o smokach i za wszelk� cen� przekonaj ich dow�dc�, by nam pom�g�.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //Gdy tylko z nim porozmawiasz, musisz odszuka� artefakt Beliara.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //To odpowiednik Oka Innosa - nie wolno dopu�ci�, aby wpad� w r�ce s�ug z�a.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"W mie�cie Khorinis przebywa grupa paladyn�w. Maj� ze sob� pot�ny artefakt, Oko Innosa, kt�rego moc pomo�e nam pokona� smoki. Musz� tylko przekona� paladyn�w, aby wsparli nasz� spraw�."); 
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

	description	 = 	"Co mi mo�esz powiedzie� o tej kamiennej tablicy?";
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
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //Co mi mo�esz powiedzie� o tej kamiennej tablicy?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der H�hlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //S�dzi�em, �e to jaki� magiczny artefakt. Okaza�o si� jednak, �e jej znaczenie jest znacznie mniejsze.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Nie uda�o mi si� do ko�ca rozszyfrowa� wyrytych na niej znak�w, ale wydaj� si� one przekazywa� histori� prastarej kultury.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //We� j�, je�li chcesz, do niczego mi si� nie przyda.

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

	description	= "Mag wody odkry� portal prowadz�cy do nieznanej dot�d cz�ci wyspy.";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Mag Wody odkry� portal prowadz�cy do nieznanej dot�d cz�ci wyspy.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //To ciekawe...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Zg�o� si� do mnie, gdy tylko znajdziesz cokolwiek, co mo�e nam naprawd� pom�c.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //Mo�e ukryto tam artefakt Beliara? Odszukaj go!
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
	description	= "Co do niezbadanej dot�d cz�ci wyspy...";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //Co do niezbadanej dot�d cz�ci wyspy...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Nie m�cz mnie zb�dnymi szczeg�ami. Wr��, gdy b�dziesz mie� co� przydatnego.
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

	description	= "Przeszuka�em nieznan� cz�� wyspy.";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //Przeszuka�em nieznan� cz�� wyspy.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //Z jakim rezultatem?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Wszystko wydaje si� obraca� wok� pot�nego artefaktu znanego jako Szpon Beliara.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //Szpon Beliara? Gdzie on jest? Masz go przy sobie?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Owszem.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //To bardzo ciekawe...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Ta bro� mo�e si� nam bardzo przyda�, jest jednak r�wnie� niezwykle niebezpieczna.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Zachowaj ostro�no�� i pod �adnym pozorem jej nie zgub!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Nie, ju� nie.
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Przekaza�em go Magom Wody, aby wrzucili go do morza.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //Oszala�e�?! Wiesz chocia�, czego si� pozby�e� lekk� r�k�?!
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Ta bro� mog�a si� nam ogromnie przys�u�y�!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //S�dz�, �e tak b�dzie lepiej.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //Niezbadane s� wyroki bog�w...
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
	description	 = 	"Potrzebuj� broni.";
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
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Potrzebuj� broni.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Mog� ci da� tylko to, co znajdziesz w mojej wie�y.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Rozejrzyj si� tu troch�. Cokolwiek uznasz za przydatne, nale�y do ciebie.
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
	description	 = 	"Czym dok�adnie jest 'Oko Innosa'?";
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
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Czym dok�adnie jest 'Oko Innosa'?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //To magiczny amulet. Legenda g�osi, �e sam Innos wla� we� cz�� swojej boskiej mocy.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Dzi�ki niemu odzyskasz cz�� dawnych si� i b�dziesz m�g� stawi� czo�a smokom.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Oko ma te� inne, tajemnicze w�a�ciwo�ci, ale o nich opowiem ci, gdy ju� zdob�dziesz amulet.
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
	description	 = 	"Dlaczego paladyni mieliby mi da� Oko Innosa?";
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
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Dlaczego paladyni mieliby mi da� Oko Innosa?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Bo twoim przeznaczeniem jest nosi� ten amulet.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Sk�d ta pewno��?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Jest kilka przes�anek. Najwa�niejsz� z nich jest fakt, �e pokona�e� �ni�cego. Gdyby� nie by� ulubie�cem bog�w, ju� dawno by� nie �y�.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Za��my, �e masz racj� i rzeczywi�cie pisane mi jest posiadanie Oka Innosa. Jak mam o tym przekona� paladyn�w?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //Oko Innosa samo wybiera swojego posiadacza. Je�li uda ci si� je zdoby� i za�o�y�, paladyni b�d� musieli uzna� prawdziwo�� twoich s��w.
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
	description	 = 	"Jak si� dosta� do miasta?";
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
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Jak si� dosta� do miasta?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Id� po prostu w d� �cie�ki prowadz�cej od drzwi mojej wie�y. Miasto jest du�e, z pewno�ci� je zauwa�ysz.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Tylko uwa�aj! Droga do miasta naje�ona jest niebezpiecze�stwami, a ty nie jeste� tak silny jak kiedy�.
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
	description	 = 	"Gdzie my w og�le jeste�my?";
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
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //Gdzie my w og�le jeste�my?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //M�wi�em ci ju� - niedaleko miasta Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Odbudowa�em tutaj moj� wie��.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Przecie� nie min�� miesi�c, odk�d widzieli�my si� w G�rniczej Dolinie!
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //S�udzy, kt�rych wezwa�em do budowy mojej wie�y, uwin�li si� bardzo sprawnie...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Trudno zaprzeczy�.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Gdzie mog� znale�� lepsze wyposa�enie?";
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
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Gdzie mog� znale�� lepsze wyposa�enie?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //Je�li chcesz kupi� bro� i pancerz, musisz pewnie uda� si� do Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Ale w dolinie znajdziesz lecznicze zio�a, kt�re przywr�c� ci si�y utracone w walce.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Wybierz si� te� nad jezioro, tu� przed moj� wie��. Znajdziesz tam ukryte przej�cie do doliny.
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
	description	 = 	"Rozmawia�e� ju� z Lesterem?";
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
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Rozmawia�e� ju� z Lesterem?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Tak, zasypa�em go pytaniami. Du�o si� od niego dowiedzia�em. Jest teraz kompletnie wyczerpany.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //To prawdziwy cud, �e w og�le prze�y� t� ucieczk�. Kaza�em mu troch� odpocz��.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Czego si� od niego dowiedzia�e�?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Niestety, niczego dobrego. Nie do��, �e widzia� smoka, to spotka� te� ludzi w czarnych kapturach.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //To takie wa�ne?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Je�li ci ludzie rzeczywi�cie istniej�, b�d� dla nas powa�nym zagro�eniem.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //Niepokoi mnie to. Prosz�, we� m�j pier�cie�. B�dzie ci� chroni� przed magi�.
	
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
	description	 = 	"By�em w mie�cie...";
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
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //By�em w mie�cie...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //Uda�o ci si� porozmawia� z przyw�dc� paladyn�w?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Nie. Nie chc� mnie dopu�ci� przed jego oblicze...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //G�upcy! Musi by� jaki� spos�b, by� do niego dotar�.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Gdyby nie by�o innego wyj�cia, dosta� si� do klasztoru i zosta� magiem.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Mo�e to troch� moralnie dwuznaczne, ale przynajmniej osi�gniesz sw�j cel.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Gdyby� by� magiem, przyw�dca paladyn�w musia�by si� z tob� spotka�.
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
	description	 = 	"Wi�c co mam teraz robi�?";
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
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Wi�c co mam teraz robi�?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Post�pujmy dalej zgodnie z planem. Chwilowo nie widz� innej drogi.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Postaraj si� zdoby� Oko Innosa. Ja w tym czasie poszukam odpowiedzi na moje pytania.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Dlaczego Kr�g Ognia nie mo�e si� o tobie dowiedzie�?";
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
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Dlaczego Kr�g Ognia nie mo�e si� o tobie dowiedzie�?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//Kiedy� by�em wysoko w hierarchii kr�gu. Jednak ju� wtedy podejrzewa�em, �e kluczem do Bariery jest magia demon�w.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Oczywi�cie nigdy nie uda�o mi si� przekona� o tym pozosta�ych mag�w.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Dlatego opu�ci�em Kr�g i odda�em si� badaniu tajemnic mrocznych sztuk.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //To zbrodnia, kt�rej 'Bogobojni Wyznawcy Innosa', 'Dobrzy' i 'Cnotliwi' Magowie Ognia nigdy mi nie wybacz�.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Zapewne wiedz�, �e wci�� �yj�, ale nie maj� poj�cia, gdzie mnie szuka�. I niech tak pozostanie.
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

	description	 = 	"Wracam z G�rniczej Doliny.";
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
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Wracam z G�rniczej Doliny.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Najwy�szy czas. Co tam widzia�e�?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Mia�e� racj�. W dolinie stacjonuje pot�na armia nieprzyjaciela.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Orkowie oblegaj� zamek, a smoki pustosz� okoliczne tereny.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Je�li si� nie myl�, wkr�tce ca�a armia ruszy na Khorinis.
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

	description	 = 	"Co si� tu do diab�a dzia�o pod moj� nieobecno��?";
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
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester powiedzia�, �e chcesz si� ze mn� widzie�.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Co si� tu do diab�a dzia�o pod moj� nieobecno��?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //Nasz przeciwnik dowiedzia� si�, kim jeste� naprawd�, i �e zamierzasz zdoby� Oko Innosa.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Zda� sobie spraw� z zagro�enia, wi�c postanowi� wyj�� z ukrycia i zaatakowa� otwarcie.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Zabawa w chowanego ju� si� sko�czy�a. Jeszcze wczoraj nikt nie wiedzia�, z kt�rej strony nadejdzie cios. Dzi� nie ma co do tego �adnych w�tpliwo�ci.

	B_LogEntry (TOPIC_INNOSEYE, "Wr�g dowiedzia� si�, �e szukam Oka Innosa. Musz� je jak najszybciej znale��, zanim b�dzie za p�no.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Zaatakowali mnie magowie w czarnych szatach.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Wreszcie uda�o mi si� zdoby� dow�d dla Lorda Hagena.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Zaatakowali mnie magowie w czarnych szatach.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //Wr�g ma wiele twarzy. Poszukiwacze to w�a�nie jedna z nich. Ale oni tylko przygotowuj� teren na przybycie prawdziwego przeciwnika.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Zaj�li ju� pozycje w strategicznych miejscach. Teraz czekaj� tylko na dogodn� okazj�, by zacisn�� p�tl� side�.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Trzymaj si� od nich z dala. To pot�ne, magiczne istoty, kt�re za wszelk� cen� spr�buj� ci� powstrzyma�.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas wie o odzianych na czarno m�czyznach. Wygl�da na to, �e tak naprawd� to Poszukiwacze poci�gaj� za sznurki, i s� bardzo niebezpiecznymi przeciwnikami."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Znalaz�em wreszcie dow�d, kt�rego domaga� si� Lord Hagen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //Co to za dow�d?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //Otrzyma�em list od Garonda, dow�dcy paladyn�w w G�rniczej Dolinie. Prosi w nim o posi�ki.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //To powinno wystarczy�, by przekona� Hagena. Dobra robota.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Co mam teraz robi�?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Co mam teraz robi�?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Zanie� Hagenowi list od Garonda. Z takim dowodem w r�ku zostaniesz dopuszczony do Oka Innosa.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Potem udaj si� do Pyrokara. To on da ci Oko.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Musisz koniecznie zabra� ten artefakt w bezpieczne miejsce.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Id� ju�, zanim b�dzie za p�no. Wr�g te� spr�buje zdoby� amulet dla siebie.
	B_LogEntry (TOPIC_INNOSEYE, "Oko znajduje si� w klasztorze Mag�w Ognia. Mam nadziej�, �e Lord Hagen pozwoli mi si� do niego dosta�, kiedy dostarcz� mu wiadomo�� od Lorda Garonda. Mag Ognia Pyrokar nie dopu�ci mnie w pobli�e amuletu, je�li nie b�d� mia� poparcia Hagena.");
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

	description	 = 	"Oko Innosa zosta�o zniszczone.";
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
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //Oko Innosa zosta�o zniszczone.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Jak to mo�liwe? Zniszczone?!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Znalaz�em je w p�nocnych lasach. Niestety, uda�o mi si� odzyska� tylko kawa�ki.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //To by�a nasza jedyna szansa na pokonanie tych smok�w! Wszystko stracone.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Co teraz?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Co teraz?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //To straszliwy cios. Niepr�dko si� po nim podniesiemy. Musz� przemy�le� ca�� spraw� w spokoju.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //W mi�dzyczasie powiniene� uda� si� do miasta i porozmawia� z Magiem Wody imieniem Vatras. Mo�e on b�dzie wiedzia�, co wypada czyni� dalej.

	B_LogEntry (TOPIC_INNOSEYE, "Xardas nie by� zachwycony, kiedy dowiedzia� si�, �e Oko Innosa zosta�o zniszczone. Jedyn� nasz� nadziej� jest Vatras, Mag Wody z miasta Khorinis.");

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

	description	 = 	"Vatras przys�a� mnie do ciebie.";
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
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Vatras przys�a� mnie do ciebie.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //To dobrze. Co ci powiedzia�?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Wspomnia� co� o rytuale odwr�cenia, kt�ry nale�y odprawi� w S�onecznym Kr�gu.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //Ten stary wyga! Chyba wiem, co planuje. Przybywasz, by przekaza� mi jego zaproszenie?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //Na to wygl�da. Kiedy wyruszysz?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Bezzw�ocznie. Ty musisz jeszcze wype�ni� swoje zadania. Potem zn�w si� spotkamy.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas zgodzi� si� przyj�� do S�onecznego Kr�gu na rytua�.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Pomog� przy odprawianiu rytua�u, dopiero gdy b�d� mia� pewno��, �e jeste� got�w stawi� czo�a smokom.
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

	description	 = 	"Dlaczego nie p�jdziesz do Vatrasa od razu?";
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
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Dlaczego od razu nie p�jdziesz do Vatrasa?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //Czasem ci� po prostu nie rozumiem.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //Nigdy nie zwracaj si� do mnie tym tonem! Gdyby nie JA, twoje szcz�tki gni�yby teraz w �wi�tyni �ni�cego!

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Mniejsza z tym. Powiedz tylko, co mam zrobi�.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Wi�c wyja�nij mi chocia�, dlaczego si� wahasz.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Wi�c wyja�nij mi chocia�, dlaczego si� wahasz.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Odk�d opu�ci�em Mag�w Ognia, stara�em si� trzyma� od nich mo�liwie daleko.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //I nie zamierzam tego zmienia�, tak d�ugo, jak to mo�liwe.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Wi�c zanim zn�w stan� przed mymi dawnymi towarzyszami, chc� mie� absolutn� pewno��, �e nie robi� tego na darmo. Musisz by� got�w do walki ze smokami!
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //Z takim wyposa�eniem daleko jednak nie zajdziesz. Wr�� do mnie, gdy b�dziesz wystarczaj�co silny.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Mniejsza z tym. Powiedz tylko, co mam zrobi�.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Jeste� jeszcze zbyt s�aby, by zmierzy� si� ze smokiem.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Wr��, gdy b�dziesz odpowiednio przygotowany. Wtedy udam si� na spotkanie z Vatrasem.
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

	description	 = 	"Jestem got�w, by zmierzy� si� ze smokami.";
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
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Jestem got�w, by zmierzy� si� ze smokami.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //Zatem nie ma czasu do stracenia. Natychmiast wyruszam w drog� do S�onecznego Kr�gu. Wype�nij swoje zadania. Spotkamy si� na miejscu.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas zgodzi� si� przyj�� do S�onecznego Kr�gu na rytua�.");
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

	description	 = 	"Czy ten rytua� odwr�cenia ma szans� si� powie��?";
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
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Czy ten rytua� odwr�cenia ma szans� si� powie��?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //Nie mo�emy mie� pewno�ci. Wszystko zale�y od szczeg��w planu Vatrasa.
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

	description	 = 	"Pyrokar nie chce si� stawi� na spotkanie.";
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
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar nie chce si� stawi� na spotkanie.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Domaga si� dowodu, �e mo�na ci zaufa�.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //Czy�by? Pyrokar, tak? To ciekawe.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Ten stary cap zaczyna mnie irytowa�. Ale chyba mam tu co�, co mo�e go przekona�.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Opuszczaj�c Zakon Mag�w Ognia, zabra�em ze sob� kilka drobiazg�w.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich st�ndig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen k�nnte - Satz ist eh �berfl�ssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Nie chc�, by oddzia� paladyn�w i mag�w przetrz�sn�� moj� wie�� i znalaz� te rzeczy.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Dlatego ukry�em je w bezpiecznym miejscu, w kt�rym magowie nigdy nie b�d� ich szuka�.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //Gdzie dok�adnie?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Cz�� z nich le�y zamkni�ta w skrzyni na farmie Sekoba.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Ufasz temu Sekobowi?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Nie, ale mo�na go kupi�, a wtedy nie zadaje niewygodnych pyta�. Poza tym - skrzynia jest zamkni�ta. Oto klucz.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Znajdziesz tam mi�dzy innymi pewn� star� ksi�g�. Gdy Pyrokar j� zobaczy, b�dzie wiedzia�, �e to prezent ode mnie.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Ja ju� nie b�d� mia� z niej po�ytku, wi�c przynajmniej tobie na co� si� przyda.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas da� mi klucz do kufra na farmie Sekoba. W �rodku znajd� ksi��k�, kt�r� mam wr�czy� Pyrokarowi.");
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
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Teraz, gdy Oko Innosa zosta�o naprawione, musisz stawi� czo�a smokom.
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Wszystkie one s� s�ugami Beliara, boga ciemno�ci.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Ale bezpo�rednie rozkazy musz� otrzymywa� z tego �wiata. Tyle uda�o mi si� do tej pory ustali�.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Dowiedz si�, co jest �r�d�em ich pot�gi.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Potem wracaj czym pr�dzej do mnie.
	
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

	description	 = 	"Oko Innosa zosta�o naprawione. Co teraz?";
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
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //Oko Innosa zosta�o naprawione. Co teraz?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //Pami�taj, by zak�ada� je za ka�dym razem, gdy przyjdzie ci walczy� ze smokiem.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Nie tra� czasu. Zejd� teraz do G�rniczej Doliny i rozpraw si� ze smokami.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Id� do Pyrokara. Niech ci wyja�ni, jak pos�ugiwa� si� Okiem.
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
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Poszukiwacze nadal kr�c� si� w pobli�u. Nie spoczn�, p�ki nie przeci�gn� ci� na swoj� stron�.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Zabij smoki z G�rniczej Doliny i dowiedz si�, kto stoi za tymi atakami. W przeciwnym wypadku ich si�a jeszcze wzro�nie!

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




























































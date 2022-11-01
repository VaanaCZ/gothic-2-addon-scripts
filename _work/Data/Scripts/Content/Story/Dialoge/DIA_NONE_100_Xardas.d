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
	description = "Vyrazím hned, jak budu moci! (KONEC)";
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
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //Vyrazím hned, jak budu moci!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //Dobrá! A ještě jedna věc: neříkej nikomu, že jsme spolu mluvili. Hlavně to neříkej žádnému mágovi.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Co jsem odešel, považují mě mágové ohně za mrtvého - a to se může docela hodit.
	
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
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //Tak už je to tu zas! (s úsměvem) Nikdy jsem si nemyslel, že se my dva ještě někdy sejdeme.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //Mám pocit, jako bych strávil tři neděle pod hromadou balvanů.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //Taky že ano. Naživu tě udržela jenom magie ve tvé zbroji. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //Bál jsem se, že tě z trosek toho chrámu už nezachráním.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Ale na tom už nezáleží. Teď jsi tady.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Teď máme na krku NOVOU hrozbu.

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Máme teď spoustu času. Spáč byl přece poražen.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "O jaké NOVÉ hrozbě to mluvíš?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //Musíme se s nimi spojit! Pouze tak můžeme Beliara zastavit!
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Teď alespoň máme dost času. Postaral jsem se o to. Spáč...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //...byl zapuzen. Porazil jsi ho, to je naprostá pravda - ale není v naší moci zastavit válku, která bude teď následovat.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Svým posledním zběsilým skřekem vyslal Spáč na cestu armády temnot.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Byl to rozkaz určený všem zlým stvůrám. Mocné zaklínadlo, které nemohou neuposlechnout.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Jeho poslední rozkaz byl: PŘIJĎTE! A přišli. Všichni. Dokonce i draci.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(užasle) Draci!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Jsou to pradávná stvoření nebývalé moci. Cítím jejich přítomnost - dokonce i zde.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Shromáždili kolem sebe celou armádu nižších stvůr, aby jim sloužily.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //Kde je ta armáda teď?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //Utábořila se nedaleko odsud, v Hornickém údolí poblíž Khorinidu. Pomalu se připravuje k útoku.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(zamyšleně) Moc času nám nezbývá.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Ale to ještě není všechno. Nedávno jsem se dozvěděl ještě o DALŠÍ hrozbě.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "O jaké JINÉ hrozbě to mluvíš?", DIA_Addon_Xardas_Hello_Man );
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
	description	 = 	"Tak si pospěšme, abychom byli co nejrychleji pryč!";
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
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //Tak si pospěšme, abychom byli co nejrychleji pryč!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Pokud teď utečeme, bude to znamenat jediné - budeme se muset drakům postavit později.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //S pomocí vojáků a mágů, kteří žijí v těchto končinách, bychom mohli jejich armádu zastavit dřív, než se úplně zformuje.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //Lepší šanci už nikdy mít nebudeme.
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
	description	 = 	"Co budeme dělat teď?";
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
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //Co budeme dělat?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Tentokrát to sami nezvládneme. Proti těm drakům nám může pomoci jen Innosova moc.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //Ve městě Khorinis sídlí skupina paladinů, je to nedaleko odsud.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Mají mocný artefakt, který by nám mohl v boji proti drakům hodně pomoci.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //Říkají mu Innosovo oko. Musíš ten artefakt za každou cenu získat.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Vysvětli paladinům, jaké nebezpečí nám hrozí. MUSÍŠ přesvědčit jejich vůdce, aby nám pomohl!
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //A až si s ním promluvíš, musíš najít Beliarův artefakt.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //Je protikladem Oka Innosova. Nesmí padnout do nesprávných rukou.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"V Khorinidu se usadila skupina paladinů, kteří opatrují mocný artefakt zvaný Innosovo oko, jenž nám může pomoci zahnat dračí hrozbu. Musím ty svaté bojovníky nějak přesvědčit, aby se k nám přidali."); 
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

	description	 = 	"Můžeš mi říct něco o téhle kamenné tabulce?";
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
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //Můžeš mi něco říci o téhle kamenné tabulce?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //Napřed jsem ji považoval za magický artefakt, ale nakonec jsem došel k závěru, že není nijak zvlášť důležitá.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //Úplně jsem ji sice nerozluštil, ale podle všeho pojednává o historii nějaké velmi staré kultury.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Jestli tu tabulku chceš, tak si ji vezmi. Mně k ničemu není.

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

	description	= "Vodní mágové objevili portál, který vede do neznámé části ostrova...";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Vodní mágové objevili portál do neznámé části ostrova...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Zajímavé...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //Pokud objevíš něco, co nám SKUTEČNĚ k něčemu bude, pak mi to určitě oznam!
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //Ten Beliarův artefakt musí být ukrytý někde tady. Najdi jej!
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
	description	= "K té neznámé části ostrova...";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //Co se týče té neznámé části ostrova...
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //Neotravuj mě podrobnostmi. Vrať se, až najdeš něco opravdu zajímavého.
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

	description	= "Prozkoumal jsem tu neznámou část ostrova...";
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
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //Prozkoumal jsem neznámou část ostrova.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //A co jsi tam objevil?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Všechno se točilo kolem mocného artefaktu zvaného Beliarův dráp.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //Beliarův dráp? A kde je? Máš jej s sebou?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Ano, tady je.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(chtivě) To je nesmírně zajímavé.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Tahle zbraň se nám může velice hodit. Ale zároveň je nesmírně nebezpečná.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //Buď opatrný! A hlavně ji neztrať!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Už ji nemám.
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Dal jsem ji vodním mágům, kteří ji hodí do moře...
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(vztekle vykřikuje) Copak ses zbláznil? Máš vůbec ponětí, čeho se vzdáváš?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //Ta zbraň nám mohla velmi posloužit!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Myslím, že takhle to bude lepší.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(povzdechne si) Cesty boží jsou nevyzpytatelné.
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
	description	 = 	"Potřebuji zbraně.";
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
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Potřebuji zbraně.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Můžu ti dát jen to málo, co tady mám.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Porozhlédni se po mé věži. Vem si cokoliv, o čem budeš přesvědčen, že by se ti mohlo hodit.
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
	description	 = 	"Co přesně je to 'Innosovo oko'?";
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
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //Co přesně je to 'Innosovo oko'?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //Je to amulet. Legenda vypráví, že do něj vložil část své síly sám Innos.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Obnoví část tvé ztracené síly a pomůže nám porazit draky.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //Má také další skryté schopnosti. O nich ti povím víc, až ho budeš mít u sebe.
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
	description	 = 	"Proč by mi měli paladinové Innosovo oko dávat?";
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
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //Proč by mi měli paladinové Innosovo oko dávat?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Protože ty jsi ten, komu osud určil, aby jej nosil.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //Jak můžeš vědět něco takového?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Mám hned několik důvodů si to myslet, ale nejdůležitější je ten, že jsi porazil Spáče. Kdybys nebyl oblíbenec bohů, byl bys teď mrtvý.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Řekněme, že máš pravdu a že jsem vyvolený, abych nesl Innosovo oko. Jak ale paladinové poznají, že to je pravda?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //Oko samo si zvolí toho, kdo jej může mít. Jakmile se k němu dostaneš a nasadíš si ho, nebudou paladinové moci o tvých slovech dál pochybovat.
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
	description	 = 	"Jak se dostanu do města?";
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
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //Jak se dostanu do města?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Jdi po cestě vedoucí odsud skrz hory. Město je velké. Nemůžeš ho minout.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //Ale dávej si pozor! Cesta do města není úplně bezpečná. A ty nejsi zdaleka tak silný, jak jsi kdysi býval.
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
	description	 = 	"Kde přesně to vlastně jsme?";
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
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //A kde to vůbec jsme?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //Jak jsem už řekl, poblíž města Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Postavil jsem si zde znovu svou věž.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Ale vždyť je to jen pár dní, co jsme se naposledy viděli v Hornickém údolí...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //Služebníci, které jsem k obnovení své věže povolal, odvedli důkladnou práci...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Taky mám ten pocit.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde najdu lepší výbavu?";
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
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //Kde najdu lepší výbavu?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //Nejbližší místo, kde můžeš najít lepší zbraně a brnění, je město Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Ale dole v údolí můžeš tu a tam najít léčivé bylinky, které ti pomohou, když budeš zraněn v boji.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Vidíš to jezero hned před mou věží? Od něj vede do údolí tajná cesta.
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
	description	 = 	"Mluvil jsi už s Lesterem?";
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
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //Mluvil jsi už s Lesterem?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Ano, zasypal jsem ho otázkami. Řekl mi toho hodně, ale byl úplně vyčerpaný.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //Je vlastně zázrak, že ten útěk vůbec přežil. Poslal jsem jej, ať si odpočine.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //Co ti řekl?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Bojím se, že nic dobrého. Nejen že viděl draka, ale také muže v černých kápích.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //A?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Pokud ti muži skutečně existují, představuje jejich přítomnost možnou hrozbu.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //A to se mi moc nelíbí. Na, vezmi si můj prsten. Ochrání tě před magií.
	
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
	description	 = 	"Byl jsem ve městě...";
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
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //Byl jsem ve městě.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //A? Podařilo se ti promluvit si s vůdcem paladinů?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //Nepustili mě k němu.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //Nesmysl! Musí existovat způsob, jak se k němu dostat.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Když selže všechno ostatní, vstup do kláštera a staň se mágem.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Možná to je z morálního hlediska trošku pochybené, ale účel světí prostředky.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Pokud budeš mágem, určitě setkání s tebou neodmítne.
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
	description	 = 	"Tak co uděláme teď?";
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
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //Tak co uděláme teď?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Budeme postupovat podle plánu. Jinak to nejde.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Ty běž získat Innosovo oko a já budu hledat odpovědi.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "Proč by o tobě neměl 'kruh ohně' vědět?";
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
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//Proč o tobě nemají mágové ohně vědět?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//Býval jsem vysoko postavený člen kruhu. Už tenkrát jsem měl podezření, že klíčem k magické bariéře by mohla být magie démonů.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Nikdy se mi však nepodařilo přesvědčit ostatní členy kruhu, aby sledovali tuhle stopu.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Opustil jsem tedy kruh, abych mohl studovat černá umění.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //A to je zločin, pro který ohniví mágové, (jízlivě) 'Innosovi služebníci', vždy 'Dobří' a 'Ctnostní', nikdy nepřijmou žádnou omluvu.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Jsou si jisti, že jsem stále naživu, ale vůbec netuší, kde mě hledat - a to je jedině dobře.
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

	description	 = 	"Vrátil jsem se z Hornického údolí.";
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
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //Vrátil jsem se z Hornického údolí.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Už bylo načase. Co jsi viděl?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Měl jsi pravdu. Celá země se hemží nepřátelskou armádou.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Skřeti obléhají hrad a draci zpustošili celý kraj.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Jestli se nepletu, tak nebude dlouho trvat a zaútočí na Khorinis.
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

	description	 = 	"Co se to tu proboha stalo?";
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
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester říkal, že mě chceš okamžitě vidět.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //Co se to tu proboha stalo?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //Nepřítel se dozvěděl, kdo ve skutečnosti jsi, a chce se zmocnit Innosova oka.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Zjistil, jaká hrozba se na něj žene. Donutilo ho to opustit úkryt a přejít do útoku.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Je konec hry na schovávanou. Ještě včera nikdo nevěděl, jak bude nepřátelský útok vypadat. Teď je to nad slunce jasné.

	B_LogEntry (TOPIC_INNOSEYE, "Nepřítel se dozvěděl, že hledám Innosovo oko. Je načase je získat, než bude příliš pozdě.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Zaútočili na mě nějací mágové v černých hábitech.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Konečně jsem získal důkaz pro lorda Hagena.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Zaútočili na mě mágové v černých róbách.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //Nepřítel má mnoho podob. Pátrači jsou jednou z nich. Oni jsou těmi, kdo připravuje půdu pro nepřítele.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Zaujali pozice na strategických místech a teď jen čekají na vhodnou příležitost, aby spustili past.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Vyhýbej se jim. Jsou to mocná magická stvoření a pokusí se tě odstranit z cesty za každou cenu.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas ty černě oděné mágy zná. Pátrači jsou pravděpodobně tím, kdo naše nepřátele ovládá. Jsou nesmírně nebezpeční."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Konečně mám důkaz, který po mně lord Hagen chtěl.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //Co je to za důkaz?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //Dostal jsem dopis od Garonda, velitele paladinů z Hornického údolí. Žádá v něm o posily.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //To by snad mělo toho bojechtivého politika přesvědčit. Dobrá práce.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Co uděláme teď?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //Co uděláme teď?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Jdi a dones lordu Hagenovi dopis od Garonda, měl by ti umožnit přístup k Innosovu oku.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Pak běž do kláštera a promluv si s Pyrokarem. Bude ti muset Oko dát.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Nic není důležitějšího než dostat ten artefakt do bezpečí.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Teď běž, dokud není pozdě. I nepřítel se ho určitě pokusí získat.
	B_LogEntry (TOPIC_INNOSEYE, "Oko se nachází v kláštere mágů ohně. Doufejme, že mi tam lord Hagen nyní dovolí vejít, když jsem mu předal zprávu od lorda Garonda. Hlavní mág Pyrokar mě totiž bez Hagenova svolení k amuletu vůbec nepustí.");
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

	description	 = 	"Innosovo oko bylo zničeno.";
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
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //Innosovo oko bylo zničeno.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //Co to říkáš? Zničeno!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Tohle jsem našel nahoře v severních lesích - bohužel se mi podařilo získat už jen jeho úlomky.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //Byla to naše jediná naděje, jak obstát v boji s draky. Teď je v nenávratnu. Selhali jsme.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "Co teď?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //Co teď?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //To je bolestná zpráva. Musíme se sami v téhle situaci zorientovat. Zkusím najít nějaké řešení.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //Mezitím bys měl zajít do města a promluvit si s vodním mágem Vatrasem. Je možné, že bude vědět, co by mělo být uděláno.

	B_LogEntry (TOPIC_INNOSEYE, "Zpráva o zničení Oka Innosova Xardase rozhodně nepotěšila. Naší jedinou nadějí je nyní mág vody jménem Vatras, který sídlí ve městě Khorinidu.");

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

	description	 = 	"Posílá mě za tebou Vatras.";
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
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Posílá mě za tebou Vatras.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //To je dobře. Co řekl?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Povídal něco o obráceném rituálu ve slunečním kruhu.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(zasměje se) Ten starý pekelník. Myslím, že vím, co má za lubem. Přišel jsi, abys mě dostal k němu.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //Vypadá to tak. Kdy vyrazíš na cestu?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //Nesmím nechat Vatrase čekat. Okamžitě se vydám na cestu. Splň, co musíš, a pak se ke mně znovu přidej.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas souhlasil, že se zúčastní rituálu kruhu Slunce.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Zúčastním se rituálu až ve chvíli, kdy si budu jist, že jsi plně připraven utkat se s draky.
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

	description	 = 	"Proč nejdeš za Vatrasem HNED?";
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
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //Proč nejdeš za Vatrasem HNED?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //Někdy ti prostě nerozumím.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(rozzlobeně) Nemluv se mnou tímto tónem. Nebýt MĚ, tvoje bídné tělo by ještě hnilo v tom chrámu.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Co se dá dělat. Alespoň mi řekni, co bych měl udělat.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Tak mi alespoň vysvětli, proč váháš.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Tak mi alespoň vysvětli, proč váháš.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Od chvíle, kdy jsem opustil ohnivé mágy, jsem se jim držel co možná z cesty.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //A na tom nehodlám nic měnit, ledaže bych neměl na vybranou.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Ale než se vystavím vyčítavým pohledům ostatních mágů, chci mít jistotu, že máš proti drakům alespoň nějakou šanci.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //S tím svým ošuntělým vybavením se ale moc daleko nedostaneš. Vrať se, až budeš dostatečně silný.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Co se dá dělat. Alespoň mi řekni, co bych měl udělat.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Na boj s draky jsi pořád příliš slabý. S touhle výbavou nemáš vůbec žádnou šanci.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //Nevracej se, dokud nebudeš lépe připraven. Pak se vydám za Vatrasem.
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

	description	 = 	"Jsem připraven bojovat s draky.";
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
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Jsem připraven bojovat s draky.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //V tom případě už nemůžeme plýtvat časem. Okamžitě se vydám do slunečního kruhu. Splň, co musíš. Setkáme se tam.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas souhlasil, že se zúčastní rituálu kruhu Slunce.");
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

	description	 = 	"Bude rituál zvratu fungovat?";
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
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //Bude obrácený rituál fungovat?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //To nemůžu vědět najisto. Záleží to na tom, co přesně chce Vatras udělat.
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

	description	 = 	"Pyrokar se odmítá zúčastnit rituálu.";
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
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar odmítá zúčastnit se rituálu.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Především chce důkaz, že ti může věřit.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //No ano. Pyrokar. Velice zajímavé.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Z toho starocha se stává docela mrzout. Ale myslím, že pro tebe mám něco užitečného.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Když jsem kdysi opouštěl řád ohnivých mágů, vzal jsem si z kláštera pár věcí.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //Nechtěl jsem, aby náhodou přišla skupina paladinů nebo ohnivých mágů, prohledali věž skrz naskrz a ty věci našli.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Tak jsem je schoval na bezpečná místa, kde by je mágové určitě nikdy nehledali.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //A kde?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Některé z nich jsou zamčené v truhle na Sekobově farmě.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //Tomu Sekobovi věříš?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //Ne. Ale je možné ho koupit a neklade žádné ošidné otázky. Ta truhla je navíc zamčená. Tady máš klíč.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Mezi těmi věcmi je jedna velice stará kniha. Až ji Pyrokar spatří, bude vědět, že pochází ode mě.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Už mi není k ničemu. Ale řekl bych, že k tomuhle úkolu by se mohla docela dobře hodit.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas mi dal klíč od truhlice na Sekobově statku. Knihu, kterou uvnitř najdu, mám zanést Pyrokarovi.");
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
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //Teď, když je Innosovo oko opraveno, se musíš postavit drakům!
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Všichni slouží Beliarovi, bohu temnot.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Musí ale existovat nějaká pozemská síla, která je ovládá. To je mi jasné.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Zjisti, co za sílu je ovládá.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //Vrať se sem, jakmile to zjistíš!
	
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

	description	 = 	"Innosovo oko je uzdraveno. Co dál?";
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
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //Innosovo oko je opraveno. Co dál?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //Nezapomeň ho mít na sobě, až budeš stát drakům tváří v tvář.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //Neztrácej čas. Běž do Hornického údolí a zabij ty draky.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Jdi za Pyrokarem, ať ti vysvětlí, jak Oko používat.
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

	description	 = 	"Co je nového?";
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
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //Co je nového?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Pátrači ještě neodešli. Nedají si pokoje, dokud tě nedostanou.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Zabij draky v Hornickém údolí a zjisti, kdo za těmi útoky stojí. Jinak bude jejich síla neustále narůstat.

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




























































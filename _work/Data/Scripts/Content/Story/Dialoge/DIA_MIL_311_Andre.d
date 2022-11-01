// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_EXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_EXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos (self);

};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_FIRSTEXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_FIRSTEXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_StartOtherRoutine (Wulfgar,"START"); 
};




// ************************************************************
// 	  				   		Steckbrief
// ************************************************************
var int Andre_Steckbrief; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_Steckbrief()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Jeden z mých mužů mi âekl, že bandité roznášejí plakáty s vypsanou odmęnou a že je na nich tvoje tváâ.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //Také mi âekl, žes to nejdâív popâel.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Takže o co tady jde?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //Nevím, proč mę ti lidé hledají...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Pro tvoje vlastní dobrou doufám, že âíkáš pravdu.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Nechci v domobranę nikoho, kdo nemá čistý rejstâík.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //Vętšina z tęch banditů jsou bývalí vęzni z tęžaâské kolonie.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //Doufám, že ses s tęmi hrdloâezy nijak nezapletl!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //Byl tady kupec Canthar. Povídal, že jsi uprchlý trestanec z tęžaâské kolonie.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //Nevím, jestli to je pravda, a radši bych se tę neptal, ale męl bys to nęjak objasnit.
	
	B_RemoveNpc (Sarah);
	
			
	B_StartOtherRoutine (Canthar,"MARKTSTAND");
	AI_Teleport (Canthar,"NW_CITY_SARAH");
					
	if (Canthar_Sperre == FALSE)
	&& (Canthar_Pay == FALSE)
	{
		Canthar_Sperre = TRUE; 
	};
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	
	Andre_CantharFalle = TRUE;
};

// ************************************************************
// 			Canthar Falle als INFO (niedrige Important)
// ************************************************************

INSTANCE DIA_Andre_CantharFalle (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 3;
	condition   = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_CantharFalle_Condition()
{
	if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	&& (Andre_CantharFalle == FALSE)
	{
		return TRUE;
	};
	
	if (Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE)
	{
		return TRUE;
	};
};

FUNC INT DIA_Andre_CantharFalle_Info()
{
	if (Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
	};
	
	if (Andre_CantharFalle == FALSE)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	{
		B_Andre_CantharFalle();
	};
};

// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Andre_PMSchulden (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Andre_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Pâišel jsi zaplatit svou pokutu?

						
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};
						
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //Už jsem se sám sebe ptal, jestli budeš mít dost odvahy sem pâijít!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Zdá se, že se počet žalob na tebe ještę znásobil!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Varoval jsem tę! Pokuta, kterou musíš zaplatit, je ještę vyšší!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //Kolik?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);
		
			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};
		
			if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Andre_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //Vážnę jsi mę zklamal!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Objevilo se pár nových vęcí.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //Už není nikdo, kdo by tę obviŕoval z vraždy.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Už si nikdo nevzpomíná, že by tę vidęl pâi krádeži.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Už nejsou žádní svędkové, kteâí by tvrdili, že tę vidęli účastnit se rvačky.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Zdá se, že se všechna obvinęní proti tobę nakonec vyjasnila.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //Nevím, jak se to stalo, ale varuji tę: nehraj si se mnou.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //Každopádnę jsem se rozhodl odpustit ti tvoje dluhy.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Dej si pozor, aby ses nedostal do žádných dalších potíží.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Jedno si vyjasnęme: tak jako tak budeš muset zaplatit pokutu v plné výši.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //Tak kolik to dęlá?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Nemám dost penęz!",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Kolik že to bylo?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //Kolik že to bylo?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Nemám dost penęz!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Kolik že to bylo?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Andre_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Andre_PETZMASTER   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Ty musíš být ten nový chlapík, který tady ve męstę dęlá tolik problémů.
	};
	
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};	
	
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};
	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Dobâe že jsi za mnou pâišel, než to začalo být pro tebe ještę horší.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Vražda je vážný zločin!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //A to nemluvím o tęch dalších vęcech, které jsi napáchal.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //Strážní mají rozkazy trestat každého vraha hned na místę.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //A vętšina občanů nehodlá vraždy na území męsta tolerovat!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Nemám žádný zájem na tom tę povęsit. Jsme ve válce a potâebujeme každého muže.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Ale nebude lehké pâesvędčit lidi, aby o tobę smýšleli zase lépe.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //Męl bys projevit svou lítost zaplacením pokuty - pochopitelnę pâimęâenę vysoké.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //Dobâe že jsi pâišel! Jsi obvinęn z krádeže! Jsou na to svędci!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //A to nemluvím o dalších vęcech, které se mi donesly.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Takové chování nebudu ve męstę trpęt!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //Abys odčinil svůj zločin, musíš zaplatit pokutu.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Je nęco jiného, když se popereš s lůzou v pâístavu...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Ale jakmile zaútočíš na občany nebo královské vojáky, musíš jít pâed soud.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //A to s tou ovcí bylo také zcela zbytečné.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Kdybych tę nechal odejít jen tak, bude si tady za chvíli každý dęlat, co se mu zlíbí.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //Takže zaplatíš pâimęâenou pokutu - a na celou vęc zapomeneme.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Slyšel jsem, že sis zasedl na naše ovce.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Uvędom si, že to nemohu nechat být jen tak.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Budeš muset zaplatit náhradu škody!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Kolik?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Nemám dost penęz!",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Dobrá! Postarám se o tom, aby se o tom dozvędęl každý ve męstę - tím se tvoje povęst zase trošku vylepší.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Nemám dost penęz.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //Tak si nęjaké co nejrychleji sežeŕ.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //A varuji tę: jestli se proviníš ještę nęčím, jen si to zhoršíš.
	
	Andre_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// *********************************************************
//							Hallo
// *********************************************************
instance DIA_Andre_Hallo		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Hallo_Condition;
	information	 = 	DIA_Andre_Hallo_Info;
	permanent 	 =  FALSE; 
	important    =  TRUE;
};
func int DIA_Andre_Hallo_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Innos tę provázej, cizinče! Co tę ke mnę pâivádí?
};



// *********************************************************
//					Nachricht für Lord Hagen
// *********************************************************
instance DIA_Andre_Message		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 1;
	condition	= DIA_Andre_Message_Condition;
	information	= DIA_Andre_Message_Info;
	permanent 	= FALSE; 
	description = "Pâináším důležitou zprávu pro lorda Hagena.";
};
func int DIA_Andre_Message_Condition ()
{
	if (Kapitel < 3)
	&& ((hero.guild == GIL_NONE)
	|| (hero.guild == GIL_NOV))
	{
		return TRUE;
	};	
};
func void DIA_Andre_Message_Info ()
{
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //Mám důležitou zprávu pro lorda Hagena.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //No, stojíš pâed jedním z jeho mužů. Čeho se to týká?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "To mohu âíct jen lordu Hagenovi.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Skâetímu vojsku velí DRACI!", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Týká se to posvátného artefaktu - Innosova oka.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen pâijímá jen paladiny a ty, kdo jsou u paladinů ve službę.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Je pod jeho důstojnost ztrácet čas s bęžnými lidmi.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Týká se to posvátného artefaktu - Innosova oka.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //Innosovo oko - nikdy jsem o nęm neslyšel. Ale to ještę nemusí nic znamenat.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //Pokud nęjaký artefakt tohoto jména opravdu existuje, stejnę o nęm vędí jen nejvyšší členové našeho âádu.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //Proto si musím promluvit se samotným lordem Hagenem.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Zástupy skâetů vedou DRA-
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(pâeruší tę) JÁ VÍM, že armáda skâetů je čím dál tím silnęjší.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Nesnažíš se mi naznačit, že to je TO, co chceš nahlásit lordu Hagenovi.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Ten by ti utrhl hlavu za to, že mrháš jeho časem takovými historkami.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //A jsem si jist, že jsi dost chytrý na to, abys to vędęl sám.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //Takže o co ve skutečnosti jde?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //To mohu âíct jen lordu Hagenovi.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Jak myslíš. Ale jedno bys męl vędęt:
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_Paladine		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_Paladine_Condition;
	information	 = 	DIA_Andre_Paladine_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Proč jsou ve męstę paladinové?";	
};
func int DIA_Andre_Paladine_Condition ()
{	
	if (other.guild != GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Proč jsou ve męstę paladinové?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Cíle naší mise jsou tajné.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Mohu âíct jen to, že občané męsta nejsou v ohrožení.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Nemusíš si dęlat starosti.
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_PaladineAgain		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_PaladineAgain_Condition;
	information	 = 	DIA_Andre_PaladineAgain_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Proč jsou ve męstę paladinové?";	
};
func int DIA_Andre_PaladineAgain_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_PaladineAgain_Info ()
{
	if Npc_KnowsInfo (other,DIA_Andre_Paladine)
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Âekneš mi teë, proč jste vy paladinové pâijeli sem do Khorinidu?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Proč jsou ve męstę paladinové?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Teë patâíš k męstské stráži, takže jsi také podâízený paladinům.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //Konečnę tę tedy mohu zasvętit.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Pâišli jsme sem na rozkaz krále Rhobara. Se zhroucením bariéry ustaly dodávky rudy.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Proto musíme získat rudu a dopravit ji na pevninu. Z té rudy vykováme nové zbranę a zaženeme skâety zpátky.
	
	KnowsPaladins_Ore = TRUE;
};
// *********************************************************
//						AskToJoin
// *********************************************************
instance DIA_Andre_AskToJoin		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_AskToJoin_Condition;
	information	= DIA_Andre_AskToJoin_Info;
	permanent 	= FALSE; 
	description = "Chci vstoupit do služby k paladinům!";
};
func int DIA_Andre_AskToJoin_Condition ()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Andre_AskToJoin_Info ()
{
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Chci vstoupit do služby k paladinům!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Dobrá. Hodí se mi každý schopný muž. Nezáleží na důvodech, proč se k nám chce pâidat.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Pokud vstoupíš do služby k paladinům, mohl bych ti pomoci zaâídit slyšení u lorda Hagena.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Požadavek hodný uznání.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Mám však rozkazy pâijímat do domobrany jen občany męsta.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //Můj velitel se bojí, že by se do ní jinak mohli vetâít špehové nebo sabotéâi.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //Tímhle způsobem chce to riziko minimalizovat.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Nejprve tedy musíš být občanem męsta - může sice být sporné, jestli tohle pravidlo má smysl nebo ne, ale rozkazy jsou rozkazy.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Chci-li se stát členem męstské gardy, musím být nejdâív občanem męsta.");
};

// *********************************************************
//						About Miliz
// *********************************************************
instance DIA_Andre_AboutMiliz (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	5;
	condition	 = 	DIA_Andre_AboutMiliz_Condition;
	information	 = 	DIA_Andre_AboutMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"Co můžu od služby v domobranę čekat?";
};

func int DIA_Andre_AboutMiliz_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_ABOUTMILIZ_Info ()
{
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //Co můžu od služby v domobranę čekat?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Jedno si vyjasnęme. Být vojákem v domobranę obnáší mnohem víc než jen promenádovat se męstem v uniformę.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //Je to špinavá a nękdy i krvavá práce. Jakmile budeš jedním z nás, bude tę čekat spousta povinností.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Ale stojí to za to. Kromę platu budeš mít také možnost stát se jednoho dne Innosovým svatým válečníkem.
};
			
///////////////////////////////////////////////////////////////////////
//	Info MartinEmpfehlung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MartinEmpfehlung		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information	 = 	DIA_Addon_Andre_MartinEmpfehlung_Info;

	description	 = 	"Podívej, mám tu doporučující dopis od vašeho skladníka.";
};

func int DIA_Addon_Andre_MartinEmpfehlung_Condition ()
{
	if (Npc_HasItems (other,ItWr_Martin_MilizEmpfehlung_Addon))
	&& (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Koukni, mám tu doporučující dopis od jednoho z vašich skladníků.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(nevęâícnę) Cože? Ukaž mi ho.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(ohromenę) No tohle...! To ti muselo dát poâádnou práci. Martin nęco takového hned tak nękomu nedá.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //No dobâe, pâesvędčil jsi mę. Když se za tebe pâimluvil i Martin, pâijmu tę mezi nás. Dej mi vędęt, až budeš pâipravený.
	Andre_Knows_MartinEmpfehlung = TRUE;
};

// *********************************************************
//						Alternative			//e2
// *********************************************************
instance DIA_Andre_Alternative (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_Alternative_Condition;
	information	= DIA_Andre_Alternative_Info;
	permanent 	= FALSE; 
	description = "Není nęjaký rychlejší způsob, jak se k vám pâidat?";
};
func int DIA_Andre_Alternative_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Alternative_Info ()
{
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Není nęjaký rychlejší způsob, jak se k vám pâidat?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Hmm (na chvíli se odmlčí) - ty to asi myslíš vážnę, co?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Dobrá, poslouchej. Mám problém. Když ho za mę vyâešíš, dohlédnu na to, abys byl pâijat do âad domobrany.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Ale je velice důležité, abys o tom nikomu neâekl ani slovo!
	
	
};

// *********************************************************
//						GuildOfThieves			//e3
// *********************************************************
instance DIA_Andre_GuildOfThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_GuildOfThieves_Condition;
	information	= DIA_Andre_GuildOfThieves_Info;
	permanent 	= FALSE; 
	description = "Co máš za problém?";
};
func int DIA_Andre_GuildOfThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};
func void DIA_Andre_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //Co máš za problém?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Poslední dobou ve męstę došlo k množství krádeží. Zatím se nám nepodaâilo nikoho chytit, ti zlodęji jsou prostę pâíliš dobâí.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Ti bastardi se vyznají. Jsem si jistý, že máme co do činęní s organizovanou bandou.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Nepâekvapilo by mę, kdyby byl tady v Khorinidu zlodęjský cech. Najdi vůdce toho gangu a sejmi ho.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Já se pak postarám o to, abys byl pâijat do domobrany - bez ohledu na to, jestli jsi občanem męsta, nebo ne.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Ale nesmíš se o naší dohodę nikomu zmínit ani slovem!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"K męstské gardę se mohu pâidat i jinak, a to tak, že vypátrám a zničím khorinidský zlodęjský cech.");
	
};

// *********************************************************
//						WhereThieves			//e4
// *********************************************************
instance DIA_Andre_WhereThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_WhereThieves_Condition;
	information	= DIA_Andre_WhereThieves_Info;
	permanent 	= FALSE; 
	description = "Kde bych męl ty zlodęje začít hledat?";
};
func int DIA_Andre_WhereThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhereThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Kde bych męl ty zlodęje začít hledat?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //Kdybych to vędęl, udęlám to sám!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Můžu ti âíct jenom tohle: Nedávno jsme obrátili celou pâístavní čtvră vzhůru nohama a nenašli jsme nic, vůbec nic.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Lidé odtamtud nejsou zrovna upovídaní, zvlášă když na sobę máš paladinské brnęní.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Ale ty nejsi odsud, nebudou k tobę tak nedůvęâiví.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Nejdâív by ses męl poptat po pâístavu. Ale buë opatrný. Jestli tamním lidem dojde, že pracuješ pro paladiny, nedozvíš se vůbec NIC!
	
	B_LogEntry (TOPIC_BecomeMIL,"S pátráním po zlodęjském cechu mohu začít v pâístavní čtvrti.");
};

// *********************************************************
//						WhatToDo			//e4
// *********************************************************
instance DIA_Andre_WhatToDo (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 3;
	condition	= DIA_Andre_WhatToDo_Condition;
	information	= DIA_Andre_WhatToDo_Info;
	permanent 	= FALSE; 
	description = "Co mám udęlat, až najdu nękterého z tęch zlodęjů?";
};
func int DIA_Andre_WhatToDo_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhatToDo_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Co mám udęlat, až najdu nękterého z tęch zlodęjů?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Pokud se bude jednat o nęjakého poskoka, pomahače nebo malou rybu, bude nejlepší, když to nebudeš hnát na ostâí nože.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Spíš pâijë za mnou a podej mi o tom zprávu. Já se pak postarám o to, aby ten chlapík skončil za mâížemi.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //Do pâímého boje by náhodou mohla zakročit męstská stráž a tęžko bys pak męl pâíležitost vysvętlovat, o co vlastnę jde.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Navíc za každýho zmetka, kterej skončí pod zámkem, dostaneš odmęnu.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Ale jestli se ti podaâí najít skrýš jejich vůdců - no - pak se boji už asi nevyhneš.
	
	B_LogEntry (TOPIC_BecomeMIL,"Pokud chytnu nękterého z pâisluhovačů zlodęjského cechu, mám ho pâedvést pâímo pâed lorda Andreho. Jestliže mám ale zničit celý cech, musím zjistit, kde se skrývají.");
};

// *********************************************************
//					Verbrecher ausliefern		//e4
// *********************************************************
	
instance DIA_Andre_Auslieferung		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	200;
	condition	 = 	DIA_Andre_Auslieferung_Condition;
	information	 = 	DIA_Andre_Auslieferung_Info;
	permanent    =  TRUE;
	description	 = 	"Pâišel jsem si vybrat odmęnu za zločince.";
};

func int DIA_Andre_Auslieferung_Condition ()
{	
	if (Rengaru_Ausgeliefert == FALSE)
	|| (Halvor_Ausgeliefert == FALSE)
	|| (Nagur_Ausgeliefert == FALSE)
	|| (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};	
};

func void DIA_Andre_Auslieferung_Info ()
{
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //Pâišel jsem si vybrat odmęnu za zločince.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Vrátím se pozdęji. (ZPĘT)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru okradl obchodníka Jora.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor prodává kradené zboží.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur zabil Baltramova posla.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar se pokouší zbavit Sarah!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sarah prodává zbranę Onarovi.",DIA_Andre_Auslieferung_Sarah);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{	
	//Rengaru in den Knast beamen
	AI_Teleport			(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengaru okradl kupce Joru. Zkusil prásknout do bot, ale chytil jsem ho.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Dobrá, mí muži ho už sebrali. V nejbližší budoucnosti už nikoho okrádat nebude.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Tady máš své peníze.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE; 
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	B_StartOtherRoutine (Rengaru,"PRISON");	
};

func void DIA_Andre_Auslieferung_Halvor()
{
	//Halvor in den Knast beamen
	AI_Teleport			(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor je pâekupník. Prodává zboží, které bandité ukradnou kupcům.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //Takže on za tím vęzí. Mí muži ho okamžitę zatknou.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //Neâekl bych, že bude dęlat nęjaké problémy. Hned ti dám tvou odmęnu.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	//Nagur in den Knast beamen
	AI_Teleport			(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur zabil Baltramova posla. Pokusil se nastrčit mę jako nového posla, aby zachytil Akilovu zásilku.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Na toho chlapíka čeká trest. Okamžitę ho nechám zavâít.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Tady máš odmęnu, kterou sis po právu zasloužil.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE; 
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	//Canthar in den Knast beamen
	AI_Teleport			(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Kupec Canthar se snaží zbavit Sarah!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sarah? Té prodavačky zbraní z tržištę?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Męl jsem jí podstrčit falešný dopis, ve kterém se tvrdí, že dodává zbranę Onarovi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Aha. Za toho parchanta ti rád vyplatím odmęnu. Jako by už byl za mâížemi.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Canthar,"KNAST"); 
	
	MIS_Canthars_KomproBrief  = LOG_FAILED;
	B_CheckLog ();
	
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};
func void DIA_Andre_Auslieferung_Sarah()
{
	//Sarah in den Knast beamen
	AI_Teleport			(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	//Canthar zum markt beamen
	AI_Teleport			(Canthar,"NW_CITY_SARAH"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sarah prodává zbranę Onarovi.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sarah? Ta prodavačka zbraní z tržištę? Máš nęjaký důkaz?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //Má u sebe dopis, ve kterém jsou podrobnosti o dodávce zbraní na farmu.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //To jí neprojde. Nechám ji zatknout.
	
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Sarah,"KNAST"); 
	
	B_StartOtherRoutine (Canthar,"MARKTSTAND"); 
	
	Sarah_Ausgeliefert = TRUE;
	
	MIS_Canthars_KomproBrief  = LOG_SUCCESS;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

// *********************************************************
//					Diebesgilde Running
// *********************************************************
	
instance DIA_Andre_DGRunning (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	4;
	condition	 = 	DIA_Andre_DGRunning_Condition;
	information	 = 	DIA_Andre_DGRunning_Info;
	permanent    =  TRUE;
	description	 = 	"Co se týče toho cechu zlodęjů...";
};

func int DIA_Andre_DGRunning_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info ()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Co se týče toho cechu zlodęjů...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Můžeš to pustit z hlavy. Poslal jsem dolů do stok pár chlapů.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //Cech zlodęjů je už jen smutná kapitola v historii tohoto męsta.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		
		if (MIS_CassiaKelche == LOG_RUNNING)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if (MIS_RamirezSextant == LOG_RUNNING)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //Ano?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "Pracuji na tom...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Všechny jsem je dostal!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Našel jsem úkryt cechu zlodęjů!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Pracuji na tom.
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Dobrá. Dám ti na splnęní toho úkolu trochu víc času.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Dobrá! Dej mi o všem vędęt.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //Našel jsem úkryt cechu zlodęjů!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Kde?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //Ve stokách pod męstem.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Cože? Všechny kanály jsme zapečetili.
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Zdá se, že to jim nebrání v tom, aby si dole v klidu vegetovali.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Zneškodnil jsi ty kriminálníky?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //Všechny jsem je dostal!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Prokázal jsi męstu cennou službu.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Jestli máš poâád zájem o místo v domobranę, stačí âíct.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Splnil jsi svou povinnost, jak se sluší na Innosova služebníka a královského vojáka.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Právem ti náleží odmęna za ty bandity. Tady je.
	B_GiveInvItems (self, other, itmi_gold, (Kopfgeld*3));
	
	Info_ClearChoices(DIA_Andre_DGRunning);
};
	
// *********************************************************
//						JOIN Miliz			
// *********************************************************
instance DIA_Andre_JOIN	(C_INFO) 
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	100;
	condition	 = 	DIA_Andre_JOIN_Condition;
	information	 = 	DIA_Andre_JOIN_Info;
	permanent    =  TRUE;
	description	 = 	"Jsem pâipraven pâidat se k domobranę!";
};

func int DIA_Andre_JOIN_Condition ()
{
	if (hero.guild == GIL_NONE) 
	&& (Npc_KnowsInfo (other,  DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info ()
{
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Jsem pâipraven pâidat se k domobranę!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Skladník Martin pro tebe nejen hlasuje, ale také se za tebe pâimluvil. A to samotné mi stačí.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Dodržím svou část úmluvy a pâijímám tę do âad domobrany, ačkoliv nejsi občanem męsta.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Ale nikomu na svętę o tom neâekni ani slovo! Čím ménę lidí bude o této výjimce vędęt, tím ménę to budu muset pozdęji obhajovat.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //Takže ses stal občanem Khorinidu?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Kováâ mę pâijal za učedníka.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? Znám ho. Pracuje pro nás. Je to dobrý chlap.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Jsem alchymistův učeŕ!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //V domobranę nemáme zrovna moc učenců. Možná by se nám mohly tvoje schopnosti hodit.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Moc toho o tom alchymistovi nevím. Ale lidé âíkají, že to je čestný muž.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Výrobce luků Bosper mę vzal do učení.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //Takže víš také nęco o životę v divočinę? To je dobâe, protože členové domobrany plní i úkoly mimo okruh męstských hradeb.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Lidé, kteâí se vyznají v divočinę, se nám budou určitę hodit.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //A ten výrobce luků je pro męsto velice významný človęk.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Pokud pro tebe bude hlasovat, nestojí tvému pâijetí do domobrany nic v cestę.
		
		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Navíc se ti podaâilo zbavit nás toho cechu zlodęjů. Už jen za to bych tę do domobrany pâijal.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //To je možné - ale stále nejsi občanem našeho męsta a já mám své rozkazy.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Můžeš se k nám pâidat, jestli chceš. Ale tvé rozhodnutí bude konečné.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Jakmile na sobę budeš mít zbroj domobrany, nebudeš si ji moci jen tak sejmout a pâestat patâit mezi nás.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Jsi pâipraven společnę s námi bojovat za Innose a krále?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Ještę si nejsem tak úplnę jistý.",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Jsem pâipraven!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Jsem pâipraven!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //Tak budiž. Vítej v domobranę.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Tady máš svou zbroj.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Nos ji hrdę a důstojnę.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Ještę si nejsem tak úplnę jistý.
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Pokud máš stále nęjaké pochyby o svém rozhodnutí, nemohu tę pâijmout do âad domobrany.
	
	Info_ClearChoices (DIA_Andre_JOIN);
};
	
// *********************************************************
//					Endlich zu Lord Hagen?
// *********************************************************

instance DIA_Andre_LORDHAGEN		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_LORDHAGEN_Condition;
	information	 = 	DIA_Andre_LORDHAGEN_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohu teë konečnę jít za lordem Hagenem?";
};
func int DIA_Andre_LORDHAGEN_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_LORDHAGEN_Info ()
{
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Mohu teë konečnę jít za lordem Hagenem?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Nyní jsi ve službách paladinů. Vpustí tę dovnitâ. Ale ve vlastním zájmu bys męl mít na srdci nęco opravdu důležitého.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //To také mám, nemęj obavy.
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Męj na pamęti, že budeš mluvit s velitelem paladinů. Chovej se podle toho. Nebudeš tam stát jen za sebe, ale za celou domobranu.
};
// *********************************************************
//				Waffe
// *********************************************************
instance DIA_Andre_Waffe		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Waffe_Condition;
	information	 = 	DIA_Andre_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dostanu také nęjakou zbraŕ?";
};
func int DIA_Andre_Waffe_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Dostanu také nęjakou zbraŕ?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Samozâejmę. Obvykle se o to stará Peck. Ale zdá se mi, že jsem ho už nęjakou dobu nevidęl.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Zjisti, kde se zašívá, a pâiveë ho sem. Pak od nęj nafasuješ zbraŕ.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //A pokud bys chtęl spát, můžeš si lehnout na nękterou z postelí v kasárnách.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck se toulá nękde po męstę. Pokud ho pâivedu zpátky do kasáren, mohu od nęj dostat zbraŕ.");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_PECK_Condition;
	information	 = 	DIA_Andre_FOUND_PECK_Info;
	permanent	 =  FALSE;
	description	 = 	"Podaâilo se mi najít Pecka.";
};

func int DIA_Andre_FOUND_PECK_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Peck_FOUND_PECK)
	&& (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_IsDead (Peck) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //Podaâilo se mi najít Pecka.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Ano, už je zpęt na svém místę a plní své povinnosti. Kde jsi ho našel?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Zkâížil mi cestu...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"U Červené lucerničky...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Narazil jsem na nęj ve męstę.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //Dobrá, tak za ním zajdi a vyzvedni si zbraŕ.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //Byl u "Červené lucerny".
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //Aha, takže místo aby se staral o své povinnosti, vysedává s dęvčaty.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Asi s ním budu muset prohodit pár slov.
	
	B_GivePlayerXP 		(XP_FoundPeck*2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};




// ################################################
// ###											###
// 				_NACH_  MILIZ-AUFNAHME
// ###											###
// ################################################

FUNC VOID B_AndreSold ()
{
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Tady máš svůj plat.
	B_GiveInvItems (self, other, itmi_Gold, Andre_Sold); 
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIRSTMISSION		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIRSTMISSION_Condition;
	information	 = 	DIA_Andre_FIRSTMISSION_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Máš pro mę nęjaký úkol?";
};
func int DIA_Andre_FIRSTMISSION_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIRSTMISSION_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Máš pro mę nęjaký úkol?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //V poslední dobę se prý ve męstę obchoduje s trávou z bažin.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Nemůžeme dopustit, aby se to tady nęjak rozmohlo.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Jinak by každý začal kouâit a nikdo by nebyl schopný pracovat, natož udržet zbraŕ.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //To si nemůžeme dovolit zvlášă teë, když hrozí útok skâetů nebo žoldáků.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Mám podezâení, že za tím jsou ti žoldáci. Vsadím se, že to oni pâináší to svinstvo do męsta.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Co je na práci?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, jeden z našich mužů, v pâístavní krčmę zaslechl, že nękam do pâístavní čtvrti męl dorazit balík trávy z bažin.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Porozhlédni se kolem a ten balík mi dones.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"Do pâístavu dorazil balík trávy z bažin - Mortis se o tom dozvędęl v místní hospodę. Já mám tu zásilku najít a donést lordu Andreovi.");
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_STUFF
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_STUFF		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_STUFF_Condition;
	information	 = 	DIA_Andre_FOUND_STUFF_Info;
	permanent	 =  TRUE;
	description	 = 	"Co se toho balíku týče...";
};
func int DIA_Andre_FOUND_STUFF_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_STUFF_Info ()
{
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //Co se toho balíku týče...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //Našel jsi ho?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Ano, tady je.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Hodil jsem ho do pâístavní zátoky.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Zatím ne.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Ano, tady je.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Dobrá práce. Budeme tu trávu dobâe stâežit.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Hodil jsem ho do pâístavní zátoky.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //Vážnę? No, hlavnę že už nemůže padnout do špatných rukou.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP (XP_Warehouse_Super);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
};	
	

///////////////////////////////////////////////////////////////////////
//	Info FIND_DEALER
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIND_DEALER		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIND_DEALER_Condition;
	information	 = 	DIA_Andre_FIND_DEALER_Info;
	permanent	 =  FALSE;
	description	 = 	"Máš pro mę nęjakou další práci?";
};

func int DIA_Andre_FIND_DEALER_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	&& (Npc_IsDead (Borka)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIND_DEALER_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //Máš pro mę nęjakou další práci?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Stáhnul jsi ten balík trávy z obęhu - to je dobâe.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Rád bych ale zjistil, kdo to rozšiâuje mezi lidi.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //Musí to být nękdo z pâístavní čtvrti.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Kdyby do męsta nękdo pravidelnę pâicházel zvenčí, už bychom ho dávno chytili.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Co pâesnę mám udęlat?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Najdi toho pâekupníka a nech si od nęj nęjakou tu trávu prodat. Nebude to snadné, ale jinak ho nemůžeme zatknout.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Promluv si s Mortisem, vyzná se v pâístavní čtvrti. Možná by ti mohl nęjak pomoci.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Mám najít chlápka, co v pâístavišti kšeftuje s trávou z bažin. Musím ho pâimęt, aby mi nęco ze svých zásob prodal. Mortis mi v tom může pomoci.");
};
///////////////////////////////////////////////////////////////////////
//	Info REDLIGHT_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_REDLIGHT_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information	 = 	DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent	 =  TRUE;
	description	 = 	"Co se týká té trávy...";
};
func int DIA_Andre_REDLIGHT_SUCCESS_Condition ()
{
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_REDLIGHT_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //Co se té trávy týče...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //Nemyslím, že bychom se v pâístavní čtvrti nęco dozvędęli.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Ne, když je ten vyhazovač mrtvý.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Ta dívka z Červené lucerny, Nadja, je mrtvá. Musela to být nęjaká podivná nehoda.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //Nebyl jsi dostatečnę opatrný.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //Vím, kdo tu trávu ve męstę prodává. Je to Borka, dveâník od Červené lucerny.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Vážnę? Máme nęjaký důkaz?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Trochu té trávy mi prodal.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Výbornę, to nám stačí. Okamžitę ho nechám zatknout.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //Ještę na tom pracuju.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Dobrá, a nezapomeŕ, že musíš toho chlapíka pâesvędčit, aby s tebou uzavâel obchod.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info HilfBauerLobart
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_HILFBAUERLOBART		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 =  3;
	condition	 = 	DIA_Andre_HILFBAUERLOBART_Condition;
	information	 = 	DIA_Andre_HILFBAUERLOBART_Info;
	description	 = 	"Máš pro mę nęjaký další úkol?";
};
func int DIA_Andre_HILFBAUERLOBART_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_HILFBAUERLOBART_Info ()
{
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Máš pro mę nęjaký další úkol?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Farmáâ Lobart má na svých polích nęjaké problémy.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Pokud mu pomůžeme, upevníme jeho vztahy s męstem. Zajdi tedy za ním a zjisti, co se dęje.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre mę poslal na Lobartův statek. Mám mu pomoci ho dát znovu do poâádku."); 
	
	
	MIS_AndreHelpLobart = LOG_RUNNING;

	Wld_InsertNpc		(Lobarts_Giant_Bug1, 			"NW_FARM1_FIELD_06"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug2, 			"NW_FARM1_FIELD_06");
	
	Wld_InsertNpc		(Lobarts_Giant_Bug3, 			"NW_FARM1_FIELD_05"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug4, 			"NW_FARM1_FIELD_05"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug5, 			"NW_FARM1_FIELD_04"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug6, 			"NW_FARM1_FIELD_04"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug7, 			"NW_FARM1_FIELD_03"); 
	
	
	B_StartOtherRoutine (Vino,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer2,"BUGSTHERE");
	
	AI_StopProcessInfos (self);	
};

///////////////////////////////////////////////////////////////////////
//	Info LOBART_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_LOBART_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_LOBART_SUCCESS_Condition;
	information	 = 	DIA_Andre_LOBART_SUCCESS_Info;
	description	 = 	"Pomohl jsem Lobartovi.";
};
func int DIA_Andre_LOBART_SUCCESS_Condition ()
{	
	if (MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_LOBART_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //Pomohl jsem Lobartovi.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Výbornę. Pokud bude Lobart spokojený, bude męstu i nadále prodávat své tuâíny.
	B_GivePlayerXP (XP_LobartBugs);
	B_AndreSold ();
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople		(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople_Condition;
	information	= DIA_Addon_Andre_MissingPeople_Info;

	description	= "A co ti zmizelí lidé?";
};
func int DIA_Addon_Andre_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //Co je s tęmi pohâešovanými lidmi?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //Co s nimi?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Nemęli bychom je zkusit najít?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen mi nakázal chránit męsto a pâilehlé statky.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //To znamená, že se staráme o lidi, kteâí jsou ještę TADY.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //V noci stâeží ulice domobrana. Víc dęlat nemohu.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //A TY by sis męl taky hledęt hlavnę úkolů, které jsem ti zadal, jasné?
	
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople2	(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople2_Condition;
	information	= DIA_Addon_Andre_MissingPeople2_Info;

	description	= "K tęm zmizelým lidem...";
};
func int DIA_Addon_Andre_MissingPeople2_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild != GIL_MIL)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //Co se týče tęch zmizelých lidí...
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //S tím už mi dej POKOJ! Mám jiné starosti.
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_ReturnedMissingPeople		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Info;

	description	 = 	"Zachránil jsem pár pohâešovaných lidí.";
};

func int DIA_Addon_Andre_ReturnedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	&& (MIS_Addon_Andre_MissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //Nękteré z tęch pohâešovaných jsem osvobodil.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //A já si âíkal, kde jsi sakra byl tak dlouho!
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Jsi členem domobrany! A k ničemu takovému jsi nemęl rozkazy!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Ale...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Kolik lidí jsi našel?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //Všechny, kdo zatím pâežili.
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //VŠECHNY?! Já... Ehm...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //...jsem na tebe hrdý! A jsem rád, že ses pâidal právę k nám!
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //To byl takâka hrdinský čin.

	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Andre_MissingPeople);
};



//##########################################
//##
//##	Kapitel 3
//##
//##########################################


func void B_Andre_GotoLordHagen()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Męl bys jít pâímo za ním.
};

// *********************************************************
// 						BerichtDrachen
// *********************************************************

instance DIA_Andre_BerichtDrachen		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachen_Condition;
	information	 = 	DIA_Andre_BerichtDrachen_Info;
	permanent	 =	FALSE;
	description	 = 	"Byl jsem v Hornickém údolí a vidęl jsem draky!";
};
func int DIA_Andre_BerichtDrachen_Condition ()
{	
	if (EnterOW_Kapitel2 == TRUE)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachen_Info ()
{
	//AI_Output (other, self,"DIA_Andre_Add_15_12"); //Lord Hagen hat mich auf eine Mission ins Minental geschickt! Ich soll direkt aufbrechen.
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //Byl jsem v Hornickém údolí a vidęl jsem draky!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //Mám dopis od velitele Garonda, který má slova potvrzuje.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //To bude lorda Hagena zajímat!
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_BennetInPrison		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_BennetInPrison_Condition;
	information	 = 	DIA_Andre_BennetInPrison_Info;
	permanent	 =	TRUE;
	description	 = 	"A co Bennet, ten kováâ?";
};
func int DIA_Andre_BennetInPrison_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_BennetInPrison_Info ()
{
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //A co Bennet, ten kováâ?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Myslíš toho žoldáka? Sedí ve vęzení, kam patâí.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Mohu s ním mluvit?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Jistę, jak je libo. Ale pokud se pokusíš pomoci mu k útęku, skončíš tam také.
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_Cornelius_Liar		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Cornelius_Liar_Condition;
	information	 = 	DIA_Andre_Cornelius_Liar_Info;
	permanent	 =	TRUE;
	description	 = 	"Myslím, že Cornelius lže.";
};
func int DIA_Andre_Cornelius_Liar_Condition ()
{	
	if (Cornelius_ThreatenByMilSC == TRUE)
	&& (CorneliusFlee != TRUE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Cornelius_Liar_Info ()
{
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Myslím, že Cornelius lže.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Jsi si jistý?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Ne.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Ano.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //Ne.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //V tom pâípadę bys nemęl své podezâení tak zeširoka roztrubovat.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius je vlivný muž. Mohl by ti udęlat ze života peklo, kdyby chtęl.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Pokud nemáš žádný důkaz, nemohu ti pomoci.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Ano.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Co za důkaz máš?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //Četl jsem jeho deník! Podplatili ho. Všechno je jen snůška lží.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Pokud to je skutečnę tak, musíš jít okamžitę za lordem Hagenem.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Ukaž mu ten deník. On už se postará o zbytek.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ehm, no, myslím...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Potâebuji důkaz, ne podezâení. Sežeŕ důkaz, pak pro tebe budu moci nęco udęlat.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //Do té doby by sis męl radęji dávat pozor na jazyk.
	};
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

// ******************************************************
//						Als Paladin
// ******************************************************

instance DIA_Andre_Paladin		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Paladin_Condition;
	information	 = 	DIA_Andre_Paladin_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};
func int DIA_Andre_Paladin_Condition ()
{	
	if (other.guild == GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladin_Info ()
{
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //Takže nyní jsi paladin! Gratuluji!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //Už od začátku jsem si myslel, že nezůstaneš u domobrany dlouho.
};

// ******************************************************
//						PERM
// ******************************************************

instance DIA_Andre_PERM		(C_INFO)
{
	npc			 = Mil_311_Andre;
	nr 			 = 100;
	condition	 = DIA_Andre_PERM_Condition;
	information	 = DIA_Andre_PERM_Info;
	permanent	 = TRUE;
	description	 = "Jak to vypadá ve męstę?";
};
func int DIA_Andre_PERM_Condition ()
{	
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_PERM_Info ()
{
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Jak to vypadá ve męstę?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Všechno je pod kontrolou.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Pokračuj ve svém poslání.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //Od této chvíle se hlásíš pâímo lordu Hagenovi. Bęž si s ním promluvit.
	};
};


// ###################
//		  Kap 5
// ###################

// *********************************************************
// 						BerichtDrachenTot
// *********************************************************

instance DIA_Andre_BerichtDrachenTot		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachenTot_Condition;
	information	 = 	DIA_Andre_BerichtDrachenTot_Info;
	permanent	 =	FALSE;
	description	 = 	"Pobil jsem všechny draky v Hornickém údolí!";
};
func int DIA_Andre_BerichtDrachenTot_Condition ()
{	
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachenTot_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //Pobil jsem všechny draky v Hornickém údolí!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Pokud to je pravda, musíš o tom âíct lordu Hagenovi.
	B_Andre_GotoLordHagen();
};

// *********************************************************
// 						BerichtTorAuf
// *********************************************************

instance DIA_Andre_BerichtTorAuf (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtTorAuf_Condition;
	information	 = 	DIA_Andre_BerichtTorAuf_Info;
	permanent	 =	FALSE;
	description	 = 	"Na hrad v Hornickém údolí zaútočili skâeti!";
};
func int DIA_Andre_BerichtTorAuf_Condition ()
{	
	if (Kapitel == 5)
	&& (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtTorAuf_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Na hrad v Hornickém údolí zaútočili skâeti!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //Ne! O tom se musí dozvędęt lord Hagen.
	B_Andre_GotoLordHagen();
};






















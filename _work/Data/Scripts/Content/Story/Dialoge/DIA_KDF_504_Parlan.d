///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap1
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ***************
// B_Parlan_Hammer
// ***************

var int Parlan_Hammer; //damit es nur EINMAL kommt

func void B_Parlan_HAMMER()
{
	AI_Output (self, other, "DIA_Parlan_HAMMER_05_00"); //(pâísnę) Počkej chvíli, synu.
	AI_Output (self, other, "DIA_Parlan_HAMMER_05_01"); //Âíká se, že ze svatynę 'zmizel' cenný artefakt.
	AI_Output (self, other, "DIA_Parlan_HAMMER_05_02"); //Ani o tom nechci slyšet nic dalšího - pâedpokládám, že se vrátí na své místo.
	
	Parlan_Hammer = TRUE;
};


// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Parlan_PMSchulden (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 1;
	condition   = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Parlan_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Parlan_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Parlan_PMSchulden_Info()
{
					// ------ Hammer genommen ------
					if (Parlan_Hammer == FALSE)
					&& (Hammer_Taken == TRUE) 
					&& (other.guild == GIL_NOV)
					&& (Npc_IsDead (Garwig) == FALSE)
					{
						B_Parlan_HAMMER();
					};
	
	AI_Output (self, other, "DIA_Parlan_PMSchulden_05_00"); //Porušil jsi zákon našeho společenství.

	if (B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Parlan_PMSchulden_05_01"); //A i když jsi už byl obvinęn, provinil ses ještę víc.
		
		if (Parlan_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_02"); //Tvá vina může být smyta jen vętším darem klášteru.
			AI_Output (other, self, "DIA_Parlan_PMAdd_15_00"); //Kolik?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter);
		
			if (diff > 0)
			{
				Parlan_Schulden = Parlan_Schulden + (diff * 50);
			};
				
			if (Parlan_Schulden > 1000)	{	Parlan_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Parlan_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_03"); //Kdo si myslíš, že jsi? Modli se k Innosovi za odpuštęní svých skutků!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Parlan_PMSchulden_05_04"); //Tvoje situace se zmęnila.
		
		if (Parlan_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_05"); //Nejsou už žádní svędkové tvé vraždy!
		};
		
		if (Parlan_LastPetzCrime == CRIME_THEFT)
		|| ( (Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_06"); //Nikdo už nebude svędčit, že tę vidęl krást!
		};
		
		if (Parlan_LastPetzCrime == CRIME_ATTACK)
		|| ( (Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_07"); //Už tę nikdo neobviŕuje z toho, že by ses pral!
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_08"); //Všechna obvinęní proti tobę byla stažena!
		};
		
		AI_Output (self, other, "DIA_Parlan_PMSchulden_05_09"); //Možná se ti podaâí mę ošálit - ale Innos zná tvé pravé skutky!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_10"); //Tvé hâíchy ti byly odpuštęny.
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_11"); //A snaž se, aby to tak také zůstalo!
	
			Parlan_Schulden			= 0;
			Parlan_LastPetzCounter 	= 0;
			Parlan_LastPetzCrime	= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_12"); //Zaplatíš pokutu - taková je vůle Innosova!
			B_Say_Gold (self, other, Parlan_Schulden);
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_13"); //Osvoboë se od své viny!
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Parlan_PMSchulden);
		Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
		Info_AddChoice		(DIA_Parlan_PMSchulden,"Nemám dost penęz!",DIA_Parlan_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Parlan_PMSchulden,"Kolik že to bylo?",DIA_Parlan_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
		{
			Info_AddChoice 	(DIA_Parlan_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Parlan_PMSchulden_HowMuchAgain_15_00"); //Kolik že to bylo?
	B_Say_Gold (self, other, Parlan_Schulden);

	Info_ClearChoices  	(DIA_Parlan_PMSchulden);
	Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
	Info_AddChoice		(DIA_Parlan_PMSchulden,"Nemám dost penęz!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Parlan_PMSchulden,"Kolik že to bylo?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
	{
		Info_AddChoice 	(DIA_Parlan_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Parlan_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Parlan_PETZMASTER   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 1;
	condition   = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Parlan_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parlan_PETZMASTER_Info()
{
					// ------ Hammer genommen ------
					if (Parlan_Hammer == FALSE)
					&& (Hammer_Taken == TRUE) 
					&& (other.guild == GIL_NOV)
					&& (Npc_IsDead (Garwig) == FALSE)
					{
						B_Parlan_HAMMER();
					};
	
	Parlan_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Parlan noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_00"); //Ještę jsme spolu nemluvili, a už na sobę máš bâemeno viny!
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_01"); //Provinil ses nejhorším ze všech zločinů! Vraždou!
	
		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Parlan_Schulden = Parlan_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_02"); //A zatížil ses ještę další vinou!
		};
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_03"); //Kdyby záleželo na mnę, na místę bych tę odsoudil, vrahu!
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_04"); //Ale když za svůj zločin zaplatíš pokutu, zbavím tę tvé viny.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_05"); //Krádež je porušením zákonů kláštera!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_06"); //Kromę toho jsi porušil i další zákony.
		};
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_07"); //Tyto prohâešky musí být potrestány. Tak zní Innosovo pâikázání.
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_08"); //Zaplatíš klášteru pâimęâenou pokutu.
		
		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_09"); //V klášteâe netolerujeme rvačky. Takové chování se protiví našim zákonům.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_10"); //A proč zabíjíš naše ovce?
		};
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_11"); //Žijeme tady podle pâikázání. A ta se vztahují i na tebe.
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_12"); //Za svůj zločin musíš dát klášteru dar.
		
		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_13"); //Zabil jsi naše ovce. Za to zaplatíš odškodné!
		
		
		Parlan_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Parlan_PETZMASTER_15_14"); //Kolik?
	
	if (Parlan_Schulden > 1000)	{	Parlan_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Parlan_Schulden);
	
	Info_ClearChoices  	(DIA_Parlan_PMSchulden);
	Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
	Info_AddChoice		(DIA_Parlan_PETZMASTER,"Nemám dost penęz!",DIA_Parlan_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
	{
		Info_AddChoice 	(DIA_Parlan_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Parlan_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Parlan_Schulden);
	AI_Output (self, other, "DIA_Parlan_PETZMASTER_PayNow_05_01"); //Pâijímám tvůj dar. Tvé hâíchy jsou odpuštęny. Nechă ti Innos dá moudrost, abys stejné chyby již víckrát neopakoval.

	B_GrantAbsolution (LOC_MONASTERY);
	
	Parlan_Schulden			= 0;
	Parlan_LastPetzCounter 	= 0;
	Parlan_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Parlan_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
	Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Parlan_PETZMASTER_PayLater_15_00"); //Nemám dost penęz!
	AI_Output (self, other, "DIA_Parlan_PETZMASTER_PayLater_05_01"); //Na to jsi męl myslet, než ses svých prohâešků dopustil.
	AI_Output (self, other, "DIA_Parlan_PETZMASTER_PayLater_05_02"); //Možná se z toho ponaučíš. Nedęlej žádné další potíže, nebudeš muset platit.
	
	Parlan_LastPetzCounter 		= B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	Info_ClearChoices (DIA_Parlan_PMSchulden);
	Info_ClearChoices (DIA_Parlan_PETZMASTER);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_WELCOME		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 =  1;
	condition	 = 	DIA_Parlan_WELCOME_Condition;
	information	 = 	DIA_Parlan_WELCOME_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Parlan_WELCOME_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

func void B_DIA_Parlan_WELCOME_GoForTribute ()
{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_09"); //Až to udęláš, promluvíme si o tvé práci tady v klášteâe.
};
func void B_DIA_Parlan_WELCOME_BringTribute2Gorax ()
{
			AI_Output (self, other, "DIA_Addon_Parlan_WELCOME_05_00"); //Svou platbu hned zanes Goraxovi do kláštera. Dál už to zaâídí on.
};

func void DIA_Parlan_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_00"); //Vítej, novici, já jsem Parlan.
	AI_Output (other, self, "DIA_Parlan_WELCOME_15_01"); //Já jsem...
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_02"); //(pâeruší tę)... NOVIC. Není důležité, kdo jsi byl pâedtím. Teë jsi Innosův služebník. To je vše, na čem záleží.
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_03"); //A jakmile budeš pâijat do bratrstva ohnę, budou všechny tvé pâedchozí prohâešky odpuštęny.
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_04"); //Nechă Innos požehná tomuto muži, který zasvętí svůj život jeho službę, a smyje z nęj všechny jeho hâíchy.
	AI_Output (other, self, "DIA_Parlan_WELCOME_15_05"); //A teë?
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_06"); //Nejprve budeš plnit své povinnosti novice. Budeš pracovat a sloužit pro blaho bratrstva.
	
	B_GrantAbsolution (LOC_ALL);
	Snd_Play ("LEVELUP");
	
		Log_CreateTopic (Topic_Gemeinschaft,LOG_MISSION);
		Log_SetTopicStatus (Topic_Gemeinschaft,LOG_RUNNING);
		B_LogEntry (Topic_Gemeinschaft, "Jako novic mám povinnost plnit úkoly, které poslouží celému společenství.");
	
	if (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)//ADDON
	{
		if (Liesel_Giveaway ==  FALSE)
		{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_07"); //Nejprve však doveë svou ovci k Opolosovi, postará se o ni.
		};
		if (DIA_Gorax_GOLD_perm == FALSE) 
		{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_08"); //Své zlato můžeš dát Goraxovi, našemu správci. Najdeš ho ve stáčírnę vína.
			B_DIA_Parlan_WELCOME_GoForTribute ();		
		};
	}
	//ADDON>
	else
	{
		if (DIA_Gorax_GOLD_perm == FALSE) 
		{
			B_DIA_Parlan_WELCOME_BringTribute2Gorax ();
			B_DIA_Parlan_WELCOME_GoForTribute ();
		};		
	};
	//ADDON<
};

///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Auge		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_Auge_Condition;
	information	 = 	DIA_Parlan_Auge_Info;
	permanent 	 =  FALSE; 
	description	 =  "Hledám Innosovo oko.";
};
func int DIA_Parlan_Auge_Condition ()
{	
	if  (Kapitel <= 2)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Auge_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Auge_15_00"); //Hledám Innosovo oko.
	AI_Output (self, other, "DIA_Parlan_Auge_05_01"); //Nevím, kdo ti o nęm âekl, ale k tomuto posvátnému artefaktu nemá nikdo pâístup.
	AI_Output (other, self, "DIA_Parlan_Auge_15_02"); //Kde je Innosovo oko uschováno?
	AI_Output (self, other, "DIA_Parlan_Auge_05_03"); //Čím ménę lidí toto tajemství zná, tím lépe. Hledej ho - a nenajdeš jej.
};


///////////////////////////////////////////////////////////////////////
//	Info Amulett
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Amulett		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  3;
	condition	 = 	DIA_Parlan_Amulett_Condition;
	information	 = 	DIA_Parlan_Amulett_Info;
	permanent 	 =  FALSE; 
	description	 =  "Povęz mi nęco o Innosovę oku.";
};
func int DIA_Parlan_Amulett_Condition ()
{	
	if (Kapitel <= 2)
	&& Npc_KnowsInfo (other, DIA_Parlan_Auge)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Amulett_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Amulett_15_00"); //Âekni mi nęco o Innosovę oku.
	AI_Output (self, other, "DIA_Parlan_Amulett_05_01"); //Dobrá. Innosovo oko obsahuje část Innosovy svaté moci. Nosit tento amulet může jen JEDINÝ vyvolený Innosův služebník.
	AI_Output (self, other, "DIA_Parlan_Amulett_05_02"); //Bylo vytvoâeno, aby nás v pravý čas ochránilo pâed silami zla.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Hagen		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_Hagen_Condition;
	information	 = 	DIA_Parlan_Hagen_Info;
	permanent 	 =  FALSE; 
	description	 =  "Potâebuji si promluvit s vůdcem paladinů!";
};
func int DIA_Parlan_Hagen_Condition ()
{	
	if (Kapitel <= 2)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Hagen_15_00"); //Potâebuji si promluvit s vůdcem paladinů!
	AI_Output (self, other, "DIA_Parlan_Hagen_05_01"); //Lord Hagen novice nepâijímá - setkat se s ním mohou pouze mágové.
};
///////////////////////////////////////////////////////////////////////
//	Info WORK
/////////////////////////////////////////////////////////////////////// 
instance DIA_Parlan_WORK		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_WORK_Condition;
	information	 = 	DIA_Parlan_WORK_Info;
	permanent	 =  TRUE;
	description	 = 	"Jak mohu posloužit zdejší komunitę?";
};
//------------------------------------
var int DIA_Parlan_WORK_perm;
//------------------------------------
func int DIA_Parlan_WORK_Condition ()
{
	if  (Kapitel == 1)
	&&  (Npc_KnowsInfo(other,DIA_Parlan_KNOWSJUDGE) == FALSE) 
	&&  Npc_KnowsInfo (other,DIA_Parlan_WELCOME)
	&&  (DIA_Parlan_WORK_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_WORK_Info ()
{
	AI_Output			(other, self, "DIA_Parlan_WORK_15_00"); //Jak mohu posloužit zdejší komunitę?
	
	//HACK
	if (Liesel_Giveaway ==  FALSE)
	|| (DIA_Gorax_GOLD_perm == FALSE)
	{
		AI_Output (self, other, "DIA_Parlan_WELCOME_05_06"); //Nejprve budeš plnit své povinnosti novice. Budeš pracovat a sloužit pro blaho bratrstva.
		
		if 	(Liesel_Giveaway ==  FALSE)
		{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_07"); //Nejprve však doveë svou ovci k Opolosovi, postará se o ni.
		};
		if  (DIA_Gorax_GOLD_perm == FALSE)
		{
				//ADDON>
				if (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
				{
					B_DIA_Parlan_WELCOME_BringTribute2Gorax ();
					B_DIA_Parlan_WELCOME_GoForTribute ();
				}
				//ADDON<
				else
				{	
					AI_Output (self, other, "DIA_Parlan_WELCOME_05_08"); //Své zlato můžeš dát Goraxovi, našemu správci. Najdeš ho ve stáčírnę vína.
					AI_Output (self, other, "DIA_Parlan_WELCOME_05_09"); //Až to udęláš, promluvíme si o tvé práci tady v klášteâe.
				};
		};
		
		AI_StopProcessInfos (self);
	}
	else if Wld_IsTime (22,00,07,30)
	{
		AI_Output (self, other, "DIA_Parlan_WORK_NIGHT_05_01"); //Je čas klidu. Práce noviců začíná za rozbâesku a pokračuje až do setmęní.
		AI_Output (self, other, "DIA_Parlan_WORK_NIGHT_05_02"); //Męl by ses vyspat. Pâijë, až nadejde čas práce.
		
		AI_StopProcessInfos (self);
	} 
	else
	{
		AI_Output (self, other, "DIA_Parlan_WORK_05_03"); //Promluv si s ostatními mágy. Oni ti zadají úkoly.
		AI_Output (self, other, "DIA_Parlan_WORK_05_04"); //Já budu na tvou práci dohlížet, a až své povinnosti uspokojivę splníš, dostaneš povolení vstoupit do knihovny a studovat Innosovo učení.
		
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_RUNNING; 
		B_LogEntry (Topic_Gemeinschaft, "Když splním úkoly pro mágy, dovolí mi pak studovat v knihovnę.");
	
	};
};
///////////////////////////////////////////////////////////////////////
//	Missions Abfrage Stand der Dinge
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Stand		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	23;
	condition	 = 	DIA_Parlan_Stand_Condition;
	information	 = 	DIA_Parlan_Stand_Info;
	permanent	 =  TRUE;
	description	 = 	"Mohu vstoupit do knihovny?";
};
func int DIA_Parlan_Stand_Condition ()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Stand_Info ()
{
	Kloster_Punkte = 0;
	
	AI_Output (other, self, "DIA_Parlan_Stand_15_00"); //Mohu vstoupit do knihovny?
	
	if (MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_01"); //Sehnal jsi ohnivé kopâivy pro bratra Neorase.
		Kloster_Punkte = (Kloster_Punkte + 2);
	};
	if (MIS_Neorasrezept == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_02"); //Našel jsi recept bratra Neorase.
		Kloster_Punkte = (Kloster_Punkte + 2);
	};
	if (MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_03"); //Zdolal jsi černého vlka, který ohrožoval svatyni.
		Kloster_Punkte = (Kloster_Punkte + 1);
	};
	if (MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_04"); //Podaâilo se ti najít čtyâi novice a tím pádem i uklidit pokoje.
		Kloster_Punkte = (Kloster_Punkte + 3);
	};
	if (MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_05"); //Rozdęlil jsi jídlo mezi novice spravedlivę, pâesnę jak ti bratr Gorax nakázal.
		Kloster_Punkte = (Kloster_Punkte + 1);
	}
	else if (MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_06"); //Gorax s tebou nebyl spokojen, protože jsi jídlo nerozdęlil spravedlivę.
	};	
	if (MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_07"); //Prodal jsi víno ke Goraxovę spokojenosti.
		Kloster_Punkte = (Kloster_Punkte + 1);
	}
	else if (MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_08"); //Čím ménę toho bude âečeno o té záležitosti s vínem, tím lépe.
	};	
	
	if (Kloster_Punkte >= 8)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_09"); //Ano, už jsi pracoval dost. Nadešel čas, abys studoval Innosovo učení. Promluv si s mistrem Hyglasem v knihovnę.
		AI_Output (self, other, "DIA_Parlan_Stand_05_10"); //Zde ti dávám klíč.
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild ("Kloster02",GIL_PUBLIC);
		B_GiveInvItems (self, other, ItKe_KlosterBibliothek,1);
		
		//laufende Arbeiten im Log verschwinden lassen
		if (MIS_NeorasPflanzen == LOG_RUNNING)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if (MIS_Neorasrezept == LOG_RUNNING)
		{
			MIS_Neorasrezept = LOG_OBSOLETE;
		};
		if (MIS_IsgarothWolf == LOG_RUNNING)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if (MIS_ParlanFegen == LOG_RUNNING)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if (MIS_GoraxEssen == LOG_RUNNING)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if (MIS_GoraxWein == LOG_RUNNING)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if (MIS_MardukBeten == LOG_RUNNING)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};
		
		B_CheckLog();
		
	}
	else if (Kloster_Punkte >= 1)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_11"); //Nepracoval jsi málo, ale tvou povinností je dál sloužit společenství.
	}
	else  //0 Punkte
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_12"); //Nejprve splŕ své úkoly ve službę společenství. Až budeš se vším hotov, můžeme si o tom promluvit znovu.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	10;
	condition	 = 	DIA_Parlan_Aufgabe_Condition;
	information	 = 	DIA_Parlan_Aufgabe_Info;
	permanent	 =  FALSE;
	description	 = 	"Máš pro mę nęjaký úkol?";
};

func int DIA_Parlan_Aufgabe_Condition ()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Aufgabe_15_00"); //Máš pro mę nęjaký úkol?
	AI_Output (self, other, "DIA_Parlan_Aufgabe_05_01"); //Hmm... Ano, opravdu tady je nęco, co bys mohl pro naši komunitu udęlat.
	AI_Output (self, other, "DIA_Parlan_Aufgabe_05_02"); //Komnaty noviců by potâebovaly poâádnę zamést. Postarej se o to.
	AI_Output (other, self, "DIA_Parlan_Aufgabe_15_03"); //Ale to bude trvat vęčnę.
	AI_Output (self, other, "DIA_Parlan_Aufgabe_05_04"); //V tom pâípadę bys męl začít co nejdâív, nezdá se ti?
	
	MIS_ParlanFegen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus (Topic_ParlanFegen,LOG_RUNNING);
	B_LogEntry 	(Topic_ParlanFegen,"Mistr Parlan chce, abych zametl čtyâi cely pro novice. To potrvá celou vęčnost!"); 
};
///////////////////////////////////////////////////////////////////////
//	Info alle sind am Fegen 
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Fegen		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	3;
	condition	 = 	DIA_Parlan_Fegen_Condition;
	information	 = 	DIA_Parlan_Fegen_Info;
	permanent	 =  TRUE;
	description	 = 	"Co se tęch komnat noviců týče...";
};
//------------------------------------
var int DIA_Parlan_Fegen_permanent; 
//------------------------------------
func int DIA_Parlan_Fegen_Condition ()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	&& (DIA_Parlan_Fegen_permanent == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Fegen_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Fegen_15_00"); //Co se tęch komnat noviců týče...
	
	if (NOV_Helfer >= 4)
	{
		AI_Output (self, other, "DIA_Parlan_Fegen_05_01"); //Podaâilo se ti najít čtyâi novice, aby ti pomohli. Myslím, že se teë mohou zase vrátit ke své bęžné práci.
		AI_Output (self, other, "DIA_Parlan_Fegen_05_02"); //Dobrá práce, novici. Splnil jsi úkol, který jsem ti zadal.
		MIS_ParlanFegen = LOG_SUCCESS; 
		B_GivePlayerXP (XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;
		
		B_StartOtherRoutine (Feger1,"START");
		B_StartOtherRoutine (Feger2,"START");
		B_StartOtherRoutine (Feger3,"START");
		B_StartOtherRoutine (Babo,"START");
	}
	else 
	{
		AI_Output (self, other, "DIA_Parlan_Fegen_05_03"); //O tom není sporu - není to jednoduchý úkol. Ale s Innosovou pomocí to jistę zvládneš.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info LEARN
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_LEARN		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	23;
	condition	 = 	DIA_Parlan_LEARN_Condition;
	information	 = 	DIA_Parlan_LEARN_Info;
	permanent	 =  FALSE;
	description	 = 	"Jak se mohu naučit umęní magie?";
};

func int DIA_Parlan_LEARN_Condition ()
{
	if (Npc_KnowsInfo (hero,DIA_Parlan_Hagen))
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Parlan_LEARN_Info ()
{
	AI_Output (other, self, "DIA_Parlan_LEARN_15_00"); //Jak se mohu naučit umęní magie?
	AI_Output (self, other, "DIA_Parlan_LEARN_05_01"); //Nejsi zde proto, abys dostal dar magie - jsi zde, abys sloužil Innosovi.
	AI_Output (self, other, "DIA_Parlan_LEARN_05_02"); //Ale mohu ti ukázat, jak zvýšit svou magickou moc.
	
	B_LogEntry (Topic_KlosterTeacher,"Mistr Parlan mi pomůže vylepšit magická umęní.");
};
///////////////////////////////////////////////////////////////////////
//	Info KNOWSJUDGE
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_KNOWSJUDGE		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	23;
	condition	 = 	DIA_Parlan_KNOWSJUDGE_Condition;
	information	 = 	DIA_Parlan_KNOWSJUDGE_Info;
	permanent	 = 	FALSE;
	description	 = 	"Chtęl bych podstoupit zkoušku ohnę.";
};
func int DIA_Parlan_KNOWSJUDGE_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo (hero, DIA_Pyrokar_FIRE) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_KNOWSJUDGE_Info ()
{
	AI_Output (other, self, "DIA_Parlan_KNOWSJUDGE_15_00"); //Chtęl bych podstoupit zkoušku ohnę.
	AI_Output (self, other, "DIA_Parlan_KNOWSJUDGE_05_01"); //Cože...? Hm... (naléhavę) Myslíš to vážnę?
	AI_Output (other, self, "DIA_Parlan_KNOWSJUDGE_15_02"); //Trvám na tom.
	AI_Output (self, other, "DIA_Parlan_KNOWSJUDGE_05_03"); //Jsi výjimečný novic. Dobrá, pokud jsi rozhodnut, promluv si s mistrem Pyrokarem.
	
	B_LogEntry (TOPIC_FireContest,"Kdybych nękdy chtęl podstoupit zkoušku ohnę, musím si promluvit s mistrem Pyrokarem.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr 			 =  10;
	condition	 = 	DIA_Parlan_TEACH_MANA_Condition;
	information	 = 	DIA_Parlan_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtęl bych posílit svoji magickou moc.";
};
func int DIA_Parlan_TEACH_MANA_Condition ()
{	
	if ((other.guild == GIL_KDF)
	|| (other.guild == GIL_PAL) 
	|| (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (hero,DIA_Parlan_LEARN))
	&& (Parlan_Sends == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Parlan_TEACH_MANA_15_00"); //Chtęl bych posílit svoji magickou moc.
		
		Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
		Info_AddChoice 		(DIA_Parlan_TEACH_MANA,DIALOG_BACK,DIA_Parlan_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Parlan_TEACH_MANA_1);
		Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Parlan_TEACH_MANA_5);
};
FUNC VOID DIA_Parlan_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)  
	{
		AI_Output (self, other, "DIA_Parlan_TEACH_MANA_05_00"); //Tvá magická síla se zvýšila. Dál už ti pomoci nemohu.
		AI_Output (self, other, "DIA_Parlan_TEACH_MANA_05_01"); //Jestli se chceš učit dál, požádej Pyrokara.
		Parlan_Sends = TRUE;
	};
	
	Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
};
FUNC VOID DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
	Info_AddChoice 		(DIA_Parlan_TEACH_MANA,DIALOG_BACK,DIA_Parlan_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Parlan_TEACH_MANA_5);
};
FUNC VOID DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
	Info_AddChoice 		(DIA_Parlan_TEACH_MANA,DIALOG_BACK,DIA_Parlan_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Parlan_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info MAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_MAGE		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_MAGE_Condition;
	information	 = 	DIA_Parlan_MAGE_Info;
	permanent 	 =  FALSE; 
	important 	 =  TRUE; 
};
func int DIA_Parlan_MAGE_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Parlan_MAGE_Info ()
{
	AI_Output (self, other, "DIA_Parlan_MAGE_05_00"); //Složil jsi slib, bratâe. Vítej mezi námi.
	AI_Output (self, other, "DIA_Parlan_MAGE_05_01"); //Až budeš dostatečnę zkušený, budu tę učit v kruzích magie.
	AI_Output (self, other, "DIA_Parlan_MAGE_05_02"); //Na důkaz, že ve tvých rukou nyní dâímá moc, si vezmi tenhle runový kámen.
	
	B_GiveInvItems (self, other, Itmi_RunebLank,1);
};
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_01
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE1		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	99;
	condition	 = 	DIA_Parlan_CIRCLE1_Condition;
	information	 = 	DIA_Parlan_CIRCLE1_Info;
	permanent	 = 	TRUE;
	description	 = 	"Nauč mę první kruh magie.";
};
func int DIA_Parlan_CIRCLE1_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 0)
	{
		return TRUE;
	};
};
func void DIA_Parlan_CIRCLE1_Info ()
{
	AI_Output (other, self, "DIA_Parlan_TECH_CIRCLE1_15_00"); //Nauč mę první kruh magie.
	
	if B_TeachMagicCircle (self, other, 1)
	{
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE1_05_01"); //V prvním kruhu magie můžeš používat runy, které jsi sám vytvoâil.
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE1_05_02"); //Ke stvoâení run se budeš muset naučit kouzelné formule.
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE1_05_03"); //Každý z nás se soustâedí na jeden okruh magie. Dobâe si tedy rozmysli, jaké by ses chtęl vęnovat ty.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_02
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE2		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	99;
	condition	 = 	DIA_Parlan_CIRCLE2_Condition;
	information	 = 	DIA_Parlan_CIRCLE2_Info;
	permanent	 = 	TRUE;
	description	 = 	"Nauč mę druhý kruh magie.";
};
func int DIA_Parlan_CIRCLE2_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 1)
	{
		return TRUE;
	};
};
func void DIA_Parlan_CIRCLE2_Info ()
{
	AI_Output (other, self, "DIA_Parlan_TECH_CIRCLE2_15_00"); //Nauč mę druhý kruh magie.
	
	if (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self, other, 2)
		{
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_01"); //Vstup do druhého kruhu a nauč se ještę silnęjší magii.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_02"); //Ale męj na pamęti, že na sebe bereš zodpovędnost. Ne ke mnę nebo k Pyrokarovi - ale k Innosovi.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_03"); //On ti ukazuje smęr - cestu však tvoâí tvé skutky.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_04"); //Ještę nenadešel správný čas.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_03
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE3		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	99;
	condition	 = 	DIA_Parlan_CIRCLE3_Condition;
	information	 = 	DIA_Parlan_CIRCLE3_Info;
	permanent	 = 	TRUE;
	description	 = 	"Nauč mę tâetí kruh magie.";
};
func int DIA_Parlan_CIRCLE3_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 2)
	{
		return TRUE;
	};
};
func void DIA_Parlan_CIRCLE3_Info ()
{
	AI_Output (other, self, "DIA_Parlan_TECH_CIRCLE3_15_00"); //Nauč mę tâetí kruh magie.
	
	if (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self, other, 3)
		{
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_01"); //Ano, už nadešel ten správný čas. Vstup do tâetího kruhu magie. Nová kouzla tę již očekávají.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_02"); //Budeš je potâebovat, protože zlo se stahuje a odrazit jej může jen Innosova síla.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_03"); //Už jsem tę naučil všem kruhům, jimiž jsem tę mohl provést. Vyšší kruhy tę naučí Karas.
			
			B_LogEntry (Topic_KlosterTeacher,"Bratr Parlan mę naučil první tâi kruhy. Do dalších mę uvede bratr Karras.");
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_04"); //Ještę nenadešel pravý čas, aby ses naučil tâetí kruh.
	};
};		
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_TEACH		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	3;
	condition	 = 	DIA_Parlan_TEACH_Condition;
	information	 = 	DIA_Parlan_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Rád bych se od tebe nęčemu pâiučil (vytvoâit runy).";
};
func int DIA_Parlan_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Parlan_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	
	AI_Output (other, self, "DIA_Parlan_TEACH_15_00"); //Uč mę!
	
	Info_ClearChoices (DIA_Parlan_TEACH);
	Info_AddChoice (DIA_Parlan_TEACH,DIALOG_BACK,DIA_Parlan_TEACH_BACK);
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
	{
		Info_AddChoice 	  (DIA_Parlan_TEACH,B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightHeal)),DIA_Parlan_TEACH_LIGHT_HEAL);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_LIGHT] == FALSE)
	{
		Info_AddChoice 	  (DIA_Parlan_TEACH,B_BuildLearnString (NAME_SPL_LIGHT, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LIGHT)),DIA_Parlan_TEACH_LIGHT);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_Parlan_TEACH_WINDFIST);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_Sleep] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_Sleep, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Sleep)) ,DIA_Parlan_TEACH_Sleep);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MediumHeal)) ,DIA_Parlan_TEACH_MediumHeal);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_Fear] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_Fear, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Fear)) ,DIA_Parlan_TEACH_Fear);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
	&& (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_DestroyUndead)) ,DIA_Parlan_TEACH_DestroyUndead);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
	&& (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_FullHeal)) ,DIA_Parlan_TEACH_FullHeal);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Parlan_TEACH_05_01"); //V tuhle chvíli tę nemohu naučit žádné další formule.
	};
};
FUNC VOID DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices (DIA_Parlan_TEACH);
};
FUNC VOID DIA_Parlan_TEACH_LIGHT_HEAL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightHeal);	
};
FUNC VOID DIA_Parlan_TEACH_LIGHT()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LIGHT);	
};
FUNC VOID DIA_Parlan_TEACH_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_Parlan_TEACH_Sleep()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Sleep);	
};
FUNC VOID DIA_Parlan_TEACH_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MediumHeal);	
};
FUNC VOID DIA_Parlan_TEACH_Fear()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Fear);	
};
FUNC VOID DIA_Parlan_TEACH_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead);	
};
FUNC VOID DIA_Parlan_TEACH_FullHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FullHeal);	
};

//###########################################
//##
//##	Kapitel 2
//##
//###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//###########################################
//##
//##	Kapitel 3
//##
//###########################################

func void B_Parlan_Exit()
{
	AI_Output (self ,other,"DIA_Parlan_EXIT_05_00"); //Nechă tę Innos ochraŕuje.
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap3_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	||  (other.guild == GIL_NOV)
	||  (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info IAmParlan //Sprich nicht mit den Schmuddelnovizen ;-)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_IAmParlan   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 39;
	condition   = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Parlan_IAmParlan_Condition()
{
	if	( (Kapitel >= 3)  
	&&	  (Npc_IsInState (self, ZS_Talk))
	&&	 ((other.guild != GIL_NOV)
	&& 	  (other.guild != GIL_KDF)))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_IAmParlan_Info()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_00"); //Vidím, že ses nakonec rozhodl bojovat po našem boku. Jsem rád.
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_01"); //Bude se nám hodit každá ruka. Bęž si promluvit pâímo s Mardukem, ten zodpovídá za vás paladiny.
	}
	else
	{
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_02"); //Netuším, proč ti byl povolen vstup sem do kláštera. Jsem Parlan a zodpovídám za naše nováčky.
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_03"); //Nerad bych, abys je zdržoval od práce svými hloupými otázkami. Je to jasné?
		
		Parlan_DontTalkToNovice = LOG_RUNNING;
			
		Info_ClearChoices (DIA_Parlan_IAmParlan);
		Info_AddChoice (DIA_Parlan_IAmParlan,"Budu si dęlat, co se mi zlíbí.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice (DIA_Parlan_IAmParlan,"Jasnę.",DIA_Parlan_IAmParlan_OK);
	};
	Wld_InsertItem (ItKe_KlosterBibliothek,"NW_MONASTERY_CORRIDOR_02"); 
};

FUNC VOID DIA_Parlan_IAmParlan_MyChoice ()
{
	AI_Output (other,self ,"DIA_Parlan_IAmParlan_MyChoice_15_00"); //Budu si dęlat, co se mi zlíbí.
	AI_Output (self ,other,"DIA_Parlan_IAmParlan_MyChoice_05_01"); //Určitę je nęjaký důvod, proč tu jsi trpęn, ale všechno má své meze.
	AI_Output (self ,other,"DIA_Parlan_IAmParlan_MyChoice_05_02"); //Když budeš dęlat problémy, zaplatíš za to. Tak se drž od noviců dál.
	 
	Info_ClearChoices (DIA_Parlan_IAmParlan);
};

FUNC VOID DIA_Parlan_IAmParlan_OK()
{
	AI_Output (other,self ,"DIA_Parlan_IAmParlan_OK_15_00"); //Jasnę.
	AI_Output (self ,other,"DIA_Parlan_IAmParlan_OK_05_01"); //To doufám.

	Info_ClearChoices (DIA_Parlan_IAmParlan);
};
///////////////////////////////////////////////////////////////////////
//	Schlüssel für Bibliothek
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Bibliothek   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 40;
	condition   = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent   = FALSE;
	description = "Máš pro mę ještę nęco?";
};
FUNC INT DIA_Parlan_Bibliothek_Condition()
{
	if  (other.guild != GIL_KDF)
	&&  (Kapitel >=3)
	&&  (other.guild != GIL_SLD)
	&&  (other.guild != GIL_DJG)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Bibliothek_Info()
{
	AI_Output (other ,self,"DIA_Parlan_Bibliothek_15_00"); //Máš pro mę ještę nęco?
	AI_Output (self ,other,"DIA_Parlan_Bibliothek_05_01"); //Ano. Jakožto člen knihovny bys męl dostat klíč ke knihovnę. Najdeš tam bratry Karase a Hyglase.
	AI_Output (self ,other,"DIA_Parlan_Bibliothek_05_02"); //Pokud chceš, můžeš si tam s nimi promluvit
	
	if (other.guild != GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_03"); //Ale od noviců se drž dál!
	};
	B_GiveInvItems (self,other,ItKe_KlosterBibliothek,1);
};
///////////////////////////////////////////////////////////////////////
//	Ich wiederhole mich nicht gern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_DontDisturb   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 39;
	condition   = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Parlan_DontDisturb_Condition()
{
	if   (Parlan_DontTalkToNovice == LOG_SUCCESS)
	&& (B_GetGreatestPetzCrime(self) == CRIME_NONE)
	&&	 ((other.guild != GIL_PAL)
	||	  (other.guild != GIL_NOV)
	|| 	  (other.guild != GIL_KDF))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_DontDisturb_Info()
{
	AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_00"); //(výhrůžnę) Nerad bych se opakoval. Drž se od noviců dál.
	AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_01"); //Męli by očistit své duše fyzickou prací a pâipravit se na život v klášteâe.
	AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_02"); //(ráznę) Další vyrušování nebudu trpęt!
	
	Parlan_DontTalkToNovice = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm Kap3
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap3U4U5_PERM   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 39;
	condition   = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent   = TRUE;
	description = "Kde bych našel...";
};
FUNC INT DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3_PERM_15_00"); //Kde bych našel...
	
	Info_ClearChoices (DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,DIALOG_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"...kostel?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"...knihovnu?",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"...kapli?",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"... sklepení?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices (DIA_Parlan_Kap3U4U5_PERM);
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00"); //...kostel?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Church_05_01"); //Die Kirche ist das größte Gebäude im Kloster. Du kannst sie gar nicht übersehen.
	AI_Output (self, other, "DIA_Parlan_Add_05_00"); //Bože všemohoucí! Copak tę Innos oslepil?
	AI_Output (self, other, "DIA_Parlan_Add_05_01"); //(sarkasticky) Kdepak je kostel? Božíčku, kde by asi tak mohl být?
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00"); //...knihovnu?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Library_05_01"); //Die Bibliothek ist am Ende des Säulenganges, direkt gegenüber der Kirche.
	AI_Output (self, other, "DIA_Parlan_Add_05_02"); //Knihovna je na konci kolonády, pâímo naproti kostelu.
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00"); //...kapli?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Chapel_05_01"); //Wenn du das Kloster betrittst, findest du die Kapelle auf der halben Höhe des linken Säulenganges.
	AI_Output (self, other, "DIA_Parlan_Add_05_03"); //Kaple je místnost v polovinę kolonády nalevo. Paladinové se v ní modlí k Innosovi.
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00"); //...sklepení?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Cellar_05_01"); //Der Eingang in die Katakomben ist direkt gegenüber der Kapelle auf halber Höhe des Säulenganges.
	AI_Output (self, other, "DIA_Parlan_Add_05_04"); //Vstup do sklepení je v polovinę kolonády napravo.
};


//###########################################
//##
//##	Kapitel 4
//##
//###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap4_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	||  (other.guild == GIL_NOV)
	||  (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	
	AI_StopProcessInfos (self);
};


//###########################################
//##
//##	Kapitel 5
//##
//###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap5_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	||  (other.guild == GIL_NOV)
	||  (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	
	AI_StopProcessInfos (self);
};













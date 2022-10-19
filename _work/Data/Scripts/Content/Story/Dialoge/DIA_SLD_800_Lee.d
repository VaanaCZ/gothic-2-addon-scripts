// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lee_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 999;
	condition   = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lee_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// **************
// B_Lee_Teleport
// **************

var int Lee_Teleport; //damit es nur EINMAL kommt
// ------------------

func void B_Lee_Teleport()
{
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Aaa... Dobrze, ¿e jesteœ.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Co siê sta³o?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Zobacz, co znalaz³em w starej kaplicy.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //To magiczna runa. Jeœli siê nie mylê, przeniesie ciê z powrotem na tê farmê.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Pomyœla³em, ¿e mo¿e ci siê przydaæ.
	
	Lee_Teleport = TRUE;
};


// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Lee_PMSchulden (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Lee_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lee_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_PMSchulden_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Masz pieni¹dze dla Onara?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Ostrzega³em ciê, ¿ebyœ nie robi³ nic g³upiego.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar dowiedzia³ siê, ¿e trochê w miêdzyczasie nabroi³eœ.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Teraz chce wiêcej pieniêdzy.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //Ile?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Lee_LastPetzCounter);
		
			if (diff > 0)
			{
				Lee_Schulden = Lee_Schulden + (diff * 50);
			};
		
			if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Lee_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Myœla³em, ¿e jesteœ m¹drzejszy.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //No to mam dla ciebie dobr¹ wiadomoœæ.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Wygl¹da na to, ¿e nie uchowa³ siê ¿aden œwiadek morderstwa.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nikt nie chce ju¿ zeznawaæ, ¿e widzia³ ciê podczas kradzie¿y.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Nie ma œwiadków, którzy WIDZIELI, jak pobi³eœ tego wieœniaka.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Wygl¹da na to, ¿e wszystkie zarzuty wobec ciebie zosta³y wycofane.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //Jest to jakiœ sposób na wypl¹tanie siê z tarapatów.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Tak czy siak - nie musisz ju¿ nic p³aciæ.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Tylko na przysz³oœæ lepiej uwa¿aj!
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Jedno jest pewne: i tak musisz zap³aciæ grzywnê.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //No i co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Nie mam dostatecznie du¿o z³ota!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Ile to mia³o byæ?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Ile mam zap³aciæ?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Nie mam dostatecznie du¿o z³ota!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Ile to mia³o byæ?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Lee_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Lee_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Lee_PETZMASTER   (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Lee_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PETZMASTER_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Kto ciê tu do cholery... To TY jesteœ tym nowym, który stwarza³ tyle k³opotów?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //S³ysza³em od Gorna, ¿e wci¹¿ ¿yjesz.. ale ¿e tu przyszed³eœ... mniejsza z tym...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Dobrze, ¿e przyszed³eœ do mnie, zanim sytuacja sta³a siê naprawdê paskudna.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Najemnicy to twarde sztuki, a ch³opi te¿ nie dadz¹ sobie w kaszê dmuchaæ. Nie mo¿esz tak po prostu zabijaæ kogo popadnie.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Nie wspominaj¹c ju¿ o twoich pozosta³ych wyczynach.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Jeœli chcesz, mogê ci pomóc wydostaæ siê z tego bagna...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //...ale to ciê bêdzie kosztowaæ. Onar to chciwy cz³owiek, a sprawê mo¿na za³atwiæ tylko wtedy, jeœli ON przymknie na ni¹ oko.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Dobrze, ¿e siê spotykamy. Podobno coœ st¹d ukrad³eœ.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //I poturbowa³eœ paru wieœniaków.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //I zabi³eœ kilka owiec.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //Nie mo¿esz tu odstawiaæ takich numerów. Onar naciska na mnie, ¿ebym wreszcie rozliczy³ siê z winowajc¹.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Wniosek: ty p³acisz, Onar chowa z³oto do kieszeni i wszyscy zapominaj¹ o sprawie.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Gdybyœ wda³ siê w bójkê z najemnikami, nie ma sprawy...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //...ale jak ruszysz wieœniaka, od razu pobiegnie na skargê do Onara. A potem ja muszê coœ z tym zrobiæ.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Nie mówiê nawet, jak siê Onar wkurza, kiedy ktoœ zabije parê owiec.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Musisz wysup³aæ parê groszy. Pieni¹dze zgarnie Onar, ale potem wszyscy zapomn¹ o sprawie.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar p³aci mi za ochronê farmy. A to oznacza te¿ ochronê owiec.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Musisz zap³aciæ mu odpowiednie odszkodowanie.
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Ile?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Nie mam dostatecznie du¿o z³ota!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Chcê zap³aciæ grzywnê!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Chcê zap³aciæ grzywnê!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //M¹dry ch³opiec. Dopilnujê, ¿eby pieni¹dze trafi³y do Onara. Sprawê mo¿emy uznaæ za za³atwion¹.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Nie mam tyle pieniêdzy!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //No to postaraj siê je zdobyæ, i to szybko!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Tylko nie próbuj okradaæ kogoœ na farmie! Jeœli ciê z³api¹, wpadniesz w gówno po uszy.
	
	Lee_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				 Hallo 
// ************************************************************
INSTANCE DIA_Lee_Hallo   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Hallo_Info()
{
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Kto ciê tu do diab³a... TY?! Co ty tu robisz? Myœla³em, ¿e nie ¿yjesz!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Sk¹d to przypuszczenie?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn powiedzia³, ¿e to ty zniszczy³eœ Barierê.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Tak, to prawda.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //No, no. Kto by pomyœla³, ¿e wyjdziesz z tego ca³o. Co ciê tu sprowadza? Nie wpad³eœ chyba powspominaæ dawnych dziejów?
};

// ************************************************************
// 			  				Paladine 
// ************************************************************
INSTANCE DIA_Lee_Paladine   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent   = FALSE;
	description = "Muszê koniecznie porozmawiaæ z paladynami w mieœcie...";
};
FUNC INT DIA_Lee_Paladine_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Paladine_Info()
{
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Muszê koniecznie porozmawiaæ z paladynami w mieœcie. Pomo¿esz mi jakoœ siê do nich dostaæ?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //A co ciê tak ci¹gnie do paladynów?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //To d³uga historia...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Mam mnóstwo czasu.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //Xardas wys³a³ mnie z kolejn¹ misj¹. Mam zdobyæ potê¿ny amulet zwany Okiem Innosa.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Czyli dalej kumplujesz siê z tym nekromant¹? Rozumiem. A amulet maj¹ paladyni, tak?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //O ile mi wiadomo - tak.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Pomogê ci dostaæ siê do paladynów, ale najpierw musisz zostaæ jednym z nas.
};

// ************************************************************
// 			  				PaladineHOW
// ************************************************************
INSTANCE DIA_Lee_PaladineHOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 3;
	condition   = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent   = FALSE;
	description = "W jaki sposób mo¿esz mi pomóc w skontaktowaniu siê z paladynami?";
};
FUNC INT DIA_Lee_PaladineHOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PaladineHOW_Info()
{
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //W jaki sposób mo¿esz mi pomóc w skontaktowaniu siê z paladynami?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Zaufaj mi. Mam plan, i myœlê, ¿e siê do niego znakomicie nadajesz...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Zaprowadzê ciê do paladynów, a ty wyœwiadczysz mi drobn¹ przys³ugê. Ale najpierw musisz do nas do³¹czyæ!
};

// ************************************************************
// 			  				Lees Plan
// ************************************************************
INSTANCE DIA_Lee_LeesPlan (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent   = FALSE;
	description = "Co ty tu w³aœciwie robisz?";
};
FUNC INT DIA_Lee_LeesPlan_Condition()
{
	if (Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lee_LeesPlan_Info()
{
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Co ty tu w³aœciwie robisz?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Proste: kombinujê, jak nas wyrwaæ z tej przeklêtej wyspy.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar wynaj¹³ nas, byœmy bronili tej farmy, i w³aœnie to zamierzamy robiæ.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Ale nie tylko dla pieniêdzy! Pomagaj¹c ch³opom, odcinamy miasto od dostaw ¿ywnoœci.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //A im bardziej paladyni zg³odniej¹, tym chêtniej wys³uchaj¹ mojej propozycji ugody.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Wielka szkoda, ¿e musia³eœ siê spikn¹æ akurat z nimi.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //A jak bêdzie wygl¹daæ twoja propozycja?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //Najogólniej mówi¹c: bêdziemy siê domagaæ zwolnienia i prawa powrotu na kontynent. Szczegó³y poznasz, gdy nadejdzie odpowiednia pora.
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
INSTANCE DIA_Lee_WannaJoin (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent   = FALSE;
	description = "Chcê do was do³¹czyæ!";
};
FUNC INT DIA_Lee_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Chcê do was do³¹czyæ!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Mia³em nadziejê, ¿e to powiesz! Przyda mi siê ka¿dy pewny cz³owiek.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Ostatni najemnicy, których przyj¹³em, narobili tylko k³opotów!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //W zasadzie mo¿esz zaczynaæ od zaraz. Chocia¿... musimy najpierw wyjaœniæ parê spraw, ale to nic wielkiego...
};

// ************************************************************
// 			  				ClearWhat
// ************************************************************
INSTANCE DIA_Lee_ClearWhat (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent   = FALSE;
	description = "Co dok³adnie mam 'wyjaœniæ', ¿eby móc do was do³¹czyæ?";
};
FUNC INT DIA_Lee_ClearWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ClearWhat_Info()
{
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Co dok³adnie mam 'wyjaœniæ', ¿eby móc do was do³¹czyæ?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Naszym szefem jest Onar, zarz¹dca tych ziem. Mo¿esz zostaæ na farmie tylko wtedy, jeœli on siê na to zgodzi.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //No i s¹ jeszcze ch³opcy. Mogê ciê przyj¹æ, jeœli wstawi siê za tob¹ wiêkszoœæ najemników.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Tylko nie idŸ do Onara, zanim wszystko siê nie wyjaœni. To bardzo niecierpliwy cz³owiek...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Aby móc zostaæ najemnikiem, muszê przekonaæ do tego pomys³u pozosta³ych najemników i uzyskaæ zgodê Onara.");
};

// ************************************************************
// 			  				OtherSld
// ************************************************************
INSTANCE DIA_Lee_OtherSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 7;
	condition   = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent   = FALSE;
	description = "Jak mam przekonaæ najemników, ¿eby mnie poparli?";
};
FUNC INT DIA_Lee_OtherSld_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_OtherSld_Info()
{
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Jak mam przekonaæ najemników, ¿eby mnie poparli?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Najlepiej udowodnij im, ¿e nadajesz siê do tej roboty.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Pogadaj z Torlofem. Zwykle krêci siê gdzieœ przed domem. On podda ciê próbie.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Jeœli j¹ przejdziesz, bêdziesz ju¿ prawie jednym z nas.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Torlof powie ci wszystko, co musisz wiedzieæ.
	
	B_LogEntry (TOPIC_BecomeSLD,"Aby móc zostaæ najemnikiem, muszê poddaæ siê próbie Torlofa i zyskaæ szacunek pozosta³ych najemników.");
};
			
///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lee_Ranger		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lee_Ranger_Condition;
	information	 = 	DIA_Addon_Lee_Ranger_Info;

	description	 = 	"Co wiesz o Wodnym Krêgu?";
};

func int DIA_Addon_Lee_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (SC_KnowsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lee_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Co wiesz o Wodnym Krêgu?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //Mo¿na siê by³o domyœliæ... To nie twoja sprawa.
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Ej¿e. Powiedz mi!
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Nie dotyczy mnie to bezpoœrednio - wiem tylko, ¿e to jakaœ tajna gildia, za któr¹ stoj¹ Magowie Wody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Od chwili upadku Bariery nie obowi¹zuje mnie ju¿ umowa z Magami Wody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Oczywiœcie spróbujê ci pomóc, jeœli czegokolwiek ci potrzeba. Nie mam jednak zbyt wiele czasu - muszê siê troszczyæ przede wszystkim o swoje sprawy.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Jeœli chcesz zdobyæ wiêcej informacji o tym krêgu, to pogadaj z Cordem. On nale¿y do tej organizacji, o ile mi wiadomo.
		
	RangerHelp_gildeSLD = TRUE;	
	SC_KnowsCordAsRangerFromLee = TRUE;
};			
			
// ************************************************************
// 			  				JoinNOW
// ************************************************************
var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

INSTANCE DIA_Lee_JoinNOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 8;
	condition   = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent   = TRUE;
	description = "Jestem gotowy, by do was do³¹czyæ!";
};
FUNC INT DIA_Lee_JoinNOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (Lee_OnarOK == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_JoinNOW_Info()
{
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Jestem gotowy, by do was do³¹czyæ!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Nie przeszed³eœ jeszcze testu Torlofa.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Czyli przeszed³eœ ju¿ próbê Torlofa?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Tak.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //Bardzo dobrze.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Co s¹dz¹ o tobie pozostali najemnicy?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Nie jestem pewien, czy wystarczaj¹co wielu z nich jest po mojej stronie.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //No to pogadaj z Torlofem. On wie o wszystkim, o czym siê mówi na farmie.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //Wiêkszoœæ z nich jest po mojej stronie.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //W takim razie idŸ do Onara. Ja ju¿ z nim rozmawia³em.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Ale wynagrodzenie musisz sam sobie wynegocjowaæ.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Teraz potrzebujê tylko zgody Onara.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Rozmawia³eœ z Onarem?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Tak. Zgodzi³ siê.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //No to witamy na pok³adzie!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Masz tu przyzwoity pancerz. Przyda ci siê.
			Npc_SetTrueGuild (other, GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine (Lothar, "START");
			
			CreateInvItems (other, ItAr_Sld_L, 1);
			AI_EquipArmor (other, ItAr_Sld_L);
						
			Snd_Play ("LEVELUP"); 
	
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP (XP_BecomeMercenary);
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Cieszê siê, ¿e jesteœ z nami.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Mam ju¿ dla ciebie pierwsze zadanie.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Chodzi o paladynów. Pora, byœ z³o¿y³ im wizytê.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //I tak chcia³eœ tam iœæ, nie?
		};
	};
};

// ************************************************************
// 			  				KEIN SLD
// ************************************************************
INSTANCE DIA_Lee_KeinSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_KeinSld_Condition()
{
	if ( (other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KeinSld_Info()
{
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Widzê, ¿e wst¹pi³eœ na s³u¿bê do paladynów.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //By³eœ w klasztorze? Wszystkiego bym siê spodziewa³, tylko nie tego.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //Có¿, najemnikiem ju¿ raczej nie zostaniesz.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Ale kto wie, mo¿e móg³byœ mi wyœwiadczyæ przys³ugê czy dwie... albo ja tobie...
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Tak czy siak - ¿yczê ci powodzenia.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Tylko nie próbuj ze mn¹ ¿adnych numerów, jasne?
};

// ************************************************************
// 			  				ToHagen
// ************************************************************
INSTANCE DIA_Lee_ToHagen(C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent   = FALSE;
	description = "Jak mam siê teraz dostaæ do paladynów?";
};
FUNC INT DIA_Lee_ToHagen_Condition()
{
	if (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ToHagen_Info()
{
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Jak mam siê teraz dostaæ do paladynów?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //To proste. Zaniesiesz im moj¹ propozycjê pokojow¹.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Znam Lorda Hagena, dowódcê paladynów, jeszcze z królewskiej armii.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Wiem, co sobie teraz myœli: ma zbyt ma³o ludzi. Przyjmie wiêc moje warunki. A w ka¿dym razie na pewno ciê wys³ucha.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Napisa³em do niego list. Masz.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //Dziêki niemu dopuszcz¹ ciê przed dowódcê paladynów.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee wys³a³ mnie z ofert¹ pokojow¹ do Lorda Hagena. W ten sposób dotrê do paladynów.");
};
		
// ************************************************************
// 			  			AngebotSuccess
// ************************************************************
INSTANCE DIA_Lee_AngebotSuccess (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent   = FALSE;
	description = "Zanios³em twoj¹ propozycjê Lordowi Hagenowi.";
};
FUNC INT DIA_Lee_AngebotSuccess_Condition()
{
	if (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AngebotSuccess_Info()
{
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Zanios³em twoj¹ propozycjê Lordowi Hagenowi.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //I co odpowiedzia³?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Jest sk³onny u³askawiæ ciebie, ale nie twoich ludzi.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Nadêty g³upiec. Moi ludzie to baranki w porównaniu z niektórymi oprychami z królewskiej armii.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Co teraz zrobisz?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Znajdê jakiœ inny sposób... Jeœli bêdzie trzeba, uprowadzê królewski okrêt. Muszê trochê pomyœleæ.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Nie zostawiê moich ludzi w tym bagnie. To wykluczone.

	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};

// ************************************************************
// 			  			Background
// ************************************************************
INSTANCE DIA_Lee_Background (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent   = FALSE;
	description = "Dlaczego tak bardzo chcesz siê dostaæ na kontynent?";
};
FUNC INT DIA_Lee_Background_Condition()
{
	if (MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Background_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Dlaczego tak bardzo chcesz siê dostaæ na kontynent?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Jak zapewne pamiêtasz, s³u¿y³em kiedyœ w królewskiej armii, w randze genera³a.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Ale grupa dworskich przydupasów postanowi³a siê mnie pozbyæ, bo za du¿o wiedzia³em.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Wtr¹cili mnie do Kolonii, a Król nawet nie kiwn¹³ palcem, ¿eby ich powstrzymaæ.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //Mia³em mnóstwo czasu, ¿eby to sobie przemyœleæ.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Zamierzam siê zemœciæ.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //Na Królu?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //Tak, na Królu i na wszystkich dwujêzycznych pochlebcach. Zap³ac¹ mi za piek³o, przez które musia³em przejœæ!
};

// ************************************************************
// 			  		RescueGorn
// ************************************************************
INSTANCE DIA_Lee_RescueGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent   = FALSE;
	description = "Zamierzam wyruszyæ do Górniczej Doliny.";
};
FUNC INT DIA_Lee_RescueGorn_Condition()
{
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RescueGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Zamierzam wyruszyæ do Górniczej Doliny.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Wiedzia³em, ¿e nie wysiedzisz za d³ugo na farmie!
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //W takim razie rozejrzyj siê trochê za Gornem. Paladyni zawlekli go z powrotem do Kolonii.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn to równy facet. Przyda³by mi siê tutaj ktoœ taki jak on. Gdybyœ mia³ okazjê go uwolniæ - zrób to.
	
	KnowsAboutGorn = TRUE;
};
// ************************************************************
// 			 RescueGorn Success
// ************************************************************
INSTANCE DIA_Lee_Success (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent   = FALSE;
	description = "Uwolni³em Gorna.";
};
FUNC INT DIA_Lee_Success_Condition()
{
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel >= 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Success_Info()
{
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Uwolni³em Gorna.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Tak, ju¿ mi mówi³eœ. Dobra robota.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Ten facet jest wiêcej wart, ni¿ Sylvio i jego ch³opcy razem wziêci.
	
	B_GivePlayerXP (XP_Ambient);
	
};
// ************************************************************
// 			  				AboutGorn
// ************************************************************
INSTANCE DIA_Lee_AboutGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent   = FALSE;
	description = "Rozmawia³eœ z Gornem? Co siê z nim dzieje?";
};
FUNC INT DIA_Lee_AboutGorn_Condition()
{
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (other,DIA_Lee_RescueGorn) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AboutGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Rozmawia³eœ z Gornem? Co siê z nim dzieje?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Chyba go jeszcze pamiêtasz?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Niech pomyœlê...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Jasne.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Jasne.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Z³apali go paladyni i wys³ali z powrotem do Górniczej Doliny, w karnym konwoju.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Gdyby drogi do Doliny nie roi³y siê od paladynów i orków, wys³a³bym paru moich ch³opców, ¿eby go wyci¹gnêli.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Ale nie mogê ryzykowaæ. Szkoda cz³owieka.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Niech pomyœlê...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Du¿y, ciemnow³osy, z wielkim toporem... Pomóg³ ci odbiæ nasz¹ kopalniê w Kolonii.
};

// ************************************************************
// 			  				WegenBullco
// ************************************************************
INSTANCE DIA_Lee_WegenBullco (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent   = FALSE;
	description = "Onar straci³ w³aœnie kilka owiec. Wszystko przez Bullka...";
};
FUNC INT DIA_Lee_WegenBullco_Condition()
{
	if (Kapitel < 4) 
	&& (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Onar_WegenPepe == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WegenBullco_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Onar straci³ w³aœnie kilka owiec. Wszystko przez Bullka...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //A daj mi spokój z tym gównem! Mam doœæ k³opotów i bez tego.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Ja te¿. Bullko chyba za mn¹ nie przepada. Chce, ¿ebym opuœci³ farmê...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //I co z tego? Postaw mu siê.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //I powiedz mu, ¿e jak siê nie uspokoi, potr¹cê koszt zaginionych owiec z jego wyp³aty.
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

// ************************************************************
// 							Drachen Report
// ************************************************************
instance DIA_Lee_Report (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Report_Condition;
	information	= DIA_Lee_Report_Info;
	permanent	= TRUE;
	description = "Wracam z Górniczej Doliny...";
};                       
FUNC INT DIA_Lee_Report_Condition()
{
	if (EnterOW_Kapitel2 == TRUE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Report_Info()
{	
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Wracam z Górniczej Doliny. Tamtejszy zamek zosta³ zaatakowany przez smoki!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //A wiêc to prawda! Lares wspomina³ coœ o smokach, które mia³y siê krêciæ wokó³ miasta... Prawdê mówi¹c, nie dawa³em temu wiary...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Co siê sta³o z paladynami?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Rozbici. Zdziesi¹tkowani.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //I BARDZO dobrze! Mo¿e Lord Hagen przemyœli jeszcze raz moj¹ propozycjê...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //A jeœli nie... Znajdziemy inny sposób na wydostanie siê st¹d...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Œwietnie! Mo¿e Lord Hagen wyprawi siê teraz do Górniczej Doliny ze swoimi ludŸmi...
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Im mniej paladynów zostanie na miejscu, tym lepiej.
	};
};

// ************************************************************
// 							Armor M freischalten
// ************************************************************

var int Lee_Give_Sld_M;
// -----------------------

instance DIA_Lee_ArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorM_Condition;
	information	= DIA_Lee_ArmorM_Info;
	permanent	= TRUE;
	description = "Przyda³aby mi siê lepsza zbroja.";
};                       
FUNC INT DIA_Lee_ArmorM_Condition()
{
	if (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	&& (Lee_Give_Sld_M == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Przyda³aby mi siê lepsza zbroja.
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Wype³ni³eœ swoje zadanie.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Mam dla ciebie solidniejsz¹ zbrojê. Oczywiœcie, jeœli masz odpowiedni¹ iloœæ kruszcu.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof dosta³ od Onara pewne zlecenie, które powinno zostaæ za³atwione jakiœ czas temu.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Zajmij siê tym, to porozmawiamy o lepszej zbroi.
	};
};

// ************************************************************
// 							Armor M kaufen
// ************************************************************
var int Lee_SldMGiven;
// -------------------

instance DIA_Lee_BuyArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorM_Condition;
	information	= DIA_Lee_BuyArmorM_Info;
	permanent	= TRUE;
	description = "Kup œredni pancerz najemnika. Ochrona (broñ i strza³y) 50, 1000 sztuk z³ota.";
};                       
FUNC INT DIA_Lee_BuyArmorM_Condition()
{
	if (Lee_Give_Sld_M == TRUE)
	&& (Lee_SldMGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Daj mi jak¹œ zbrojê.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Proszê, to dobry pancerz.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Ale ja nie rozdajê prezentów. Najpierw chcê zobaczyæ z³oto!
	};
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

INSTANCE DIA_Lee_KAP3_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP3_EXIT_Condition;
	information	= DIA_Lee_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				  		Teleport
// ************************************************************

INSTANCE DIA_Lee_Teleport(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 1;
	condition	= DIA_Lee_Teleport_Condition;
	information	= DIA_Lee_Teleport_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lee_Teleport_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (Lee_Teleport == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Teleport_Info()
{	
	 B_Lee_Teleport();
};

// ************************************************************
// 							Armor H freischalten
// ************************************************************

instance DIA_Lee_ArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorH_Condition;
	information	= DIA_Lee_ArmorH_Info;
	permanent	= FALSE;
	description = "Nie masz dla mnie jakiejœ lepszej zbroi?";
};                       
FUNC INT DIA_Lee_ArmorH_Condition()
{
	if (Kapitel == 3)
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Nie masz dla mnie jakiejœ lepszej zbroi?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Jasne, ¿e mam!
};

// ************************************************************
// 							Armor H kaufen
// ************************************************************
var int Lee_SldHGiven;
// -------------------

instance DIA_Lee_BuyArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorH_Condition;
	information	= DIA_Lee_BuyArmorH_Info;
	permanent	= TRUE;
	description = "Kup ciê¿ki pancerz najemnika. Ochrona (broñ i strza³y) 80, 2500 sztuk z³ota.";
};                       
FUNC INT DIA_Lee_BuyArmorH_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_ArmorH))
	&& (Lee_SldHGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Daj mi ciê¿k¹ zbrojê.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Proszê. To solidny pancerz. Sam taki noszê.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Znasz zasady. Najpierw z³oto.
	};
};


// ************************************************************
// 	Richter
// ************************************************************

INSTANCE DIA_Lee_Richter (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Richter_Condition;
	information	= DIA_Lee_Richter_Info;
	permanent	= FALSE;
	description = "Nie masz dla mnie ¿adnej roboty?";
};                       
FUNC INT DIA_Lee_Richter_Condition()
{
	if (Kapitel >= 3)
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	&& ((Npc_IsDead(Richter))== FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Richter_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Nie masz dla mnie ¿adnej roboty?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Ci¹gle ci ma³o, co? I tak siedzisz w niez³ym bagnie. Czego jeszcze chcesz?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Kolejnego zlecenia. W koñcu jestem najemnikiem, prawda?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //W porz¹dku. Mam coœ w sam raz dla ciebie.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Mam pewien rachunek do wyrównania z miejskim sêdzi¹. Najchêtniej sam bym siê tym zaj¹³...
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //...ale paladyni nie dopuszcz¹ mnie do jego domu nawet na odleg³oœæ celnego rzutu kamieniem.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Sprawa jest doœæ delikatna, wiêc uwa¿aj: pójdziesz do sêdziego i zaoferujesz mu swoje us³ugi.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Spróbujesz zdobyæ jego zaufanie i wykonasz dla niego kilka szemranych zleceñ, póki nie znajdziesz na niego jakiegoœ haka.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Ten wieprz tapla siê w takim bagnie, ¿e nie powinno to byæ trudne.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Tylko przynieœ mi SOLIDNE dowody. Chcê, ¿eby po ich ujawnieniu facet trafi³ do paki na resztê swojego ¿ycia.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //I pod ¿adnym pozorem go nie zabijaj! To by by³o zbyt proste. On ma najpierw trochê pocierpieæ, zrozumiano?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //I jak myœlisz? Dasz radê?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee chce, abym znalaz³ jakieœ dowody przeciwko sêdziemu Khorinis. Muszê tylko zaoferowaæ temu ostatniemu swoje us³ugi i mieæ oczy szeroko otwarte."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Wykluczone.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Nie ma sprawy. Ile?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Nie ma sprawy. Ile?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Twoja nagroda zale¿y od tego, co mi przyniesiesz, wiêc dobrze siê postaraj.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Wykluczone. Nie bêdê siê korzy³ przed ¿adn¹ œwini¹.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //No, no. Nie unoœ mi siê tu honorem. To on kaza³ ciê zamkn¹æ i wrzuciæ za Barierê, pamiêtasz?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Zreszt¹, rób jak chcesz. Moim zdaniem pope³niasz b³¹d.
	Info_ClearChoices	(DIA_Lee_Richter);
};



// ************************************************************
// 	RichterBeweise
// ************************************************************

INSTANCE DIA_Lee_RichterBeweise (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_RichterBeweise_Condition;
	information	= DIA_Lee_RichterBeweise_Info;

	description = "Mam dla ciebie dowody obci¹¿aj¹ce sêdziego.";
};                       
FUNC INT DIA_Lee_RichterBeweise_Condition()
{
	if (Kapitel >= 3)
	&& (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_RichterKomproBrief_MIS))
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RichterBeweise_Info()
{	
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Mam dla ciebie dowody obci¹¿aj¹ce sêdziego.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Serio? Co znalaz³eœ?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Pan sêdzia wynaj¹³ kilku oprychów, by zastraszyli gubernatora Khorinis.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Gdy wykonali brudn¹ robotê, kaza³ ich aresztowaæ i odebra³ im swoje z³oto.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Mam przy sobie pismo, w którym sêdzia opisuje bandziorom ich zadanie.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Poka¿.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Nareszcie! No, panie sêdzio - pora wyrównaæ rachunki. Dobra robota!
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Zas³u¿y³eœ na sowite wynagrodzenie. Proszê, oto twoja nagroda.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //Tylko nikomu ani s³owa, jasne?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //To œwietnie, ale sprawa sama siê rozwi¹za³a. Sêdzia nie ¿yje.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Jakiœ idiota go rozwali³. Ech, trudno. Nie bêdê po nim p³aka³.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Masz tu parê monet. Na wy¿sz¹ nagrodê nie mo¿esz teraz liczyæ.
			CreateInvItems (self, ItMi_Gold, 50);									
			B_GiveInvItems (self, other, ItMi_Gold, 50);		
			MIS_Lee_JudgeRichter = LOG_FAILED;
			B_GivePlayerXP (XP_Ambient);			
		};
};

// ************************************************************
// 	  				   Was ist mit Bennet?
// ************************************************************

INSTANCE DIA_Lee_TalkAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_TalkAboutBennet_Condition;
	information	= DIA_Lee_TalkAboutBennet_Info;
	permanent	= FALSE;
	description = "Co z Bennetem?";
};                       
FUNC INT DIA_Lee_TalkAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (KApitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_TalkAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //Co z Bennetem?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Ach, ju¿ s³ysza³eœ? Sukinsyny zamknê³y go w pace!
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Jakbym nie mia³ doœæ problemów ze swoimi ludŸmi, teraz muszê jeszcze zaj¹æ siê paladynami!
	};
};

//**************************************************************
//	Was willst du wegen Bennet unternehmen?
//**************************************************************

INSTANCE DIA_Lee_DoAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_DoAboutBennet_Condition;
	information	= DIA_Lee_DoAboutBennet_Info;
	permanent	= FALSE;
	description = "Co zamierzasz zrobiæ w sprawie Benneta?";
};                       
FUNC INT DIA_Lee_DoAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_TalkAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_DoAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Co zamierzasz zrobiæ w sprawie Benneta?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Jeszcze nie wiem. Moi ch³opcy najchêtniej pobiegliby od razu do miasta, ¿eby wbiæ Hagenowi zêby do gard³a.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Na szczêœcie mamy za ma³o ludzi, ¿eby przeprowadziæ tak¹ operacjê. Prawdê mówi¹c, to nie w moim stylu.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //A wiêc zamierzasz tu czekaæ na rozwój wydarzeñ?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //W ¿adnym wypadku!
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Nie zdo³am na czas udowodniæ niewinnoœci Benneta. Ludzie Lee nie zawahaj¹ siê zaatakowaæ miasta i odbiæ Benneta si³¹."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares wci¹¿ siedzi w mieœcie i próbuje wykombinowaæ, jak wyci¹gn¹æ Benneta.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //Póki co, próbujê jakoœ utrzymaæ moich ludzi w ryzach. Mam tylko nadziejê, ¿e Lares siê poœpieszy.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //A, zanim zapomnê! Buster chce z tob¹ porozmawiaæ. Nie chcia³ mi powiedzieæ, o co chodzi. Mo¿e powinieneœ do niego zajrzeæ?
	};
};

//**************************************************************
//	Kann ich dir helfen?
//**************************************************************

INSTANCE DIA_Lee_CanHelpYou(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_CanHelpYou_Condition;
	information	= DIA_Lee_CanHelpYou_Info;
	permanent	= FALSE;
	description = "Mogê ci jakoœ pomóc w tej sprawie z Bennetem?";
};                       
FUNC INT DIA_Lee_CanHelpYou_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_CanHelpYou_Info()
{	
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Mogê ci jakoœ pomóc w tej sprawie z Bennetem?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Jasne. Odrobina sprytu i rozs¹dku na pewno nie zaszkodzi.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos œwiadkiem, ¿e pêta siê tu wystarczaj¹co wielu idiotów.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //IdŸ do miasta i postaraj siê wyci¹gn¹æ stamt¹d Benneta.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Tylko siê pospiesz! Nie wiem, jak d³ugo zdo³am utrzymaæ moich ludzi w ryzach!
};

//**************************************************************
//	Gibts was neues wegen Bennet?
//**************************************************************

//----------------------------------
var int DIA_Lee_AnyNews_OneTime;
//----------------------------------

INSTANCE DIA_Lee_AnyNews(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_AnyNews_Condition;
	information	= DIA_Lee_AnyNews_Info;
	permanent	= TRUE;
	description = "Jakieœ wieœci w sprawie Benneta?";
};                       
FUNC INT DIA_Lee_AnyNews_Condition()
{
	if (MIS_RescueBennet != FALSE)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))
	&& (DIA_Lee_AnyNews_OneTime == FALSE) 	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Jakieœ wieœci w sprawie Benneta?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Wygl¹da na to, ¿e nie poturbowali go za bardzo w wiêzieniu.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Dobra robota.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Nie, nadal wiemy za ma³o.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info Sylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_SYLVIO		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	3;
	condition	 = 	DIA_Lee_SYLVIO_Condition;
	information	 = 	DIA_Lee_SYLVIO_Info;

	description	 = 	"Co siê tu dzia³o?";
};

func int DIA_Lee_SYLVIO_Condition ()
{
	if (MIS_ReadyforChapter4 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Lee_SYLVIO_Info ()
{
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Co siê tu dzia³o?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Ten sukinsyn, Sylvio, dowiedzia³ siê o smokach w Górniczej Dolinie i namiesza³ w g³owach wszystkim na farmie.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Przekonywa³ ch³opaków, ¿eby poszli z nim do Doliny. Obiecywa³ bogactwa, s³awê, zaszczyty...
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Niektórzy nie chcieli go nawet s³uchaæ, ale znalaz³o siê paru idiotów, którzy dali siê nabraæ.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Kazali Bennetowi przygotowaæ dla siebie odpowiednie wyposa¿enie i wyruszyli w drogê.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //Ech, prawdê mówi¹c, cieszê siê, ¿e Sylvio poszed³ wreszcie do diab³a.
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

INSTANCE DIA_Lee_KAP4_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP4_EXIT_Condition;
	information	= DIA_Lee_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_CanTeach		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	10;
	condition	 = 	DIA_Lee_CanTeach_Condition;
	information	 = 	DIA_Lee_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Czy mo¿esz mnie wyszkoliæ?";
};
func int DIA_Lee_CanTeach_Condition ()
{	
	if Kapitel >= 4
	&& Lee_TeachPlayer == FALSE
	{
		return TRUE;
	};
};
func void DIA_Lee_CanTeach_Info ()
{
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Mogê ci pokazaæ, jak pos³ugiwaæ siê dwurêcznym.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Ale nie mam czasu, ¿eby wbijaæ ci do g³owy podstawy.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Poducz siê trochê u kogoœ innego. Jak bêdziesz gotowy, poka¿ê ci parê ciekawych sztuczek.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //S³ysza³em, ¿e jesteœ ca³kiem niez³y, ale mogê ci pokazaæ parê nowych sztuczek.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee nauczy mnie walki orê¿em dwurêcznym.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Wiêc jeœli chcesz, mogê ciê uczyæ. Ale to bêdzie kosztowa³o...
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Ile?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 sztuk z³ota i mo¿emy zaczynaæ.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"To trochê za drogo.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Umowa stoi. Oto twoje z³oto.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //To trochê za drogo.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Zastanów siê. Trudno o drugiego takiego nauczyciela jak ja.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Umowa stoi. Oto twoje z³oto.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Œwietnie. Nie po¿a³ujesz tego.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee nauczy mnie walki orê¿em dwurêcznym.");
};
 
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Lee_Teach(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 10;
	condition	= DIA_Lee_Teach_Condition;
	information	= DIA_Lee_Teach_Info;
	permanent	= TRUE;
	description = "Dobra. Bierzmy siê do nauki.";
};                       

FUNC INT DIA_Lee_Teach_Condition()
{
	IF (Lee_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Lee_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Dobra. Bierzmy siê do nauki.
	
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);

};

FUNC VOID DIA_Lee_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_Teach);
};


FUNC VOID DIA_Lee_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Teraz jesteœ prawdziwym mistrzem walki dwurêcznym orê¿em.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Nie potrzebujesz ju¿ nauczyciela.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

FUNC VOID DIA_Lee_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Teraz jesteœ prawdziwym mistrzem walki dwurêcznym orê¿em.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Nie potrzebujesz ju¿ nauczyciela.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachenei
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DRACHENEI		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	4;
	condition	 = 	DIA_Lee_DRACHENEI_Condition;
	information	 = 	DIA_Lee_DRACHENEI_Info;

	description	 = 	"Jaszczuroludzie roznosz¹ smocze jaja po ca³ym kraju.";
};

func int DIA_Lee_DRACHENEI_Condition ()
{

	if (Npc_HasItems (other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Jaszczuroludzie roznosz¹ smocze jaja po ca³ym kraju.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Mo¿na siê by³o tego spodziewaæ. Najwy¿szy czas, ¿ebyœmy siê st¹d wynieœli.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //To co mam z nimi zrobiæ?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Rozwaliæ je, a co innego?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Mo¿e skorupy da siê wykorzystaæ do sporz¹dzania zbroi, albo czegoœ w tym stylu.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Wygl¹daj¹ na doœæ solidne. Pogadaj o tym z Bennetem.
		B_LogEntry (TOPIC_DRACHENEIER,"Lee nie zdo³a³ zrobiæ zbyt wiele ze smoczym jajem. Wys³a³ mnie do kowala Benneta."); 
	};
};

//********************************************************************
//	Kap 4 Perm
//********************************************************************

INSTANCE DIA_Lee_KAP4_Perm(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 49;
	condition	= DIA_Lee_KAP4_Perm_Condition;
	information	= DIA_Lee_KAP4_Perm_Info;
	permanent	= TRUE;
	description = "Co s³ychaæ na farmie?";
};                       
FUNC INT DIA_Lee_KAP4_Perm_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Co s³ychaæ na farmie?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //Có¿, odk¹d odszed³ Sylvio, mamy tu wzglêdny spokój.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //To chyba dobrze?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Niby tak, ale pracy nam przez to nie uby³o. Moi ch³opcy marudz¹ coraz bardziej, bo teraz musz¹ pracowaæ za siebie i za ludzi, których wyci¹gn¹³ Sylvio.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Ale to ju¿ mój problem. Jakoœ sobie poradzê.
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lee_KAP5_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP5_EXIT_Condition;
	information	= DIA_Lee_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GetShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GetShip_Condition;
	information	 = 	DIA_Lee_GetShip_Info;
	
	description	 = 	"Wiesz mo¿e, jak móg³bym przej¹æ okrêt paladynów?";
};
func int DIA_Lee_GetShip_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{	
		return TRUE;
	};
};
func void DIA_Lee_GetShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Wiesz mo¿e, jak móg³bym przej¹æ okrêt paladynów?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //A myœlisz, ¿e siedzia³bym tu, gdybym wiedzia³, jak to zrobiæ? Ten okrêt jest lepiej strze¿ony ni¿ konwoje z rud¹ w Starym Obozie.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Musi byæ jakiœ sposób, ¿eby dostaæ siê na pok³ad.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Dostanie siê na pok³ad to akurat pestka.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Przecie¿ mamy w garœci sêdziego! IdŸ do niego i wyduœ odpowiednie pismo uprawniaj¹ce do zajêcia okrêtu.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee uwa¿a, ¿e aby dostaæ siê na statek, najlepiej by³oby mieæ upowa¿nienie od sêdziego. W¹tpiê jednak, aby ten ostatni wyda³ mi przepustkê z w³asnej, nieprzymuszonej woli.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Mam tu sfa³szowane pe³nomocnictwo. Dziêki niemu stra¿nicy powinni wpuœciæ ciê na pok³ad.
		
			B_LogEntry (TOPIC_Ship,"Poczciwy Lee, zawsze mo¿na na nim polegaæ. Podrobi³ list, dziêki któremu zostanê wpuszczony na okrêt paladynów.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Ale to jeszcze nie wszystko. Musisz najpierw znaleŸæ kapitana, za³ogê, i takie tam.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Sam okrêt to za ma³o. Jest jeszcze mnóstwo spraw, które trzeba za³atwiæ.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Kogo powinienem wzi¹æ do za³ogi?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Znasz kogoœ, kto móg³by stan¹æ za sterem statku?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Znasz kogoœ, kto móg³by stan¹æ za sterem statku?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Jeœli dobrze pamiêtam, Torlof kiedyœ sporo ¿eglowa³. On bêdzie wiedzia³ co i jak.

	B_LogEntry (TOPIC_Captain,"Torlof to stary wilk morski, mo¿e zechce zostaæ kapitanem na moim statku.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Kogo powinienem wzi¹æ do za³ogi?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //To ju¿ twoja decyzja. Na twoim miejscu bra³bym tylko ludzi, którym móg³bym zaufaæ. Masz wystarczaj¹c¹ iloœæ zaufanych ludzi?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Jeœli potrzebujesz kowala, pogadaj koniecznie z Bennetem. Lepszego ni¿ on nie znajdziesz.

	B_LogEntry (TOPIC_Crew,"Lee nie pomóg³ mi zbytnio w skompletowaniu za³ogi, jednak poradzi³ mi, abym wzi¹³ jedynie osoby godne zaufania. Powinienem siê udaæ do Benneta, mo¿e on bêdzie zainteresowany.");
};

func void DIA_Lee_GetShip_back ()
{
	Info_ClearChoices	(DIA_Lee_GetShip);
};

///////////////////////////////////////////////////////////////////////
//	GotRichtersPermissionForShip
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GotRichtersPermissionForShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GotRichtersPermissionForShip_Condition;
	information	 = 	DIA_Lee_GotRichtersPermissionForShip_Info;

	description	 = 	"Sztuczka z pisemnym upowa¿nieniem zadzia³a³a!";
};
func int DIA_Lee_GotRichtersPermissionForShip_Condition ()
{	
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)	
	{
		return TRUE;
	};
};
func void DIA_Lee_GotRichtersPermissionForShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //Sztuczka z pisemnym upowa¿nieniem zadzia³a³a! Statek nale¿y teraz do mnie. Pan sêdzia by³ bardzo... pomocny.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //A nie mówi³em? Wiedzia³em, ¿e ten sukinsyn jeszcze siê do czegoœ przyda.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Ich will das Schiff klauen
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StealShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StealShip_Condition;
	information	 = 	DIA_Lee_StealShip_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Zamierzam ukraœæ okrêt.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen nötig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Zamierzam ukraœæ okrêt.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //A jak niby chcesz tego dokonaæ?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //To proste - pójdê na przystañ, poka¿ê im twoje papiery i zajmê statek.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Jak chcesz. Mam nadziejê, ¿e wiesz w co siê pakujesz.
	
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
};

//Lee anheuern

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lee_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pop³yniesz ze mn¹?";
};
func int DIA_Lee_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lee_GetShip))
	{
		return TRUE;
	};
};
func void DIA_Lee_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Pop³yniesz ze mn¹?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //¯artujesz? Jasne, ¿e tak! Mam parê rachunków do wyrównania na kontynencie.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //No i mogê ci pokazaæ kilka sztuczek w walce dwurêcznym orê¿em. Mog¹ ci siê przydaæ.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee chce jak najprêdzej wróciæ na kontynent. Zaoferowa³ mi swoj¹ pomoc. Z pewnoœci¹ nigdzie nie znajdê lepszego trenera.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Narazie mam ju¿ za³ogê, ale dam ci znaæ, gdyby coœ siê zwolni³o.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Dam ci znaæ, kiedy bêdziesz mi potrzebny.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"W takim razie pakuj siê!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //W takim razie pakuj siê!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Co? Ju¿? Teraz?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Tak, podnosimy ¿agle. Jeœli chcesz siê ze mn¹ zabraæ, przyjdŸ na przystañ. Spotkamy siê na statku.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //D³ugo czeka³em na tê chwilê. Mo¿esz na mnie liczyæ.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	Lee_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
		
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

FUNC VOID DIA_Lee_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Dam ci znaæ, kiedy bêdziesz mi potrzebny.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Có¿, ty wiesz najlepiej. Ale dobrych ¿o³nierzy nigdy nie za wielu.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //No, chyba ¿e to idioci pokroju Sylvio.

	Lee_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_LeaveMyShip_Condition;
	information	 = 	DIA_Lee_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Chyba jednak mi siê nie przydasz!";
};

func int DIA_Lee_LeaveMyShip_Condition ()
{	
	if (Lee_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Chyba jednak mi siê nie przydasz!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Jak chcesz. Wiesz, gdzie mnie szukaæ, prawda?
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Chyba jednak bêdê ciê potrzebowa³!";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man natürlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Chyba jednak bêdê ciê potrzebowa³!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Wiedzia³em, ¿e tak bêdzie! Do zobaczenia na statku!
		
		Lee_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Wiesz co? Niech ciê! Najpierw ka¿esz mi przyjœæ, potem mnie odsy³asz...
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Poszukaj sobie innego jelenia.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lee_KAP6_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP6_EXIT_Condition;
	information	= DIA_Lee_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




































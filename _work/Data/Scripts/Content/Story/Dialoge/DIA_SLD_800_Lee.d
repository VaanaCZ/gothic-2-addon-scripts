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
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Aaa... Dobrze, że jesteś.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Co się stało?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Zobacz, co znalazłem w starej kaplicy.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //To magiczna runa. Jeśli się nie mylę, przeniesie cię z powrotem na tę farmę.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Pomyślałem, że może ci się przydać.
	
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
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Masz pieniądze dla Onara?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Ostrzegałem cię, żebyś nie robił nic głupiego.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar dowiedział się, że trochę w międzyczasie nabroiłeś.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Teraz chce więcej pieniędzy.
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
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Myślałem, że jesteś mądrzejszy.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //No to mam dla ciebie dobrą wiadomość.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Wygląda na to, że nie uchował się żaden świadek morderstwa.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nikt nie chce już zeznawać, że widział cię podczas kradzieży.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Nie ma świadków, którzy WIDZIELI, jak pobiłeś tego wieśniaka.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Wygląda na to, że wszystkie zarzuty wobec ciebie zostały wycofane.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //Jest to jakiś sposób na wyplątanie się z tarapatów.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Tak czy siak - nie musisz już nic płacić.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Tylko na przyszłość lepiej uważaj!
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Jedno jest pewne: i tak musisz zapłacić grzywnę.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //No i co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Nie mam dostatecznie dużo złota!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Ile to miało być?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Ile mam zapłacić?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Nie mam dostatecznie dużo złota!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Ile to miało być?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Lee_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Kto cię tu do cholery... To TY jesteś tym nowym, który stwarzał tyle kłopotów?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Słyszałem od Gorna, że wciąż żyjesz.. ale że tu przyszedłeś... mniejsza z tym...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Dobrze, że przyszedłeś do mnie, zanim sytuacja stała się naprawdę paskudna.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Najemnicy to twarde sztuki, a chłopi też nie dadzą sobie w kaszę dmuchać. Nie możesz tak po prostu zabijać kogo popadnie.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Nie wspominając już o twoich pozostałych wyczynach.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Jeśli chcesz, mogę ci pomóc wydostać się z tego bagna...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //...ale to cię będzie kosztować. Onar to chciwy człowiek, a sprawę można załatwić tylko wtedy, jeśli ON przymknie na nią oko.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Dobrze, że się spotykamy. Podobno coś stąd ukradłeś.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //I poturbowałeś paru wieśniaków.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //I zabiłeś kilka owiec.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //Nie możesz tu odstawiać takich numerów. Onar naciska na mnie, żebym wreszcie rozliczył się z winowajcą.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Wniosek: ty płacisz, Onar chowa złoto do kieszeni i wszyscy zapominają o sprawie.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Gdybyś wdał się w bójkę z najemnikami, nie ma sprawy...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //...ale jak ruszysz wieśniaka, od razu pobiegnie na skargę do Onara. A potem ja muszę coś z tym zrobić.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Nie mówię nawet, jak się Onar wkurza, kiedy ktoś zabije parę owiec.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Musisz wysupłać parę groszy. Pieniądze zgarnie Onar, ale potem wszyscy zapomną o sprawie.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar płaci mi za ochronę farmy. A to oznacza też ochronę owiec.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Musisz zapłacić mu odpowiednie odszkodowanie.
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Ile?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Nie mam dostatecznie dużo złota!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Chcę zapłacić grzywnę!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Chcę zapłacić grzywnę!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Mądry chłopiec. Dopilnuję, żeby pieniądze trafiły do Onara. Sprawę możemy uznać za załatwioną.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Nie mam tyle pieniędzy!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //No to postaraj się je zdobyć, i to szybko!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Tylko nie próbuj okradać kogoś na farmie! Jeśli cię złapią, wpadniesz w gówno po uszy.
	
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
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Kto cię tu do diabła... TY?! Co ty tu robisz? Myślałem, że nie żyjesz!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Skąd to przypuszczenie?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn powiedział, że to ty zniszczyłeś Barierę.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Tak, to prawda.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //No, no. Kto by pomyślał, że wyjdziesz z tego cało. Co cię tu sprowadza? Nie wpadłeś chyba powspominać dawnych dziejów?
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
	description = "Muszę koniecznie porozmawiać z paladynami w mieście...";
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
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Muszę koniecznie porozmawiać z paladynami w mieście. Pomożesz mi jakoś się do nich dostać?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //A co cię tak ciągnie do paladynów?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //To długa historia...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Mam mnóstwo czasu.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //Xardas wysłał mnie z kolejną misją. Mam zdobyć potężny amulet zwany Okiem Innosa.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Czyli dalej kumplujesz się z tym nekromantą? Rozumiem. A amulet mają paladyni, tak?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //O ile mi wiadomo - tak.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Pomogę ci dostać się do paladynów, ale najpierw musisz zostać jednym z nas.
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
	description = "W jaki sposób możesz mi pomóc w skontaktowaniu się z paladynami?";
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
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //W jaki sposób możesz mi pomóc w skontaktowaniu się z paladynami?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Zaufaj mi. Mam plan, i myślę, że się do niego znakomicie nadajesz...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Zaprowadzę cię do paladynów, a ty wyświadczysz mi drobną przysługę. Ale najpierw musisz do nas dołączyć!
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
	description = "Co ty tu właściwie robisz?";
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
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Co ty tu właściwie robisz?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Proste: kombinuję, jak nas wyrwać z tej przeklętej wyspy.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar wynajął nas, byśmy bronili tej farmy, i właśnie to zamierzamy robić.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Ale nie tylko dla pieniędzy! Pomagając chłopom, odcinamy miasto od dostaw żywności.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //A im bardziej paladyni zgłodnieją, tym chętniej wysłuchają mojej propozycji ugody.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Wielka szkoda, że musiałeś się spiknąć akurat z nimi.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //A jak będzie wyglądać twoja propozycja?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //Najogólniej mówiąc: będziemy się domagać zwolnienia i prawa powrotu na kontynent. Szczegóły poznasz, gdy nadejdzie odpowiednia pora.
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
	description = "Chcę do was dołączyć!";
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
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Chcę do was dołączyć!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Miałem nadzieję, że to powiesz! Przyda mi się każdy pewny człowiek.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Ostatni najemnicy, których przyjąłem, narobili tylko kłopotów!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //W zasadzie możesz zaczynać od zaraz. Chociaż... musimy najpierw wyjaśnić parę spraw, ale to nic wielkiego...
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
	description = "Co dokładnie mam 'wyjaśnić', żeby móc do was dołączyć?";
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
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Co dokładnie mam 'wyjaśnić', żeby móc do was dołączyć?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Naszym szefem jest Onar, zarządca tych ziem. Możesz zostać na farmie tylko wtedy, jeśli on się na to zgodzi.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //No i są jeszcze chłopcy. Mogę cię przyjąć, jeśli wstawi się za tobą większość najemników.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Tylko nie idź do Onara, zanim wszystko się nie wyjaśni. To bardzo niecierpliwy człowiek...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Aby móc zostać najemnikiem, muszę przekonać do tego pomysłu pozostałych najemników i uzyskać zgodę Onara.");
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
	description = "Jak mam przekonać najemników, żeby mnie poparli?";
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
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Jak mam przekonać najemników, żeby mnie poparli?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Najlepiej udowodnij im, że nadajesz się do tej roboty.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Pogadaj z Torlofem. Zwykle kręci się gdzieś przed domem. On podda cię próbie.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Jeśli ją przejdziesz, będziesz już prawie jednym z nas.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Torlof powie ci wszystko, co musisz wiedzieć.
	
	B_LogEntry (TOPIC_BecomeSLD,"Aby móc zostać najemnikiem, muszę poddać się próbie Torlofa i zyskać szacunek pozostałych najemników.");
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

	description	 = 	"Co wiesz o Wodnym Kręgu?";
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
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Co wiesz o Wodnym Kręgu?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //Można się było domyślić... To nie twoja sprawa.
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Ejże. Powiedz mi!
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Nie dotyczy mnie to bezpośrednio - wiem tylko, że to jakaś tajna gildia, za którą stoją Magowie Wody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Od chwili upadku Bariery nie obowiązuje mnie już umowa z Magami Wody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Oczywiście spróbuję ci pomóc, jeśli czegokolwiek ci potrzeba. Nie mam jednak zbyt wiele czasu - muszę się troszczyć przede wszystkim o swoje sprawy.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Jeśli chcesz zdobyć więcej informacji o tym kręgu, to pogadaj z Cordem. On należy do tej organizacji, o ile mi wiadomo.
		
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
	description = "Jestem gotowy, by do was dołączyć!";
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
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Jestem gotowy, by do was dołączyć!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Nie przeszedłeś jeszcze testu Torlofa.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Czyli przeszedłeś już próbę Torlofa?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Tak.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //Bardzo dobrze.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Co sądzą o tobie pozostali najemnicy?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Nie jestem pewien, czy wystarczająco wielu z nich jest po mojej stronie.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //No to pogadaj z Torlofem. On wie o wszystkim, o czym się mówi na farmie.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //Większość z nich jest po mojej stronie.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //W takim razie idź do Onara. Ja już z nim rozmawiałem.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Ale wynagrodzenie musisz sam sobie wynegocjować.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Teraz potrzebuję tylko zgody Onara.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Rozmawiałeś z Onarem?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Tak. Zgodził się.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //No to witamy na pokładzie!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Masz tu przyzwoity pancerz. Przyda ci się.
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
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Cieszę się, że jesteś z nami.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Mam już dla ciebie pierwsze zadanie.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Chodzi o paladynów. Pora, byś złożył im wizytę.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //I tak chciałeś tam iść, nie?
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
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Widzę, że wstąpiłeś na służbę do paladynów.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Byłeś w klasztorze? Wszystkiego bym się spodziewał, tylko nie tego.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //Cóż, najemnikiem już raczej nie zostaniesz.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Ale kto wie, może mógłbyś mi wyświadczyć przysługę czy dwie... albo ja tobie...
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Tak czy siak - życzę ci powodzenia.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Tylko nie próbuj ze mną żadnych numerów, jasne?
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
	description = "Jak mam się teraz dostać do paladynów?";
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
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Jak mam się teraz dostać do paladynów?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //To proste. Zaniesiesz im moją propozycję pokojową.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Znam Lorda Hagena, dowódcę paladynów, jeszcze z królewskiej armii.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Wiem, co sobie teraz myśli: ma zbyt mało ludzi. Przyjmie więc moje warunki. A w każdym razie na pewno cię wysłucha.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Napisałem do niego list. Masz.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //Dzięki niemu dopuszczą cię przed dowódcę paladynów.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee wysłał mnie z ofertą pokojową do Lorda Hagena. W ten sposób dotrę do paladynów.");
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
	description = "Zaniosłem twoją propozycję Lordowi Hagenowi.";
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
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Zaniosłem twoją propozycję Lordowi Hagenowi.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //I co odpowiedział?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Jest skłonny ułaskawić ciebie, ale nie twoich ludzi.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Nadęty głupiec. Moi ludzie to baranki w porównaniu z niektórymi oprychami z królewskiej armii.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Co teraz zrobisz?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Znajdę jakiś inny sposób... Jeśli będzie trzeba, uprowadzę królewski okręt. Muszę trochę pomyśleć.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Nie zostawię moich ludzi w tym bagnie. To wykluczone.

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
	description = "Dlaczego tak bardzo chcesz się dostać na kontynent?";
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
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Dlaczego tak bardzo chcesz się dostać na kontynent?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Jak zapewne pamiętasz, służyłem kiedyś w królewskiej armii, w randze generała.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Ale grupa dworskich przydupasów postanowiła się mnie pozbyć, bo za dużo wiedziałem.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Wtrącili mnie do Kolonii, a Król nawet nie kiwnął palcem, żeby ich powstrzymać.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //Miałem mnóstwo czasu, żeby to sobie przemyśleć.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Zamierzam się zemścić.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //Na Królu?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //Tak, na Królu i na wszystkich dwujęzycznych pochlebcach. Zapłacą mi za piekło, przez które musiałem przejść!
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
	description = "Zamierzam wyruszyć do Górniczej Doliny.";
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
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Zamierzam wyruszyć do Górniczej Doliny.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Wiedziałem, że nie wysiedzisz za długo na farmie!
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //W takim razie rozejrzyj się trochę za Gornem. Paladyni zawlekli go z powrotem do Kolonii.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn to równy facet. Przydałby mi się tutaj ktoś taki jak on. Gdybyś miał okazję go uwolnić - zrób to.
	
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
	description = "Uwolniłem Gorna.";
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
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Uwolniłem Gorna.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Tak, już mi mówiłeś. Dobra robota.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Ten facet jest więcej wart, niż Sylvio i jego chłopcy razem wzięci.
	
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
	description = "Rozmawiałeś z Gornem? Co się z nim dzieje?";
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
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Rozmawiałeś z Gornem? Co się z nim dzieje?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Chyba go jeszcze pamiętasz?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Niech pomyślę...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Jasne.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Jasne.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Złapali go paladyni i wysłali z powrotem do Górniczej Doliny, w karnym konwoju.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Gdyby drogi do Doliny nie roiły się od paladynów i orków, wysłałbym paru moich chłopców, żeby go wyciągnęli.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Ale nie mogę ryzykować. Szkoda człowieka.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Niech pomyślę...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Duży, ciemnowłosy, z wielkim toporem... Pomógł ci odbić naszą kopalnię w Kolonii.
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
	description = "Onar stracił właśnie kilka owiec. Wszystko przez Bullka...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Onar stracił właśnie kilka owiec. Wszystko przez Bullka...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //A daj mi spokój z tym gównem! Mam dość kłopotów i bez tego.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Ja też. Bullko chyba za mną nie przepada. Chce, żebym opuścił farmę...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //I co z tego? Postaw mu się.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //I powiedz mu, że jak się nie uspokoi, potrącę koszt zaginionych owiec z jego wypłaty.
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
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Wracam z Górniczej Doliny. Tamtejszy zamek został zaatakowany przez smoki!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //A więc to prawda! Lares wspominał coś o smokach, które miały się kręcić wokół miasta... Prawdę mówiąc, nie dawałem temu wiary...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Co się stało z paladynami?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Rozbici. Zdziesiątkowani.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //I BARDZO dobrze! Może Lord Hagen przemyśli jeszcze raz moją propozycję...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //A jeśli nie... Znajdziemy inny sposób na wydostanie się stąd...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Świetnie! Może Lord Hagen wyprawi się teraz do Górniczej Doliny ze swoimi ludźmi...
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
	description = "Przydałaby mi się lepsza zbroja.";
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
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Przydałaby mi się lepsza zbroja.
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Wypełniłeś swoje zadanie.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Mam dla ciebie solidniejszą zbroję. Oczywiście, jeśli masz odpowiednią ilość kruszcu.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof dostał od Onara pewne zlecenie, które powinno zostać załatwione jakiś czas temu.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Zajmij się tym, to porozmawiamy o lepszej zbroi.
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
	description = "Kup średni pancerz najemnika. Ochrona (broń i strzały) 50, 1000 sztuk złota.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Daj mi jakąś zbroję.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Proszę, to dobry pancerz.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Ale ja nie rozdaję prezentów. Najpierw chcę zobaczyć złoto!
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
	description = "Nie masz dla mnie jakiejś lepszej zbroi?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Nie masz dla mnie jakiejś lepszej zbroi?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Jasne, że mam!
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
	description = "Kup ciężki pancerz najemnika. Ochrona (broń i strzały) 80, 2500 sztuk złota.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Daj mi ciężką zbroję.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Proszę. To solidny pancerz. Sam taki noszę.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Znasz zasady. Najpierw złoto.
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
	description = "Nie masz dla mnie żadnej roboty?";
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
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Nie masz dla mnie żadnej roboty?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Ciągle ci mało, co? I tak siedzisz w niezłym bagnie. Czego jeszcze chcesz?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Kolejnego zlecenia. W końcu jestem najemnikiem, prawda?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //W porządku. Mam coś w sam raz dla ciebie.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Mam pewien rachunek do wyrównania z miejskim sędzią. Najchętniej sam bym się tym zajął...
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //...ale paladyni nie dopuszczą mnie do jego domu nawet na odległość celnego rzutu kamieniem.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Sprawa jest dość delikatna, więc uważaj: pójdziesz do sędziego i zaoferujesz mu swoje usługi.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Spróbujesz zdobyć jego zaufanie i wykonasz dla niego kilka szemranych zleceń, póki nie znajdziesz na niego jakiegoś haka.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Ten wieprz tapla się w takim bagnie, że nie powinno to być trudne.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Tylko przynieś mi SOLIDNE dowody. Chcę, żeby po ich ujawnieniu facet trafił do paki na resztę swojego życia.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //I pod żadnym pozorem go nie zabijaj! To by było zbyt proste. On ma najpierw trochę pocierpieć, zrozumiano?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //I jak myślisz? Dasz radę?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee chce, abym znalazł jakieś dowody przeciwko sędziemu Khorinis. Muszę tylko zaoferować temu ostatniemu swoje usługi i mieć oczy szeroko otwarte."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Wykluczone.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Nie ma sprawy. Ile?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Nie ma sprawy. Ile?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Twoja nagroda zależy od tego, co mi przyniesiesz, więc dobrze się postaraj.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Wykluczone. Nie będę się korzył przed żadną świnią.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //No, no. Nie unoś mi się tu honorem. To on kazał cię zamknąć i wrzucić za Barierę, pamiętasz?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Zresztą, rób jak chcesz. Moim zdaniem popełniasz błąd.
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

	description = "Mam dla ciebie dowody obciążające sędziego.";
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
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Mam dla ciebie dowody obciążające sędziego.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Serio? Co znalazłeś?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Pan sędzia wynajął kilku oprychów, by zastraszyli gubernatora Khorinis.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Gdy wykonali brudną robotę, kazał ich aresztować i odebrał im swoje złoto.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Mam przy sobie pismo, w którym sędzia opisuje bandziorom ich zadanie.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Pokaż.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Nareszcie! No, panie sędzio - pora wyrównać rachunki. Dobra robota!
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Zasłużyłeś na sowite wynagrodzenie. Proszę, oto twoja nagroda.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //Tylko nikomu ani słowa, jasne?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //To świetnie, ale sprawa sama się rozwiązała. Sędzia nie żyje.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Jakiś idiota go rozwalił. Ech, trudno. Nie będę po nim płakał.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Masz tu parę monet. Na wyższą nagrodę nie możesz teraz liczyć.
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
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Ach, już słyszałeś? Sukinsyny zamknęły go w pace!
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Jakbym nie miał dość problemów ze swoimi ludźmi, teraz muszę jeszcze zająć się paladynami!
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
	description = "Co zamierzasz zrobić w sprawie Benneta?";
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
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Co zamierzasz zrobić w sprawie Benneta?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Jeszcze nie wiem. Moi chłopcy najchętniej pobiegliby od razu do miasta, żeby wbić Hagenowi zęby do gardła.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Na szczęście mamy za mało ludzi, żeby przeprowadzić taką operację. Prawdę mówiąc, to nie w moim stylu.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //A więc zamierzasz tu czekać na rozwój wydarzeń?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //W żadnym wypadku!
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Nie zdołam na czas udowodnić niewinności Benneta. Ludzie Lee nie zawahają się zaatakować miasta i odbić Benneta siłą."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares wciąż siedzi w mieście i próbuje wykombinować, jak wyciągnąć Benneta.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //Póki co, próbuję jakoś utrzymać moich ludzi w ryzach. Mam tylko nadzieję, że Lares się pośpieszy.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //A, zanim zapomnę! Buster chce z tobą porozmawiać. Nie chciał mi powiedzieć, o co chodzi. Może powinieneś do niego zajrzeć?
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
	description = "Mogę ci jakoś pomóc w tej sprawie z Bennetem?";
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
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Mogę ci jakoś pomóc w tej sprawie z Bennetem?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Jasne. Odrobina sprytu i rozsądku na pewno nie zaszkodzi.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos świadkiem, że pęta się tu wystarczająco wielu idiotów.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Idź do miasta i postaraj się wyciągnąć stamtąd Benneta.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Tylko się pospiesz! Nie wiem, jak długo zdołam utrzymać moich ludzi w ryzach!
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
	description = "Jakieś wieści w sprawie Benneta?";
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
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Jakieś wieści w sprawie Benneta?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Wygląda na to, że nie poturbowali go za bardzo w więzieniu.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Dobra robota.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Nie, nadal wiemy za mało.
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

	description	 = 	"Co się tu działo?";
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
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Co się tu działo?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Ten sukinsyn, Sylvio, dowiedział się o smokach w Górniczej Dolinie i namieszał w głowach wszystkim na farmie.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Przekonywał chłopaków, żeby poszli z nim do Doliny. Obiecywał bogactwa, sławę, zaszczyty...
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Niektórzy nie chcieli go nawet słuchać, ale znalazło się paru idiotów, którzy dali się nabrać.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Kazali Bennetowi przygotować dla siebie odpowiednie wyposażenie i wyruszyli w drogę.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //Ech, prawdę mówiąc, cieszę się, że Sylvio poszedł wreszcie do diabła.
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
	description	 = 	"Czy możesz mnie wyszkolić?";
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
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Możesz mnie czegoś nauczyć?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Mogę ci pokazać, jak posługiwać się dwuręcznym.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Ale nie mam czasu, żeby wbijać ci do głowy podstawy.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Poducz się trochę u kogoś innego. Jak będziesz gotowy, pokażę ci parę ciekawych sztuczek.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //Słyszałem, że jesteś całkiem niezły, ale mogę ci pokazać parę nowych sztuczek.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee nauczy mnie walki orężem dwuręcznym.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Więc jeśli chcesz, mogę cię uczyć. Ale to będzie kosztowało...
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Ile?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 sztuk złota i możemy zaczynać.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"To trochę za drogo.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Umowa stoi. Oto twoje złoto.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //To trochę za drogo.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Zastanów się. Trudno o drugiego takiego nauczyciela jak ja.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Umowa stoi. Oto twoje złoto.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Świetnie. Nie pożałujesz tego.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee nauczy mnie walki orężem dwuręcznym.");
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
	description = "Dobra. Bierzmy się do nauki.";
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
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Dobra. Bierzmy się do nauki.
	
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Teraz jesteś prawdziwym mistrzem walki dwuręcznym orężem.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Nie potrzebujesz już nauczyciela.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Teraz jesteś prawdziwym mistrzem walki dwuręcznym orężem.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Nie potrzebujesz już nauczyciela.
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

	description	 = 	"Jaszczuroludzie roznoszą smocze jaja po całym kraju.";
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
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Jaszczuroludzie roznoszą smocze jaja po całym kraju.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Można się było tego spodziewać. Najwyższy czas, żebyśmy się stąd wynieśli.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //To co mam z nimi zrobić?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Rozwalić je, a co innego?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Może skorupy da się wykorzystać do sporządzania zbroi, albo czegoś w tym stylu.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Wyglądają na dość solidne. Pogadaj o tym z Bennetem.
		B_LogEntry (TOPIC_DRACHENEIER,"Lee nie zdołał zrobić zbyt wiele ze smoczym jajem. Wysłał mnie do kowala Benneta."); 
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
	description = "Co słychać na farmie?";
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
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Co słychać na farmie?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //Cóż, odkąd odszedł Sylvio, mamy tu względny spokój.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //To chyba dobrze?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Niby tak, ale pracy nam przez to nie ubyło. Moi chłopcy marudzą coraz bardziej, bo teraz muszą pracować za siebie i za ludzi, których wyciągnął Sylvio.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Ale to już mój problem. Jakoś sobie poradzę.
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
	
	description	 = 	"Wiesz może, jak mógłbym przejąć okręt paladynów?";
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
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Wiesz może, jak mógłbym przejąć okręt paladynów?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //A myślisz, że siedziałbym tu, gdybym wiedział, jak to zrobić? Ten okręt jest lepiej strzeżony niż konwoje z rudą w Starym Obozie.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Musi być jakiś sposób, żeby dostać się na pokład.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Dostanie się na pokład to akurat pestka.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Przecież mamy w garści sędziego! Idź do niego i wyduś odpowiednie pismo uprawniające do zajęcia okrętu.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee uważa, że aby dostać się na statek, najlepiej byłoby mieć upoważnienie od sędziego. Wątpię jednak, aby ten ostatni wydał mi przepustkę z własnej, nieprzymuszonej woli.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Mam tu sfałszowane pełnomocnictwo. Dzięki niemu strażnicy powinni wpuścić cię na pokład.
		
			B_LogEntry (TOPIC_Ship,"Poczciwy Lee, zawsze można na nim polegać. Podrobił list, dzięki któremu zostanę wpuszczony na okręt paladynów.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Ale to jeszcze nie wszystko. Musisz najpierw znaleźć kapitana, załogę, i takie tam.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Sam okręt to za mało. Jest jeszcze mnóstwo spraw, które trzeba załatwić.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Kogo powinienem wziąć do załogi?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Znasz kogoś, kto mógłby stanąć za sterem statku?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Znasz kogoś, kto mógłby stanąć za sterem statku?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Jeśli dobrze pamiętam, Torlof kiedyś sporo żeglował. On będzie wiedział co i jak.

	B_LogEntry (TOPIC_Captain,"Torlof to stary wilk morski, może zechce zostać kapitanem na moim statku.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Kogo powinienem wziąć do załogi?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //To już twoja decyzja. Na twoim miejscu brałbym tylko ludzi, którym mógłbym zaufać. Masz wystarczającą ilość zaufanych ludzi?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Jeśli potrzebujesz kowala, pogadaj koniecznie z Bennetem. Lepszego niż on nie znajdziesz.

	B_LogEntry (TOPIC_Crew,"Lee nie pomógł mi zbytnio w skompletowaniu załogi, jednak poradził mi, abym wziął jedynie osoby godne zaufania. Powinienem się udać do Benneta, może on będzie zainteresowany.");
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

	description	 = 	"Sztuczka z pisemnym upoważnieniem zadziałała!";
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
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //Sztuczka z pisemnym upoważnieniem zadziałała! Statek należy teraz do mnie. Pan sędzia był bardzo... pomocny.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //A nie mówiłem? Wiedziałem, że ten sukinsyn jeszcze się do czegoś przyda.
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
	description	 = 	"Zamierzam ukraść okręt.";
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
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Zamierzam ukraść okręt.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //A jak niby chcesz tego dokonać?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //To proste - pójdę na przystań, pokażę im twoje papiery i zajmę statek.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Jak chcesz. Mam nadzieję, że wiesz w co się pakujesz.
	
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
	description	 = 	"Popłyniesz ze mną?";
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
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Popłyniesz ze mną?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //Żartujesz? Jasne, że tak! Mam parę rachunków do wyrównania na kontynencie.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //No i mogę ci pokazać kilka sztuczek w walce dwuręcznym orężem. Mogą ci się przydać.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee chce jak najprędzej wrócić na kontynent. Zaoferował mi swoją pomoc. Z pewnością nigdzie nie znajdę lepszego trenera.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Narazie mam już załogę, ale dam ci znać, gdyby coś się zwolniło.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Dam ci znać, kiedy będziesz mi potrzebny.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"W takim razie pakuj się!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //W takim razie pakuj się!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Co? Już? Teraz?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Tak, podnosimy żagle. Jeśli chcesz się ze mną zabrać, przyjdź na przystań. Spotkamy się na statku.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //Długo czekałem na tę chwilę. Możesz na mnie liczyć.
	
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
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Dam ci znać, kiedy będziesz mi potrzebny.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Cóż, ty wiesz najlepiej. Ale dobrych żołnierzy nigdy nie za wielu.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //No, chyba że to idioci pokroju Sylvio.

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
	description	 = 	"Chyba jednak mi się nie przydasz!";
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
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Chyba jednak mi się nie przydasz!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Jak chcesz. Wiesz, gdzie mnie szukać, prawda?
	
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
	description	 = 	"Chyba jednak będę cię potrzebował!";
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
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Chyba jednak będę cię potrzebował!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Wiedziałem, że tak będzie! Do zobaczenia na statku!
		
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
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Wiesz co? Niech cię! Najpierw każesz mi przyjść, potem mnie odsyłasz...
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




































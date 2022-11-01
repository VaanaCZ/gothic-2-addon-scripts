// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hagen_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Hagen_EXIT_Condition;
	information	= DIA_Hagen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hagen_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Hagen_PMSchulden (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Hagen_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Hagen_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hagen_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Dobrze, że jesteś. Możesz od razu zapłacić grzywnę.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Widzę, że lekceważysz prawa tego miasta, co?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //Lista twoich występków jeszcze się powiększyła!
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //Tylko mi tu nie udawaj niewiniątka!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Zapłacisz maksymalną grzywnę.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //Cóż, wygląda na to, że sytuacja się zmieniła.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Nie ma żadnych świadków morderstwa!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Nikt nie chce zeznawać, że widział cię podczas kradzieży!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //Nie ma żadnych świadków twojej bijatyki.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Wszystkie oskarżenia wobec ciebie zostały wycofane.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //Nie wiem, co się stało w mieście i NIE CHCĘ tego wiedzieć.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Po prostu staraj się na przyszłość unikać kłopotów.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //W każdym bądź razie - postanowiłem darować ci karę.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Staraj się trzymać z dala od podobnych awantur.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Mimo to zapłacisz należne grzywny.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Więc jak będzie, płacisz?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Nie mam tyle pieniędzy!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Ile to miało być?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Ile wynosi grzywna?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Nie mam tyle pieniędzy!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Ile to miało być?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Hagen_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Hagen_PETZMASTER   (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Hagen_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_PETZMASTER_Info()
{
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Twoja reputacja cię wyprzedza. Słyszałem, że pogwałciłeś prawa tego miasta.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Wplątałeś się w niezłą kabałę.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //Morderstwo to poważne przestępstwo!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Nie wspominając nawet o twoich pozostałych przewinieniach.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Strażnicy otrzymali rozkaz natychmiastowego zabijania każdego mordercy.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //Mordercy nie będą tutaj tolerowani. Ale możesz okazać skruchę, płacąc odpowiednią grzywnę.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Oskarżono cię o kradzież!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Nie wspominając nawet o twoich pozostałych przewinieniach.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //To pogwałcenie praw tego miasta. Musisz zapłacić grzywnę.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Wdałeś się w bijatykę, tym samym łamiąc prawo tego miasta.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //A co to za sprawa z owcami?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Pogwałcenie miejskiego prawa to złamanie prawa ustanowionego przez Innosa.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Dlatego musisz zapłacić za swoje przewinienia.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Zabijałeś nasze owce! Początkowo nie dawałem temu wiary...
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Dlaczego muszę zajmować się takimi błahostkami?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Musisz zapłacić grzywnę!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Ile mam zapłacić?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"Nie mam tyle pieniędzy!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Chcę zapłacić grzywnę!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Przychodzę, żeby zapłacić grzywnę.
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //Świetnie! Dopilnuję, żeby dowiedzieli się o tym wszyscy mieszkańcy miasta. To poprawi trochę twoją reputację.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //Nie mam tyle złota!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Zatem postaraj się szybko je zdobyć.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //Ale ostrzegam: jeśli popełnisz jeszcze jakieś wykroczenia, nie będzie dla ciebie litości!
	
	Hagen_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Hallo (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Hallo_Condition;
	information	 = 	DIA_Lord_Hagen_Hallo_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};
func int DIA_Lord_Hagen_Hallo_Condition ()
{	
	if (hero.guild != GIL_NONE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //Słyszałem już o tobie.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar doniósł mi, że chciałeś ze mną rozmawiać.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Jesteś tym obcym, który domaga się Oka Innosa.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Jestem Lord Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Królewski paladyn, wojownik w służbie Innosa i namiestnik Khorinis.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //Jestem zajętym człowiekiem, więc nie marnuj mojego czasu. Mów od razu, co cię tu sprowadza.
};

///////////////////////////////////////////////////////////////////////
//	Info Frieden
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Frieden (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Frieden_Condition;
	information	 = 	DIA_Lord_Hagen_Frieden_Info;
	permanent	 = 	FALSE;
	description	 =  "Przynoszę propozycję rozejmu od jednego z najemników.";
};
func int DIA_Lord_Hagen_Frieden_Condition ()
{	
	if (MIS_Lee_Friedensangebot == LOG_RUNNING)
	&& (Npc_HasItems (other, itwr_Passage_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Frieden_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //Przynoszę propozycję rozejmu od jednego z najemników.
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //Hmmm... Pokaż!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Znam generała Lee. Znam też okoliczności, w wyniku których trafił jako więzień do Kolonii.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Uważam go za człowieka honoru. Jestem skłonny go ułaskawić... Ale TYLKO jego.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //Jego ludzie zostaną na miejscu. Większość z nich to pozbawione skrupułów łotry, które trafiły tu zasłużenie.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Oni nie mogą liczyć na moją łaskę.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //Czy to wszystko?
	};
	B_LogEntry (Topic_Frieden,"Lord Hagen może wybaczyć Lee, ale nie pozostałym najemnikom."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Armee
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Armee (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Armee_Condition;
	information	 = 	DIA_Lord_Hagen_Armee_Info;
	permanent	 = 	FALSE;
	description	 =  "Armie ciemności zbierają się w pobliżu miasta, w Górniczej Dolinie.";
};
func int DIA_Lord_Hagen_Armee_Condition ()
{	
	if (!MIS_Lee_Friedensangebot == LOG_RUNNING)
	|| (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Armee_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Armie ciemności zbierają się w pobliżu miasta, w Górniczej Dolinie.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //W Dolinie? Wysłałem tam oddział moich ludzi. Doniesiono mi, że przełęcz jest zajęta przez orków.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Ale pierwsze słyszę o... armiach ciemności.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //Czy to jakaś sztuczka, która ma mnie skłonić do zawarcia przymierza z najemnikami?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //Nie.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //A co to niby za armia?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Stado smoków, którym towarzyszy horda równie groźnych istot.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Smoki? Stare pisma głoszą, że ostatnie smoki widziano setki lat temu!
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Dlaczego miałbym ci uwierzyć, co?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //Tu nie chodzi o to, czy mi wierzysz, tylko czy możesz sobie pozwolić, żeby mi NIE wierzyć.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Dopóki nie przedstawisz mi jakiegoś dowodu, nie wyślę tam żadnych nowych ludzi.
};

///////////////////////////////////////////////////////////////////////
//	Info Proof
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Proof (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Proof_Condition;
	information	 = 	DIA_Lord_Hagen_Proof_Info;
	permanent	 = 	TRUE;
	description	 =  "A więc mam ci dostarczyć dowodów?";
};
func int DIA_Lord_Hagen_Proof_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee )
	&& (Hagen_BringProof == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Proof_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //A więc mam ci dostarczyć dowodów?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Dokładnie tak. Zejdź przełęczą do Górniczej Doliny. Na miejscu poszukaj naszej ekspedycji, a gdy ją znajdziesz - porozmawiaj z kapitanem Garondem.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Jeśli ktoś może coś powiedzieć o tej sytuacji, to właśnie on.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Jeśli Garond potwierdzi twoje słowa, będę skłonny ci zaufać.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Czy to znaczy, że przekażesz mi Oko Innosa?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //Oko Innosa... niech będzie. Przynieś mi niezbity dowód, a dopilnuję, żebyś dostał ten amulet.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //Mam na to twoje słowo?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Tak, masz moje słowo.
		Hagen_BringProof = TRUE;
	}
	else
	{
		if (hero.guild == GIL_NOV)
		{
			PrintScreen	(PRINT_Addon_GuildNeeded_NOV, -1,-1, FONT_Screen ,2);
		}
		else 
		{	
			PrintScreen	(PRINT_Addon_GuildNeeded, -1,-1, FONT_Screen ,2);
		};	
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Auge (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Auge_Condition;
	information	 = 	DIA_Lord_Hagen_Auge_Info;
	permanent	 = 	FALSE;
	description	 =  "Co ci wiadomo na temat Oka Innosa?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //Co ci wiadomo na temat Oka Innosa?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //To święty artefakt... Stare przepowiednie łączą go ze smokami.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //Ale głoszą również, że tylko Wybraniec Innosa może nosić ten amulet.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //JA jestem Wybrańcem Innosa.
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Więc może będziesz mógł założyć Oko.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Pass (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Pass_Condition;
	information	 = 	DIA_Lord_Hagen_Pass_Info;
	permanent	 = 	FALSE;
	description	 =  "Jak mam się dostać na przełęcz?";
};
func int DIA_Lord_Hagen_Pass_Condition ()
{	
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Pass_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Jak mam się dostać na przełęcz?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Dam ci klucz do bramy prowadzącej na przełęcz. Dalej musisz jednak radzić sobie sam. Tej drogi pilnują stada orków.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Niech Innos będzie z tobą.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Lord Hagen chce, abym dostarczył mu jakiś dowód na istnienie armii Zła. Powinienem się udać do Górniczej Doliny i porozmawiać z Kapitanem Garondem.");
	
	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine (Fernando,"WAIT"); 
	};
	
	Wld_InsertNpc (BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47");	//Joly: //ADDON stört dann nicht mehr
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lord_Hagen_Ornament		(C_INFO)
{
	npc		 	= PAL_200_Hagen;
	nr		 	= 10;
	condition	= DIA_Addon_Lord_Hagen_Ornament_Condition;
	information	= DIA_Addon_Lord_Hagen_Ornament_Info;

	description	= "Szukam metalowego ornamentu.";
};

func int DIA_Addon_Lord_Hagen_Ornament_Condition ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
	&& (Lord_Hagen_GotOrnament == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lord_Hagen_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Szukam metalowego ornamentu. Powinien być gdzieś w kamiennym kręgu przy farmie Lobarta.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Jeśli chodzi ci o to tutaj... Myśleliśmy, że może to być magiczna runa, ale to całkowicie bezwartościowy przedmiot.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //Weź go sobie, do niczego nam się nie przyda.
	
	CreateInvItems (self, ItMi_Ornament_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Ornament_Addon, 1);	
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Khorinis (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Khorinis_Condition;
	information	 = 	DIA_Lord_Hagen_Khorinis_Info;
	permanent	 = 	FALSE;
	description	 =  "Co was sprowadza do Khorinis?";
};
func int DIA_Lord_Hagen_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //Co was sprowadza do Khorinis?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Wysłano nas z misją wagi państwowej. Otrzymaliśmy rozkaz od samego Króla Rhobara.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //Mówiłem ci już, że wysłaliśmy ekspedycję do Górniczej Doliny. Po to tu właśnie przybyliśmy.
};

///////////////////////////////////////////////////////////////////////
//	Info Minental
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Minental (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Minental_Condition;
	information	 = 	DIA_Lord_Hagen_Minental_Info;
	permanent	 = 	TRUE;
	description	 =  "Co twoi ludzie robią w Górniczej Dolinie?";
};
func int DIA_Lord_Hagen_Minental_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Khorinis))
	&& (KnowsPaladins_Ore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Minental_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //Co twoi ludzie robią w Górniczej Dolinie?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Nie widzę powodu, dla którego miałbym ci to mówić!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //Byłeś tam. Sam powinieneś wiedzieć.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //No dobrze. Skoro i tak się tam udajesz, mogę ci chyba powiedzieć.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //Chodzi o magiczną rudę. Dzięki niej możemy jeszcze wygrać tę wojnę.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Bez oręża wykonanego z tej rudy, królewska armia nie ma żadnych szans w starciu z elitarnymi oddziałami orków.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //A na tej wyspie znajdują się ostatnie kopalnie, do których mamy jeszcze dostęp.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Wracamy na kontynent, gdy tylko załadujemy całą rudę na statek.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //A więc przegrywamy tę wojnę?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //I tak powiedziałem ci zbyt wiele.
	};
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Hagen_CanTeach		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	5;
	condition	 = 	DIA_Hagen_CanTeach_Condition;
	information	 = 	DIA_Hagen_CanTeach_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Szukam jakiegoś mistrza miecza.";
};
func int DIA_Hagen_CanTeach_Condition ()
{	
	if (LordHagen_Teach2H == FALSE)
	&& (other.guild == GIL_PAL)
	&& (other.aivar[REAL_TALENT_2H] >= 90)
	&& (other.aivar[REAL_TALENT_2H] < 100)
	{
		return TRUE;
	};
};
func void DIA_Hagen_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Szukam jakiegoś mistrza miecza.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //No to go znalazłeś.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Lord Hagen może mnie nauczyć walki orężem dwuręcznym.");
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Hagen_Teach(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 100;
	condition	= DIA_Hagen_Teach_Condition;
	information	= DIA_Hagen_Teach_Info;
	permanent	= TRUE;
	description = "Zacznijmy (trening walki broniami dwuręcznymi).";
};                       
//----------------------------------
var int DIA_Hagen_Teach_permanent;
//----------------------------------
FUNC INT DIA_Hagen_Teach_Condition()
{
	if (LordHagen_Teach2H == TRUE)
	&& (DIA_Hagen_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hagen_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //Zaczynajmy.
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Jesteś teraz prawdziwym mistrzem miecza. Więcej nie mogę cię nauczyć.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Niech mądrość mistrza miecza zawsze kieruje twoimi czynami.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Hagen_Teach);
};

FUNC VOID DIA_Hagen_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)) ,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)) ,DIA_Hagen_Teach_2H_5);	
};

FUNC VOID DIA_Hagen_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);	
	
};
//##############################################################
//###
//###	RitterAufnahme
//###
//##############################################################

//**************************************************************
//	Ich will auch ein Paladin werden.
//**************************************************************


INSTANCE DIA_Lord_Hagen_Knight		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	990;
	condition	 = 	DIA_Lord_Hagen_Knight_Condition;
	information	 = 	DIA_Lord_Hagen_Knight_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Chciałbym wstąpić do waszego zakonu.";
};
FUNC INT DIA_Lord_Hagen_Knight_Condition ()
{	
	if (hero.guild == GIL_MIL)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Knight_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Chciałbym wstąpić do waszego zakonu.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Dobrze, ale najpierw musisz udowodnić, że posiadasz odwagę, umiejętności i wiedzę potrzebną słudze Innosa.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Twoje czyny świadczą, że jesteś człowiekiem honoru.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Jeśli takie jest twoje życzenie, chętnie powitam cię w naszym zakonie.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Nie podjąłem jeszcze ostatecznej decyzji.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Jestem gotów!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Aby zostać wojownikiem Innosa, musisz całkowicie poświęcić się wypełnianiu jego woli.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //W naszym zakonie służyć mogą tylko najmężniejsi i najszlachetniejsi z wojowników.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Jeśli naprawdę chcesz zostać jednym z nas, musisz dowieść, że jesteś tego godzien.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Nie podjąłem jeszcze ostatecznej decyzji.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Zatem rozważ tę sprawę w swoim sercu i wróć, gdy będziesz gotowy.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Jestem gotów!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //Niech tak się stanie!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //Wielu z tych, którzy wstąpili na tę ścieżkę, oddało życie w służbie Innosowi.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //Czy przysięgasz czcić swymi czynami pamięć po nich i głosić wszem, i wobec chwałę Innosa?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //Przysięgam!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Zatem od tej pory jesteś członkiem naszego zakonu.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Niniejszym tytułuję cię wojownikiem Innosa.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Daję ci oręż i zbroję godną rycerza. Noś je z dumą!

	CreateInvItems (self,ITAR_PAL_M,1);
	B_GiveInvItems (self,other,ITAR_PAL_M,1);

	if ((other.HitChance[NPC_TALENT_2H]) >= (other.HitChance[NPC_TALENT_1H])) //Damit der SC auch seine Lieblingswaffe bekommt ;-)
	{
		CreateInvItems (self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems (self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_1h_Pal_Sword,1);
	};		 
	
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,ITAR_PAL_M);

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //Zostając jednym z nas, otrzymujesz prawo wstępu do klasztoru.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Albrecht wyuczy cię naszej magii. Idź i porozmawiaj z nim.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //Nasze kwatery w górnym mieście są oczywiście do twojej dyspozycji.

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	
	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};


//***********************************************
//	Wie kann ich mich würdig erweisen
//***********************************************

INSTANCE DIA_Lord_Hagen_WhatProof		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	991;
	condition	 = 	DIA_Lord_Hagen_WhatProof_Condition;
	information	 = 	DIA_Lord_Hagen_WhatProof_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Jak mam udowodnić, że jestem godny, by do was dołączyć?";
};

FUNC INT DIA_Lord_Hagen_WhatProof_Condition ()
{	
	if (Hagen_GaveInfoKnight == TRUE)	
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_WhatProof_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Jak mam udowodnić, że jestem godny, by do was dołączyć?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //Tylko twoje czyny będą odpowiednim świadectwem.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //W imię Innosa walczymy o wolność i sprawiedliwość.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Stawiamy czoła Beliarowi i jego sługom, którzy próbują zniszczyć święty ład Innosa.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Rozumiem.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //Nic nie rozumiesz! Honor jest całym naszym życiem, a nasze życie należy do Innosa.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Paladyn rusza do boju z imieniem swojego boga na ustach. Wielu z nas złożyło życie na ołtarzu odwiecznej walki Dobra ze Złem.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //Każdy paladyn musi pozostać wierny tej tradycji. Jeśli zbłądzimy, zbrukamy pamięć naszych poległych towarzyszy.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Aby zostać paladynem, musisz w pełni zdać sobie z tego sprawę.
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

INSTANCE DIA_Lord_Hagen_KAP3_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   PERM KAP 3
// ************************************************************

var int Hagen_KnowsEyeKaputt;
// --------------------------

INSTANCE DIA_Lord_Hagen_KAP3U4_PERM(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 998;
	condition	= DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information	= DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent	= TRUE;
	description = "Jak wygląda sytuacja?";
};                       
FUNC INT DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3U4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Jakieś wieści?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Muszę jakoś uratować tę ekspedycję.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Musimy coś zrobić w sprawie tych smoków.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //Może Oko Innosa zdoła nas jeszcze ocalić...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Ja tu chyba oszaleję. Jestem żołnierzem, a nie urzędnikiem!
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //Przez te wszystkie dokumenty, pisma i zarządzenia zapomniałem już chyba, jak się trzyma miecz w garści!
	};
};

// ************************************************************
// 	  				   PERM KAP3U4
// ************************************************************

INSTANCE DIA_Lord_Hagen_EyeBroken(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 1;
	condition	= DIA_Lord_Hagen_EyeBroken_Condition;
	information	= DIA_Lord_Hagen_EyeBroken_Info;
	permanent	= FALSE;
	description = "Mam Oko przy sobie. Niestety, jest uszkodzone.";
};                       
FUNC INT DIA_Lord_Hagen_EyeBroken_Condition()
{
	if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE)	))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_EyeBroken_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //Mam Oko przy sobie. Niestety, jest uszkodzone.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //CO TAKIEGO?! Cóżeś uczynił?! Bez Oka jesteśmy zgubieni!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Porozmawiaj z Pyrokarem! Musi być jakiś sposób, żeby je naprawić!
	Hagen_KnowsEyeKaputt = TRUE;
};

//*********************************************************************
//	Info BACKINTOWN
//*********************************************************************

instance DIA_Lord_Hagen_BACKINTOWN		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_BACKINTOWN_Condition;
	information	 = 	DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Przynoszę wieści od Garonda.";
};
func int DIA_Lord_Hagen_BACKINTOWN_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) >= 1)
	&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_BACKINTOWN_Info ()
{
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Przynoszę ci wieści od Garonda. Proszę, kazał mi wręczyć ten list.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //Sytuacja jest groźniejsza, niż przypuszczałem. Ale mów! Mów, co się dzieje w Górniczej Dolinie!
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Paladyni zabarykadowali się w tamtejszym zamku. Oblega ich horda orków.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Wielu żołnierzy poległo. Zostało też bardzo niewiele rudy.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //Obawiam się, że bez odpowiedniego wsparcia ci ludzie nie mają szans.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Znajdę jakiś sposób, żeby ich stamtąd wyciągnąć. Innos będzie ci wdzięczny...
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Bardziej niż jego wdzięczność przyda mi się Oko.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Tak, naturalnie. Dotrzymam słowa. Weź ten list. On otworzy przed tobą bramy klasztoru.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Porozmawiaj z Pyrokarem - najwyższym z Magów Ognia. Pokaż mu to pismo, a on zaprowadzi cię do Oka.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //Jeszcze jedno, zanim pójdziesz.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //Weź tę runę jako wyraz mojej wdzięczności. W chwilach potrzeby przeniesie cię ona bezpiecznie do miasta.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Lord Hagen wręczył mi przesyłkę, dzięki której Mistrz Pyrokar dopuści mnie do Oka Innosa.");

			Wld_InsertNpc 		(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
			Wld_InsertNpc		(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
			Wld_InsertNpc		(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09"); 
			Wld_InsertNpc		(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
			B_KillNpc 			(BDT_1020_Bandit_L);	//Joly: macht Platz für DMT_1200_Dementor
			Wld_InsertNpc		(DMT_1200_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1201_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1202_Dementor, "NW_TROLLAREA_RITUAL_01");
			//Wld_InsertNpc		(DMT_1203_Dementor, "NW_TROLLAREA_RITUAL_02");//Joly:waren zu viele!
			Wld_InsertNpc		(DMT_1204_Dementor, "NW_TROLLAREA_RITUAL_03");
			//Wld_InsertNpc		(DMT_1205_Dementor, "NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc		(DMT_1206_Dementor, "NW_TROLLAREA_RITUAL_05");
			Wld_InsertNpc		(DMT_1207_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1208_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1209_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1210_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1211_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			B_StartOtherRoutine (Pedro,"Tot"); 
				if (Npc_IsDead (MiltenNW))	//Wichtig, damit Milten vor dem Kloster steht!!!!!
				{ 
					Wld_InsertNpc (PC_MAGE_NW ,"NW_MONASTERY_ENTRY_01");
					B_StartOtherRoutine (MiltenNW,"START");		//zur Sicherheit
				};		
			Wld_InsertNpc		(NOV_650_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_650_ToterNovize);
			Wld_InsertNpc		(NOV_651_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_651_ToterNovize);
			Wld_InsertNpc		(NOV_652_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_652_ToterNovize);
			Wld_InsertNpc		(NOV_653_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_653_ToterNovize);
			Wld_InsertNpc		(NOV_654_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_654_ToterNovize);
			Wld_InsertNpc		(NOV_655_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_655_ToterNovize);
			Wld_InsertNpc		(NOV_656_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_656_ToterNovize);
	
			TEXT_Innoseye_Setting	=	TEXT_Innoseye_Setting_Broken; 
			Wld_InsertItem		(ItMi_InnosEye_Broken_Mis , "FP_TROLLAREA_RITUAL_ITEM"); 
};

//--------Hier kommt der gesamte Befreie den schmied Klumpatsch-------------


//*********************************************************
//		Lasse Bennet aus dem Knast
//*********************************************************

var int Hagen_einmalBennet;
// -----------------------

INSTANCE DIA_Lord_Hagen_RescueBennet		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_RescueBennet_Condition;
	information	 = 	DIA_Lord_Hagen_RescueBennet_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Muszę z tobą porozmawiać o Bennecie.";
};

FUNC INT DIA_Lord_Hagen_RescueBennet_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Cornelius_IsLiar == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Muszę z tobą porozmawiać o Bennecie.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Ale to ten najemnik, który zamordował jednego z moich ludzi!
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Skąd masz pewność, że to Bennet jest mordercą?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Sądzę, że Bennet jest niewinny.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Może Bennet mógłby naprawić Oko Innosa.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Może Bennet mógłby naprawić Oko Innosa.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //Choćby nawet mógł ściągnąć na ziemię potęgę samego Innosa...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //...ten człowiek zamordował paladyna i zostanie za to stracony.
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Skąd masz pewność, że to Bennet jest mordercą?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //Mamy naocznego świadka.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Jak widzisz, wina tego najemnika nie podlega dyskusji.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Co to za świadek?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, sekretarz gubernatora, widział całe zajście.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Podany przez niego rysopis pasuje jak ulał do Benneta. Z mojego punktu widzenia, sprawa jest zamknięta.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Najemnik zostanie powieszony za zdradę stanu.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, sekretarz gubernatora, twierdzi, że był świadkiem morderstwa."); 

	RecueBennet_KnowsCornelius = TRUE;
	//RescueBennet_KnowsWitness = TRUE; 
};
/*
FUNC VOID DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekretär des Statthalters, hat den Mord gesehen.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache für mich erledigt.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der Söldner wird wegen Landesverrats hängen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, der Sekretär des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben."); 

	RecueBennet_KnowsCornelius = TRUE;
};
*/
FUNC VOID DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //Sądzę, że Bennet jest niewinny.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Dowody są jednoznaczne. To on jest sprawcą.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //A jeśli dowody zostały sfałszowane?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Uważaj, co mówisz! To bardzo poważne oskarżenie!
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Jeśli nie masz dowodów, które podważają zeznania mojego świadka, lepiej trzymaj język za zębami.
};


//**************************************************************
//	Cornelius hat gelogen.	
//**************************************************************

INSTANCE DIA_Lord_Hagen_Cornelius		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_Cornelius_Condition;
	information	 = 	DIA_Lord_Hagen_Cornelius_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Cornelius kłamie.";
};

FUNC INT DIA_Lord_Hagen_Cornelius_Condition ()
{	
	if (Npc_HasItems (other,ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (Cornelius_IsLiar == TRUE)
	&& (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Cornelius_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Cornelius kłamie.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Skąd ta pewność?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Mam jego pamiętnik. Są tu wszystkie dowody.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //A to podła gnida!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //W świetle nowych dowodów mogę zrobić tylko jedno.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //Na mocy powierzonej mi przez Jego Wysokość i Świątynię ogłaszam...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...że więzień Bennet zostaje oczyszczony ze wszystkich zarzutów i ma zostać zwolniony.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Za to Cornelius ma zostać pojmany, pod zarzutem krzywoprzysięstwa.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Oszczędzę ci kłopotu. Cornelius nie żyje.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //Zatem otrzymał już sprawiedliwą karę. Dobra robota.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Cornelius uciekł.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Znajdziemy go, prędzej czy później. Nie wywinie się.
		B_StartOtherRoutine (Cornelius,"FLED");
	}
	else 
	{
		B_StartOtherRoutine (Cornelius,"PRISON");
	};
	
	
	MIS_RescueBennet = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_RescueBennet);
	
	if (hero.guild == GIL_MIL)
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Twoje czyny godne są jednego z nas.
	};
};
//--------Hier endet der gesamte Befreie den Schmied Klumpatsch-------------




//**************************************************************
//	Auge Innos ganz!	
//**************************************************************

INSTANCE DIA_Lord_Hagen_AugeAmStart	(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	4;
	condition	 = 	DIA_Lord_Hagen_AugeAmStart_Condition;
	information	 = 	DIA_Lord_Hagen_AugeAmStart_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Oko należy do mnie!";
};

FUNC INT DIA_Lord_Hagen_AugeAmStart_Condition ()
{	
	if (Kapitel <= 4)
	&& (MIS_ReadyForChapter4 == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_AugeAmStart_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //Oko należy do mnie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //Tak, Oko jest twoje!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //I to ty musisz je naprawić!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //Zatem musisz być Wybrańcem Innosa.
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Zamierzam położyć kres zagrożeniu ze strony smoków.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //Idź więc, i z pomocą Innosa zniszcz Zło w zarodku.
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

INSTANCE DIA_Lord_Hagen_KAP4_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Antipaladine
///////////////////////////////////////////////////////////////////////

instance DIA_Lord_Hagen_ANTIPALADINE(C_INFO)
{
	npc		 	= 	PAL_200_Hagen;
	nr		 	= 	3;
	condition	 = 	DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information	 = 	DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Najlepsi wojownicy orków ruszyli do ataku.";
};

func int DIA_Lord_Hagen_ANTIPALADINE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)))
	&& (Hagen_SawOrcRing == FALSE)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};
var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Najlepsi wojownicy orków ruszyli do ataku.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Rozmawiałem z Lordem Hagenem na temat zbliżających się hord hersztów orków."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Dlaczego tak sądzisz?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //Rozmawiałem z jednym z nich. W rozmowie padło twoje imię.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Brednie. Moi ludzie nie donieśli mi o żadnym pospolitym ruszeniu orków.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Może jacyś ich zwiadowcy zabłąkali się do pobliskich lasów.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //To nie byli zwiadowcy. Przy jednym z nich znalazłem ten pierścień.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Pokaż.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Hmmm... Niepokojące...
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //To znak ich siły. A więc orkowie porzucili swoje palisady i stanęli do boju w otwartym polu.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Nie widziałem ich jeszcze zbyt wielu. Głównie ich przywódców i kilku wojowników.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //Tak? Zatem planują coś innego. To mało podobne do orków, by ich przywódcy wypuszczali się w pojedynkę poza swoje osiedla.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Ale to świetna okazja, by uderzyć w ich czuły punkt.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Gdy stracą swoich przywódców, morale całej armii osłabnie.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //Mam dla ciebie nowe zadanie, rycerzu. Masz zabić wszystkich orkowych przywódców, którzy kręcą się po okolicy.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Tylko przynieś mi ich pierścienie! Po takim ciosie szybko się nie podniosą.
			
			B_LogEntry (TOPIC_OrcElite,"Na dowód moich słów przyniosłem Hagenowi orkowy pierścień. Kazał sobie dostarczyć wszystkie pierścienie, jakie tylko uda mi się zdobyć."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Udaj się najpierw do Ingmara. Doradzi ci, jak skutecznie walczyć z takim przeciwnikiem.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Elitarni wojownicy orków to jego specjalność. Często miał z nimi do czynienia.
			B_LogEntry (TOPIC_OrcElite,"Elitarni orkowi wojownicy są specjalnością Ingmara."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //Twoje słowo, że pokonałeś orkowego wodza, to dla mnie za mało!
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Jeśli mam ci uwierzyć, potrzebuję bardziej wiarygodnych dowodów.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen nie chce mi uwierzyć. Zażądał dowodów na to, że orkowi wojownicy faktycznie atakują ludzkie siedziby. Cóż, byłbym zaskoczony, gdyby tego nie zrobił."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RingeBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_RINGEBRINGEN		(C_INFO)
{
	npc		 = 	PAL_200_Hagen;
	nr		 = 	5;
	condition	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mam jeszcze coś do powiedzenia w sprawie orkowych przywódców.";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition ()
{
	if (Hagen_SawOrcRing == TRUE)
	&& (Npc_HasItems (other,ItRi_OrcEliteRing) >= 1)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

var int OrkRingCounter;

func void DIA_Lord_Hagen_RINGEBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Mam jeszcze coś do powiedzenia w sprawie orkowych przywódców.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //Słucham...

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld für einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //Mam dla ciebie jeszcze jeden pierścień.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //Mam dla ciebie kolejne pierścienie.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Dobra robota! Tak trzymać.

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //W okolicy może się kręcić jeszcze kilku.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Wkrótce rzucimy te bestie na kolana!
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Zdziwiłbym się, gdyby w okolicy kręciło się ich jeszcze wielu.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Jeśli chcesz, możesz nadal przynosić mi pierścienie, ale myślę, że orkowie dostali już odpowiednią nauczkę.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Proszę. Weź to złoto i kup za nie lepsze wyposażenie.

	OrcRingGeld	= (Ringcount * HagensRingOffer);	

	CreateInvItems (self, ItMi_Gold, OrcRingGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OrcRingGeld);
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

INSTANCE DIA_Lord_Hagen_KAP5_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************************
//		Die Drachen sind tot
//****************************************************************************

INSTANCE DIA_Lord_Hagen_AllDragonsDead(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_AllDragonsDead_Condition;
	information	= DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Wszystkie smoki nie żyją.";
};                       
FUNC INT DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Wszystkie smoki zostały zgładzone.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //Wiedziałem, że Innos doda ci sił w walce ze smokami!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Gdzie jest ruda?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Orkowie wciąż oblegają zamek w Górniczej Dolinie. Garond nie może opuścić twierdzy, póki nie odeprze ich ataku.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //Niech to szlag!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Jeśli Garond nie potrafi uporać się z tą sytuacją, sam się tym zajmę!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //Żadna banda orków nie stanie mi na przeszkodzie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //Powiadomiłem już moich ludzi. Przygotowujemy się do wyruszenia w drogę.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Zabieram ich wszystkich. Na straży statku pozostaną nieliczni wartownicy.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //Pora, by ktoś wreszcie rozprawił się z tymi orkami!

	MIS_SCVisitShip = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ShipFree");	
};

// ************************************************************
// 	  				   Ich brauche das Schiff
// ************************************************************

INSTANCE DIA_Lord_Hagen_NeedShip(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_NeedShip_Condition;
	information	= DIA_Lord_Hagen_NeedShip_Info;
	permanent	= FALSE;
	description = "Potrzebuję okrętu.";
};                       
FUNC INT DIA_Lord_Hagen_NeedShip_Condition()
{
	if (ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_NeedShip_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Potrzebuję okrętu.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //Nie ty jeden, żołnierzu.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //Słyszę to prawie codziennie, przyjacielu. Ale...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Nie masz nawet kapitana, nie wspominając już o załodze...
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //A co z tym statkiem na przystani?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Ten okręt należy do mnie. To na nim przewieziemy rudę.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Mogę ci go użyczyć, dopiero gdy wywiążemy się z zadania.
};


// ************************************************************
// 	  				 Tor auf
// ************************************************************

INSTANCE DIA_Lord_Hagen_GateOpen (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_GateOpen_Condition;
	information	= DIA_Lord_Hagen_GateOpen_Info;
	permanent	= FALSE;
	description = "Orkowie przypuścili szturm na zamek w Górniczej Dolinie!";
};                       
FUNC INT DIA_Lord_Hagen_GateOpen_Condition()
{
	if (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_GateOpen_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Orkowie przypuścili szturm na zamek w Górniczej Dolinie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //Na Innosa! Co tam się stało?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //Wygląda na to, że brama była otwarta...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //Wygląda... Jak to możliwe... W zamku musi być zdrajca!
};

// ************************************************************
// 	  						 PERM
// ************************************************************

INSTANCE DIA_Lord_Hagen_Perm5 (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_Perm5_Condition;
	information	= DIA_Lord_Hagen_Perm5_Info;
	permanent	= TRUE;
	description = "Na co czekasz?";
};                       
FUNC INT DIA_Lord_Hagen_Perm5_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_Perm5_Info()
{	
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //Na co czekasz?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Czekam tylko na wyposażenie i żywność. Zaraz potem ruszamy!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Po szturmie na zamek potrzebujemy jeszcze więcej zapasów.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //Ale to tylko nieznacznie opóźni nasz wymarsz.
	};
};

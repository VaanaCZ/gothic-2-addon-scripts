// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_garond_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_EXIT_Condition;
	information	= DIA_Garond_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Garond_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Garond_PMSchulden (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Garond_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Garond_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garond_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Nie mamy o czym rozmawiać, póki nie uiścisz grzywny.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //A wzrosła ona jeszcze w świetle ostatnich wydarzeń.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Wpakowałeś się w kolejne kłopoty.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Mam nadzieję, że wreszcie za wszystko zapłacisz. W sumie wychodzi...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Zawiodłem się na tobie. Twoja grzywna wyniesie...
		};
				
		var int diff; diff = (B_GetTotalPetzCounter(self) - Garond_LastPetzCounter);
		
		if (diff > 0)
		{
			Garond_Schulden = Garond_Schulden + (diff * 50);
		};
		
		if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
		B_Say_Gold (self, other, Garond_Schulden);
	}
	else if (B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Sytuacja poważnie się zmieniła.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Nie jesteś już oskarżony o morderstwo.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nikt nie przypomina sobie ciebie na miejscu kradzieży.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Żaden świadek nie może potwierdzić, że brałeś udział w bijatyce.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Wygląda na to, że wszystkie zarzuty wobec ciebie zostały wycofane.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Nie wiem, co się dzieje, ale ostrzegam: nie posuwaj się za daleko!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Postanowiłem umorzyć twój dług.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //Tylko już nigdy nie sprawiaj kłopotów na terenie zamku!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Żeby wszystko było jasne: I TAK zapłacisz całą grzywnę. Co do grosza!
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Więc jak?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Nie mam tyle pieniędzy!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Ile to miało być?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Ile wynosi ta grzywna?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Nie mam tyle pieniędzy!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Ile to miało być?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Chcę zapłacić grzywnę!",DIA_Garond_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Garond_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Garond_PETZMASTER   (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Garond_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_PETZMASTER_Info()
{
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Podobno stwarzałeś problemy moim podwładnym.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //Byłem ciekaw, ile czasu minie, zanim trafisz do mnie.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Morderstwo to ostatnia rzecz, której nam tutaj potrzeba.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Każdy z moich ludzi jest mi teraz potrzebny, a ty zabiłeś jednego z nich!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Nie wspomnę już o twoich pozostałych wybrykach.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Wyjaśnijmy coś sobie: wszyscy jedziemy na tym samym wózku.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //Potrzebuję każdego, kto jest w stanie nosić oręż, łącznie z tobą.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Jeśli już musisz kogoś zabić, wyjdź za mury. Tam aż roi się od orków!
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Wyznaczę ci grzywnę, choć prawdę mówiąc, brzydzę się grzebaniem w takim gównie.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Plotka głosi, że pożyczyłeś sobie stąd kilka rzeczy.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Nie wspominając już o innych twoich wybrykach.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Nie puszczę tego płazem. Chyba nie zdajesz sobie sprawy z powagi sytuacji.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Zapłacisz grzywnę za wszystkie swoje występki.
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Nie toleruję bijatyk między moimi ludźmi.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //A ta sprawa z owcami wcale nie poprawia twojej sytuacji.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Dlatego zapłacisz odpowiednią grzywnę.
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Dlaczego zabijasz nasze owce, pozbawiając nas żywności?
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Zapłacisz mi za to mięso.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Ile?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Nie mam tyle pieniędzy!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Chcę zapłacić grzywnę!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Chcę zapłacić grzywnę.
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Dobrze. Uprzedzę chłopców, żeby dali ci spokój. Tylko już nigdy nie próbuj tutaj takich sztuczek!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Nie mam tyle złota!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Więc postaraj się czym prędzej je zdobyć.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //Ale ostrzegam: kolejna awantura znacznie podniesie cenę!
	
	Garond_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Garond_Hello (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Hello_Condition;
	information	= DIA_Garond_Hello_Info;
	IMPORTANT 	= TRUE;
	permanent	= FALSE;
};                       

FUNC INT DIA_Garond_Hello_Condition()
{
	if (Kapitel == 2)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garond_Hello_Info()
{	
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Skąd się tu wziąłeś? Nie jesteś górnikiem ani jednym z moich ludzi. No, słucham?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Przeszedłem przez przełęcz.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Przełęcz?! I udało ci się przez nią przedostać? Na Innosa!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Co cię tutaj sprowadza, magu?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Jakie są twoje rozkazy, żołnierzu?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Ciekawym, czemu najemnik chciałby tak ryzykować... Czego tu szukasz?
		};
};

//**********************************
//	Ich brauch Beweise 
//**********************************

INSTANCE DIA_Garond_NeedProof (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 1;
	condition	= DIA_Garond_NeedProof_Condition;
	information	= DIA_Garond_NeedProof_Info;
	description = "Przysyła mnie Lord Hagen.";
};                       

FUNC INT DIA_Garond_NeedProof_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garond_Hello))
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&&	(Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_NeedProof_Info()
{		
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Przybywam na polecenie Lorda Hagena. Mam mu dostarczyć dowód na istnienie smoków.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //Zamierzasz więc znaleźć taki dowód, a potem wrócić do bezpiecznego miasta, co?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //Coś w tym stylu.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //A więc chce dowodu? Dostanie go. Ale nie odeślę cię do Lorda Hagena bez dokładnych informacji o rudzie.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Słuchaj, Lord Hagen musi się dowiedzieć, jak wygląda sytuacja i ile rudy wydobyliśmy do tej pory.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //W porządku. Co mam dla ciebie zrobić?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //Wysłałem trzy ekipy górników, ale żadna z nich nie przysłała mi jeszcze ani bryłki.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Udasz się do każdej z nich i wybadasz, jak przebiega wydobycie.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Potem napiszę list, który zaniesiesz Lordowi Hagenowi.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Cóż, chyba nie mam wyboru...
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Kapitan Garond chce, abym odnalazł trzy ekipy górnicze i dowiedział się, ile rudy udało im się wydobyć.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Kapitan Garond wysłał trzy ekipy górników na poszukiwania magicznej rudy. żadna z nich nie wróciła.");
	B_LogEntry (TOPIC_ScoutMine,"Moim zadaniem jest odnalezienie wszystkich trzech ekip i sprawdzenie, ile rudy udało im się wydobyć.");

};
// ************************************************************
// 			  Warum ich?
// ************************************************************

INSTANCE DIA_Garond_Why (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Why_Condition;
	information	= DIA_Garond_Why_Info;
	permanent	= FALSE;
	description = "Ale dlaczego właśnie ja?";
};                       

FUNC INT DIA_Garond_Why_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Why_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Ale dlaczego właśnie ja?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Bo potrafisz prześlizgnąć się przez linie wroga. Moi ludzie nie mieliby żadnych szans na twoim miejscu.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //A ty już raz pokonałeś tę drogę. To zadanie w sam raz dla ciebie.
};
// ************************************************************
// 			Ausrüstung
// ************************************************************

INSTANCE DIA_Garond_Equipment (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Equipment_Condition;
	information	= DIA_Garond_Equipment_Info;
	permanent	= FALSE;
	description = "Potrzebuję lepszego wyposażenia.";
};                       

FUNC INT DIA_Garond_Equipment_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& ((other.guild == GIL_KDF)
	||  (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Equipment_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Potrzebuję lepszego wyposażenia.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Porozmawiaj z magiem Miltenem. On będzie wiedział, czego ci potrzeba.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Zgłoś się w tej sprawie do Tandora. On da ci wszystko, czego potrzebujesz.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor handluje na zamku bronią.");
	};
};
// ************************************************************
// 			Zahlen
// ************************************************************

INSTANCE DIA_Garond_zahlen (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_zahlen_Condition;
	information	= DIA_Garond_zahlen_Info;
	permanent	= FALSE;
	description = "Co dostanę za wykonanie tego zadania?";
};                       

FUNC INT DIA_Garond_zahlen_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_zahlen_Info()
{		
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Co dostanę za wykonanie tego zadania?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //Nie zwykłem targować się z najemnikami!
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Ale chyba nie mam wyboru. Zrób, o co proszę, a dostaniesz ode mnie 500 sztuk złota.
};
// ************************************************************
// 	Wo finde ich die Schürfstellen?
// ************************************************************

INSTANCE DIA_Garond_Wo (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Wo_Condition;
	information	= DIA_Garond_Wo_Info;
	permanent	= FALSE;
	description = "Gdzie mam szukać twoich górników?";
};                       

FUNC INT DIA_Garond_Wo_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Wo_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Gdzie mam szukać twoich górników?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Weź tę mapę. Zaznaczyłem na niej dwa rejony, w których prowadzimy wydobycie.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Gdybyś miał jeszcze jakieś pytania, porozmawiaj z Parcivalem. On powie ci wszystko na temat górników.
	
	B_LogEntry (TOPIC_ScoutMine,"Paladyn Parcival może udzielić mi informacji o górnikach.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Niech to diabli! Co się tu dzieje? Czyżby sam Beliar przybył, by się z nami zmierzyć?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Większość moich ludzi zginęła. Dzięki tej garstce rudy nie powstrzymamy nawet jednego orka, a co dopiero całą armię!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Ta wyprawa jest z góry skazana na niepowodzenie!
};

// ************************************************************
// 	Fajeth
// ************************************************************
INSTANCE DIA_Garond_Fajeth (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Fajeth_Condition;
	information	= DIA_Garond_Fajeth_Info;
	permanent	= FALSE;
	description = "Rozmawiałem z Fajethem.";
};                       

FUNC INT DIA_Garond_Fajeth_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Fajeth_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Fajeth_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //Rozmawiałem z Fajethem.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Co u niego słychać?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Jego ludzie wydobyli dwie skrzynie rudy.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Hmmm... dwie skrzynie?! Ja potrzebuję DWUSTU skrzyń!
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Mam ci też przekazać, że potrzebuje dodatkowych ludzi.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Co? Mam wysłać kolejnych ludzi na pewną śmierć? Nie ma mowy!
 	
 	Ore_Counter = (Ore_Counter +1);
 	B_GivePlayerXP (XP_Fajeth_Ore);
 	
 	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};

// ************************************************************
// 	Silvestro
// ************************************************************
INSTANCE DIA_Garond_Silvestro (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Silvestro_Condition;
	information	= DIA_Garond_Silvestro_Info;
	permanent	= FALSE;
	description = "Jeśli chodzi o grupę Silvestra...";
};                       

FUNC INT DIA_Garond_Silvestro_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Silvestro_Ore == TRUE)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Silvestro_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Jeśli chodzi o grupę Silvestra...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Widziałeś go? Rozmawiałeś z nim?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Wszyscy zginęli. Zaskoczyło ich stado pełzaczy.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //A co z rudą? Wiesz, ile zdołali wydobyć?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Zdążyli zabezpieczyć kilka skrzyń. Ukryli je w jaskini, przy ścieżce prowadzącej z zamku do miejsca wydobycia.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Do diaska... To byli dobrzy ludzie. Niech Innos ulituje się nad ich duszami.
	
	Ore_Counter = (Ore_Counter +1);
	B_GivePlayerXP (XP_Silvestro_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};
// ************************************************************
// 	Marcos
// ************************************************************
INSTANCE DIA_Garond_Marcos (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Marcos_Condition;
	information	= DIA_Garond_Marcos_Info;
	permanent	= FALSE;
	description = "Rozmawiałem z Marcosem.";
};                       

FUNC INT DIA_Garond_Marcos_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Marcos_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Marcos_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //Rozmawiałem z Marcosem.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //I jakie wieści? Ile rudy zdołali wydobyć?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Cztery skrzynie. Marcos opuścił już miejsce wydobycia, by przenieść rudę w bezpieczne miejsce.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Teraz strzeże jej w małej dolinie za liniami orków. Prosi o posiłki.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Tylko cztery skrzynie? I opuścił już kopalnię? Niedobrze. Bardzo niedobrze.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //Mam mu wysłać dodatkowych ludzi? Trudno... dwóch będzie musiało mu wystarczyć.
	
	
	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;
	
	B_StartOtherRoutine (Marcos_Guard1,"MARCOS");
	B_StartOtherRoutine (Marcos_Guard2,"MARCOS");
	
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	
	Ore_Counter = (Ore_Counter +1);
	MIS_Marcos_Jungs = LOG_SUCCESS;

	B_GivePlayerXP (XP_Marcos_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};		
// ************************************************************
// Info Success
// ************************************************************

INSTANCE DIA_Garond_Success (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Success_Condition;
	information	= DIA_Garond_Success_Info;
	permanent	= FALSE;
	description = "Co z listem do Lorda Hagena?";
};                       

FUNC INT DIA_Garond_Success_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Success_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Success_15_00"); //Co z listem do Lorda Hagena?
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Mamy w sumie dziesięć marnych skrzyń rudy, a straciliśmy dwa razy tyle dobrych ludzi.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Dostaniesz swój list. Lord Hagen MUSI się o tym dowiedzieć. Ta dolina jest przeklęta. To siedlisko zła.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Kapitan Garond wręczył mi list. Muszę zanieść go Lordowi Hagenowi - mam nadzieję, że taki dowód mu wystarczy.");
	
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP (XP_ScoutMine);
	MIS_ReadyForChapter3  = TRUE; 	//Joly: Bei Levelchange ab hier in die Newworld  -> Kapitel 3!!!!!!
	B_NPC_IsAliveCheck (OldWorld_Zen);
};
// ************************************************************
// SLD bezahlen
// ************************************************************

INSTANCE DIA_Garond_SLD (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_SLD_Condition;
	information	= DIA_Garond_SLD_Info;
	permanent	= FALSE;
	description = "Co z moją zapłatą?";
};                       

FUNC INT DIA_Garond_SLD_Condition()
{
	if (MIS_ScoutMine == LOG_SUCCESS)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_SLD_Info()
{		
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //Co z moją zapłatą?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Ach, tak, prawda. Jestem ci winien trochę złota. Oto twoja nagroda.
	B_GiveInvItems (self, other, itMI_Gold, 500);
};
// ************************************************************
// Info Perm wenn Scout Mine == RUNNING
// ************************************************************
INSTANCE DIA_Garond_Running (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 10;
	condition	= DIA_Garond_Running_Condition;
	information	= DIA_Garond_Running_Info;
	permanent	= TRUE;
	description = "Jak wygląda sytuacja?";
};                       

FUNC INT DIA_Garond_Running_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Running_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Jak się mają sprawy?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Czekam jeszcze na raport o ostatniej grupie. Mam nadzieję, że będą to wreszcie dobre wiadomości.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Czekam na raport o pozostałych dwóch grupach. Wtedy zobaczymy.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Powinieneś czym prędzej ruszyć w drogę. Muszę wiedzieć, ile rudy wydobyto do tej pory.
	};
	
};
// ************************************************************
// Gorn
// ************************************************************

INSTANCE DIA_Garond_Gorn (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Gorn_Condition;
	information	= DIA_Garond_Gorn_Info;
	permanent	= FALSE;
	description = "Chcę, żebyś wypuścił na wolność Gorna.";
};                       

FUNC INT DIA_Garond_Gorn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_MiltenOW_Gorn))
	&& (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_Garond_NeedProof))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Gorn_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Chcę, żebyś wypuścił na wolność Gorna.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //To niemożliwe. Popełnił wiele przestępstw i musi za nie odpokutować.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Nie mogę go wykupić?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //Cóż, istnieje taka możliwość, ale jego wolność będzie cię drogo kosztować. 1000 sztuk złota, to moja cena.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //To dużo pieniędzy.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //A Gorn dużo narozrabiał. Przynieś mi pieniądze, a ja puszczę go wolno.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Za uwolnienie Gorna Garond domaga się tysiąca sztuk złota.");
};
// ************************************************************
// Gorn freikaufen
// ************************************************************

INSTANCE DIA_Garond_Pay (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Pay_Condition;
	information	= DIA_Garond_Pay_Info;
	permanent	= TRUE;
	description = "Chcę wykupić Gorna (zapłać 1000 sztuk złota).";
};                       
FUNC INT DIA_Garond_Pay_Condition()
{
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Pay_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Chcę wykupić Gorna.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Dobrze. Idź do Gerolda i powiedz mu, że z mojego rozkazu ma wypuścić więźnia.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Zapłaciłem Garondowi. Teraz mogę pójść po Gorna do więzienia. Strażnik Gerold go wypuści.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Zatem przynieś mi 1000 sztuk złota.
	};	
};
// ************************************************************
// Info Perm in Kap.2
// ************************************************************
INSTANCE DIA_Garond_Perm2 (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 9;
	condition	= DIA_Garond_Perm2_Condition;
	information	= DIA_Garond_Perm2_Info;
	permanent	= TRUE;
	description = "Co zamierzasz teraz zrobić?";
};                       

FUNC INT DIA_Garond_Perm2_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garond_Success)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Perm2_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Co zamierzasz teraz zrobić?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Próbowałem wszystkiego. Teraz cała nadzieja w tobie, i w posiłkach od Lorda Hagena.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Będziemy dalej trwali na posterunku, zanosząc modły do Innosa, by nie opuścił nas w tej godzinie próby.
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

INSTANCE DIA_Garond_KAP3_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP3_EXIT_Condition;
	information	= DIA_Garond_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGibtsNeues
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_WASGIBTSNEUES		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	30;
	condition	 = 	DIA_Garond_WASGIBTSNEUES_Condition;
	information	 = 	DIA_Garond_WASGIBTSNEUES_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co nowego?";
};

func int DIA_Garond_WASGIBTSNEUES_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info ()
{
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //Co nowego?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Niech cię szlag! Czego tu jeszcze szukasz? Potrzebuję tych cholernych posiłków!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Nawet Milten wyniósł się z zamku. A ja potrzebuję więcej ludzi! WIĘCEJ!
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

INSTANCE DIA_Garond_KAP4_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP4_EXIT_Condition;
	information	= DIA_Garond_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_BACKINKAP4		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	12;
	condition	 = 	DIA_Garond_BACKINKAP4_Condition;
	information	 = 	DIA_Garond_BACKINKAP4_Info;
	Permanent	 =	FALSE;
	description	 = 	"Wróciłem.";
};

func int DIA_Garond_BACKINKAP4_Condition ()
{
	if (Kapitel == 4)
		{
				return TRUE;
		};
};

func void DIA_Garond_BACKINKAP4_Info ()
{
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Wróciłem.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Przecież widzę. Gdzie są posiłki?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen przybędzie, gdy tylko będzie mógł. Wiele się wydarzyło.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //Nie obchodzi mnie to! Potrzebuję żołnierzy! Orków jest co raz więcej. Długo tu nie wytrzymamy.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Moi ludzie są wyczerpani. Kończą się nam zapasy.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Przybyło paru ochotników.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Masz na myśli siebie i swoich kumpli - łowców smoków, tak? Możecie nam pomóc, ale to i tak nie wystarczy.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Masz na myśli tych łowców smoków na zewnątrz? Mogą nam pomóc, ale i tak to nie wystarczy!
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Jeśli Hagen nie przyśle mi wkrótce ludzi, wątpię, byśmy wypełnili zadanie.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;


	// Die Drachenjäger vom Spielstart verziehen sich in ihr Lager.
	//-----------------------------------------
	B_StartOtherRoutine 	(Kjorn,	"START");
	B_StartOtherRoutine 	(Godar,	"START");
	B_StartOtherRoutine 	(Hokurn,"START");
	B_StartOtherRoutine 	(PC_Fighter_DJG,"START");
	B_StartOtherRoutine  (Kurgan,"START");

	if 	(DJG_BiffParty == FALSE)
	{
	B_StartOtherRoutine 	(Biff,"START");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	11;
	condition	 = 	DIA_Garond_DragonPlettBericht_Condition;
	information	 = 	DIA_Garond_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co do tych smoków...";
};

var int DIA_Garond_DragonPlettBericht_NoPerm;
func int DIA_Garond_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Garond_BACKINKAP4))
	&& (DIA_Garond_DragonPlettBericht_NoPerm == FALSE)
	{
		return TRUE;
	};
};

var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;
func void DIA_Garond_DragonPlettBericht_Info ()
{
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond powinien być zainteresowany problemem smoków, tymczasem sprawia wrażenie, jakby ta sprawa w ogóle go nie obchodziła."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //Mam wiadomości dotyczące smoków.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Mów.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Zabiłem smoka z bagien na wschód stąd.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Smok z fortecy na południu już nie żyje.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Ognisty smok z wulkanu na południu już nikogo nie zaatakuje.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Udałem się na zachód i rozprawiłem się z lodowym smokiem.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //To dobra wiadomość. Masz tu trochę pieniędzy na lepszy ekwipunek.
		
		DrachenGeld = (CurrentDragonCount * Garond_KilledDragonGeld);
		XP_LocalGarond =  (CurrentDragonCount * XP_Garond_KilledDragon);

		B_GivePlayerXP (XP_LocalGarond);

		CreateInvItems (self, ItMi_Gold, DrachenGeld);									
		B_GiveInvItems (self, other, ItMi_Gold, DrachenGeld);					

		Garond_DragonCounter = MIS_KilledDragons;

		if (MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
		};
	};
		
	if (Garond_OricExperte_OneTime == FALSE)
	&& ((Npc_IsDead(Oric))	== FALSE)
	&& (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Możesz mi powiedzieć coś więcej na temat tych smoków?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Mam teraz inne zmartwienie. Mój doradca, Orik, powie ci o wszystkim.
		B_LogEntry (TOPIC_DRACHENJAGD,"Doradca Garonda, Orik, może mieć dla mnie pożyteczne informacje."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Czy w międzyczasie zaatakowały was smoki?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Na szczęście nie. Na razie mamy spokój.
	};
};

//*********************************************************************
//	Ich habe alle drachen getötet
//*********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_AllDragonDead		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	12;
	condition	 = 	DIA_Garond_AllDragonDead_Condition;
	information	 = 	DIA_Garond_AllDragonDead_Info;
	Permanent	 =	FALSE;
	description	 = 	"Wszystkie smoki nie żyją.";
};

func int DIA_Garond_AllDragonDead_Condition ()
{
	if (MIS_AllDragonsDead == TRUE)
	&& (DIA_Garond_DragonPlettBericht_NoPerm == TRUE)	
	&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info ()
{
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Wszystkie smoki nie żyją.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //Wszystkie? A więc Zło zostało ostatecznie pokonane?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Niestety, nie. Pozostał jeszcze ich przywódca.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Ale czy to nie smoki dowodziły orkami?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Tak, to prawda, ale one też mają swojego władcę. Jego również musimy zgładzić.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Ale ja nie mogę się stąd ruszyć! Muszę pilnować rudy, a dookoła kręcą się jeszcze ci przeklęci orkowie.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Będziesz musiał sam się tym zająć. Nie mogę ci pomóc.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Niech Innos ma cię w swojej opiece.
};

///////////////////////////////////////////////////////////////////////
//	Mission JanBecomeSmith
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_JanBecomeSmith		(C_INFO)
{
	npc			= 	PAL_250_Garond;
	nr		 	= 	12;
	condition	= 	DIA_Garond_JanBecomeSmith_Condition;
	information	= 	DIA_Garond_JanBecomeSmith_Info;
	Permanent	=	TRUE;
	description	= 	"Jest pewien problem z kowalem.";
};

func int DIA_Garond_JanBecomeSmith_Condition ()
{
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info ()
{
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //Jest pewien problem z kowalem.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Jakim kowalem? Kowal zbiegł! Uciekł do lasu.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //Czyżby wrócił? W takim razie powiedz mu...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Nie, nie! TEN kowal ma na imię Jan.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //To łowca smoków, jak ja, a przy tym dobry kowal.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Jeden z łowców smoków jest kowalem.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //To dobra wiadomość. Poprzedni kowal dał nogę. Tchórz!
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan chętnie zajmie się pracą w kuźni.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Rozumiem. Myślisz, że można mu zaufać?
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Tak.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Ręczysz za niego?
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Jeśli zacznie sprawiać kłopoty, to ty poniesiesz konsekwencje, jasne?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Muszę się zastanowić.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Ręczę za niego.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Jeszcze się nad tym zastanowię.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Jak mam mu zaufać, skoro nawet ty nie możesz?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Dopóki ktoś nie weźmie za niego odpowiedzialności, ma się trzymać z dala od kuźni!

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Ręczę za niego.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Dobrze. Może od razu zacząć pracę w kuźni. Liczę, że zaopatrzy moich ludzi w solidny oręż.
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS; 
	B_GivePlayerXP (XP_Ambient);
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

INSTANCE DIA_Garond_KAP5_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP5_EXIT_Condition;
	information	= DIA_Garond_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm5
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_PERM5		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	59;
	condition	 = 	DIA_Garond_PERM5_Condition;
	information	 = 	DIA_Garond_PERM5_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak wygląda sytuacja?";
};

func int DIA_Garond_PERM5_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info ()
{
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //Co nowego?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Przeklęte miejsce! Jakiś sukinsyn otworzył główną bramę! Teraz możemy już tylko czekać na egzekucję.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Jak się dowiem, kto nas zdradził...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Jeśli Hagen szybko nie przybędzie z odsieczą, wybiją nas tu do nogi.
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


INSTANCE DIA_Garond_KAP6_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP6_EXIT_Condition;
	information	= DIA_Garond_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

































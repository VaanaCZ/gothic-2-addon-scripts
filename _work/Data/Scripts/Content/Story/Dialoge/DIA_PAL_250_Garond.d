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
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Nie mamy o czym rozmawiaæ, póki nie uiœcisz grzywny.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //A wzros³a ona jeszcze w œwietle ostatnich wydarzeñ.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Wpakowa³eœ siê w kolejne k³opoty.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Mam nadziejê, ¿e wreszcie za wszystko zap³acisz. W sumie wychodzi...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Zawiod³em siê na tobie. Twoja grzywna wyniesie...
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
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Sytuacja powa¿nie siê zmieni³a.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Nie jesteœ ju¿ oskar¿ony o morderstwo.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nikt nie przypomina sobie ciebie na miejscu kradzie¿y.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //¯aden œwiadek nie mo¿e potwierdziæ, ¿e bra³eœ udzia³ w bijatyce.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Wygl¹da na to, ¿e wszystkie zarzuty wobec ciebie zosta³y wycofane.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Nie wiem, co siê dzieje, ale ostrzegam: nie posuwaj siê za daleko!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Postanowi³em umorzyæ twój d³ug.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //Tylko ju¿ nigdy nie sprawiaj k³opotów na terenie zamku!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //¯eby wszystko by³o jasne: I TAK zap³acisz ca³¹ grzywnê. Co do grosza!
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Wiêc jak?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Nie mam tyle pieniêdzy!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Ile to mia³o byæ?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Ile wynosi ta grzywna?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Nie mam tyle pieniêdzy!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Ile to mia³o byæ?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Garond_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Podobno stwarza³eœ problemy moim podw³adnym.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //By³em ciekaw, ile czasu minie, zanim trafisz do mnie.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Morderstwo to ostatnia rzecz, której nam tutaj potrzeba.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Ka¿dy z moich ludzi jest mi teraz potrzebny, a ty zabi³eœ jednego z nich!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Nie wspomnê ju¿ o twoich pozosta³ych wybrykach.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Wyjaœnijmy coœ sobie: wszyscy jedziemy na tym samym wózku.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //Potrzebujê ka¿dego, kto jest w stanie nosiæ orê¿, ³¹cznie z tob¹.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Jeœli ju¿ musisz kogoœ zabiæ, wyjdŸ za mury. Tam a¿ roi siê od orków!
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Wyznaczê ci grzywnê, choæ prawdê mówi¹c, brzydzê siê grzebaniem w takim gównie.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Plotka g³osi, ¿e po¿yczy³eœ sobie st¹d kilka rzeczy.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Nie wspominaj¹c ju¿ o innych twoich wybrykach.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Nie puszczê tego p³azem. Chyba nie zdajesz sobie sprawy z powagi sytuacji.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Zap³acisz grzywnê za wszystkie swoje wystêpki.
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Nie tolerujê bijatyk miêdzy moimi ludŸmi.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //A ta sprawa z owcami wcale nie poprawia twojej sytuacji.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Dlatego zap³acisz odpowiedni¹ grzywnê.
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Dlaczego zabijasz nasze owce, pozbawiaj¹c nas ¿ywnoœci?
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Zap³acisz mi za to miêso.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Ile?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Nie mam tyle pieniêdzy!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Chcê zap³aciæ grzywnê!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Chcê zap³aciæ grzywnê.
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Dobrze. Uprzedzê ch³opców, ¿eby dali ci spokój. Tylko ju¿ nigdy nie próbuj tutaj takich sztuczek!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Nie mam tyle z³ota!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Wiêc postaraj siê czym prêdzej je zdobyæ.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //Ale ostrzegam: kolejna awantura znacznie podniesie cenê!
	
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
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Sk¹d siê tu wzi¹³eœ? Nie jesteœ górnikiem ani jednym z moich ludzi. No, s³ucham?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Przeszed³em przez prze³êcz.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Prze³êcz?! I uda³o ci siê przez ni¹ przedostaæ? Na Innosa!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Co ciê tutaj sprowadza, magu?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Jakie s¹ twoje rozkazy, ¿o³nierzu?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Ciekawym, czemu najemnik chcia³by tak ryzykowaæ... Czego tu szukasz?
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
	description = "Przysy³a mnie Lord Hagen.";
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
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Przybywam na polecenie Lorda Hagena. Mam mu dostarczyæ dowód na istnienie smoków.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //Zamierzasz wiêc znaleŸæ taki dowód, a potem wróciæ do bezpiecznego miasta, co?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //Coœ w tym stylu.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //A wiêc chce dowodu? Dostanie go. Ale nie odeœlê ciê do Lorda Hagena bez dok³adnych informacji o rudzie.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //S³uchaj, Lord Hagen musi siê dowiedzieæ, jak wygl¹da sytuacja i ile rudy wydobyliœmy do tej pory.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //W porz¹dku. Co mam dla ciebie zrobiæ?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //Wys³a³em trzy ekipy górników, ale ¿adna z nich nie przys³a³a mi jeszcze ani bry³ki.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Udasz siê do ka¿dej z nich i wybadasz, jak przebiega wydobycie.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Potem napiszê list, który zaniesiesz Lordowi Hagenowi.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Có¿, chyba nie mam wyboru...
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Kapitan Garond chce, abym odnalaz³ trzy ekipy górnicze i dowiedzia³ siê, ile rudy uda³o im siê wydobyæ.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Kapitan Garond wys³a³ trzy ekipy górników na poszukiwania magicznej rudy. ¿adna z nich nie wróci³a.");
	B_LogEntry (TOPIC_ScoutMine,"Moim zadaniem jest odnalezienie wszystkich trzech ekip i sprawdzenie, ile rudy uda³o im siê wydobyæ.");

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
	description = "Ale dlaczego w³aœnie ja?";
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
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Ale dlaczego w³aœnie ja?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Bo potrafisz przeœlizgn¹æ siê przez linie wroga. Moi ludzie nie mieliby ¿adnych szans na twoim miejscu.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //A ty ju¿ raz pokona³eœ tê drogê. To zadanie w sam raz dla ciebie.
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
	description = "Potrzebujê lepszego wyposa¿enia.";
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
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Potrzebujê lepszego wyposa¿enia.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Porozmawiaj z magiem Miltenem. On bêdzie wiedzia³, czego ci potrzeba.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Zg³oœ siê w tej sprawie do Tandora. On da ci wszystko, czego potrzebujesz.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor handluje na zamku broni¹.");
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
	description = "Co dostanê za wykonanie tego zadania?";
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
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Co dostanê za wykonanie tego zadania?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //Nie zwyk³em targowaæ siê z najemnikami!
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Ale chyba nie mam wyboru. Zrób, o co proszê, a dostaniesz ode mnie 500 sztuk z³ota.
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
	description = "Gdzie mam szukaæ twoich górników?";
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
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Gdzie mam szukaæ twoich górników?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //WeŸ tê mapê. Zaznaczy³em na niej dwa rejony, w których prowadzimy wydobycie.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Gdybyœ mia³ jeszcze jakieœ pytania, porozmawiaj z Parcivalem. On powie ci wszystko na temat górników.
	
	B_LogEntry (TOPIC_ScoutMine,"Paladyn Parcival mo¿e udzieliæ mi informacji o górnikach.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Niech to diabli! Co siê tu dzieje? Czy¿by sam Beliar przyby³, by siê z nami zmierzyæ?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Wiêkszoœæ moich ludzi zginê³a. Dziêki tej garstce rudy nie powstrzymamy nawet jednego orka, a co dopiero ca³¹ armiê!
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
	description = "Rozmawia³em z Fajethem.";
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
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //Rozmawia³em z Fajethem.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Co u niego s³ychaæ?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Jego ludzie wydobyli dwie skrzynie rudy.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Hmmm... dwie skrzynie?! Ja potrzebujê DWUSTU skrzyñ!
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Mam ci te¿ przekazaæ, ¿e potrzebuje dodatkowych ludzi.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Co? Mam wys³aæ kolejnych ludzi na pewn¹ œmieræ? Nie ma mowy!
 	
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
	description = "Jeœli chodzi o grupê Silvestra...";
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
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Jeœli chodzi o grupê Silvestra...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Widzia³eœ go? Rozmawia³eœ z nim?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Wszyscy zginêli. Zaskoczy³o ich stado pe³zaczy.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //A co z rud¹? Wiesz, ile zdo³ali wydobyæ?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Zd¹¿yli zabezpieczyæ kilka skrzyñ. Ukryli je w jaskini, przy œcie¿ce prowadz¹cej z zamku do miejsca wydobycia.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Do diaska... To byli dobrzy ludzie. Niech Innos ulituje siê nad ich duszami.
	
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
	description = "Rozmawia³em z Marcosem.";
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
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //Rozmawia³em z Marcosem.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //I jakie wieœci? Ile rudy zdo³ali wydobyæ?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Cztery skrzynie. Marcos opuœci³ ju¿ miejsce wydobycia, by przenieœæ rudê w bezpieczne miejsce.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Teraz strze¿e jej w ma³ej dolinie za liniami orków. Prosi o posi³ki.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Tylko cztery skrzynie? I opuœci³ ju¿ kopalniê? Niedobrze. Bardzo niedobrze.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //Mam mu wys³aæ dodatkowych ludzi? Trudno... dwóch bêdzie musia³o mu wystarczyæ.
	
	
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
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Mamy w sumie dziesiêæ marnych skrzyñ rudy, a straciliœmy dwa razy tyle dobrych ludzi.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Dostaniesz swój list. Lord Hagen MUSI siê o tym dowiedzieæ. Ta dolina jest przeklêta. To siedlisko z³a.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Kapitan Garond wrêczy³ mi list. Muszê zanieœæ go Lordowi Hagenowi - mam nadziejê, ¿e taki dowód mu wystarczy.");
	
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
	description = "Co z moj¹ zap³at¹?";
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
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //Co z moj¹ zap³at¹?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Ach, tak, prawda. Jestem ci winien trochê z³ota. Oto twoja nagroda.
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
	description = "Jak wygl¹da sytuacja?";
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
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Jak siê maj¹ sprawy?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Czekam jeszcze na raport o ostatniej grupie. Mam nadziejê, ¿e bêd¹ to wreszcie dobre wiadomoœci.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Czekam na raport o pozosta³ych dwóch grupach. Wtedy zobaczymy.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Powinieneœ czym prêdzej ruszyæ w drogê. Muszê wiedzieæ, ile rudy wydobyto do tej pory.
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
	description = "Chcê, ¿ebyœ wypuœci³ na wolnoœæ Gorna.";
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
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Chcê, ¿ebyœ wypuœci³ na wolnoœæ Gorna.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //To niemo¿liwe. Pope³ni³ wiele przestêpstw i musi za nie odpokutowaæ.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Nie mogê go wykupiæ?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //Có¿, istnieje taka mo¿liwoœæ, ale jego wolnoœæ bêdzie ciê drogo kosztowaæ. 1000 sztuk z³ota, to moja cena.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //To du¿o pieniêdzy.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //A Gorn du¿o narozrabia³. Przynieœ mi pieni¹dze, a ja puszczê go wolno.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Za uwolnienie Gorna Garond domaga siê tysi¹ca sztuk z³ota.");
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
	description = "Chcê wykupiæ Gorna (zap³aæ 1000 sztuk z³ota).";
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
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Chcê wykupiæ Gorna.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Dobrze. IdŸ do Gerolda i powiedz mu, ¿e z mojego rozkazu ma wypuœciæ wiêŸnia.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Zap³aci³em Garondowi. Teraz mogê pójœæ po Gorna do wiêzienia. Stra¿nik Gerold go wypuœci.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Zatem przynieœ mi 1000 sztuk z³ota.
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
	description = "Co zamierzasz teraz zrobiæ?";
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
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Co zamierzasz teraz zrobiæ?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Próbowa³em wszystkiego. Teraz ca³a nadzieja w tobie, i w posi³kach od Lorda Hagena.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Bêdziemy dalej trwali na posterunku, zanosz¹c mod³y do Innosa, by nie opuœci³ nas w tej godzinie próby.
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
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Niech ciê szlag! Czego tu jeszcze szukasz? Potrzebujê tych cholernych posi³ków!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Nawet Milten wyniós³ siê z zamku. A ja potrzebujê wiêcej ludzi! WIÊCEJ!
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
	description	 = 	"Wróci³em.";
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
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Wróci³em.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Przecie¿ widzê. Gdzie s¹ posi³ki?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen przybêdzie, gdy tylko bêdzie móg³. Wiele siê wydarzy³o.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //Nie obchodzi mnie to! Potrzebujê ¿o³nierzy! Orków jest co raz wiêcej. D³ugo tu nie wytrzymamy.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Moi ludzie s¹ wyczerpani. Koñcz¹ siê nam zapasy.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Przyby³o paru ochotników.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Masz na myœli siebie i swoich kumpli - ³owców smoków, tak? Mo¿ecie nam pomóc, ale to i tak nie wystarczy.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Masz na myœli tych ³owców smoków na zewn¹trz? Mog¹ nam pomóc, ale i tak to nie wystarczy!
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Jeœli Hagen nie przyœle mi wkrótce ludzi, w¹tpiê, byœmy wype³nili zadanie.

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
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond powinien byæ zainteresowany problemem smoków, tymczasem sprawia wra¿enie, jakby ta sprawa w ogóle go nie obchodzi³a."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //Mam wiadomoœci dotycz¹ce smoków.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Mów.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Zabi³em smoka z bagien na wschód st¹d.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Smok z fortecy na po³udniu ju¿ nie ¿yje.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Ognisty smok z wulkanu na po³udniu ju¿ nikogo nie zaatakuje.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Uda³em siê na zachód i rozprawi³em siê z lodowym smokiem.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //To dobra wiadomoœæ. Masz tu trochê pieniêdzy na lepszy ekwipunek.
		
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
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Mo¿esz mi powiedzieæ coœ wiêcej na temat tych smoków?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Mam teraz inne zmartwienie. Mój doradca, Orik, powie ci o wszystkim.
		B_LogEntry (TOPIC_DRACHENJAGD,"Doradca Garonda, Orik, mo¿e mieæ dla mnie po¿yteczne informacje."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Czy w miêdzyczasie zaatakowa³y was smoki?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Na szczêœcie nie. Na razie mamy spokój.
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
	description	 = 	"Wszystkie smoki nie ¿yj¹.";
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
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Wszystkie smoki nie ¿yj¹.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //Wszystkie? A wiêc Z³o zosta³o ostatecznie pokonane?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Niestety, nie. Pozosta³ jeszcze ich przywódca.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Ale czy to nie smoki dowodzi³y orkami?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Tak, to prawda, ale one te¿ maj¹ swojego w³adcê. Jego równie¿ musimy zg³adziæ.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Ale ja nie mogê siê st¹d ruszyæ! Muszê pilnowaæ rudy, a dooko³a krêc¹ siê jeszcze ci przeklêci orkowie.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Bêdziesz musia³ sam siê tym zaj¹æ. Nie mogê ci pomóc.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Niech Innos ma ciê w swojej opiece.
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
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Jakim kowalem? Kowal zbieg³! Uciek³ do lasu.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //Czy¿by wróci³? W takim razie powiedz mu...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Nie, nie! TEN kowal ma na imiê Jan.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //To ³owca smoków, jak ja, a przy tym dobry kowal.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Jeden z ³owców smoków jest kowalem.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //To dobra wiadomoœæ. Poprzedni kowal da³ nogê. Tchórz!
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan chêtnie zajmie siê prac¹ w kuŸni.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Rozumiem. Myœlisz, ¿e mo¿na mu zaufaæ?
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Tak.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Rêczysz za niego?
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Jeœli zacznie sprawiaæ k³opoty, to ty poniesiesz konsekwencje, jasne?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Muszê siê zastanowiæ.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Rêczê za niego.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Jeszcze siê nad tym zastanowiê.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Jak mam mu zaufaæ, skoro nawet ty nie mo¿esz?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Dopóki ktoœ nie weŸmie za niego odpowiedzialnoœci, ma siê trzymaæ z dala od kuŸni!

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Rêczê za niego.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Dobrze. Mo¿e od razu zacz¹æ pracê w kuŸni. Liczê, ¿e zaopatrzy moich ludzi w solidny orê¿.
	
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

	description	 = 	"Jak wygl¹da sytuacja?";
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
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Przeklête miejsce! Jakiœ sukinsyn otworzy³ g³ówn¹ bramê! Teraz mo¿emy ju¿ tylko czekaæ na egzekucjê.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Jak siê dowiem, kto nas zdradzi³...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Jeœli Hagen szybko nie przybêdzie z odsiecz¹, wybij¹ nas tu do nogi.
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

































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
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Nie mamy o czym rozmawia�, p�ki nie ui�cisz grzywny.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //A wzros�a ona jeszcze w �wietle ostatnich wydarze�.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Wpakowa�e� si� w kolejne k�opoty.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Mam nadziej�, �e wreszcie za wszystko zap�acisz. W sumie wychodzi...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Zawiod�em si� na tobie. Twoja grzywna wyniesie...
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
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Sytuacja powa�nie si� zmieni�a.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Nie jeste� ju� oskar�ony o morderstwo.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nikt nie przypomina sobie ciebie na miejscu kradzie�y.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //�aden �wiadek nie mo�e potwierdzi�, �e bra�e� udzia� w bijatyce.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Wygl�da na to, �e wszystkie zarzuty wobec ciebie zosta�y wycofane.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Nie wiem, co si� dzieje, ale ostrzegam: nie posuwaj si� za daleko!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Postanowi�em umorzy� tw�j d�ug.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //Tylko ju� nigdy nie sprawiaj k�opot�w na terenie zamku!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //�eby wszystko by�o jasne: I TAK zap�acisz ca�� grzywn�. Co do grosza!
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Wi�c jak?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Nie mam tyle pieni�dzy!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Ile to mia�o by�?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Ile wynosi ta grzywna?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Nie mam tyle pieni�dzy!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Ile to mia�o by�?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Garond_PETZMASTER_PayNow);
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
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Podobno stwarza�e� problemy moim podw�adnym.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //By�em ciekaw, ile czasu minie, zanim trafisz do mnie.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Morderstwo to ostatnia rzecz, kt�rej nam tutaj potrzeba.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Ka�dy z moich ludzi jest mi teraz potrzebny, a ty zabi�e� jednego z nich!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Nie wspomn� ju� o twoich pozosta�ych wybrykach.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Wyja�nijmy co� sobie: wszyscy jedziemy na tym samym w�zku.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //Potrzebuj� ka�dego, kto jest w stanie nosi� or�, ��cznie z tob�.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Je�li ju� musisz kogo� zabi�, wyjd� za mury. Tam a� roi si� od ork�w!
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Wyznacz� ci grzywn�, cho� prawd� m�wi�c, brzydz� si� grzebaniem w takim g�wnie.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Plotka g�osi, �e po�yczy�e� sobie st�d kilka rzeczy.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Nie wspominaj�c ju� o innych twoich wybrykach.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Nie puszcz� tego p�azem. Chyba nie zdajesz sobie sprawy z powagi sytuacji.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Zap�acisz grzywn� za wszystkie swoje wyst�pki.
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Nie toleruj� bijatyk mi�dzy moimi lud�mi.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //A ta sprawa z owcami wcale nie poprawia twojej sytuacji.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Dlatego zap�acisz odpowiedni� grzywn�.
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf get�tet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Dlaczego zabijasz nasze owce, pozbawiaj�c nas �ywno�ci?
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Zap�acisz mi za to mi�so.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Ile?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Nie mam tyle pieni�dzy!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Chc� zap�aci� grzywn�!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Chc� zap�aci� grzywn�.
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Dobrze. Uprzedz� ch�opc�w, �eby dali ci spok�j. Tylko ju� nigdy nie pr�buj tutaj takich sztuczek!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Nie mam tyle z�ota!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Wi�c postaraj si� czym pr�dzej je zdoby�.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //Ale ostrzegam: kolejna awantura znacznie podniesie cen�!
	
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
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Sk�d si� tu wzi��e�? Nie jeste� g�rnikiem ani jednym z moich ludzi. No, s�ucham?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Przeszed�em przez prze��cz.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Prze��cz?! I uda�o ci si� przez ni� przedosta�? Na Innosa!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Co ci� tutaj sprowadza, magu?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Jakie s� twoje rozkazy, �o�nierzu?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Ciekawym, czemu najemnik chcia�by tak ryzykowa�... Czego tu szukasz?
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
	description = "Przysy�a mnie Lord Hagen.";
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
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Przybywam na polecenie Lorda Hagena. Mam mu dostarczy� dow�d na istnienie smok�w.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //Zamierzasz wi�c znale�� taki dow�d, a potem wr�ci� do bezpiecznego miasta, co?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //Co� w tym stylu.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //A wi�c chce dowodu? Dostanie go. Ale nie ode�l� ci� do Lorda Hagena bez dok�adnych informacji o rudzie.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //S�uchaj, Lord Hagen musi si� dowiedzie�, jak wygl�da sytuacja i ile rudy wydobyli�my do tej pory.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //W porz�dku. Co mam dla ciebie zrobi�?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //Wys�a�em trzy ekipy g�rnik�w, ale �adna z nich nie przys�a�a mi jeszcze ani bry�ki.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Udasz si� do ka�dej z nich i wybadasz, jak przebiega wydobycie.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Potem napisz� list, kt�ry zaniesiesz Lordowi Hagenowi.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //C�, chyba nie mam wyboru...
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Kapitan Garond chce, abym odnalaz� trzy ekipy g�rnicze i dowiedzia� si�, ile rudy uda�o im si� wydoby�.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Kapitan Garond wys�a� trzy ekipy g�rnik�w na poszukiwania magicznej rudy. �adna z nich nie wr�ci�a.");
	B_LogEntry (TOPIC_ScoutMine,"Moim zadaniem jest odnalezienie wszystkich trzech ekip i sprawdzenie, ile rudy uda�o im si� wydoby�.");

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
	description = "Ale dlaczego w�a�nie ja?";
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
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Ale dlaczego w�a�nie ja?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Bo potrafisz prze�lizgn�� si� przez linie wroga. Moi ludzie nie mieliby �adnych szans na twoim miejscu.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //A ty ju� raz pokona�e� t� drog�. To zadanie w sam raz dla ciebie.
};
// ************************************************************
// 			Ausr�stung
// ************************************************************

INSTANCE DIA_Garond_Equipment (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Equipment_Condition;
	information	= DIA_Garond_Equipment_Info;
	permanent	= FALSE;
	description = "Potrzebuj� lepszego wyposa�enia.";
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
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Potrzebuj� lepszego wyposa�enia.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Porozmawiaj z magiem Miltenem. On b�dzie wiedzia�, czego ci potrzeba.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Zg�o� si� w tej sprawie do Tandora. On da ci wszystko, czego potrzebujesz.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor handluje na zamku broni�.");
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
	description = "Co dostan� za wykonanie tego zadania?";
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
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Co dostan� za wykonanie tego zadania?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //Nie zwyk�em targowa� si� z najemnikami!
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Ale chyba nie mam wyboru. Zr�b, o co prosz�, a dostaniesz ode mnie 500 sztuk z�ota.
};
// ************************************************************
// 	Wo finde ich die Sch�rfstellen?
// ************************************************************

INSTANCE DIA_Garond_Wo (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Wo_Condition;
	information	= DIA_Garond_Wo_Info;
	permanent	= FALSE;
	description = "Gdzie mam szuka� twoich g�rnik�w?";
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
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Gdzie mam szuka� twoich g�rnik�w?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //We� t� map�. Zaznaczy�em na niej dwa rejony, w kt�rych prowadzimy wydobycie.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Gdyby� mia� jeszcze jakie� pytania, porozmawiaj z Parcivalem. On powie ci wszystko na temat g�rnik�w.
	
	B_LogEntry (TOPIC_ScoutMine,"Paladyn Parcival mo�e udzieli� mi informacji o g�rnikach.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Niech to diabli! Co si� tu dzieje? Czy�by sam Beliar przyby�, by si� z nami zmierzy�?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Wi�kszo�� moich ludzi zgin�a. Dzi�ki tej garstce rudy nie powstrzymamy nawet jednego orka, a co dopiero ca�� armi�!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Ta wyprawa jest z g�ry skazana na niepowodzenie!
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
	description = "Rozmawia�em z Fajethem.";
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
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //Rozmawia�em z Fajethem.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Co u niego s�ycha�?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Jego ludzie wydobyli dwie skrzynie rudy.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Hmmm... dwie skrzynie?! Ja potrzebuj� DWUSTU skrzy�!
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Mam ci te� przekaza�, �e potrzebuje dodatkowych ludzi.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Co? Mam wys�a� kolejnych ludzi na pewn� �mier�? Nie ma mowy!
 	
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
	description = "Je�li chodzi o grup� Silvestra...";
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
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Je�li chodzi o grup� Silvestra...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Widzia�e� go? Rozmawia�e� z nim?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Wszyscy zgin�li. Zaskoczy�o ich stado pe�zaczy.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //A co z rud�? Wiesz, ile zdo�ali wydoby�?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Zd��yli zabezpieczy� kilka skrzy�. Ukryli je w jaskini, przy �cie�ce prowadz�cej z zamku do miejsca wydobycia.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Do diaska... To byli dobrzy ludzie. Niech Innos ulituje si� nad ich duszami.
	
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
	description = "Rozmawia�em z Marcosem.";
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
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //Rozmawia�em z Marcosem.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //I jakie wie�ci? Ile rudy zdo�ali wydoby�?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Cztery skrzynie. Marcos opu�ci� ju� miejsce wydobycia, by przenie�� rud� w bezpieczne miejsce.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Teraz strze�e jej w ma�ej dolinie za liniami ork�w. Prosi o posi�ki.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Tylko cztery skrzynie? I opu�ci� ju� kopalni�? Niedobrze. Bardzo niedobrze.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //Mam mu wys�a� dodatkowych ludzi? Trudno... dw�ch b�dzie musia�o mu wystarczy�.
	
	
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
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Mamy w sumie dziesi�� marnych skrzy� rudy, a stracili�my dwa razy tyle dobrych ludzi.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Dostaniesz sw�j list. Lord Hagen MUSI si� o tym dowiedzie�. Ta dolina jest przekl�ta. To siedlisko z�a.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Kapitan Garond wr�czy� mi list. Musz� zanie�� go Lordowi Hagenowi - mam nadziej�, �e taki dow�d mu wystarczy.");
	
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
	description = "Co z moj� zap�at�?";
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
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //Co z moj� zap�at�?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Ach, tak, prawda. Jestem ci winien troch� z�ota. Oto twoja nagroda.
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
	description = "Jak wygl�da sytuacja?";
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
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Jak si� maj� sprawy?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Czekam jeszcze na raport o ostatniej grupie. Mam nadziej�, �e b�d� to wreszcie dobre wiadomo�ci.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Czekam na raport o pozosta�ych dw�ch grupach. Wtedy zobaczymy.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Powiniene� czym pr�dzej ruszy� w drog�. Musz� wiedzie�, ile rudy wydobyto do tej pory.
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
	description = "Chc�, �eby� wypu�ci� na wolno�� Gorna.";
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
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Chc�, �eby� wypu�ci� na wolno�� Gorna.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //To niemo�liwe. Pope�ni� wiele przest�pstw i musi za nie odpokutowa�.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Nie mog� go wykupi�?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //C�, istnieje taka mo�liwo��, ale jego wolno�� b�dzie ci� drogo kosztowa�. 1000 sztuk z�ota, to moja cena.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //To du�o pieni�dzy.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //A Gorn du�o narozrabia�. Przynie� mi pieni�dze, a ja puszcz� go wolno.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Za uwolnienie Gorna Garond domaga si� tysi�ca sztuk z�ota.");
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
	description = "Chc� wykupi� Gorna (zap�a� 1000 sztuk z�ota).";
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
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Chc� wykupi� Gorna.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Dobrze. Id� do Gerolda i powiedz mu, �e z mojego rozkazu ma wypu�ci� wi�nia.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Zap�aci�em Garondowi. Teraz mog� p�j�� po Gorna do wi�zienia. Stra�nik Gerold go wypu�ci.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Zatem przynie� mi 1000 sztuk z�ota.
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
	description = "Co zamierzasz teraz zrobi�?";
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
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Co zamierzasz teraz zrobi�?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Pr�bowa�em wszystkiego. Teraz ca�a nadzieja w tobie, i w posi�kach od Lorda Hagena.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //B�dziemy dalej trwali na posterunku, zanosz�c mod�y do Innosa, by nie opu�ci� nas w tej godzinie pr�by.
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
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Niech ci� szlag! Czego tu jeszcze szukasz? Potrzebuj� tych cholernych posi�k�w!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Nawet Milten wyni�s� si� z zamku. A ja potrzebuj� wi�cej ludzi! WI�CEJ!
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
	description	 = 	"Wr�ci�em.";
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
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Wr�ci�em.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Przecie� widz�. Gdzie s� posi�ki?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen przyb�dzie, gdy tylko b�dzie m�g�. Wiele si� wydarzy�o.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //Nie obchodzi mnie to! Potrzebuj� �o�nierzy! Ork�w jest co raz wi�cej. D�ugo tu nie wytrzymamy.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Moi ludzie s� wyczerpani. Ko�cz� si� nam zapasy.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Przyby�o paru ochotnik�w.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Masz na my�li siebie i swoich kumpli - �owc�w smok�w, tak? Mo�ecie nam pom�c, ale to i tak nie wystarczy.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Masz na my�li tych �owc�w smok�w na zewn�trz? Mog� nam pom�c, ale i tak to nie wystarczy!
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Je�li Hagen nie przy�le mi wkr�tce ludzi, w�tpi�, by�my wype�nili zadanie.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;


	// Die Drachenj�ger vom Spielstart verziehen sich in ihr Lager.
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
	description	 = 	"Co do tych smok�w...";
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
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond powinien by� zainteresowany problemem smok�w, tymczasem sprawia wra�enie, jakby ta sprawa w og�le go nie obchodzi�a."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //Mam wiadomo�ci dotycz�ce smok�w.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //M�w.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Zabi�em smoka z bagien na wsch�d st�d.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Smok z fortecy na po�udniu ju� nie �yje.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Ognisty smok z wulkanu na po�udniu ju� nikogo nie zaatakuje.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Uda�em si� na zach�d i rozprawi�em si� z lodowym smokiem.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //To dobra wiadomo��. Masz tu troch� pieni�dzy na lepszy ekwipunek.
		
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
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Mo�esz mi powiedzie� co� wi�cej na temat tych smok�w?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Mam teraz inne zmartwienie. M�j doradca, Orik, powie ci o wszystkim.
		B_LogEntry (TOPIC_DRACHENJAGD,"Doradca Garonda, Orik, mo�e mie� dla mnie po�yteczne informacje."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Czy w mi�dzyczasie zaatakowa�y was smoki?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Na szcz�cie nie. Na razie mamy spok�j.
	};
};

//*********************************************************************
//	Ich habe alle drachen get�tet
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
	description	 = 	"Wszystkie smoki nie �yj�.";
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
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Wszystkie smoki nie �yj�.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //Wszystkie? A wi�c Z�o zosta�o ostatecznie pokonane?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Niestety, nie. Pozosta� jeszcze ich przyw�dca.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Ale czy to nie smoki dowodzi�y orkami?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Tak, to prawda, ale one te� maj� swojego w�adc�. Jego r�wnie� musimy zg�adzi�.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Ale ja nie mog� si� st�d ruszy�! Musz� pilnowa� rudy, a dooko�a kr�c� si� jeszcze ci przekl�ci orkowie.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //B�dziesz musia� sam si� tym zaj��. Nie mog� ci pom�c.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Niech Innos ma ci� w swojej opiece.
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
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Jakim kowalem? Kowal zbieg�! Uciek� do lasu.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //Czy�by wr�ci�? W takim razie powiedz mu...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Nie, nie! TEN kowal ma na imi� Jan.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //To �owca smok�w, jak ja, a przy tym dobry kowal.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Jeden z �owc�w smok�w jest kowalem.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //To dobra wiadomo��. Poprzedni kowal da� nog�. Tch�rz!
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan ch�tnie zajmie si� prac� w ku�ni.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Rozumiem. My�lisz, �e mo�na mu zaufa�?
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Tak.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //R�czysz za niego?
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Je�li zacznie sprawia� k�opoty, to ty poniesiesz konsekwencje, jasne?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Musz� si� zastanowi�.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"R�cz� za niego.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Jeszcze si� nad tym zastanowi�.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Jak mam mu zaufa�, skoro nawet ty nie mo�esz?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Dop�ki kto� nie we�mie za niego odpowiedzialno�ci, ma si� trzyma� z dala od ku�ni!

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //R�cz� za niego.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Dobrze. Mo�e od razu zacz�� prac� w ku�ni. Licz�, �e zaopatrzy moich ludzi w solidny or�.
	
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

	description	 = 	"Jak wygl�da sytuacja?";
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
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Przekl�te miejsce! Jaki� sukinsyn otworzy� g��wn� bram�! Teraz mo�emy ju� tylko czeka� na egzekucj�.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Jak si� dowiem, kto nas zdradzi�...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Je�li Hagen szybko nie przyb�dzie z odsiecz�, wybij� nas tu do nogi.
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

































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
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Dobrze, �e jeste�. Mo�esz od razu zap�aci� grzywn�.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Widz�, �e lekcewa�ysz prawa tego miasta, co?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //Lista twoich wyst�pk�w jeszcze si� powi�kszy�a!
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //Tylko mi tu nie udawaj niewini�tka!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Zap�acisz maksymaln� grzywn�.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //C�, wygl�da na to, �e sytuacja si� zmieni�a.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Nie ma �adnych �wiadk�w morderstwa!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Nikt nie chce zeznawa�, �e widzia� ci� podczas kradzie�y!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //Nie ma �adnych �wiadk�w twojej bijatyki.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Wszystkie oskar�enia wobec ciebie zosta�y wycofane.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //Nie wiem, co si� sta�o w mie�cie i NIE CHC� tego wiedzie�.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Po prostu staraj si� na przysz�o�� unika� k�opot�w.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //W ka�dym b�d� razie - postanowi�em darowa� ci kar�.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Staraj si� trzyma� z dala od podobnych awantur.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Mimo to zap�acisz nale�ne grzywny.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Wi�c jak b�dzie, p�acisz?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Nie mam tyle pieni�dzy!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Ile to mia�o by�?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Ile wynosi grzywna?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Nie mam tyle pieni�dzy!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Ile to mia�o by�?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Hagen_PETZMASTER_PayNow);
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
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Twoja reputacja ci� wyprzedza. S�ysza�em, �e pogwa�ci�e� prawa tego miasta.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Wpl�ta�e� si� w niez�� kaba��.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //Morderstwo to powa�ne przest�pstwo!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Nie wspominaj�c nawet o twoich pozosta�ych przewinieniach.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Stra�nicy otrzymali rozkaz natychmiastowego zabijania ka�dego mordercy.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //Mordercy nie b�d� tutaj tolerowani. Ale mo�esz okaza� skruch�, p�ac�c odpowiedni� grzywn�.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Oskar�ono ci� o kradzie�!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Nie wspominaj�c nawet o twoich pozosta�ych przewinieniach.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //To pogwa�cenie praw tego miasta. Musisz zap�aci� grzywn�.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Wda�e� si� w bijatyk�, tym samym �ami�c prawo tego miasta.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //A co to za sprawa z owcami?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Pogwa�cenie miejskiego prawa to z�amanie prawa ustanowionego przez Innosa.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Dlatego musisz zap�aci� za swoje przewinienia.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Zabija�e� nasze owce! Pocz�tkowo nie dawa�em temu wiary...
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Dlaczego musz� zajmowa� si� takimi b�ahostkami?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Musisz zap�aci� grzywn�!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Ile mam zap�aci�?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"Nie mam tyle pieni�dzy!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Chc� zap�aci� grzywn�!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Przychodz�, �eby zap�aci� grzywn�.
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //�wietnie! Dopilnuj�, �eby dowiedzieli si� o tym wszyscy mieszka�cy miasta. To poprawi troch� twoj� reputacj�.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //Nie mam tyle z�ota!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Zatem postaraj si� szybko je zdoby�.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //Ale ostrzegam: je�li pope�nisz jeszcze jakie� wykroczenia, nie b�dzie dla ciebie lito�ci!
	
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
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //S�ysza�em ju� o tobie.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar doni�s� mi, �e chcia�e� ze mn� rozmawia�.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Jeste� tym obcym, kt�ry domaga si� Oka Innosa.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Jestem Lord Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Kr�lewski paladyn, wojownik w s�u�bie Innosa i namiestnik Khorinis.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //Jestem zaj�tym cz�owiekiem, wi�c nie marnuj mojego czasu. M�w od razu, co ci� tu sprowadza.
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
	description	 =  "Przynosz� propozycj� rozejmu od jednego z najemnik�w.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //Przynosz� propozycj� rozejmu od jednego z najemnik�w.
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //Hmmm... Poka�!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Znam genera�a Lee. Znam te� okoliczno�ci, w wyniku kt�rych trafi� jako wi�zie� do Kolonii.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Uwa�am go za cz�owieka honoru. Jestem sk�onny go u�askawi�... Ale TYLKO jego.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //Jego ludzie zostan� na miejscu. Wi�kszo�� z nich to pozbawione skrupu��w �otry, kt�re trafi�y tu zas�u�enie.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Oni nie mog� liczy� na moj� �ask�.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //Czy to wszystko?
	};
	B_LogEntry (Topic_Frieden,"Lord Hagen mo�e wybaczy� Lee, ale nie pozosta�ym najemnikom."); 
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
	description	 =  "Armie ciemno�ci zbieraj� si� w pobli�u miasta, w G�rniczej Dolinie.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Armie ciemno�ci zbieraj� si� w pobli�u miasta, w G�rniczej Dolinie.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //W Dolinie? Wys�a�em tam oddzia� moich ludzi. Doniesiono mi, �e prze��cz jest zaj�ta przez ork�w.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Ale pierwsze s�ysz� o... armiach ciemno�ci.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //Czy to jaka� sztuczka, kt�ra ma mnie sk�oni� do zawarcia przymierza z najemnikami?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //Nie.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //A co to niby za armia?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Stado smok�w, kt�rym towarzyszy horda r�wnie gro�nych istot.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Smoki? Stare pisma g�osz�, �e ostatnie smoki widziano setki lat temu!
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Dlaczego mia�bym ci uwierzy�, co?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //Tu nie chodzi o to, czy mi wierzysz, tylko czy mo�esz sobie pozwoli�, �eby mi NIE wierzy�.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Dop�ki nie przedstawisz mi jakiego� dowodu, nie wy�l� tam �adnych nowych ludzi.
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
	description	 =  "A wi�c mam ci dostarczy� dowod�w?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //A wi�c mam ci dostarczy� dowod�w?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Dok�adnie tak. Zejd� prze��cz� do G�rniczej Doliny. Na miejscu poszukaj naszej ekspedycji, a gdy j� znajdziesz - porozmawiaj z kapitanem Garondem.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Je�li kto� mo�e co� powiedzie� o tej sytuacji, to w�a�nie on.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Je�li Garond potwierdzi twoje s�owa, b�d� sk�onny ci zaufa�.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Czy to znaczy, �e przeka�esz mi Oko Innosa?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //Oko Innosa... niech b�dzie. Przynie� mi niezbity dow�d, a dopilnuj�, �eby� dosta� ten amulet.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //Mam na to twoje s�owo?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Tak, masz moje s�owo.
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
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //To �wi�ty artefakt... Stare przepowiednie ��cz� go ze smokami.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //Ale g�osz� r�wnie�, �e tylko Wybraniec Innosa mo�e nosi� ten amulet.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //JA jestem Wybra�cem Innosa.
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Wi�c mo�e b�dziesz m�g� za�o�y� Oko.
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
	description	 =  "Jak mam si� dosta� na prze��cz?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Jak mam si� dosta� na prze��cz?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Dam ci klucz do bramy prowadz�cej na prze��cz. Dalej musisz jednak radzi� sobie sam. Tej drogi pilnuj� stada ork�w.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Niech Innos b�dzie z tob�.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Lord Hagen chce, abym dostarczy� mu jaki� dow�d na istnienie armii Z�a. Powinienem si� uda� do G�rniczej Doliny i porozmawia� z Kapitanem Garondem.");
	
	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine (Fernando,"WAIT"); 
	};
	
	Wld_InsertNpc (BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47");	//Joly: //ADDON st�rt dann nicht mehr
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
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Szukam metalowego ornamentu. Powinien by� gdzie� w kamiennym kr�gu przy farmie Lobarta.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Je�li chodzi ci o to tutaj... My�leli�my, �e mo�e to by� magiczna runa, ale to ca�kowicie bezwarto�ciowy przedmiot.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //We� go sobie, do niczego nam si� nie przyda.
	
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
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Wys�ano nas z misj� wagi pa�stwowej. Otrzymali�my rozkaz od samego Kr�la Rhobara.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //M�wi�em ci ju�, �e wys�ali�my ekspedycj� do G�rniczej Doliny. Po to tu w�a�nie przybyli�my.
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
	description	 =  "Co twoi ludzie robi� w G�rniczej Dolinie?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //Co twoi ludzie robi� w G�rniczej Dolinie?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Nie widz� powodu, dla kt�rego mia�bym ci to m�wi�!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //By�e� tam. Sam powiniene� wiedzie�.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //No dobrze. Skoro i tak si� tam udajesz, mog� ci chyba powiedzie�.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //Chodzi o magiczn� rud�. Dzi�ki niej mo�emy jeszcze wygra� t� wojn�.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Bez or�a wykonanego z tej rudy, kr�lewska armia nie ma �adnych szans w starciu z elitarnymi oddzia�ami ork�w.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //A na tej wyspie znajduj� si� ostatnie kopalnie, do kt�rych mamy jeszcze dost�p.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Wracamy na kontynent, gdy tylko za�adujemy ca�� rud� na statek.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //A wi�c przegrywamy t� wojn�?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //I tak powiedzia�em ci zbyt wiele.
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
	description	 = 	"Szukam jakiego� mistrza miecza.";
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
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Szukam jakiego� mistrza miecza.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //No to go znalaz�e�.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Lord Hagen mo�e mnie nauczy� walki or�em dwur�cznym.");
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
	description = "Zacznijmy (trening walki broniami dwur�cznymi).";
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
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Jeste� teraz prawdziwym mistrzem miecza. Wi�cej nie mog� ci� nauczy�.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Niech m�dro�� mistrza miecza zawsze kieruje twoimi czynami.
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
	description	 = 	"Chcia�bym wst�pi� do waszego zakonu.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Chcia�bym wst�pi� do waszego zakonu.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Dobrze, ale najpierw musisz udowodni�, �e posiadasz odwag�, umiej�tno�ci i wiedz� potrzebn� s�udze Innosa.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Twoje czyny �wiadcz�, �e jeste� cz�owiekiem honoru.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Je�li takie jest twoje �yczenie, ch�tnie powitam ci� w naszym zakonie.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Nie podj��em jeszcze ostatecznej decyzji.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Jestem got�w!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Aby zosta� wojownikiem Innosa, musisz ca�kowicie po�wi�ci� si� wype�nianiu jego woli.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //W naszym zakonie s�u�y� mog� tylko najm�niejsi i najszlachetniejsi z wojownik�w.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Je�li naprawd� chcesz zosta� jednym z nas, musisz dowie��, �e jeste� tego godzien.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Nie podj��em jeszcze ostatecznej decyzji.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Zatem rozwa� t� spraw� w swoim sercu i wr��, gdy b�dziesz gotowy.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Jestem got�w!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //Niech tak si� stanie!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //Wielu z tych, kt�rzy wst�pili na t� �cie�k�, odda�o �ycie w s�u�bie Innosowi.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //Czy przysi�gasz czci� swymi czynami pami�� po nich i g�osi� wszem, i wobec chwa�� Innosa?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //Przysi�gam!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Zatem od tej pory jeste� cz�onkiem naszego zakonu.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Niniejszym tytu�uj� ci� wojownikiem Innosa.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Daj� ci or� i zbroj� godn� rycerza. No� je z dum�!

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

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //Zostaj�c jednym z nas, otrzymujesz prawo wst�pu do klasztoru.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Albrecht wyuczy ci� naszej magii. Id� i porozmawiaj z nim.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //Nasze kwatery w g�rnym mie�cie s� oczywi�cie do twojej dyspozycji.

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	
	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};


//***********************************************
//	Wie kann ich mich w�rdig erweisen
//***********************************************

INSTANCE DIA_Lord_Hagen_WhatProof		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	991;
	condition	 = 	DIA_Lord_Hagen_WhatProof_Condition;
	information	 = 	DIA_Lord_Hagen_WhatProof_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Jak mam udowodni�, �e jestem godny, by do was do��czy�?";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Jak mam udowodni�, �e jestem godny, by do was do��czy�?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //Tylko twoje czyny b�d� odpowiednim �wiadectwem.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //W imi� Innosa walczymy o wolno�� i sprawiedliwo��.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Stawiamy czo�a Beliarowi i jego s�ugom, kt�rzy pr�buj� zniszczy� �wi�ty �ad Innosa.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Rozumiem.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //Nic nie rozumiesz! Honor jest ca�ym naszym �yciem, a nasze �ycie nale�y do Innosa.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Paladyn rusza do boju z imieniem swojego boga na ustach. Wielu z nas z�o�y�o �ycie na o�tarzu odwiecznej walki Dobra ze Z�em.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //Ka�dy paladyn musi pozosta� wierny tej tradycji. Je�li zb��dzimy, zbrukamy pami�� naszych poleg�ych towarzyszy.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Aby zosta� paladynem, musisz w pe�ni zda� sobie z tego spraw�.
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
	description = "Jak wygl�da sytuacja?";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Jakie� wie�ci?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Musz� jako� uratowa� t� ekspedycj�.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Musimy co� zrobi� w sprawie tych smok�w.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //Mo�e Oko Innosa zdo�a nas jeszcze ocali�...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Ja tu chyba oszalej�. Jestem �o�nierzem, a nie urz�dnikiem!
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //Przez te wszystkie dokumenty, pisma i zarz�dzenia zapomnia�em ju� chyba, jak si� trzyma miecz w gar�ci!
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
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //CO TAKIEGO?! C�e� uczyni�?! Bez Oka jeste�my zgubieni!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Porozmawiaj z Pyrokarem! Musi by� jaki� spos�b, �eby je naprawi�!
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
	description	 = 	"Przynosz� wie�ci od Garonda.";
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
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Przynosz� ci wie�ci od Garonda. Prosz�, kaza� mi wr�czy� ten list.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //Sytuacja jest gro�niejsza, ni� przypuszcza�em. Ale m�w! M�w, co si� dzieje w G�rniczej Dolinie!
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Paladyni zabarykadowali si� w tamtejszym zamku. Oblega ich horda ork�w.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Wielu �o�nierzy poleg�o. Zosta�o te� bardzo niewiele rudy.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //Obawiam si�, �e bez odpowiedniego wsparcia ci ludzie nie maj� szans.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Znajd� jaki� spos�b, �eby ich stamt�d wyci�gn��. Innos b�dzie ci wdzi�czny...
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Bardziej ni� jego wdzi�czno�� przyda mi si� Oko.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Tak, naturalnie. Dotrzymam s�owa. We� ten list. On otworzy przed tob� bramy klasztoru.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Porozmawiaj z Pyrokarem - najwy�szym z Mag�w Ognia. Poka� mu to pismo, a on zaprowadzi ci� do Oka.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //Jeszcze jedno, zanim p�jdziesz.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //We� t� run� jako wyraz mojej wdzi�czno�ci. W chwilach potrzeby przeniesie ci� ona bezpiecznie do miasta.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Lord Hagen wr�czy� mi przesy�k�, dzi�ki kt�rej Mistrz Pyrokar dopu�ci mnie do Oka Innosa.");

			Wld_InsertNpc 		(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
			Wld_InsertNpc		(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
			Wld_InsertNpc		(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09"); 
			Wld_InsertNpc		(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
			B_KillNpc 			(BDT_1020_Bandit_L);	//Joly: macht Platz f�r DMT_1200_Dementor
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
	description	 = 	"Musz� z tob� porozmawia� o Bennecie.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Musz� z tob� porozmawia� o Bennecie.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Ale to ten najemnik, kt�ry zamordowa� jednego z moich ludzi!
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Sk�d masz pewno��, �e to Bennet jest morderc�?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"S�dz�, �e Bennet jest niewinny.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Mo�e Bennet m�g�by naprawi� Oko Innosa.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Mo�e Bennet m�g�by naprawi� Oko Innosa.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //Cho�by nawet m�g� �ci�gn�� na ziemi� pot�g� samego Innosa...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //...ten cz�owiek zamordowa� paladyna i zostanie za to stracony.
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Sk�d masz pewno��, �e to Bennet jest morderc�?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //Mamy naocznego �wiadka.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Jak widzisz, wina tego najemnika nie podlega dyskusji.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Co to za �wiadek?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, sekretarz gubernatora, widzia� ca�e zaj�cie.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Podany przez niego rysopis pasuje jak ula� do Benneta. Z mojego punktu widzenia, sprawa jest zamkni�ta.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Najemnik zostanie powieszony za zdrad� stanu.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, sekretarz gubernatora, twierdzi, �e by� �wiadkiem morderstwa."); 

	RecueBennet_KnowsCornelius = TRUE;
	//RescueBennet_KnowsWitness = TRUE; 
};
/*
FUNC VOID DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekret�r des Statthalters, hat den Mord gesehen.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache f�r mich erledigt.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der S�ldner wird wegen Landesverrats h�ngen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, der Sekret�r des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben."); 

	RecueBennet_KnowsCornelius = TRUE;
};
*/
FUNC VOID DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //S�dz�, �e Bennet jest niewinny.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Dowody s� jednoznaczne. To on jest sprawc�.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //A je�li dowody zosta�y sfa�szowane?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Uwa�aj, co m�wisz! To bardzo powa�ne oskar�enie!
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Je�li nie masz dowod�w, kt�re podwa�aj� zeznania mojego �wiadka, lepiej trzymaj j�zyk za z�bami.
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
	description	 = 	"Cornelius k�amie.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Cornelius k�amie.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Sk�d ta pewno��?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Mam jego pami�tnik. S� tu wszystkie dowody.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //A to pod�a gnida!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //W �wietle nowych dowod�w mog� zrobi� tylko jedno.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //Na mocy powierzonej mi przez Jego Wysoko�� i �wi�tyni� og�aszam...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...�e wi�zie� Bennet zostaje oczyszczony ze wszystkich zarzut�w i ma zosta� zwolniony.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Za to Cornelius ma zosta� pojmany, pod zarzutem krzywoprzysi�stwa.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Oszcz�dz� ci k�opotu. Cornelius nie �yje.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //Zatem otrzyma� ju� sprawiedliw� kar�. Dobra robota.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Cornelius uciek�.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Znajdziemy go, pr�dzej czy p�niej. Nie wywinie si�.
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
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Twoje czyny godne s� jednego z nas.
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
	description	 = 	"Oko nale�y do mnie!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //Oko nale�y do mnie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //Tak, Oko jest twoje!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //I to ty musisz je naprawi�!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //Zatem musisz by� Wybra�cem Innosa.
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Zamierzam po�o�y� kres zagro�eniu ze strony smok�w.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //Id� wi�c, i z pomoc� Innosa zniszcz Z�o w zarodku.
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

	description	 = 	"Najlepsi wojownicy ork�w ruszyli do ataku.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Najlepsi wojownicy ork�w ruszyli do ataku.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Rozmawia�em z Lordem Hagenem na temat zbli�aj�cych si� hord herszt�w ork�w."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Dlaczego tak s�dzisz?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //Rozmawia�em z jednym z nich. W rozmowie pad�o twoje imi�.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Brednie. Moi ludzie nie donie�li mi o �adnym pospolitym ruszeniu ork�w.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Mo�e jacy� ich zwiadowcy zab��kali si� do pobliskich las�w.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //To nie byli zwiadowcy. Przy jednym z nich znalaz�em ten pier�cie�.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Poka�.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Hmmm... Niepokoj�ce...
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //To znak ich si�y. A wi�c orkowie porzucili swoje palisady i stan�li do boju w otwartym polu.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Nie widzia�em ich jeszcze zbyt wielu. G��wnie ich przyw�dc�w i kilku wojownik�w.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //Tak? Zatem planuj� co� innego. To ma�o podobne do ork�w, by ich przyw�dcy wypuszczali si� w pojedynk� poza swoje osiedla.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Ale to �wietna okazja, by uderzy� w ich czu�y punkt.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Gdy strac� swoich przyw�dc�w, morale ca�ej armii os�abnie.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //Mam dla ciebie nowe zadanie, rycerzu. Masz zabi� wszystkich orkowych przyw�dc�w, kt�rzy kr�c� si� po okolicy.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Tylko przynie� mi ich pier�cienie! Po takim ciosie szybko si� nie podnios�.
			
			B_LogEntry (TOPIC_OrcElite,"Na dow�d moich s��w przynios�em Hagenowi orkowy pier�cie�. Kaza� sobie dostarczy� wszystkie pier�cienie, jakie tylko uda mi si� zdoby�."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Udaj si� najpierw do Ingmara. Doradzi ci, jak skutecznie walczy� z takim przeciwnikiem.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Elitarni wojownicy ork�w to jego specjalno��. Cz�sto mia� z nimi do czynienia.
			B_LogEntry (TOPIC_OrcElite,"Elitarni orkowi wojownicy s� specjalno�ci� Ingmara."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //Twoje s�owo, �e pokona�e� orkowego wodza, to dla mnie za ma�o!
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Je�li mam ci uwierzy�, potrzebuj� bardziej wiarygodnych dowod�w.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen nie chce mi uwierzy�. Za��da� dowod�w na to, �e orkowi wojownicy faktycznie atakuj� ludzkie siedziby. C�, by�bym zaskoczony, gdyby tego nie zrobi�."); 
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

	description	 = 	"Mam jeszcze co� do powiedzenia w sprawie orkowych przyw�dc�w.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Mam jeszcze co� do powiedzenia w sprawie orkowych przyw�dc�w.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //S�ucham...

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld f�r einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //Mam dla ciebie jeszcze jeden pier�cie�.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //Mam dla ciebie kolejne pier�cienie.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Dobra robota! Tak trzyma�.

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //W okolicy mo�e si� kr�ci� jeszcze kilku.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Wkr�tce rzucimy te bestie na kolana!
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Zdziwi�bym si�, gdyby w okolicy kr�ci�o si� ich jeszcze wielu.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Je�li chcesz, mo�esz nadal przynosi� mi pier�cienie, ale my�l�, �e orkowie dostali ju� odpowiedni� nauczk�.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Prosz�. We� to z�oto i kup za nie lepsze wyposa�enie.

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
	description = "Wszystkie smoki nie �yj�.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Wszystkie smoki zosta�y zg�adzone.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //Wiedzia�em, �e Innos doda ci si� w walce ze smokami!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Gdzie jest ruda?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Orkowie wci�� oblegaj� zamek w G�rniczej Dolinie. Garond nie mo�e opu�ci� twierdzy, p�ki nie odeprze ich ataku.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //Niech to szlag!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Je�li Garond nie potrafi upora� si� z t� sytuacj�, sam si� tym zajm�!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //�adna banda ork�w nie stanie mi na przeszkodzie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //Powiadomi�em ju� moich ludzi. Przygotowujemy si� do wyruszenia w drog�.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Zabieram ich wszystkich. Na stra�y statku pozostan� nieliczni wartownicy.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //Pora, by kto� wreszcie rozprawi� si� z tymi orkami!

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
	description = "Potrzebuj� okr�tu.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Potrzebuj� okr�tu.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //Nie ty jeden, �o�nierzu.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //S�ysz� to prawie codziennie, przyjacielu. Ale...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Nie masz nawet kapitana, nie wspominaj�c ju� o za�odze...
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //A co z tym statkiem na przystani?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Ten okr�t nale�y do mnie. To na nim przewieziemy rud�.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Mog� ci go u�yczy�, dopiero gdy wywi��emy si� z zadania.
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
	description = "Orkowie przypu�cili szturm na zamek w G�rniczej Dolinie!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Orkowie przypu�cili szturm na zamek w G�rniczej Dolinie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //Na Innosa! Co tam si� sta�o?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //Wygl�da na to, �e brama by�a otwarta...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //Wygl�da... Jak to mo�liwe... W zamku musi by� zdrajca!
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
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Czekam tylko na wyposa�enie i �ywno��. Zaraz potem ruszamy!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Po szturmie na zamek potrzebujemy jeszcze wi�cej zapas�w.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //Ale to tylko nieznacznie op�ni nasz wymarsz.
	};
};

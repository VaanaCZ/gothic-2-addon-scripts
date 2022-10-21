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
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Aaa... Dobrze, �e jeste�.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Co si� sta�o?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Zobacz, co znalaz�em w starej kaplicy.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //To magiczna runa. Je�li si� nie myl�, przeniesie ci� z powrotem na t� farm�.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Pomy�la�em, �e mo�e ci si� przyda�.
	
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
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Masz pieni�dze dla Onara?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Ostrzega�em ci�, �eby� nie robi� nic g�upiego.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar dowiedzia� si�, �e troch� w mi�dzyczasie nabroi�e�.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Teraz chce wi�cej pieni�dzy.
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
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //My�la�em, �e jeste� m�drzejszy.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //No to mam dla ciebie dobr� wiadomo��.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Wygl�da na to, �e nie uchowa� si� �aden �wiadek morderstwa.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nikt nie chce ju� zeznawa�, �e widzia� ci� podczas kradzie�y.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Nie ma �wiadk�w, kt�rzy WIDZIELI, jak pobi�e� tego wie�niaka.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Wygl�da na to, �e wszystkie zarzuty wobec ciebie zosta�y wycofane.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //Jest to jaki� spos�b na wypl�tanie si� z tarapat�w.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Tak czy siak - nie musisz ju� nic p�aci�.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Tylko na przysz�o�� lepiej uwa�aj!
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Jedno jest pewne: i tak musisz zap�aci� grzywn�.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //No i co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Nie mam dostatecznie du�o z�ota!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Ile to mia�o by�?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Ile mam zap�aci�?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Nie mam dostatecznie du�o z�ota!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Ile to mia�o by�?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Chc� zap�aci� grzywn�!",DIA_Lee_PETZMASTER_PayNow);
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
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Kto ci� tu do cholery... To TY jeste� tym nowym, kt�ry stwarza� tyle k�opot�w?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //S�ysza�em od Gorna, �e wci�� �yjesz.. ale �e tu przyszed�e�... mniejsza z tym...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Dobrze, �e przyszed�e� do mnie, zanim sytuacja sta�a si� naprawd� paskudna.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Najemnicy to twarde sztuki, a ch�opi te� nie dadz� sobie w kasz� dmucha�. Nie mo�esz tak po prostu zabija� kogo popadnie.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Nie wspominaj�c ju� o twoich pozosta�ych wyczynach.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Je�li chcesz, mog� ci pom�c wydosta� si� z tego bagna...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //...ale to ci� b�dzie kosztowa�. Onar to chciwy cz�owiek, a spraw� mo�na za�atwi� tylko wtedy, je�li ON przymknie na ni� oko.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Dobrze, �e si� spotykamy. Podobno co� st�d ukrad�e�.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //I poturbowa�e� paru wie�niak�w.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //I zabi�e� kilka owiec.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //Nie mo�esz tu odstawia� takich numer�w. Onar naciska na mnie, �ebym wreszcie rozliczy� si� z winowajc�.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Wniosek: ty p�acisz, Onar chowa z�oto do kieszeni i wszyscy zapominaj� o sprawie.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Gdyby� wda� si� w b�jk� z najemnikami, nie ma sprawy...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //...ale jak ruszysz wie�niaka, od razu pobiegnie na skarg� do Onara. A potem ja musz� co� z tym zrobi�.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Nie m�wi� nawet, jak si� Onar wkurza, kiedy kto� zabije par� owiec.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Musisz wysup�a� par� groszy. Pieni�dze zgarnie Onar, ale potem wszyscy zapomn� o sprawie.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar p�aci mi za ochron� farmy. A to oznacza te� ochron� owiec.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Musisz zap�aci� mu odpowiednie odszkodowanie.
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Ile?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Nie mam dostatecznie du�o z�ota!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Chc� zap�aci� grzywn�!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Chc� zap�aci� grzywn�!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //M�dry ch�opiec. Dopilnuj�, �eby pieni�dze trafi�y do Onara. Spraw� mo�emy uzna� za za�atwion�.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Nie mam tyle pieni�dzy!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //No to postaraj si� je zdoby�, i to szybko!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Tylko nie pr�buj okrada� kogo� na farmie! Je�li ci� z�api�, wpadniesz w g�wno po uszy.
	
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
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Kto ci� tu do diab�a... TY?! Co ty tu robisz? My�la�em, �e nie �yjesz!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Sk�d to przypuszczenie?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn powiedzia�, �e to ty zniszczy�e� Barier�.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Tak, to prawda.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //No, no. Kto by pomy�la�, �e wyjdziesz z tego ca�o. Co ci� tu sprowadza? Nie wpad�e� chyba powspomina� dawnych dziej�w?
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
	description = "Musz� koniecznie porozmawia� z paladynami w mie�cie...";
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
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Musz� koniecznie porozmawia� z paladynami w mie�cie. Pomo�esz mi jako� si� do nich dosta�?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //A co ci� tak ci�gnie do paladyn�w?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //To d�uga historia...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Mam mn�stwo czasu.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //Xardas wys�a� mnie z kolejn� misj�. Mam zdoby� pot�ny amulet zwany Okiem Innosa.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Czyli dalej kumplujesz si� z tym nekromant�? Rozumiem. A amulet maj� paladyni, tak?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //O ile mi wiadomo - tak.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Pomog� ci dosta� si� do paladyn�w, ale najpierw musisz zosta� jednym z nas.
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
	description = "W jaki spos�b mo�esz mi pom�c w skontaktowaniu si� z paladynami?";
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
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //W jaki spos�b mo�esz mi pom�c w skontaktowaniu si� z paladynami?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Zaufaj mi. Mam plan, i my�l�, �e si� do niego znakomicie nadajesz...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Zaprowadz� ci� do paladyn�w, a ty wy�wiadczysz mi drobn� przys�ug�. Ale najpierw musisz do nas do��czy�!
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
	description = "Co ty tu w�a�ciwie robisz?";
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
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Co ty tu w�a�ciwie robisz?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Proste: kombinuj�, jak nas wyrwa� z tej przekl�tej wyspy.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar wynaj�� nas, by�my bronili tej farmy, i w�a�nie to zamierzamy robi�.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Ale nie tylko dla pieni�dzy! Pomagaj�c ch�opom, odcinamy miasto od dostaw �ywno�ci.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //A im bardziej paladyni zg�odniej�, tym ch�tniej wys�uchaj� mojej propozycji ugody.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Wielka szkoda, �e musia�e� si� spikn�� akurat z nimi.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //A jak b�dzie wygl�da� twoja propozycja?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //Najog�lniej m�wi�c: b�dziemy si� domaga� zwolnienia i prawa powrotu na kontynent. Szczeg�y poznasz, gdy nadejdzie odpowiednia pora.
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
	description = "Chc� do was do��czy�!";
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
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Chc� do was do��czy�!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Mia�em nadziej�, �e to powiesz! Przyda mi si� ka�dy pewny cz�owiek.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Ostatni najemnicy, kt�rych przyj��em, narobili tylko k�opot�w!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //W zasadzie mo�esz zaczyna� od zaraz. Chocia�... musimy najpierw wyja�ni� par� spraw, ale to nic wielkiego...
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
	description = "Co dok�adnie mam 'wyja�ni�', �eby m�c do was do��czy�?";
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
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Co dok�adnie mam 'wyja�ni�', �eby m�c do was do��czy�?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Naszym szefem jest Onar, zarz�dca tych ziem. Mo�esz zosta� na farmie tylko wtedy, je�li on si� na to zgodzi.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //No i s� jeszcze ch�opcy. Mog� ci� przyj��, je�li wstawi si� za tob� wi�kszo�� najemnik�w.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Tylko nie id� do Onara, zanim wszystko si� nie wyja�ni. To bardzo niecierpliwy cz�owiek...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Aby m�c zosta� najemnikiem, musz� przekona� do tego pomys�u pozosta�ych najemnik�w i uzyska� zgod� Onara.");
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
	description = "Jak mam przekona� najemnik�w, �eby mnie poparli?";
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
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Jak mam przekona� najemnik�w, �eby mnie poparli?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Najlepiej udowodnij im, �e nadajesz si� do tej roboty.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Pogadaj z Torlofem. Zwykle kr�ci si� gdzie� przed domem. On podda ci� pr�bie.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Je�li j� przejdziesz, b�dziesz ju� prawie jednym z nas.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Torlof powie ci wszystko, co musisz wiedzie�.
	
	B_LogEntry (TOPIC_BecomeSLD,"Aby m�c zosta� najemnikiem, musz� podda� si� pr�bie Torlofa i zyska� szacunek pozosta�ych najemnik�w.");
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

	description	 = 	"Co wiesz o Wodnym Kr�gu?";
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
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Co wiesz o Wodnym Kr�gu?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //Mo�na si� by�o domy�li�... To nie twoja sprawa.
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Ej�e. Powiedz mi!
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Nie dotyczy mnie to bezpo�rednio - wiem tylko, �e to jaka� tajna gildia, za kt�r� stoj� Magowie Wody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Od chwili upadku Bariery nie obowi�zuje mnie ju� umowa z Magami Wody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Oczywi�cie spr�buj� ci pom�c, je�li czegokolwiek ci potrzeba. Nie mam jednak zbyt wiele czasu - musz� si� troszczy� przede wszystkim o swoje sprawy.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Je�li chcesz zdoby� wi�cej informacji o tym kr�gu, to pogadaj z Cordem. On nale�y do tej organizacji, o ile mi wiadomo.
		
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
	description = "Jestem gotowy, by do was do��czy�!";
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
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Jestem gotowy, by do was do��czy�!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Nie przeszed�e� jeszcze testu Torlofa.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Czyli przeszed�e� ju� pr�b� Torlofa?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Tak.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //Bardzo dobrze.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Co s�dz� o tobie pozostali najemnicy?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Nie jestem pewien, czy wystarczaj�co wielu z nich jest po mojej stronie.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //No to pogadaj z Torlofem. On wie o wszystkim, o czym si� m�wi na farmie.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //Wi�kszo�� z nich jest po mojej stronie.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //W takim razie id� do Onara. Ja ju� z nim rozmawia�em.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Ale wynagrodzenie musisz sam sobie wynegocjowa�.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Teraz potrzebuj� tylko zgody Onara.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Rozmawia�e� z Onarem?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Tak. Zgodzi� si�.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //No to witamy na pok�adzie!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Masz tu przyzwoity pancerz. Przyda ci si�.
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
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Ciesz� si�, �e jeste� z nami.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Mam ju� dla ciebie pierwsze zadanie.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Chodzi o paladyn�w. Pora, by� z�o�y� im wizyt�.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //I tak chcia�e� tam i��, nie?
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
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Widz�, �e wst�pi�e� na s�u�b� do paladyn�w.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //By�e� w klasztorze? Wszystkiego bym si� spodziewa�, tylko nie tego.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //C�, najemnikiem ju� raczej nie zostaniesz.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Ale kto wie, mo�e m�g�by� mi wy�wiadczy� przys�ug� czy dwie... albo ja tobie...
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Tak czy siak - �ycz� ci powodzenia.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Tylko nie pr�buj ze mn� �adnych numer�w, jasne?
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
	description = "Jak mam si� teraz dosta� do paladyn�w?";
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
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Jak mam si� teraz dosta� do paladyn�w?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //To proste. Zaniesiesz im moj� propozycj� pokojow�.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Znam Lorda Hagena, dow�dc� paladyn�w, jeszcze z kr�lewskiej armii.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Wiem, co sobie teraz my�li: ma zbyt ma�o ludzi. Przyjmie wi�c moje warunki. A w ka�dym razie na pewno ci� wys�ucha.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Napisa�em do niego list. Masz.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //Dzi�ki niemu dopuszcz� ci� przed dow�dc� paladyn�w.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee wys�a� mnie z ofert� pokojow� do Lorda Hagena. W ten spos�b dotr� do paladyn�w.");
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
	description = "Zanios�em twoj� propozycj� Lordowi Hagenowi.";
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
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Zanios�em twoj� propozycj� Lordowi Hagenowi.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //I co odpowiedzia�?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Jest sk�onny u�askawi� ciebie, ale nie twoich ludzi.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Nad�ty g�upiec. Moi ludzie to baranki w por�wnaniu z niekt�rymi oprychami z kr�lewskiej armii.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Co teraz zrobisz?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Znajd� jaki� inny spos�b... Je�li b�dzie trzeba, uprowadz� kr�lewski okr�t. Musz� troch� pomy�le�.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Nie zostawi� moich ludzi w tym bagnie. To wykluczone.

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
	description = "Dlaczego tak bardzo chcesz si� dosta� na kontynent?";
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
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Dlaczego tak bardzo chcesz si� dosta� na kontynent?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Jak zapewne pami�tasz, s�u�y�em kiedy� w kr�lewskiej armii, w randze genera�a.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Ale grupa dworskich przydupas�w postanowi�a si� mnie pozby�, bo za du�o wiedzia�em.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Wtr�cili mnie do Kolonii, a Kr�l nawet nie kiwn�� palcem, �eby ich powstrzyma�.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //Mia�em mn�stwo czasu, �eby to sobie przemy�le�.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Zamierzam si� zem�ci�.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //Na Kr�lu?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //Tak, na Kr�lu i na wszystkich dwuj�zycznych pochlebcach. Zap�ac� mi za piek�o, przez kt�re musia�em przej��!
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
	description = "Zamierzam wyruszy� do G�rniczej Doliny.";
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
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Zamierzam wyruszy� do G�rniczej Doliny.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Wiedzia�em, �e nie wysiedzisz za d�ugo na farmie!
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //W takim razie rozejrzyj si� troch� za Gornem. Paladyni zawlekli go z powrotem do Kolonii.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn to r�wny facet. Przyda�by mi si� tutaj kto� taki jak on. Gdyby� mia� okazj� go uwolni� - zr�b to.
	
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
	description = "Uwolni�em Gorna.";
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
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Uwolni�em Gorna.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Tak, ju� mi m�wi�e�. Dobra robota.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Ten facet jest wi�cej wart, ni� Sylvio i jego ch�opcy razem wzi�ci.
	
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
	description = "Rozmawia�e� z Gornem? Co si� z nim dzieje?";
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
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Rozmawia�e� z Gornem? Co si� z nim dzieje?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Chyba go jeszcze pami�tasz?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Niech pomy�l�...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Jasne.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Jasne.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Z�apali go paladyni i wys�ali z powrotem do G�rniczej Doliny, w karnym konwoju.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Gdyby drogi do Doliny nie roi�y si� od paladyn�w i ork�w, wys�a�bym paru moich ch�opc�w, �eby go wyci�gn�li.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Ale nie mog� ryzykowa�. Szkoda cz�owieka.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Niech pomy�l�...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Du�y, ciemnow�osy, z wielkim toporem... Pom�g� ci odbi� nasz� kopalni� w Kolonii.
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
	description = "Onar straci� w�a�nie kilka owiec. Wszystko przez Bullka...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Onar straci� w�a�nie kilka owiec. Wszystko przez Bullka...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //A daj mi spok�j z tym g�wnem! Mam do�� k�opot�w i bez tego.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Ja te�. Bullko chyba za mn� nie przepada. Chce, �ebym opu�ci� farm�...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //I co z tego? Postaw mu si�.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //I powiedz mu, �e jak si� nie uspokoi, potr�c� koszt zaginionych owiec z jego wyp�aty.
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
	description = "Wracam z G�rniczej Doliny...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Wracam z G�rniczej Doliny. Tamtejszy zamek zosta� zaatakowany przez smoki!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //A wi�c to prawda! Lares wspomina� co� o smokach, kt�re mia�y si� kr�ci� wok� miasta... Prawd� m�wi�c, nie dawa�em temu wiary...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Co si� sta�o z paladynami?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Rozbici. Zdziesi�tkowani.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //I BARDZO dobrze! Mo�e Lord Hagen przemy�li jeszcze raz moj� propozycj�...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //A je�li nie... Znajdziemy inny spos�b na wydostanie si� st�d...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //�wietnie! Mo�e Lord Hagen wyprawi si� teraz do G�rniczej Doliny ze swoimi lud�mi...
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Im mniej paladyn�w zostanie na miejscu, tym lepiej.
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
	description = "Przyda�aby mi si� lepsza zbroja.";
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
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Przyda�aby mi si� lepsza zbroja.
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Wype�ni�e� swoje zadanie.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Mam dla ciebie solidniejsz� zbroj�. Oczywi�cie, je�li masz odpowiedni� ilo�� kruszcu.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof dosta� od Onara pewne zlecenie, kt�re powinno zosta� za�atwione jaki� czas temu.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Zajmij si� tym, to porozmawiamy o lepszej zbroi.
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
	description = "Kup �redni pancerz najemnika. Ochrona (bro� i strza�y) 50, 1000 sztuk z�ota.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Daj mi jak�� zbroj�.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Prosz�, to dobry pancerz.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Ale ja nie rozdaj� prezent�w. Najpierw chc� zobaczy� z�oto!
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
	description = "Nie masz dla mnie jakiej� lepszej zbroi?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Nie masz dla mnie jakiej� lepszej zbroi?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Jasne, �e mam!
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
	description = "Kup ci�ki pancerz najemnika. Ochrona (bro� i strza�y) 80, 2500 sztuk z�ota.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Daj mi ci�k� zbroj�.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Prosz�. To solidny pancerz. Sam taki nosz�.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Znasz zasady. Najpierw z�oto.
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
	description = "Nie masz dla mnie �adnej roboty?";
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
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Nie masz dla mnie �adnej roboty?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Ci�gle ci ma�o, co? I tak siedzisz w niez�ym bagnie. Czego jeszcze chcesz?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Kolejnego zlecenia. W ko�cu jestem najemnikiem, prawda?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //W porz�dku. Mam co� w sam raz dla ciebie.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Mam pewien rachunek do wyr�wnania z miejskim s�dzi�. Najch�tniej sam bym si� tym zaj��...
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //...ale paladyni nie dopuszcz� mnie do jego domu nawet na odleg�o�� celnego rzutu kamieniem.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Sprawa jest do�� delikatna, wi�c uwa�aj: p�jdziesz do s�dziego i zaoferujesz mu swoje us�ugi.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Spr�bujesz zdoby� jego zaufanie i wykonasz dla niego kilka szemranych zlece�, p�ki nie znajdziesz na niego jakiego� haka.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Ten wieprz tapla si� w takim bagnie, �e nie powinno to by� trudne.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Tylko przynie� mi SOLIDNE dowody. Chc�, �eby po ich ujawnieniu facet trafi� do paki na reszt� swojego �ycia.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //I pod �adnym pozorem go nie zabijaj! To by by�o zbyt proste. On ma najpierw troch� pocierpie�, zrozumiano?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //I jak my�lisz? Dasz rad�?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee chce, abym znalaz� jakie� dowody przeciwko s�dziemu Khorinis. Musz� tylko zaoferowa� temu ostatniemu swoje us�ugi i mie� oczy szeroko otwarte."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Wykluczone.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Nie ma sprawy. Ile?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Nie ma sprawy. Ile?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Twoja nagroda zale�y od tego, co mi przyniesiesz, wi�c dobrze si� postaraj.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Wykluczone. Nie b�d� si� korzy� przed �adn� �wini�.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //No, no. Nie uno� mi si� tu honorem. To on kaza� ci� zamkn�� i wrzuci� za Barier�, pami�tasz?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Zreszt�, r�b jak chcesz. Moim zdaniem pope�niasz b��d.
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

	description = "Mam dla ciebie dowody obci��aj�ce s�dziego.";
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
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Mam dla ciebie dowody obci��aj�ce s�dziego.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Serio? Co znalaz�e�?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Pan s�dzia wynaj�� kilku oprych�w, by zastraszyli gubernatora Khorinis.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Gdy wykonali brudn� robot�, kaza� ich aresztowa� i odebra� im swoje z�oto.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Mam przy sobie pismo, w kt�rym s�dzia opisuje bandziorom ich zadanie.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Poka�.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Nareszcie! No, panie s�dzio - pora wyr�wna� rachunki. Dobra robota!
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Zas�u�y�e� na sowite wynagrodzenie. Prosz�, oto twoja nagroda.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //Tylko nikomu ani s�owa, jasne?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //To �wietnie, ale sprawa sama si� rozwi�za�a. S�dzia nie �yje.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Jaki� idiota go rozwali�. Ech, trudno. Nie b�d� po nim p�aka�.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Masz tu par� monet. Na wy�sz� nagrod� nie mo�esz teraz liczy�.
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
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Ach, ju� s�ysza�e�? Sukinsyny zamkn�y go w pace!
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Jakbym nie mia� do�� problem�w ze swoimi lud�mi, teraz musz� jeszcze zaj�� si� paladynami!
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
	description = "Co zamierzasz zrobi� w sprawie Benneta?";
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
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Co zamierzasz zrobi� w sprawie Benneta?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Jeszcze nie wiem. Moi ch�opcy najch�tniej pobiegliby od razu do miasta, �eby wbi� Hagenowi z�by do gard�a.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Na szcz�cie mamy za ma�o ludzi, �eby przeprowadzi� tak� operacj�. Prawd� m�wi�c, to nie w moim stylu.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //A wi�c zamierzasz tu czeka� na rozw�j wydarze�?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //W �adnym wypadku!
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Nie zdo�am na czas udowodni� niewinno�ci Benneta. Ludzie Lee nie zawahaj� si� zaatakowa� miasta i odbi� Benneta si��."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares wci�� siedzi w mie�cie i pr�buje wykombinowa�, jak wyci�gn�� Benneta.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //P�ki co, pr�buj� jako� utrzyma� moich ludzi w ryzach. Mam tylko nadziej�, �e Lares si� po�pieszy.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //A, zanim zapomn�! Buster chce z tob� porozmawia�. Nie chcia� mi powiedzie�, o co chodzi. Mo�e powiniene� do niego zajrze�?
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
	description = "Mog� ci jako� pom�c w tej sprawie z Bennetem?";
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
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Mog� ci jako� pom�c w tej sprawie z Bennetem?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Jasne. Odrobina sprytu i rozs�dku na pewno nie zaszkodzi.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos �wiadkiem, �e p�ta si� tu wystarczaj�co wielu idiot�w.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Id� do miasta i postaraj si� wyci�gn�� stamt�d Benneta.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Tylko si� pospiesz! Nie wiem, jak d�ugo zdo�am utrzyma� moich ludzi w ryzach!
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
	description = "Jakie� wie�ci w sprawie Benneta?";
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
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Jakie� wie�ci w sprawie Benneta?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Wygl�da na to, �e nie poturbowali go za bardzo w wi�zieniu.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Dobra robota.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Nie, nadal wiemy za ma�o.
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

	description	 = 	"Co si� tu dzia�o?";
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
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Co si� tu dzia�o?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Ten sukinsyn, Sylvio, dowiedzia� si� o smokach w G�rniczej Dolinie i namiesza� w g�owach wszystkim na farmie.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Przekonywa� ch�opak�w, �eby poszli z nim do Doliny. Obiecywa� bogactwa, s�aw�, zaszczyty...
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Niekt�rzy nie chcieli go nawet s�ucha�, ale znalaz�o si� paru idiot�w, kt�rzy dali si� nabra�.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Kazali Bennetowi przygotowa� dla siebie odpowiednie wyposa�enie i wyruszyli w drog�.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //Ech, prawd� m�wi�c, ciesz� si�, �e Sylvio poszed� wreszcie do diab�a.
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
	description	 = 	"Czy mo�esz mnie wyszkoli�?";
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
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Mo�esz mnie czego� nauczy�?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Mog� ci pokaza�, jak pos�ugiwa� si� dwur�cznym.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Ale nie mam czasu, �eby wbija� ci do g�owy podstawy.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Poducz si� troch� u kogo� innego. Jak b�dziesz gotowy, poka�� ci par� ciekawych sztuczek.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //S�ysza�em, �e jeste� ca�kiem niez�y, ale mog� ci pokaza� par� nowych sztuczek.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee nauczy mnie walki or�em dwur�cznym.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Wi�c je�li chcesz, mog� ci� uczy�. Ale to b�dzie kosztowa�o...
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Ile?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 sztuk z�ota i mo�emy zaczyna�.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"To troch� za drogo.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Umowa stoi. Oto twoje z�oto.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //To troch� za drogo.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Zastan�w si�. Trudno o drugiego takiego nauczyciela jak ja.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Umowa stoi. Oto twoje z�oto.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //�wietnie. Nie po�a�ujesz tego.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee nauczy mnie walki or�em dwur�cznym.");
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
	description = "Dobra. Bierzmy si� do nauki.";
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
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Dobra. Bierzmy si� do nauki.
	
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Teraz jeste� prawdziwym mistrzem walki dwur�cznym or�em.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Nie potrzebujesz ju� nauczyciela.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Teraz jeste� prawdziwym mistrzem walki dwur�cznym or�em.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Nie potrzebujesz ju� nauczyciela.
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

	description	 = 	"Jaszczuroludzie roznosz� smocze jaja po ca�ym kraju.";
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
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Jaszczuroludzie roznosz� smocze jaja po ca�ym kraju.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Mo�na si� by�o tego spodziewa�. Najwy�szy czas, �eby�my si� st�d wynie�li.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //To co mam z nimi zrobi�?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Rozwali� je, a co innego?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Mo�e skorupy da si� wykorzysta� do sporz�dzania zbroi, albo czego� w tym stylu.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Wygl�daj� na do�� solidne. Pogadaj o tym z Bennetem.
		B_LogEntry (TOPIC_DRACHENEIER,"Lee nie zdo�a� zrobi� zbyt wiele ze smoczym jajem. Wys�a� mnie do kowala Benneta."); 
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
	description = "Co s�ycha� na farmie?";
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
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Co s�ycha� na farmie?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //C�, odk�d odszed� Sylvio, mamy tu wzgl�dny spok�j.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //To chyba dobrze?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Niby tak, ale pracy nam przez to nie uby�o. Moi ch�opcy marudz� coraz bardziej, bo teraz musz� pracowa� za siebie i za ludzi, kt�rych wyci�gn�� Sylvio.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Ale to ju� m�j problem. Jako� sobie poradz�.
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
	
	description	 = 	"Wiesz mo�e, jak m�g�bym przej�� okr�t paladyn�w?";
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
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Wiesz mo�e, jak m�g�bym przej�� okr�t paladyn�w?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //A my�lisz, �e siedzia�bym tu, gdybym wiedzia�, jak to zrobi�? Ten okr�t jest lepiej strze�ony ni� konwoje z rud� w Starym Obozie.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Musi by� jaki� spos�b, �eby dosta� si� na pok�ad.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Dostanie si� na pok�ad to akurat pestka.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Przecie� mamy w gar�ci s�dziego! Id� do niego i wydu� odpowiednie pismo uprawniaj�ce do zaj�cia okr�tu.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee uwa�a, �e aby dosta� si� na statek, najlepiej by�oby mie� upowa�nienie od s�dziego. W�tpi� jednak, aby ten ostatni wyda� mi przepustk� z w�asnej, nieprzymuszonej woli.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Mam tu sfa�szowane pe�nomocnictwo. Dzi�ki niemu stra�nicy powinni wpu�ci� ci� na pok�ad.
		
			B_LogEntry (TOPIC_Ship,"Poczciwy Lee, zawsze mo�na na nim polega�. Podrobi� list, dzi�ki kt�remu zostan� wpuszczony na okr�t paladyn�w.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Ale to jeszcze nie wszystko. Musisz najpierw znale�� kapitana, za�og�, i takie tam.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Sam okr�t to za ma�o. Jest jeszcze mn�stwo spraw, kt�re trzeba za�atwi�.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Kogo powinienem wzi�� do za�ogi?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Znasz kogo�, kto m�g�by stan�� za sterem statku?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Znasz kogo�, kto m�g�by stan�� za sterem statku?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Je�li dobrze pami�tam, Torlof kiedy� sporo �eglowa�. On b�dzie wiedzia� co i jak.

	B_LogEntry (TOPIC_Captain,"Torlof to stary wilk morski, mo�e zechce zosta� kapitanem na moim statku.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Kogo powinienem wzi�� do za�ogi?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //To ju� twoja decyzja. Na twoim miejscu bra�bym tylko ludzi, kt�rym m�g�bym zaufa�. Masz wystarczaj�c� ilo�� zaufanych ludzi?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Je�li potrzebujesz kowala, pogadaj koniecznie z Bennetem. Lepszego ni� on nie znajdziesz.

	B_LogEntry (TOPIC_Crew,"Lee nie pom�g� mi zbytnio w skompletowaniu za�ogi, jednak poradzi� mi, abym wzi�� jedynie osoby godne zaufania. Powinienem si� uda� do Benneta, mo�e on b�dzie zainteresowany.");
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

	description	 = 	"Sztuczka z pisemnym upowa�nieniem zadzia�a�a!";
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
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //Sztuczka z pisemnym upowa�nieniem zadzia�a�a! Statek nale�y teraz do mnie. Pan s�dzia by� bardzo... pomocny.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //A nie m�wi�em? Wiedzia�em, �e ten sukinsyn jeszcze si� do czego� przyda.
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
	description	 = 	"Zamierzam ukra�� okr�t.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen n�tig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Zamierzam ukra�� okr�t.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //A jak niby chcesz tego dokona�?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //To proste - p�jd� na przysta�, poka�� im twoje papiery i zajm� statek.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Jak chcesz. Mam nadziej�, �e wiesz w co si� pakujesz.
	
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
	description	 = 	"Pop�yniesz ze mn�?";
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
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Pop�yniesz ze mn�?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //�artujesz? Jasne, �e tak! Mam par� rachunk�w do wyr�wnania na kontynencie.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //No i mog� ci pokaza� kilka sztuczek w walce dwur�cznym or�em. Mog� ci si� przyda�.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee chce jak najpr�dzej wr�ci� na kontynent. Zaoferowa� mi swoj� pomoc. Z pewno�ci� nigdzie nie znajd� lepszego trenera.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Narazie mam ju� za�og�, ale dam ci zna�, gdyby co� si� zwolni�o.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Dam ci zna�, kiedy b�dziesz mi potrzebny.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"W takim razie pakuj si�!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //W takim razie pakuj si�!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Co? Ju�? Teraz?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Tak, podnosimy �agle. Je�li chcesz si� ze mn� zabra�, przyjd� na przysta�. Spotkamy si� na statku.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //D�ugo czeka�em na t� chwil�. Mo�esz na mnie liczy�.
	
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
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Dam ci zna�, kiedy b�dziesz mi potrzebny.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //C�, ty wiesz najlepiej. Ale dobrych �o�nierzy nigdy nie za wielu.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //No, chyba �e to idioci pokroju Sylvio.

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
	description	 = 	"Chyba jednak mi si� nie przydasz!";
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
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Chyba jednak mi si� nie przydasz!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Jak chcesz. Wiesz, gdzie mnie szuka�, prawda?
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Chyba jednak b�d� ci� potrzebowa�!";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man nat�rlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Chyba jednak b�d� ci� potrzebowa�!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Wiedzia�em, �e tak b�dzie! Do zobaczenia na statku!
		
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
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Wiesz co? Niech ci�! Najpierw ka�esz mi przyj��, potem mnie odsy�asz...
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




































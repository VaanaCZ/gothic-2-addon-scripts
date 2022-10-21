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
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Dob�e �e jsi p�i�el. M��e� hned zaplatit tu pokutu.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Nebere� z�kony m�sta moc v�n�, co?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //Seznam tv�ch proh�e�k� zase narostl.
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //A ne��kej mi, �es to nev�d�l!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Zaplat� maxim�ln� pokutu.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //No, zd� se, �e se situace zm�nila.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Nejsou u� ��dn� sv�dkov� tv� vra�dy!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Nikdo u� nebude sv�d�it, �e t� vid�l kr�st!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //U� nezbyli ��dn� sv�dci t� tv� rva�ky.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //V�echna obvin�n� proti tob� byla sta�ena.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //Nev�m, co se tam ve m�st� stalo - a ani to v�d�t nechci.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //D�vej si prost� pozor, aby ses tady nedostal do probl�m�.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //Tak nebo tak, rozhodl jsem se prominout ti tv� dluhy.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Dej si pozor, a� se nedostane� do ��dn�ch dal��ch nesn�z�.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Nakonec stejn� zaplat� v�echny sv� z�vazky v pln� v��i.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Tak co, chce� zaplatit?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Nem�m dost pen�z!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Kolik �e to bylo?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Kolik �e to bylo?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Nem�m dost pen�z!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Kolik �e to bylo?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Tv� pov�st t� p�edch�z�. Poru�il jsi z�kony m�sta.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Dostal ses do p�kn� �lamastyky.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //Vra�da je v�n� zlo�in!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Nemluv� o tv�ch dal��ch proh�e�c�ch.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Str�e maj� p��kazy na m�st� popravit ka�d�ho vraha.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //Vra�da je v tomto m�st� nep��pustn�. M��e� v�ak d�t svou l�tost najevo zaplacen�m pokuty.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Jsi obvin�n z kr�de�e!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Nemluv� o dal��ch v�cech, kter� se ke mn� donesly.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //To je poru�en� m�stsk�ch z�kon�. Za to zaplat�.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Zapletl ses do rva�ky. T�m p�dem jsi poru�il z�kon.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //A co to bylo s tou ovc�?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Poru�en� z�kon� m�sta je poru�en�m z�kon� samotn�ho Innose.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Bude� za to muset zaplatit.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Zasedl sis na na�e ovce - poprv� jsem tomu ani necht�l v��it.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Pro� se mus�m po��d zaob�rat takov�mi prkotinami?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Bude� muset zaplatit n�hradu �kody!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Kolik?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"Nem�m dost pen�z!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //Dobr�! Dohl�dnu na to, aby se o tom dozv�d�l ka�d� ve m�st� - to ti alespo� ��ste�n� vylep�� reputaci.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //Nem�m dost pen�z!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Tak si n�jak� co nejrychleji se�e�.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //A varuji t�: jestli se provin� je�t� n���m, jen si to zhor��.
	
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
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //U� jsem o tob� sly�el.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar mi ozn�mil, �e pr� se mnou chce� mluvit.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Jsi ten cizinec, kter� se do�aduje Innosova oka.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Jsem lord Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Kr�lovsk� paladin, v�le�n�k na�eho P�na Innose a nejvy��� velitel Khorinidu.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //M�m spoustu pr�ce. Tak�e nepl�tvej m�m �asem - a rad�ji mi �ekni, pro� tu jsi.
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
	description	 =  "P�in��m n�vrh p��m��� od �oldn���!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //P�in��m n�vrh p��m��� od �oldn���!
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //(nevrle) Hm - uka�!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Gener�la Leeho zn�m. V�m tak� o okolnostech, za jak�ch byl odsouzen k nucen�m pracem v kolonii.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Pova�uji ho za �estn�ho mu�e. Jsem ochoten mu jeho proh�e�ky odpustit - ale jenom jemu!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //To se net�k� jeho mu��. V�t�ina z nich jsou hanebn� hrdlo�ezov� a sv�j trest si pln� zasluhuj�!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Jim rozhodn� nic neprominu. M��e� jim to ozn�mit.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //Je to v�echno?
	};
	B_LogEntry (Topic_Frieden,"Lord Hagen je ochoten zprostit viny Leeho, ale nikoliv ostatn� �oldn��e."); 
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
	description	 =  "Nedaleko se shroma��uj� z�stupy zl�ch stv�r. V Hornick�m �dol�.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Nedaleko se shroma��uj� z�stupy zl�ch stv�r. V Hornick�m �dol�.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //V Hornick�m �dol�? Vyslali jsme tam v�pravu. Neust�le n�m doch�zej� zpr�vy o tom, �e pr�smyk okupuj� sk�eti.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Ale o arm�d� zla se ke mn� je�t� nic nedoneslo.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //Nen� to jen n�jak� uboh� trik, kter� m� m� p�esv�d�it o nezbytnosti spojit s�ly se �oldn��i?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //Ne.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //(skepticky) Co to m� b�t za arm�du?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Arm�da drak�, kter� kolem sebe shrom�dila z�stupy p�isluhova��.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Draci? Podle star�ch spis� to u� je n�kolik stolet�, co n�kdo naposledy vid�l draka.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Pov�z - pro� bych m�l v��it jedin�mu tv�mu slovu?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //Jenom�e ot�zka nen�, jestli mi m��e� v��it. Ot�zka je, jestli si m��e� dovolit mi NEV��IT v p��pad�, �e mluv�m pravdu.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Dokud nebudu m�t d�kaz, nemohu tam vyslat v�ce mu��.
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
	description	 =  "Tak�e chce�, abych ti p�inesl n�jak� d�kaz?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //Tak�e chce�, abych ti p�inesl n�jak� d�kaz?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //P�esn� tak. Projdi pr�smykem a dosta� se do Hornick�ho �dol�. A� tam bude�, najdi mou v�pravu - a a� se ti to poda��, promluv si s velitelem Garondem.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Pokud n�kdo v�, jak� tam panuje situace, tak je to on.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Jestli tvoje slova potvrd�, jsem p�ipraven ti pomoci.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Znamen� to, �e mi pak d� Innosovo oko?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //Innosovo oko... dobr�. P�ines mi d�kaz a j� pak dohl�dnu na to, abys sm�l nosit ten amulet.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //M�m tedy v tomto ohledu tvoje slovo?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Samoz�ejm� - m� ho m�t.
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
	description	 =  "Co v� o Innosovu oku?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //Co v� o Innosovu oku?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //Je to posv�tn� artefakt. (zaduman�) Ve star�ch proroctv�ch se ��k�, �e je n�jak spojen s draky.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //V t�chto spisech je ale tak� zm�nka o tom, �e jej m��e nosit jen Innos�v vyvolen�.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //J� jsem Innos�v vyvolen�!
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Potom mo�n� bude� moci ten amulet nosit.
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
	description	 =  "Jak se m�m dostat p�es ten pr�smyk?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Jak se m�m dostat p�es ten pr�smyk?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //D�m ti kl�� od vrat v pr�smyku. Bude� si ale muset naj�t zp�sob, jak proklouznout mezi vojskem sk�et�.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Nech� t� Innos ochra�uje.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Lord Hagen chce, abych mu o arm�d�ch zla p�inesl n�jak� d�kaz. Mus�m se vydat do Hornick�ho �dol� a promluvit si tam s velitelem Garondem.");
	
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

	description	= "Hled�m kovov� ornament.";
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
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Hled�m kovov� ornament. M�l by b�t n�kde u kamenn�ho kruhu u Lobartova statku.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Jestli mysl� tohleto, tak to jsme pova�ovali za magickou runu, ale pak jsme zjistili, �e je to �pln� k ni�emu.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //Klidn� si to vem, mn� to k ni�emu nen�.
	
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
	description	 =  "Pro� jste p�i�li do Khorinidu?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //Pro� jste p�i�li do Khorinidu?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Pln�me d�le�it� �kol ve prosp�ch kr�lovstv�. Na�e rozkazy poch�zej� p��mo od kr�le Rhobara.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //�ekl jsem ti, �e jsme poslali v�pravu do Hornick�ho �dol�. Proto tu jsme.
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
	description	 =  "Co d�laj� va�i mu�i v Hornick�m �dol�?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //Co d�laj� va�i mu�i v Hornick�m �dol�?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Nevid�m d�vod, pro� bych ti m�l n�co takov�ho ��kat!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //Byl jsi tam. M�l bys to v�d�t.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //Dobr�, proto�e tam m� tak jako tak nam��eno, tak ti to m��u ��ct.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //Jde o magickou rudu. M��e rozhodnout o v�sledku v�lky.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Bez dostatku zbran� ukut�ch z magick� rudy nem� kr�lovsk� arm�da ani tu nejmen�� �anci obst�t v boji proti elitn�m sk�et�m v�le�n�k�m.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //A doly tady na ostrov� jsou posledn�, ke kter�m je�t� m�me p��stup.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Jakmile na�i lo� pln� nalo��me rudou, vr�t�me se zp�tky na pevninu.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //V�lka se sk�ety se tedy nevyv�j� moc dob�e, co?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //U� tak jsem toho �ekl v�c, ne� je zdr�vo.
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
	description	 = 	"Hled�m mistra me�e.";
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
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Hled�m mistra me�e.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //V�n�? Jednoho jsi pr�v� na�el.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Lord Hagen m� zasv�t� do taj� boje s obouru�n�mi zbran�mi.");
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
	description = "Tak za�n�me (osvojit si dovednost obouru�n�ho boje).";
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
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //Za�n�me.
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Te� jsi s�m dobr�m mistrem me�e. U� t� nemohu d�l u�it.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Nech� tv� dal�� skutky prov�z� moudrost mistra me�e.
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
	description	 = 	"Cht�l bych vstoupit do slu�by ��du.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Cht�l bych vstoupit do slu�by ��du.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Dobr�, u� jsi dok�zal, �e m� dost odvahy, schopnost� a zku�enost�, abys mohl slou�it Innosovi.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Tv� skutky jsou dostate�n�m d�kazem �ist�ho srdce.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Je-li to tv� p��n�, v�t�m t� v na�em ��du.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Je�t� si nejsem tak �pln� jist�.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Jsem p�ipraven!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //B�t Innosov�m v�le�n�kem znamen� zasv�tit v�echny sv� �iny Innosov�m z�m�r�m.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //Do ��du jsou p�ijati jen nej�estn�j�� a nejstate�n�j�� v�le�n�ci.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Pokud jsi pevn� rozhodnut st�t se paladinem, mus� nejprve prok�zat, �e jsi toho hoden.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Je�t� si nejsem tak �pln� jist�.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Tak jdi a o�isti sv� srdce od pochybnost�. Vra� se, a� bude� p�ipraven.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Jsem p�ipraven!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //(v�n�) Tak budi� dle tv� v�le!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //(v�n�) Mnoho mu�� se vydalo touto cestou a polo�ili sv� �ivoty ve jm�nu Innose.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //(v�n�) P��sah�, �e tv� skutky budou d�lat jejich smrti �est a budou hl�sat sl�vu Innosovu?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //P��sah�m!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Od t�to chv�le t� tedy prohla�uji �lenem na�eho spole�enstva.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Z�rove� t� ustanovuji Innosov�m v�le�n�kem.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //D�v�m ti zbran� a zbroj ryt��e. Nos je s hrdost�, ryt��i!

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

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //D�le, na z�klad� tv� hodnosti, ti dovoluji p��stup do kl�tera.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Albrecht t� nau�� na�� magii, sta��, kdy� za n�m zajde� a promluv� si s n�m.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //A jsou ti samoz�ejm� otev�eny na�e ubikace na horn�m konci m�sta.

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
	description	 = 	"Jak mohu dok�zat, �e jsem toho hoden?";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Jak mohu dok�zat, �e jsem toho hoden?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //To prok�� tv� skutky.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //Bojujeme v Innosovu jm�nu za svobodu a spravedlnost.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Bojujeme proti Beliarovi a jeho poh�nk�m, kte�� cht�j� zni�it Innos�v ��d.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Rozum�m.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //V�bec ni�emu nerozum�! Na�e �est je n� �ivot a n� �ivot je Innos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Ka�d� paladin, jen� se spravedliv� bije, ���� d�l sl�vu Innose a mnoz� z n�s ji� polo�ili �ivot na olt�� v��n�ho boje dobra a zla.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //My v�ichni ct�me tuto tradici. Pokud sel�eme, po�pin�me skutky na�ich padl�ch druh�.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Jen ten, kdo tohle beze zbytku pochop�, je hoden st�t se paladinem.
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
	description = "Jak se vede?";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Jak to vypad�?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Mus�m naj�t zp�sob, jak tuhle v�pravu zachr�nit.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Mus�me s t�mi draky n�co ud�lat.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //(k sob�) Mo�n� by n�s te� mohlo zachr�nit Innosovo oko.
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Asi jsem p�i�el o rozum. Jsem voj�k, ne byrokrat.
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //S t�mhle v��m pap�rov�n�m, kter� m�m na krku, si sotva dok�u vzpomenout, jak� to je t��mat me�.
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
	description = "J� Oko m�m - ale je rozbit�.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //J� Oko m�m - ale je rozbit�.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //CO�E? U Innose! Cos to ud�lal? To Oko pot�ebujeme!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Promluv si s Pyrokarem! Mus� existovat n�jak� zp�sob, jak jej zase opravit.
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
	description	 = 	"P�in��m ti zpr�vu od Garonda.";
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
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //P�in��m novinky od Garonda. Dal mi pro tebe tenhle dopis.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //Na�e postaven� je hor��, ne� jsem se ob�val. Ale podej mi hl�en� o situaci v Hornick�m �dol�.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Paladinov� jsou obkl��eni na hrad� v Hornick�m �dol�, v�ude kolem jsou sk�eti.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //P�i dolov�n� byly obrovsk� ztr�ty a skoro ��dn� ruda u� nezb�v�.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //No, pokud m��u ��ct sv�j n�zor, tak kdy� t�m chlap�k�m nikdo nepom��e, jsou ztraceni. Tak to alespo� vypad�.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Najdu zp�sob, jak tu v�pravu zachr�nit. Ud�lal jsi toho pro n�s tolik. Innos se ti odvd���.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Nechci jeho vd��nost. Chci jeho oko.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Ano, samoz�ejm�. Pln�m sv� sliby. Vezmi si tenhle dopis. Otev�e ti br�ny kl�tera.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Promluv si s Pyrokarem, nejvy���m ohniv�m m�gem, a proka� se mu touhle listinou. Za��d� ti p��stup k Innosovu oku.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //A je�t� n�co, ne� p�jde�.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //Na d�kaz m� vd��nosti si vezmi tuhle runu. P�enese t� bezpe�n� zp�tky do m�sta, kdykoliv si zamane�.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Lord Hagen mi p�edal zpr�vu, kter� p�im�je mistra Pyrokara, aby mi v kl�te�e vydal Innosovo oko.");

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
	description	 = 	"Pot�eboval bych si s tebou promluvit o Bennetovi.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Pot�eboval bych si s tebou promluvit o Bennetovi.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Ale to je p�ece ten �old�k, co zavra�dil jednoho z m�ch mu��.
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Jak si m��e� b�t tak jist�, �e je vrahem pr�v� Bennet?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"V���m, �e je Bennet nevinn�.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Bennet by n�m mohl pomoci opravit Innosovo oko.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Bennet by n�m mohl pomoci opravit Innosovo oko.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //I kdyby dok�zal p�it�hnout na zem moc samotn�ho Innose...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //Zavra�dil paladina. Za to bude popraven!
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Jak si m��e� b�t tak jist�, �e je vrahem pr�v� Bennet?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //M�me sv�dka.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Jak vid�, nen� o vin� toho �old�ka ��dn�ch pochyb.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Kdo je t�m sv�dkem?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, tajemn�k m�stodr��c�ho. On tu vra�du vid�l.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Jeho popis padne bez jak�chkoliv pochyb na Benneta. Co se m� t��e, v�c je vy��zena.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Ten �old�k bude viset za velezradu.

	B_LogEntry (TOPIC_RESCUEBENNET,"Sv�dkem je tajemn�k m�stodr��c�ho, Cornelius. Tvrd�, �e celou vra�du vid�l."); 

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
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //V���m, �e Bennet je nevinn�.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //D�kazy jsou jasn�. Je vinen.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //A co kdy� je d�kaz myln�?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //D�vej pozor, co ��k�. Vzn�� v�n� obvin�n�.
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Pokud mi nem��e� p�edlo�it d�kazy o tom, �e sv�dek lhal, rad�ji ml�.
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
	description	 = 	"Cornelius lhal.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Cornelius lhal.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Jak to v�?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //M�m jeho den�k. Je v n�m v�echno.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //(zu�iv�) Ten slizk� bastard!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //Pod vahou nov�ch d�kaz� mi nic jin�ho nezb�v�.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //Z moci ��adu sv��en�ho mi kr�lem a c�rkv� prohla�uji...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...�e v�ze� Bennet je zbaven v�ech obvin�n� a tud� svobodn� �lov�k.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Cornelius bude s okam�itou platnost� vzat do vazby pro k�ivop��se�nictv�.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //U�et�i si n�mahu. Cornelius je mrtv�.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //V tom p��pad� se mu ji� dostalo spravedliv�ho trestu. Dobr� pr�ce.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Ukr�v� se.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //D��ve nebo pozd�ji se objev�. Pak ho zatkneme.
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
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Tv� skutky jsou ke cti n�s v�ech.
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
	description	 = 	"P�in��m Oko!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //P�in��m Oko!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //(uctiv�) Nese� Oko!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //A dal jsi jej zp�t dohromady!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //V tom p��pad� jsi Innos�v vyvolen�!
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Vyraz�m na cestu a zabiju v�echny draky v Hornick�m �dol�!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //Nech� t� Innos doprov�z� a svou moc� zni�� zlo!
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

	description	 = 	"Na zemi �to�� elitn� sk�et� v�le�n�ci.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Na zemi �to�� elitn� sk�et� v�le�n�ci.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Zpravil jsem lorda Hagena o postupuj�c�ch tlup�ch sk�et�ch n�jezdn�k�."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Co t� k tomu vede?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //Mluvil jsem s jedn�m z nich. Padlo tvoje jm�no.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Nesmysl. Moji lid� zat�m ��dnou masivn� invazi sk�et� nehl�sili.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Mo�n� se v nedalek�ch les�ch ztratil n�kter� z jejich zv�d�.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //Nebyli to ��dn� zv�dov�. Jednomu z nich jsem vzal tento prsten.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Uka� mi ho.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Hmm. Tak to je docela znepokojiv�.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //Tohle je znamen� jejich moci. Tak�e sk�eti opustili sv� palis�dy a bojuj� na otev�en�m prostranstv�.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Zat�m jsem jich moc nevid�l. Hlavn� jejich velitele a jen p�r bojovn�k�.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //V�n�? V tom p��pad� musej� m�t za lubem n�co jin�ho. To mi ke sk�et�m moc nesedne, �e by jejich v�dci sami opustili sv� ochrann� palis�dy.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Mohla by to v�ak b�t ide�ln� p��le�itost, jak jim u�t�d�it citeln� �der.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Pokud by p�i�li o sv� velitele, spadne jim mor�lka na bod mrazu.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //M� nov� �kol, ryt��i. Zabij v�echny sk�et� velitele, kter� v t�hle oblasti najde�.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //P�ines mi jejich prsteny. To by mohlo sk�ety srazit na kolena.
			
			B_LogEntry (TOPIC_OrcElite,"Poda�ilo se mi p�in�st lordu Hagenovi d�kaz - prsten sk�et�ho vojev�dce. Po��dal m�, abych mu p�inesl v�echny, kter� najdu."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Pora� se s Ingmarem. M��e ti prozradit p�r taktik, kter� by se ti p�i boj�ch se sk�et�mi veliteli mohly hodit.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Sk�et� elitn� bojovn�ci jsou jeho specialita. M�l s nimi �asto co do �in�n�.
			B_LogEntry (TOPIC_OrcElite,"Elitn� sk�et� v�le�n�ci jsou Ingmarovou specialitou."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //Tvoje pouh� tvrzen�, �e jsi zabil jednoho ze sk�et�ch velitel�, mi nesta��.
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Pokud to nem�m br�t na lehkou v�hu, pot�ebuji n�jak� hmatateln�j�� d�kaz.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen mi po��d nechce v��it. ��d� d�kaz, �e elitn� v�le�n�ci skute�n� �to�� na civilizovan� kraje. No, sp� by m� p�ekvapilo, kdyby to bylo naopak."); 
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

	description	 = 	"Je tady je�t� jedna v�c, kterou mus�m ohledn� t�ch sk�et�ch velitel� nahl�sit.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Je tady je�t� jedna v�c, kterou mus�m ohledn� t�ch sk�et�ch velitel� nahl�sit.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //Tak pov�dej.

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld f�r einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //M�m pro tebe dal�� sk�et� prsten.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //M�m pro tebe dal�� sk�et� prsteny.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Jsem na tebe hrd�. Jen tak d�l!

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //Mo�n� tam je�t� n�kde n�jak� je.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Brzy je sraz�me na kolena.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //V�n� by m� p�ekvapilo, kdyby se jich tu potulovalo o mnoho v�c.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Jejich prsteny mi samoz�ejm� m��e� nosit i nad�le, ale mysl�m, �e sk�eti u� n� vzkaz pochopili.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Po�kej. Tady m� n�jak� zlato na sv� vybaven�.

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
	description = "Draci jsou mrtv�.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Draci jsou mrtv�.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //V�d�l jsem, �e ti Innos d� s�lu porazit draky!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Kde je ruda?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Sk�eti je�t� po��d obl�haj� hrad v Hornick�m �dol�. Garond nem� ��dnou �anci opevn�n� opustit, dokud obl�h�n� neskon��.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //(zu�iv�) Zatracen�!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Jestli�e Garond nedok�e tu situaci zvl�dnout, budu se o to muset postarat s�m.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //P�r sk�et� m� nezastav�! M� ne!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //U� jsem informoval sv� mu�e. Jsme p�ipraveni k odjezdu.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Pojedeme V�ICHNI. Nech�m na lodi jen nezbytnou pos�dku.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //To by m�lo sta�it na to, abychom s t�mi sk�ety kone�n� zametli!

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
	description = "Pot�ebuji lo�.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Pot�ebuji lo�.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //To hodn� lid�, voj�ku.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //(zasm�je se) To sly��m skoro ka�d� den, ctihodnosti. Ale...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Nem� dokonce ani kapit�na, o pos�dce nemluv�.
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //Co ta lo� v p��stavu?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Ta je moje a moje tak� z�stane. A� nadejde �as, odvezeme s n� rudu.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Ale a� to bude za n�mi, m��e� se m� zeptat znovu.
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
	description = "Sk�eti vtrhli do hradu v Hornick�m �dol�!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Sk�eti vtrhli do hradu v Hornick�m �dol�!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //U Innose! Co p�esn� se tam stalo?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //N�jak se musela otev��t br�na.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //N�jak?! Jak by to bylo mo�n�... Na hrad� mus� b�t zr�dce!
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
	description = "Na co �ek�?";
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
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //Na co �ek�?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //�ek�me na v�stroj a proviant. Pak vyraz�me!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Te�, kdy� jsou na hrad� sk�eti, pot�ebujeme proviantu je�t� v�c ne� p�edt�m.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //To ale n� odchod o moc nezdr��.
	};
};

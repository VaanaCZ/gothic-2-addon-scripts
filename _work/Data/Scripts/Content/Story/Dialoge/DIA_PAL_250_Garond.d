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
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Nem�me se o �em bavit, dokud nezaplat� pokutu.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //A ta podle posledn�ch obvin�n� zase stoupla.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Zd� se, �e ses zapletl do dal��ch pot��.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Ale douf�m, �e to kone�n� v�echno zaplat�! Dohromady to d�l�...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //V�n� jsi m� zklamal. Tvoje pokuta je...
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
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Objevilo se p�r nov�ch skute�nost�.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Z ni�eho nic u� nejsi obvin�n� z vra�dy.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nikdo si nevzpom�n�, �e by t� vid�l kr�st.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //U� nen� nikdo, kdo by tvrdil, �e t� vid�l zapleten�ho do n�jak� rva�ky.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Zd� se, �e v�echna obvin�n� proti tob� byla sta�ena.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Netu��m, o co tam �lo, ale varuju t�: nep�eh�n�j to!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Rozhodl jsem se zapomenout na tv� dluhy.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //A u� se na hrad� nezapl�tej do ��dn�ch pot��!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Jedno si vyjasn�me: tak jako tak bude� muset zaplatit pokutu v pln� v��i.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //No, tak�e co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Nem�m dost pen�z!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Kolik �e to bylo?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Kolik �e to bylo?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Nem�m dost pen�z!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Kolik �e to bylo?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Garond_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Tak�e to jsi ty, kdo d�l� na hrad� probl�my.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //��kal jsem si, kdy za mnou kone�n� zav�t�.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Vra�da je p�esn� to posledn�, co tady pot�ebujeme.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Pot�ebuji ka�d�ho ze sv�ch lid� - a te� m�m o jednoho m��!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //A to nemluv�m o t�ch dal��ch v�cech, do kter�ch ses zapletl.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //N�co ti vysv�tl�m. V�ichni jsme tady ve stejn� pasti.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //A zoufale pot�ebuji ka�d�ho ze sv�ch mu��. V�etn� tebe.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Pokud chce� mermomoc� n�koho zab�t, sta��, kdy� odejde� z hradu. Je tam spousta sk�et�.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Ukl�d�m ti pokutu - i kdy� m� v�n� �tve, �e se mus�m zab�vat v�cmi, jako je tohle.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //�u�k� se, �e si tu a tam p�ilep�� z v�c�, kter� ti ne��kaj� pane.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //A to nemluv�m o dal��ch v�cech, kter� se ke mn� donesly.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Z toho se jen tak nevyvl�kne�. Zd� se, �e nech�pe� v�nost na�� situace.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Bude� muset zaplatit pokutu, kter� by vyrovnala tv� zlo�iny!
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Rva�ky mezi mu�stvem nevid�m r�d.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //A to s tou ovc� bylo tak� zcela zbyte�n�.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Tak�e bude� muset zaplatit pokutu!
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf get�tet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Ty jen tak zab�j� ovce? Pat�� n�m v�em.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Zaplat� mi za to maso.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Kolik?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Nem�m dost pen�z!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Dobr�, �eknu chlapc�m, aby se uklidnili. Ale b�da ti, jestli t� je�t� jednou p�istihnu p�i n��em takov�m!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Nem�m dost pen�z!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //V tom p��pad� by sis m�l n�jak� rychle sehnat.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //A varuju t�: jestli se zase do n��eho zaplete�, tak se ta ��stka je�t� zv���!
	
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
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Odkud jsi p�i�el? Nejsi ��dn� z horn�k� a ani ��dn� z m�ch mu��. No?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //P�i�el jsem skrz pr�smyk.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Skrz pr�smyk...? Ty jsi v�n� pro�el - u Innose!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Pro� jsi tu cestu podstupoval, m�gu?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Jak� jsou tvoje rozkazy, voj�ku?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Vrt� mi hlavou, pro� by cht�l �old�k podstupovat n�co takov�ho. Co tady d�l�?
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
	description = "P�ich�z�m od lorda Hagena.";
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
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //P�ich�z�m od lorda Hagena. Chce, abych mu donesl d�kaz o p��tomnosti drak�.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //A to jsi p�i�el jen proto, abys jej sebral a zase zmizel?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //P�esn� to jsem m�l v pl�nu.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //Tak�e on chce d�kaz? M��e ho m�t. Ale nem��u t� poslat zp�tky za lordem Hagenem, ani� bych mu �ekl o rud�.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Poslouchej - lord Hagen se mus� bezpodm�ne�n� dozv�d�t o zdej�� situaci a o tom, kolik rudy se n�m poda�ilo vydolovat.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //Dobr�, co chce�, abych pro tebe ud�lal?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //M�m tam t�i skupiny horn�k�, ale je�t� jsem od nich nevid�l ani zrnko.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Obejdi v�echny doly a nahlas mi, kolik rudy u� maj�.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Pak ti nap�u dopis, kter� donese� zp�tky lordu Hagenovi.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Dobr�. Zd� se, �e nem�m na v�b�r.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Je�t� ne� m� velitel Garond po�le zp�tky, chce, abych nalezl t�i skupiny kop��� a zjistil, kolik rudy u� z�skali.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Velitel Garond m� pov��il dal��m posl�n�m. U� p�ed �asem vyslal t�i odd�ly kop���, kte�� m�li p�trat po magick� rud�, ale nikdo z nich se dosud nevr�til.");
	B_LogEntry (TOPIC_ScoutMine,"Mus�m ty ztracen� odd�ly naj�t a zjistit, kolik rudy u� se jim poda�ilo vyt�it.");

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
	description = "Ale pro� zrovna j�?";
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
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Ale pro� zrovna j�?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Proto�e v�, jak proklouznout mezi sk�ety. Moji chlapci by tam byli beznad�jn� ztracen�.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Ty jsi mezi nimi ale u� jednou pro�el - to je nejlep�� d�kaz, �e jsi pro tenhle �kol ten prav�.
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
	description = "Pot�ebuji n�jak� vybaven�.";
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
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Pot�ebuji n�jak� vybaven�.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Promluv si s m�gem Miltenem, je tady na hrad�. On bude v�d�t, co by se ti mohlo hodit.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Promluv si o tom s Tandorem. D� ti v�echno, co bude� pot�ebovat.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor na hrad� obchoduje se zbran�mi.");
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
	description = "Kolik mi d�, kdy� tv�j �kol spln�m?";
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
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Kolik mi d�, kdy� tv�j �kol spln�m?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(pohn�van�) Nejsem zvykl� dohadovat se se �old�ky.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Dobr�, zd� se, �e nem�m na v�b�r. Kdy� se o to postar�, jak je t�eba, d�m ti 500 zlat�ch.
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
	description = "Kde najdu ty doly?";
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
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Kde najdu ty doly?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Vezmi si tuhle mapu. Jsou na n� zakreslen� dv� oblasti, ve kter�ch jsou doly.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Pokud bys m�l je�t� n�jak� dotazy, zeptej se Parcivala. �ekne ti v�echno, co bys m�l v�d�t o horn�c�ch.
	
	B_LogEntry (TOPIC_ScoutMine,"Informace o kop���ch mohu z�skat od paladina Parcivala.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Zatracen�! Co se to tam d�je? To n�s p�i�el vyhladit samotn� Beliar?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Moji mu�i jsou t�m�� v�ichni mrtv� a s tou trochou rudy, co m�me, bychom nezastavili JEDIN�HO SK�ETA, NATO� CELOU ARM�DU!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Cel� v�prava je odsouzen� k z�hub�.
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
	description = "Promluvil jsem si s Fajethem.";
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
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //Promluvil jsem si s Fajethem.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Co m� na srdci?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Jeho lid� vydolovali dv� bedny rudy.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Hmm... dv� bedny? Nepot�ebuju dv� bedny - pot�ebuju DV� STOVKY.
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //M�m ti vy��dit, �e pot�ebuje v�c mu��.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Co�e? To m�m poslat dal�� lidi na jistou smrt? Na to m��e zapomenout.
 	
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
	description = "Co se Silvestrova dolu t��e...";
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
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Co se Silvestrova dolu t��e...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Vid�l jsi ho? Mluvil jsi s n�m?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //V�ichni zem�eli. P�ekvapili je d�ln� �ervi.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //A co ruda? V�, kolik j� vyt�ili?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Poda�ilo se jim zachr�nit p�r beden. Jsou v jeskyni pobl� cesty mezi hradem a dolem.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Zatracen�! Byli to v�n� dob�� chlapi - nech� se Innos slituje nad jejich du�emi.
	
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
	description = "Setkal jsem se s Marcosem.";
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
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //Setkal jsem se s Marcosem.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //A? Co hl�s�? Kolik rudy pro n�s m�?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //�ty�i bedny. Opustil d�l, aby dostal rudu do bezpe��.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Te� ty bedny hl�d� v mal�m �dol��ku za sk�et�mi liniemi. ��d� ale o posily.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Co�e? Jenom �ty�i bedny - a opustil d�l? Sakra, to nen� dobr�.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //A te� chce je�t� dal�� mu�e? No dobr�, po�lu mu dva chlapy.
	
	
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
	description = "A co ten dopis pro lorda Hagena?";
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
	AI_Output (other,self ,"DIA_Garond_Success_15_00"); //A co ten dopis pro lorda Hagena?
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //M�me dohromady deset beden rudy - a ztratili jsme dvakr�t tolik dobr�ch mu��.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Dostane� sv�j dopis. Lord Hagen se o tom MUS� dozv�d�t. Tohle �dol� je proklet� - hn�zd� tady zlo.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Velitel Garond mi dal dopis, kter� by m�l b�t dostate�n�m d�kazem. Mus�m jej uk�zat lordu Hagenovi.");
	
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
	description = "A co moje mzda?";
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
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //A co moje mzda?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //No jo, dobr�. Je�t� ti vlastn� dlu��m n�jak� zlato. Tady je tvoje odm�na.
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
	description = "Jak to vypad�?";
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
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Jak to vypad�?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Te� u� jen �ek�m na zpr�vy z posledn�ho dolu - a douf�m, �e to budou dobr� zpr�vy.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Pot�ebuji zpr�vy o tom, jak to vypad� v dal��ch dvou dolech. Pak se uvid�.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //M�l by ses vydat hledat ty doly. Zoufale pot�ebuji zpr�vy o tom, jak to vypad� s dob�v�n�m rudy.
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
	description = "Chci, abys pustil Gorna.";
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
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Chci, abys pustil Gorna.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //Nem��u ho propustit. Sp�chal mnoho zlo�in�, za kter� mus� pykat.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //M��u za n�j zaplatit jeho pokutu?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //To by mo�n� �lo - ale rozhodn� to nebude levn�. Za Gorna budu cht�t 1000 zlat�ch.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //To je hodn� pen�z.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Gorn se tak� mus� zodpov�dat za hodn� v�c�. P�ines mi ty pen�ze a j� Gorna propust�m.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Garond ��d� za Gornovo propu�t�n� tis�c zla��k�.");
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
	description = "Chci zaplatit za Gornovu svobodu. (Zaplatit 1000 zla��k�)";
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
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Cht�l bych vykoupit Gorna.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Dobr�. B� za Geroldem a �ekni mu, a� na m�j rozkaz Gorna propust�.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Zaplatil jsem Garondovi. Te� se Gorn m��e dostat z lochu - str�ce Gerold ho pust�.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //V tom p��pad� mi p�ines 1000 zlat�ch.
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
	description = "Co bude� d�lat te�?";
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
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Co bude� d�lat te�?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //M�m u� v�eho dost. Moje jedin� nad�je jsi te� ty - a �e mi lord Hagen po�le posily.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Budeme st�t pevn� jako sk�la a modlit se k Innosovi, aby n�s v t�to temn� hodin� nenechal klesnout na mysli.
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
	description	 = 	"Co je nov�ho?";
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
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //Co je nov�ho?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Zatracen�. Co se tady fl�k�? Pot�ebuju ty zatracen� posily!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Dokonce i Milten opustil hrad. Ale j� nepot�ebuju m�� lid� - pot�ebuju jich v�c!
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
	description	 = 	"Jsem zp�t.";
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
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Jsem zp�t.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //No to vid�m. Kde jsou ty posily?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen p�ijde, jakmile vy��d� v�echny nezbytn� z�le�itosti. Hodn� se toho stalo.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //To m� nezaj�m�. M� zaj�maj� voj�ci. Sk�et� je ��m d�l t�m v�c a moc dlouho se u� neudr��me.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Mu�i jsou unaven� a doch�z� n�m proviant.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //P�ijelo p�r dobrovoln�k�.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Mysl� sebe a t�ch tv�ch p�r drakobijc�, co? M��ete n�m sice pomoci, ale po��d v�s nen� dost.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Mysl� ty drakobijce na dvo�e? Ti n�m sice mohou pomoci, ale po��d jich nen� dost.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Jestli Hagen co nejd��v nepo�le n�jak� mu�e, pak za nic neru��m.

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
	description	 = 	"A co se t��e t�ch drak�...";
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
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond se mus� zaj�mat o to, jak to s draky vypad�, i kdy� p�sob� dojmem, �e ve skute�nosti mu to m��e b�t ukraden�."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //M�m zpr�vy o drac�ch.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Podej hl�en�.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Zabil jsem draka v ba�in� na v�chod odsud.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Drak ve skaln� pevnosti na jihu je mrtv�.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Ohniv� drak v sopce na jihu u� nebude tropit ��dn� pot�e.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Vydal jsem se do zamrzl� oblasti na z�pad� a zlikvidoval tamn�ho draka.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //To jsou dobr� zpr�vy. Tady. Vezmi si n�jak� pen�ze na dopln�n� v�bavy.
		
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
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //M��e� mi d�t n�jak� dal�� informace o drac�ch?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Vr�sky mi te� d�laj� jin� v�ci. Oric, m�j d�stojn�k p�es strategick� v�ci, ti o tom �ekne v�c.
		B_LogEntry (TOPIC_DRACHENJAGD,"Garond�v strategick� d�stojn�k Oric by pro m� mohl m�t n�jak� u�ite�n� informace."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Provedli draci mezit�m n�jak� dal�� �tok?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Na�t�st� ne. Prozat�m se dr�� zp�tky.
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
	description	 = 	"V�ichni draci u� jsou mrtv�.";
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
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //V�ichni draci jsou mrtv�.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(nev���cn�) V�ichni? Tak�e zlo bylo nav�dy za�ehn�no?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Ne, to bohu�el ne. Je�t� po��d zb�v� jejich v�dce.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Copak nebyli draci veliteli sk�et�?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Ano, to ano, ale maj� sv�ho vlastn�ho p�na. Toho se mus�me tak� zbavit.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Zatracen�, do toho j�t nem��u. Mus�m hl�dat rudu, a je�t� nav�c tu jsou po��d ti sk�eti.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Bude� se o to muset postarat s�m. Nem��u ti pomoci.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Nech� t� Innos ochra�uje.
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
	description	= 	"M�me probl�m s kov��em.";
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
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //M�me probl�m s kov��em.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Jak�m kov��em? P�ed chv�l� tu byl.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //On se vr�til? V tom p��pad� mu �ekni...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Ne, j� mluv�m o Janovi.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //Je to drakobijec jako j� - a je to dobr� kov��.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Jeden z drakobijc�. Je to kov��.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //To je dob�e. N� p�edchoz� kov�� zmizel, srab jeden.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan se o kov�rnu r�d postar�.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Aha. Tak�e si mysl�, �e bych mu m�l v��it.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Ano.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Pokud si jsi tak jist�, m��e� se za n�j zaru�it.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Jestli�e bude d�lat n�jak� pot�e, bude� se za to zodpov�dat ty. Souhlas�?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Budu o tom p�em��let.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Zaru��m se za Jana.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Budu o tom p�em��let.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Jak mu m�m v��it j�, kdy� mu ned�v��uje� ani ty s�m?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Pokud se za toho tv�ho Jana nikdo nepostav�, bude muset dr�et ruce od v�hn� d�l.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Zaru��m se za Jana.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Dobr�. V tom p��pad� m��e kov�rnu pou��vat. Samoz�ejm� tak� bude muset ud�lat me�e pro m� mu�e.
	
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

	description	 = 	"Jak se vede?";
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
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //Jak to vypad�?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Zatracen�! N�jak� parchant nechal hlavn� br�nu otev�enou. Te� je z n�s krmen� pro vlky.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //A� dostanu toho zr�dce do rukou...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Pokud Hagen nep�ijde co nejd��v, pochc�p�me tady jako mouchy.
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

































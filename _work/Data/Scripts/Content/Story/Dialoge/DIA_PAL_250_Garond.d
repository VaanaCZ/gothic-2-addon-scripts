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
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Nemáme se o čem bavit, dokud nezaplatíš pokutu.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //A ta podle posledních obvinęní zase stoupla.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Zdá se, že ses zapletl do dalších potíží.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Ale doufám, že to konečnę všechno zaplatíš! Dohromady to dęlá...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Vážnę jsi mę zklamal. Tvoje pokuta je...
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
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Objevilo se pár nových skutečností.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Z ničeho nic už nejsi obvinęný z vraždy.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nikdo si nevzpomíná, že by tę vidęl krást.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Už není nikdo, kdo by tvrdil, že tę vidęl zapleteného do nęjaké rvačky.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Zdá se, že všechna obvinęní proti tobę byla stažena.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Netuším, o co tam šlo, ale varuju tę: nepâehánęj to!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Rozhodl jsem se zapomenout na tvé dluhy.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //A už se na hradę nezaplétej do žádných potíží!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Jedno si vyjasnęme: tak jako tak budeš muset zaplatit pokutu v plné výši.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //No, takže co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Nemám dost penęz!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Kolik že to bylo?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Kolik že to bylo?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Nemám dost penęz!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Kolik že to bylo?",DIA_Garond_PMSchulden_HowMuchAgain);
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
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Takže to jsi ty, kdo dęlá na hradę problémy.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //Âíkal jsem si, kdy za mnou konečnę zavítáš.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Vražda je pâesnę to poslední, co tady potâebujeme.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Potâebuji každého ze svých lidí - a teë mám o jednoho míŕ!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //A to nemluvím o tęch dalších vęcech, do kterých ses zapletl.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Nęco ti vysvętlím. Všichni jsme tady ve stejné pasti.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //A zoufale potâebuji každého ze svých mužů. Včetnę tebe.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Pokud chceš mermomocí nękoho zabít, stačí, když odejdeš z hradu. Je tam spousta skâetů.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Ukládám ti pokutu - i když mę vážnę štve, že se musím zabývat vęcmi, jako je tohle.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Šušká se, že si tu a tam pâilepšíš z vęcí, které ti neâíkají pane.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //A to nemluvím o dalších vęcech, které se ke mnę donesly.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Z toho se jen tak nevyvlíkneš. Zdá se, že nechápeš vážnost naší situace.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Budeš muset zaplatit pokutu, která by vyrovnala tvé zločiny!
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Rvačky mezi mužstvem nevidím rád.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //A to s tou ovcí bylo také zcela zbytečné.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Takže budeš muset zaplatit pokutu!
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Ty jen tak zabíjíš ovce? Patâí nám všem.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Zaplatíš mi za to maso.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Kolik?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Nemám dost penęz!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Dobrá, âeknu chlapcům, aby se uklidnili. Ale będa ti, jestli tę ještę jednou pâistihnu pâi nęčem takovém!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Nemám dost penęz!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //V tom pâípadę by sis męl nęjaké rychle sehnat.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //A varuju tę: jestli se zase do nęčeho zapleteš, tak se ta částka ještę zvýší!
	
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
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Odkud jsi pâišel? Nejsi žádný z horníků a ani žádný z mých mužů. No?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Pâišel jsem skrz průsmyk.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Skrz průsmyk...? Ty jsi vážnę prošel - u Innose!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Proč jsi tu cestu podstupoval, mágu?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Jaké jsou tvoje rozkazy, vojáku?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Vrtá mi hlavou, proč by chtęl žoldák podstupovat nęco takového. Co tady dęláš?
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
	description = "Pâicházím od lorda Hagena.";
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
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Pâicházím od lorda Hagena. Chce, abych mu donesl důkaz o pâítomnosti draků.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //A to jsi pâišel jen proto, abys jej sebral a zase zmizel?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //Pâesnę to jsem męl v plánu.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //Takže on chce důkaz? Může ho mít. Ale nemůžu tę poslat zpátky za lordem Hagenem, aniž bych mu âekl o rudę.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Poslouchej - lord Hagen se musí bezpodmínečnę dozvędęt o zdejší situaci a o tom, kolik rudy se nám podaâilo vydolovat.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //Dobrá, co chceš, abych pro tebe udęlal?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //Mám tam tâi skupiny horníků, ale ještę jsem od nich nevidęl ani zrnko.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Obejdi všechny doly a nahlas mi, kolik rudy už mají.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Pak ti napíšu dopis, který doneseš zpátky lordu Hagenovi.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Dobrá. Zdá se, že nemám na výbęr.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Ještę než mę velitel Garond pošle zpátky, chce, abych nalezl tâi skupiny kopáčů a zjistil, kolik rudy už získali.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Velitel Garond mę povęâil dalším posláním. Už pâed časem vyslal tâi oddíly kopáčů, kteâí męli pátrat po magické rudę, ale nikdo z nich se dosud nevrátil.");
	B_LogEntry (TOPIC_ScoutMine,"Musím ty ztracené oddíly najít a zjistit, kolik rudy už se jim podaâilo vytęžit.");

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
	description = "Ale proč zrovna já?";
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
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Ale proč zrovna já?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Protože víš, jak proklouznout mezi skâety. Moji chlapci by tam byli beznadęjnę ztracení.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Ty jsi mezi nimi ale už jednou prošel - to je nejlepší důkaz, že jsi pro tenhle úkol ten pravý.
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
	description = "Potâebuji nęjaké vybavení.";
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
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Potâebuji nęjaké vybavení.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Promluv si s mágem Miltenem, je tady na hradę. On bude vędęt, co by se ti mohlo hodit.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Promluv si o tom s Tandorem. Dá ti všechno, co budeš potâebovat.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor na hradę obchoduje se zbranęmi.");
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
	description = "Kolik mi dáš, když tvůj úkol splním?";
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
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Kolik mi dáš, když tvůj úkol splním?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(pohnęvanę) Nejsem zvyklý dohadovat se se žoldáky.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Dobrá, zdá se, že nemám na výbęr. Když se o to postaráš, jak je tâeba, dám ti 500 zlatých.
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
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Vezmi si tuhle mapu. Jsou na ní zakreslené dvę oblasti, ve kterých jsou doly.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Pokud bys męl ještę nęjaké dotazy, zeptej se Parcivala. Âekne ti všechno, co bys męl vędęt o hornících.
	
	B_LogEntry (TOPIC_ScoutMine,"Informace o kopáčích mohu získat od paladina Parcivala.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Zatracenę! Co se to tam dęje? To nás pâišel vyhladit samotný Beliar?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Moji muži jsou témęâ všichni mrtví a s tou trochou rudy, co máme, bychom nezastavili JEDINÉHO SKÂETA, NATOŽ CELOU ARMÁDU!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Celá výprava je odsouzená k záhubę.
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
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Co má na srdci?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Jeho lidé vydolovali dvę bedny rudy.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Hmm... dvę bedny? Nepotâebuju dvę bedny - potâebuju DVĘ STOVKY.
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Mám ti vyâídit, že potâebuje víc mužů.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Cože? To mám poslat další lidi na jistou smrt? Na to může zapomenout.
 	
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
	description = "Co se Silvestrova dolu týče...";
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
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Co se Silvestrova dolu týče...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Vidęl jsi ho? Mluvil jsi s ním?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Všichni zemâeli. Pâekvapili je důlní červi.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //A co ruda? Víš, kolik jí vytęžili?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Podaâilo se jim zachránit pár beden. Jsou v jeskyni poblíž cesty mezi hradem a dolem.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Zatracenę! Byli to vážnę dobâí chlapi - nechă se Innos slituje nad jejich dušemi.
	
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
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //A? Co hlásí? Kolik rudy pro nás má?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Čtyâi bedny. Opustil důl, aby dostal rudu do bezpečí.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Teë ty bedny hlídá v malém údolíčku za skâetími liniemi. Žádá ale o posily.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Cože? Jenom čtyâi bedny - a opustil důl? Sakra, to není dobré.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //A teë chce ještę další muže? No dobrá, pošlu mu dva chlapy.
	
	
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
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Máme dohromady deset beden rudy - a ztratili jsme dvakrát tolik dobrých mužů.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Dostaneš svůj dopis. Lord Hagen se o tom MUSÍ dozvędęt. Tohle údolí je prokleté - hnízdí tady zlo.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Velitel Garond mi dal dopis, který by męl být dostatečným důkazem. Musím jej ukázat lordu Hagenovi.");
	
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
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //No jo, dobrá. Ještę ti vlastnę dlužím nęjaké zlato. Tady je tvoje odmęna.
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
	description = "Jak to vypadá?";
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
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Jak to vypadá?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Teë už jen čekám na zprávy z posledního dolu - a doufám, že to budou dobré zprávy.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Potâebuji zprávy o tom, jak to vypadá v dalších dvou dolech. Pak se uvidí.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Męl by ses vydat hledat ty doly. Zoufale potâebuji zprávy o tom, jak to vypadá s dobýváním rudy.
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
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //Nemůžu ho propustit. Spáchal mnoho zločinů, za které musí pykat.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Můžu za nęj zaplatit jeho pokutu?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //To by možná šlo - ale rozhodnę to nebude levné. Za Gorna budu chtít 1000 zlatých.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //To je hodnę penęz.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Gorn se také musí zodpovídat za hodnę vęcí. Pâines mi ty peníze a já Gorna propustím.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Garond žádá za Gornovo propuštęní tisíc zlaăáků.");
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
	description = "Chci zaplatit za Gornovu svobodu. (Zaplatit 1000 zlaăáků)";
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
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Chtęl bych vykoupit Gorna.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Dobrá. Bęž za Geroldem a âekni mu, aă na můj rozkaz Gorna propustí.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Zaplatil jsem Garondovi. Teë se Gorn může dostat z lochu - strážce Gerold ho pustí.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //V tom pâípadę mi pâines 1000 zlatých.
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
	description = "Co budeš dęlat teë?";
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
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Co budeš dęlat teë?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Mám už všeho dost. Moje jediná nadęje jsi teë ty - a že mi lord Hagen pošle posily.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Budeme stát pevnę jako skála a modlit se k Innosovi, aby nás v této temné hodinę nenechal klesnout na mysli.
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
	description	 = 	"Co je nového?";
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
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //Co je nového?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Zatracenę. Co se tady flákáš? Potâebuju ty zatracené posily!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Dokonce i Milten opustil hrad. Ale já nepotâebuju míŕ lidí - potâebuju jich víc!
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
	description	 = 	"Jsem zpęt.";
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
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Jsem zpęt.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //No to vidím. Kde jsou ty posily?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen pâijde, jakmile vyâídí všechny nezbytné záležitosti. Hodnę se toho stalo.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //To mę nezajímá. Mę zajímají vojáci. Skâetů je čím dál tím víc a moc dlouho se už neudržíme.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Muži jsou unavení a dochází nám proviant.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Pâijelo pár dobrovolníků.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Myslíš sebe a tęch tvých pár drakobijců, co? Můžete nám sice pomoci, ale poâád vás není dost.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Myslíš ty drakobijce na dvoâe? Ti nám sice mohou pomoci, ale poâád jich není dost.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Jestli Hagen co nejdâív nepošle nęjaké muže, pak za nic neručím.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Začít");
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
	description	 = 	"A co se týče tęch draků...";
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
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond se musí zajímat o to, jak to s draky vypadá, i když působí dojmem, že ve skutečnosti mu to může být ukradené."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //Mám zprávy o dracích.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Podej hlášení.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Zabil jsem draka v bažinę na východ odsud.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Drak ve skalní pevnosti na jihu je mrtvý.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Ohnivý drak v sopce na jihu už nebude tropit žádné potíže.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Vydal jsem se do zamrzlé oblasti na západę a zlikvidoval tamního draka.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //To jsou dobré zprávy. Tady. Vezmi si nęjaké peníze na doplnęní výbavy.
		
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
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Můžeš mi dát nęjaké další informace o dracích?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Vrásky mi teë dęlají jiné vęci. Oric, můj důstojník pâes strategické vęci, ti o tom âekne víc.
		B_LogEntry (TOPIC_DRACHENJAGD,"Garondův strategický důstojník Oric by pro mę mohl mít nęjaké užitečné informace."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Provedli draci mezitím nęjaký další útok?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Naštęstí ne. Prozatím se drží zpátky.
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
	description	 = 	"Všichni draci už jsou mrtví.";
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
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Všichni draci jsou mrtví.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(nevęâícnę) Všichni? Takže zlo bylo navždy zažehnáno?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Ne, to bohužel ne. Ještę poâád zbývá jejich vůdce.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Copak nebyli draci veliteli skâetů?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Ano, to ano, ale mají svého vlastního pána. Toho se musíme také zbavit.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Zatracenę, do toho jít nemůžu. Musím hlídat rudu, a ještę navíc tu jsou poâád ti skâeti.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Budeš se o to muset postarat sám. Nemůžu ti pomoci.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Nechă tę Innos ochraŕuje.
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
	description	= 	"Máme problém s kováâem.";
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
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //Máme problém s kováâem.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Jakým kováâem? Pâed chvílí tu byl.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //On se vrátil? V tom pâípadę mu âekni...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Ne, já mluvím o Janovi.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //Je to drakobijec jako já - a je to dobrý kováâ.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Jeden z drakobijců. Je to kováâ.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //To je dobâe. Náš pâedchozí kováâ zmizel, srab jeden.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan se o kovárnu rád postará.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Aha. Takže si myslíš, že bych mu męl vęâit.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Ano.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Pokud si jsi tak jistý, můžeš se za nęj zaručit.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Jestliže bude dęlat nęjaké potíže, budeš se za to zodpovídat ty. Souhlasíš?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Budu o tom pâemýšlet.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Zaručím se za Jana.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Budu o tom pâemýšlet.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Jak mu mám vęâit já, když mu nedůvęâuješ ani ty sám?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Pokud se za toho tvého Jana nikdo nepostaví, bude muset držet ruce od výhnę dál.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Zaručím se za Jana.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Dobrá. V tom pâípadę může kovárnu používat. Samozâejmę také bude muset udęlat meče pro mé muže.
	
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
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //Jak to vypadá?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Zatracenę! Nęjaký parchant nechal hlavní bránu otevâenou. Teë je z nás krmení pro vlky.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Až dostanu toho zrádce do rukou...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Pokud Hagen nepâijde co nejdâív, pochcípáme tady jako mouchy.
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

































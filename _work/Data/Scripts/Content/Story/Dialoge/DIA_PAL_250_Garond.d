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
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Nemáme se o èem bavit, dokud nezaplatíš pokutu.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //A ta podle posledních obvinìní zase stoupla.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Zdá se, že ses zapletl do dalších potíží.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Ale doufám, že to koneènì všechno zaplatíš! Dohromady to dìlá...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Vážnì jsi mì zklamal. Tvoje pokuta je...
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
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Objevilo se pár nových skuteèností.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Z nièeho nic už nejsi obvinìný z vraždy.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nikdo si nevzpomíná, že by tì vidìl krást.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Už není nikdo, kdo by tvrdil, že tì vidìl zapleteného do nìjaké rvaèky.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Zdá se, že všechna obvinìní proti tobì byla stažena.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Netuším, o co tam šlo, ale varuju tì: nepøehánìj to!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Rozhodl jsem se zapomenout na tvé dluhy.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //A už se na hradì nezaplétej do žádných potíží!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Jedno si vyjasnìme: tak jako tak budeš muset zaplatit pokutu v plné výši.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //No, takže co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Nemám dost penìz!",DIA_Garond_PETZMASTER_PayLater);
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
	Info_AddChoice		(DIA_Garond_PMSchulden,"Nemám dost penìz!",DIA_Garond_PETZMASTER_PayLater);
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
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Takže to jsi ty, kdo dìlá na hradì problémy.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //Øíkal jsem si, kdy za mnou koneènì zavítáš.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Vražda je pøesnì to poslední, co tady potøebujeme.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Potøebuji každého ze svých lidí - a teï mám o jednoho míò!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //A to nemluvím o tìch dalších vìcech, do kterých ses zapletl.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Nìco ti vysvìtlím. Všichni jsme tady ve stejné pasti.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //A zoufale potøebuji každého ze svých mužù. Vèetnì tebe.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Pokud chceš mermomocí nìkoho zabít, staèí, když odejdeš z hradu. Je tam spousta skøetù.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Ukládám ti pokutu - i když mì vážnì štve, že se musím zabývat vìcmi, jako je tohle.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Šušká se, že si tu a tam pøilepšíš z vìcí, které ti neøíkají pane.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //A to nemluvím o dalších vìcech, které se ke mnì donesly.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Z toho se jen tak nevyvlíkneš. Zdá se, že nechápeš vážnost naší situace.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Budeš muset zaplatit pokutu, která by vyrovnala tvé zloèiny!
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Rvaèky mezi mužstvem nevidím rád.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //A to s tou ovcí bylo také zcela zbyteèné.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Takže budeš muset zaplatit pokutu!
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Ty jen tak zabíjíš ovce? Patøí nám všem.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Zaplatíš mi za to maso.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Kolik?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Nemám dost penìz!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Dobrá, øeknu chlapcùm, aby se uklidnili. Ale bìda ti, jestli tì ještì jednou pøistihnu pøi nìèem takovém!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Nemám dost penìz!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //V tom pøípadì by sis mìl nìjaké rychle sehnat.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //A varuju tì: jestli se zase do nìèeho zapleteš, tak se ta èástka ještì zvýší!
	
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
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Odkud jsi pøišel? Nejsi žádný z horníkù a ani žádný z mých mužù. No?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Pøišel jsem skrz prùsmyk.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Skrz prùsmyk...? Ty jsi vážnì prošel - u Innose!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Proè jsi tu cestu podstupoval, mágu?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Jaké jsou tvoje rozkazy, vojáku?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Vrtá mi hlavou, proè by chtìl žoldák podstupovat nìco takového. Co tady dìláš?
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
	description = "Pøicházím od lorda Hagena.";
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
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Pøicházím od lorda Hagena. Chce, abych mu donesl dùkaz o pøítomnosti drakù.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //A to jsi pøišel jen proto, abys jej sebral a zase zmizel?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //Pøesnì to jsem mìl v plánu.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //Takže on chce dùkaz? Mùže ho mít. Ale nemùžu tì poslat zpátky za lordem Hagenem, aniž bych mu øekl o rudì.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Poslouchej - lord Hagen se musí bezpodmíneènì dozvìdìt o zdejší situaci a o tom, kolik rudy se nám podaøilo vydolovat.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //Dobrá, co chceš, abych pro tebe udìlal?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //Mám tam tøi skupiny horníkù, ale ještì jsem od nich nevidìl ani zrnko.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Obejdi všechny doly a nahlas mi, kolik rudy už mají.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Pak ti napíšu dopis, který doneseš zpátky lordu Hagenovi.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Dobrá. Zdá se, že nemám na výbìr.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Ještì než mì velitel Garond pošle zpátky, chce, abych nalezl tøi skupiny kopáèù a zjistil, kolik rudy už získali.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Velitel Garond mì povìøil dalším posláním. Už pøed èasem vyslal tøi oddíly kopáèù, kteøí mìli pátrat po magické rudì, ale nikdo z nich se dosud nevrátil.");
	B_LogEntry (TOPIC_ScoutMine,"Musím ty ztracené oddíly najít a zjistit, kolik rudy už se jim podaøilo vytìžit.");

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
	description = "Ale proè zrovna já?";
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
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Ale proè zrovna já?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Protože víš, jak proklouznout mezi skøety. Moji chlapci by tam byli beznadìjnì ztracení.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Ty jsi mezi nimi ale už jednou prošel - to je nejlepší dùkaz, že jsi pro tenhle úkol ten pravý.
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
	description = "Potøebuji nìjaké vybavení.";
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
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Potøebuji nìjaké vybavení.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Promluv si s mágem Miltenem, je tady na hradì. On bude vìdìt, co by se ti mohlo hodit.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Promluv si o tom s Tandorem. Dá ti všechno, co budeš potøebovat.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor na hradì obchoduje se zbranìmi.");
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
	description = "Kolik mi dáš, když tvùj úkol splním?";
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
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Kolik mi dáš, když tvùj úkol splním?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(pohnìvanì) Nejsem zvyklý dohadovat se se žoldáky.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Dobrá, zdá se, že nemám na výbìr. Když se o to postaráš, jak je tøeba, dám ti 500 zlatých.
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
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Vezmi si tuhle mapu. Jsou na ní zakreslené dvì oblasti, ve kterých jsou doly.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Pokud bys mìl ještì nìjaké dotazy, zeptej se Parcivala. Øekne ti všechno, co bys mìl vìdìt o hornících.
	
	B_LogEntry (TOPIC_ScoutMine,"Informace o kopáèích mohu získat od paladina Parcivala.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Zatracenì! Co se to tam dìje? To nás pøišel vyhladit samotný Beliar?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Moji muži jsou témìø všichni mrtví a s tou trochou rudy, co máme, bychom nezastavili JEDINÉHO SKØETA, NATOŽ CELOU ARMÁDU!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Celá výprava je odsouzená k záhubì.
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
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Jeho lidé vydolovali dvì bedny rudy.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Hmm... dvì bedny? Nepotøebuju dvì bedny - potøebuju DVÌ STOVKY.
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Mám ti vyøídit, že potøebuje víc mužù.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Cože? To mám poslat další lidi na jistou smrt? Na to mùže zapomenout.
 	
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
	description = "Co se Silvestrova dolu týèe...";
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
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Co se Silvestrova dolu týèe...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Vidìl jsi ho? Mluvil jsi s ním?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Všichni zemøeli. Pøekvapili je dùlní èervi.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //A co ruda? Víš, kolik jí vytìžili?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Podaøilo se jim zachránit pár beden. Jsou v jeskyni poblíž cesty mezi hradem a dolem.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Zatracenì! Byli to vážnì dobøí chlapi - nech se Innos slituje nad jejich dušemi.
	
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
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Ètyøi bedny. Opustil dùl, aby dostal rudu do bezpeèí.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Teï ty bedny hlídá v malém údolíèku za skøetími liniemi. Žádá ale o posily.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Cože? Jenom ètyøi bedny - a opustil dùl? Sakra, to není dobré.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //A teï chce ještì další muže? No dobrá, pošlu mu dva chlapy.
	
	
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
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Máme dohromady deset beden rudy - a ztratili jsme dvakrát tolik dobrých mužù.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Dostaneš svùj dopis. Lord Hagen se o tom MUSÍ dozvìdìt. Tohle údolí je prokleté - hnízdí tady zlo.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Velitel Garond mi dal dopis, který by mìl být dostateèným dùkazem. Musím jej ukázat lordu Hagenovi.");
	
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
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //No jo, dobrá. Ještì ti vlastnì dlužím nìjaké zlato. Tady je tvoje odmìna.
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
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Teï už jen èekám na zprávy z posledního dolu - a doufám, že to budou dobré zprávy.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Potøebuji zprávy o tom, jak to vypadá v dalších dvou dolech. Pak se uvidí.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Mìl by ses vydat hledat ty doly. Zoufale potøebuji zprávy o tom, jak to vypadá s dobýváním rudy.
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
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //Nemùžu ho propustit. Spáchal mnoho zloèinù, za které musí pykat.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Mùžu za nìj zaplatit jeho pokutu?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //To by možná šlo - ale rozhodnì to nebude levné. Za Gorna budu chtít 1000 zlatých.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //To je hodnì penìz.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Gorn se také musí zodpovídat za hodnì vìcí. Pøines mi ty peníze a já Gorna propustím.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Garond žádá za Gornovo propuštìní tisíc zlaákù.");
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
	description = "Chci zaplatit za Gornovu svobodu. (Zaplatit 1000 zlaákù)";
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
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Chtìl bych vykoupit Gorna.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Dobrá. Bìž za Geroldem a øekni mu, a na mùj rozkaz Gorna propustí.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Zaplatil jsem Garondovi. Teï se Gorn mùže dostat z lochu - strážce Gerold ho pustí.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //V tom pøípadì mi pøines 1000 zlatých.
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
	description = "Co budeš dìlat teï?";
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
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Co budeš dìlat teï?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Mám už všeho dost. Moje jediná nadìje jsi teï ty - a že mi lord Hagen pošle posily.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Budeme stát pevnì jako skála a modlit se k Innosovi, aby nás v této temné hodinì nenechal klesnout na mysli.
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
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Zatracenì. Co se tady flákáš? Potøebuju ty zatracené posily!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Dokonce i Milten opustil hrad. Ale já nepotøebuju míò lidí - potøebuju jich víc!
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
	description	 = 	"Jsem zpìt.";
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
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Jsem zpìt.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //No to vidím. Kde jsou ty posily?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen pøijde, jakmile vyøídí všechny nezbytné záležitosti. Hodnì se toho stalo.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //To mì nezajímá. Mì zajímají vojáci. Skøetù je èím dál tím víc a moc dlouho se už neudržíme.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Muži jsou unavení a dochází nám proviant.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Pøijelo pár dobrovolníkù.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Myslíš sebe a tìch tvých pár drakobijcù, co? Mùžete nám sice pomoci, ale poøád vás není dost.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Myslíš ty drakobijce na dvoøe? Ti nám sice mohou pomoci, ale poøád jich není dost.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Jestli Hagen co nejdøív nepošle nìjaké muže, pak za nic neruèím.

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
	description	 = 	"A co se týèe tìch drakù...";
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
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond se musí zajímat o to, jak to s draky vypadá, i když pùsobí dojmem, že ve skuteènosti mu to mùže být ukradené."); 

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
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Zabil jsem draka v bažinì na východ odsud.
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
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Vydal jsem se do zamrzlé oblasti na západì a zlikvidoval tamního draka.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //To jsou dobré zprávy. Tady. Vezmi si nìjaké peníze na doplnìní výbavy.
		
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
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Mùžeš mi dát nìjaké další informace o dracích?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Vrásky mi teï dìlají jiné vìci. Oric, mùj dùstojník pøes strategické vìci, ti o tom øekne víc.
		B_LogEntry (TOPIC_DRACHENJAGD,"Garondùv strategický dùstojník Oric by pro mì mohl mít nìjaké užiteèné informace."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Provedli draci mezitím nìjaký další útok?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Naštìstí ne. Prozatím se drží zpátky.
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
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(nevìøícnì) Všichni? Takže zlo bylo navždy zažehnáno?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Ne, to bohužel ne. Ještì poøád zbývá jejich vùdce.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Copak nebyli draci veliteli skøetù?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Ano, to ano, ale mají svého vlastního pána. Toho se musíme také zbavit.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Zatracenì, do toho jít nemùžu. Musím hlídat rudu, a ještì navíc tu jsou poøád ti skøeti.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Budeš se o to muset postarat sám. Nemùžu ti pomoci.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Nech tì Innos ochraòuje.
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
	description	= 	"Máme problém s kováøem.";
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
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //Máme problém s kováøem.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Jakým kováøem? Pøed chvílí tu byl.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //On se vrátil? V tom pøípadì mu øekni...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Ne, já mluvím o Janovi.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //Je to drakobijec jako já - a je to dobrý kováø.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Jeden z drakobijcù. Je to kováø.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //To je dobøe. Náš pøedchozí kováø zmizel, srab jeden.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan se o kovárnu rád postará.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Aha. Takže si myslíš, že bych mu mìl vìøit.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Ano.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Pokud si jsi tak jistý, mùžeš se za nìj zaruèit.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Jestliže bude dìlat nìjaké potíže, budeš se za to zodpovídat ty. Souhlasíš?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Budu o tom pøemýšlet.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Zaruèím se za Jana.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Budu o tom pøemýšlet.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Jak mu mám vìøit já, když mu nedùvìøuješ ani ty sám?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Pokud se za toho tvého Jana nikdo nepostaví, bude muset držet ruce od výhnì dál.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Zaruèím se za Jana.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Dobrá. V tom pøípadì mùže kovárnu používat. Samozøejmì také bude muset udìlat meèe pro mé muže.
	
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
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Zatracenì! Nìjaký parchant nechal hlavní bránu otevøenou. Teï je z nás krmení pro vlky.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Až dostanu toho zrádce do rukou...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Pokud Hagen nepøijde co nejdøív, pochcípáme tady jako mouchy.
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

































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
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Dobâe že jsi pâišel. Můžeš hned zaplatit tu pokutu.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Nebereš zákony męsta moc vážnę, co?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //Seznam tvých prohâešků zase narostl.
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //A neâíkej mi, žes to nevędęl!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Zaplatíš maximální pokutu.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //No, zdá se, že se situace zmęnila.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Nejsou už žádní svędkové tvé vraždy!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Nikdo už nebude svędčit, že tę vidęl krást!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //Už nezbyli žádní svędci té tvé rvačky.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Všechna obvinęní proti tobę byla stažena.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //Nevím, co se tam ve męstę stalo - a ani to vędęt nechci.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Dávej si prostę pozor, aby ses tady nedostal do problémů.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //Tak nebo tak, rozhodl jsem se prominout ti tvé dluhy.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Dej si pozor, aă se nedostaneš do žádných dalších nesnází.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Nakonec stejnę zaplatíš všechny své závazky v plné výši.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Tak co, chceš zaplatit?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Nemám dost penęz!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Kolik že to bylo?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Kolik že to bylo?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Nemám dost penęz!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Kolik že to bylo?",DIA_Hagen_PMSchulden_HowMuchAgain);
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
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Tvá povęst tę pâedchází. Porušil jsi zákony męsta.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Dostal ses do pękné šlamastyky.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //Vražda je vážný zločin!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Nemluvę o tvých dalších prohâešcích.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Stráže mají pâíkazy na místę popravit každého vraha.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //Vražda je v tomto męstę nepâípustná. Můžeš však dát svou lítost najevo zaplacením pokuty.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Jsi obvinęn z krádeže!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Nemluvę o dalších vęcech, které se ke mnę donesly.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //To je porušení męstských zákonů. Za to zaplatíš.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Zapletl ses do rvačky. Tím pádem jsi porušil zákon.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //A co to bylo s tou ovcí?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Porušení zákonů męsta je porušením zákonů samotného Innose.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Budeš za to muset zaplatit.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Zasedl sis na naše ovce - poprvé jsem tomu ani nechtęl vęâit.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Proč se musím poâád zaobírat takovými prkotinami?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Budeš muset zaplatit náhradu škody!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Kolik?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"Nemám dost penęz!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //Dobrá! Dohlédnu na to, aby se o tom dozvędęl každý ve męstę - to ti alespoŕ částečnę vylepší reputaci.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //Nemám dost penęz!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Tak si nęjaké co nejrychleji sežeŕ.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //A varuji tę: jestli se proviníš ještę nęčím, jen si to zhoršíš.
	
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
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //Už jsem o tobę slyšel.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar mi oznámil, že prý se mnou chceš mluvit.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Jsi ten cizinec, který se dožaduje Innosova oka.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Jsem lord Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Královský paladin, válečník našeho Pána Innose a nejvyšší velitel Khorinidu.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //Mám spoustu práce. Takže neplýtvej mým časem - a radęji mi âekni, proč tu jsi.
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
	description	 =  "Pâináším návrh pâímęâí od žoldnéâů!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //Pâináším návrh pâímęâí od žoldnéâů!
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //(nevrle) Hm - ukaž!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Generála Leeho znám. Vím také o okolnostech, za jakých byl odsouzen k nuceným pracem v kolonii.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Považuji ho za čestného muže. Jsem ochoten mu jeho prohâešky odpustit - ale jenom jemu!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //To se netýká jeho mužů. Vętšina z nich jsou hanební hrdloâezové a svůj trest si plnę zasluhují!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Jim rozhodnę nic neprominu. Můžeš jim to oznámit.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //Je to všechno?
	};
	B_LogEntry (Topic_Frieden,"Lord Hagen je ochoten zprostit viny Leeho, ale nikoliv ostatní žoldnéâe."); 
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
	description	 =  "Nedaleko se shromažëují zástupy zlých stvůr. V Hornickém údolí.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Nedaleko se shromažëují zástupy zlých stvůr. V Hornickém údolí.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //V Hornickém údolí? Vyslali jsme tam výpravu. Neustále nám docházejí zprávy o tom, že průsmyk okupují skâeti.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Ale o armádę zla se ke mnę ještę nic nedoneslo.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //Není to jen nęjaký ubohý trik, který mę má pâesvędčit o nezbytnosti spojit síly se žoldnéâi?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //Ne.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //(skepticky) Co to má být za armádu?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Armáda draků, která kolem sebe shromáždila zástupy pâisluhovačů.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Draci? Podle starých spisů to už je nękolik století, co nękdo naposledy vidęl draka.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Povęz - proč bych męl vęâit jedinému tvému slovu?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //Jenomže otázka není, jestli mi můžeš vęâit. Otázka je, jestli si můžeš dovolit mi NEVĘÂIT v pâípadę, že mluvím pravdu.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Dokud nebudu mít důkaz, nemohu tam vyslat více mužů.
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
	description	 =  "Takže chceš, abych ti pâinesl nęjaký důkaz?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //Takže chceš, abych ti pâinesl nęjaký důkaz?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Pâesnę tak. Projdi průsmykem a dostaŕ se do Hornického údolí. Až tam budeš, najdi mou výpravu - a až se ti to podaâí, promluv si s velitelem Garondem.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Pokud nękdo ví, jaká tam panuje situace, tak je to on.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Jestli tvoje slova potvrdí, jsem pâipraven ti pomoci.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Znamená to, že mi pak dáš Innosovo oko?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //Innosovo oko... dobrá. Pâines mi důkaz a já pak dohlédnu na to, abys smęl nosit ten amulet.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //Mám tedy v tomto ohledu tvoje slovo?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Samozâejmę - máš ho mít.
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
	description	 =  "Co víš o Innosovu oku?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //Co víš o Innosovu oku?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //Je to posvátný artefakt. (zadumanę) Ve starých proroctvích se âíká, že je nęjak spojen s draky.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //V tęchto spisech je ale také zmínka o tom, že jej může nosit jen Innosův vyvolený.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //JÁ jsem Innosův vyvolený!
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Potom možná budeš moci ten amulet nosit.
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
	description	 =  "Jak se mám dostat pâes ten průsmyk?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Jak se mám dostat pâes ten průsmyk?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Dám ti klíč od vrat v průsmyku. Budeš si ale muset najít způsob, jak proklouznout mezi vojskem skâetů.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Nechă tę Innos ochraŕuje.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Lord Hagen chce, abych mu o armádách zla pâinesl nęjaký důkaz. Musím se vydat do Hornického údolí a promluvit si tam s velitelem Garondem.");
	
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

	description	= "Hledám kovový ornament.";
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
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Hledám kovový ornament. Męl by být nękde u kamenného kruhu u Lobartova statku.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Jestli myslíš tohleto, tak to jsme považovali za magickou runu, ale pak jsme zjistili, že je to úplnę k ničemu.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //Klidnę si to vem, mnę to k ničemu není.
	
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
	description	 =  "Proč jste pâišli do Khorinidu?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //Proč jste pâišli do Khorinidu?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Plníme důležitý úkol ve prospęch království. Naše rozkazy pocházejí pâímo od krále Rhobara.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //Âekl jsem ti, že jsme poslali výpravu do Hornického údolí. Proto tu jsme.
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
	description	 =  "Co dęlají vaši muži v Hornickém údolí?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //Co dęlají vaši muži v Hornickém údolí?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Nevidím důvod, proč bych ti męl nęco takového âíkat!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //Byl jsi tam. Męl bys to vędęt.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //Dobrá, protože tam máš tak jako tak namíâeno, tak ti to můžu âíct.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //Jde o magickou rudu. Může rozhodnout o výsledku války.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Bez dostatku zbraní ukutých z magické rudy nemá královská armáda ani tu nejmenší šanci obstát v boji proti elitním skâetím válečníkům.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //A doly tady na ostrovę jsou poslední, ke kterým ještę máme pâístup.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Jakmile naši loë plnę naložíme rudou, vrátíme se zpátky na pevninu.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //Válka se skâety se tedy nevyvíjí moc dobâe, co?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //Už tak jsem toho âekl víc, než je zdrávo.
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
	description	 = 	"Hledám mistra meče.";
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
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Hledám mistra meče.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //Vážnę? Jednoho jsi právę našel.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Lord Hagen mę zasvętí do tajů boje s obouručními zbranęmi.");
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
	description = "Tak začnęme (osvojit si dovednost obouručního boje).";
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
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //Začnęme.
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Teë jsi sám dobrým mistrem meče. Už tę nemohu dál učit.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Nechă tvé další skutky provází moudrost mistra meče.
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
	description	 = 	"Chtęl bych vstoupit do služby âádu.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Chtęl bych vstoupit do služby âádu.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Dobrá, už jsi dokázal, že máš dost odvahy, schopností a zkušeností, abys mohl sloužit Innosovi.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Tvé skutky jsou dostatečným důkazem čistého srdce.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Je-li to tvé pâání, vítám tę v našem âádu.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Ještę si nejsem tak úplnę jistý.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Jsem pâipraven!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Být Innosovým válečníkem znamená zasvętit všechny své činy Innosovým zámęrům.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //Do âádu jsou pâijati jen nejčestnęjší a nejstatečnęjší válečníci.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Pokud jsi pevnę rozhodnut stát se paladinem, musíš nejprve prokázat, že jsi toho hoden.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Ještę si nejsem tak úplnę jistý.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Tak jdi a očisti své srdce od pochybností. Vraă se, až budeš pâipraven.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Jsem pâipraven!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //(vážnę) Tak budiž dle tvé vůle!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //(vážnę) Mnoho mužů se vydalo touto cestou a položili své životy ve jménu Innose.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //(vážnę) Pâísaháš, že tvé skutky budou dęlat jejich smrti čest a budou hlásat slávu Innosovu?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //Pâísahám!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Od této chvíle tę tedy prohlašuji členem našeho společenstva.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Zároveŕ tę ustanovuji Innosovým válečníkem.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Dávám ti zbranę a zbroj rytíâe. Nos je s hrdostí, rytíâi!

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

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //Dále, na základę tvé hodnosti, ti dovoluji pâístup do kláštera.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Albrecht tę naučí naší magii, stačí, když za ním zajdeš a promluvíš si s ním.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //A jsou ti samozâejmę otevâeny naše ubikace na horním konci męsta.

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
	description	 = 	"Jak mohu dokázat, že jsem toho hoden?";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Jak mohu dokázat, že jsem toho hoden?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //To prokáží tvé skutky.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //Bojujeme v Innosovu jménu za svobodu a spravedlnost.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Bojujeme proti Beliarovi a jeho pohůnkům, kteâí chtęjí zničit Innosův âád.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Rozumím.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //Vůbec ničemu nerozumíš! Naše čest je náš život a náš život je Innos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Každý paladin, jenž se spravedlivę bije, šíâí dál slávu Innose a mnozí z nás již položili život na oltáâ vęčného boje dobra a zla.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //My všichni ctíme tuto tradici. Pokud selžeme, pošpiníme skutky našich padlých druhů.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Jen ten, kdo tohle beze zbytku pochopí, je hoden stát se paladinem.
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
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Jak to vypadá?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Musím najít způsob, jak tuhle výpravu zachránit.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Musíme s tęmi draky nęco udęlat.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //(k sobę) Možná by nás teë mohlo zachránit Innosovo oko.
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Asi jsem pâišel o rozum. Jsem voják, ne byrokrat.
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //S tímhle vším papírováním, které mám na krku, si sotva dokážu vzpomenout, jaké to je tâímat meč.
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
	description = "Já Oko mám - ale je rozbité.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //Já Oko mám - ale je rozbité.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //COŽE? U Innose! Cos to udęlal? To Oko potâebujeme!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Promluv si s Pyrokarem! Musí existovat nęjaký způsob, jak jej zase opravit.
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
	description	 = 	"Pâináším ti zprávu od Garonda.";
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
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Pâináším novinky od Garonda. Dal mi pro tebe tenhle dopis.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //Naše postavení je horší, než jsem se obával. Ale podej mi hlášení o situaci v Hornickém údolí.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Paladinové jsou obklíčeni na hradę v Hornickém údolí, všude kolem jsou skâeti.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Pâi dolování byly obrovské ztráty a skoro žádná ruda už nezbývá.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //No, pokud můžu âíct svůj názor, tak když tęm chlapíkům nikdo nepomůže, jsou ztraceni. Tak to alespoŕ vypadá.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Najdu způsob, jak tu výpravu zachránit. Udęlal jsi toho pro nás tolik. Innos se ti odvdęčí.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Nechci jeho vdęčnost. Chci jeho oko.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Ano, samozâejmę. Plním své sliby. Vezmi si tenhle dopis. Otevâe ti brány kláštera.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Promluv si s Pyrokarem, nejvyšším ohnivým mágem, a prokaž se mu touhle listinou. Zaâídí ti pâístup k Innosovu oku.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //A ještę nęco, než půjdeš.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //Na důkaz mé vdęčnosti si vezmi tuhle runu. Pâenese tę bezpečnę zpátky do męsta, kdykoliv si zamaneš.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Lord Hagen mi pâedal zprávu, která pâimęje mistra Pyrokara, aby mi v klášteâe vydal Innosovo oko.");

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
	description	 = 	"Potâeboval bych si s tebou promluvit o Bennetovi.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Potâeboval bych si s tebou promluvit o Bennetovi.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Ale to je pâece ten žoldák, co zavraždil jednoho z mých mužů.
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Jak si můžeš být tak jistý, že je vrahem právę Bennet?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Vęâím, že je Bennet nevinný.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Bennet by nám mohl pomoci opravit Innosovo oko.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Bennet by nám mohl pomoci opravit Innosovo oko.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //I kdyby dokázal pâitáhnout na zem moc samotného Innose...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //Zavraždil paladina. Za to bude popraven!
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Jak si můžeš být tak jistý, že je vrahem právę Bennet?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //Máme svędka.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Jak vidíš, není o vinę toho žoldáka žádných pochyb.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Kdo je tím svędkem?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, tajemník místodržícího. On tu vraždu vidęl.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Jeho popis padne bez jakýchkoliv pochyb na Benneta. Co se mę týče, vęc je vyâízena.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Ten žoldák bude viset za velezradu.

	B_LogEntry (TOPIC_RESCUEBENNET,"Svędkem je tajemník místodržícího, Cornelius. Tvrdí, že celou vraždu vidęl."); 

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
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //Vęâím, že Bennet je nevinný.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Důkazy jsou jasné. Je vinen.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //A co když je důkaz mylný?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Dávej pozor, co âíkáš. Vznášíš vážné obvinęní.
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Pokud mi nemůžeš pâedložit důkazy o tom, že svędek lhal, radęji mlč.
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
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Jak to víš?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Mám jeho deník. Je v nęm všechno.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //(zuâivę) Ten slizký bastard!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //Pod vahou nových důkazů mi nic jiného nezbývá.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //Z moci úâadu svęâeného mi králem a církví prohlašuji...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...že vęzeŕ Bennet je zbaven všech obvinęní a tudíž svobodný človęk.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Cornelius bude s okamžitou platností vzat do vazby pro kâivopâísežnictví.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Ušetâi si námahu. Cornelius je mrtvý.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //V tom pâípadę se mu již dostalo spravedlivého trestu. Dobrá práce.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Ukrývá se.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Dâíve nebo pozdęji se objeví. Pak ho zatkneme.
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
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Tvé skutky jsou ke cti nás všech.
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
	description	 = 	"Pâináším Oko!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //Pâináším Oko!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //(uctivę) Neseš Oko!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //A dal jsi jej zpęt dohromady!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //V tom pâípadę jsi Innosův vyvolený!
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Vyrazím na cestu a zabiju všechny draky v Hornickém údolí!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //Nechă tę Innos doprovází a svou mocí zničí zlo!
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

	description	 = 	"Na zemi útočí elitní skâetí válečníci.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Na zemi útočí elitní skâetí válečníci.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Zpravil jsem lorda Hagena o postupujících tlupách skâetích nájezdníků."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Co tę k tomu vede?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //Mluvil jsem s jedním z nich. Padlo tvoje jméno.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Nesmysl. Moji lidé zatím žádnou masivní invazi skâetů nehlásili.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Možná se v nedalekých lesích ztratil nękterý z jejich zvędů.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //Nebyli to žádní zvędové. Jednomu z nich jsem vzal tento prsten.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Ukaž mi ho.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Hmm. Tak to je docela znepokojivé.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //Tohle je znamení jejich moci. Takže skâeti opustili své palisády a bojují na otevâeném prostranství.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Zatím jsem jich moc nevidęl. Hlavnę jejich velitele a jen pár bojovníků.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //Vážnę? V tom pâípadę musejí mít za lubem nęco jiného. To mi ke skâetům moc nesedne, že by jejich vůdci sami opustili své ochranné palisády.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Mohla by to však být ideální pâíležitost, jak jim uštędâit citelný úder.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Pokud by pâišli o své velitele, spadne jim morálka na bod mrazu.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //Máš nový úkol, rytíâi. Zabij všechny skâetí velitele, které v téhle oblasti najdeš.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Pâines mi jejich prsteny. To by mohlo skâety srazit na kolena.
			
			B_LogEntry (TOPIC_OrcElite,"Podaâilo se mi pâinést lordu Hagenovi důkaz - prsten skâetího vojevůdce. Požádal mę, abych mu pâinesl všechny, které najdu."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Poraë se s Ingmarem. Může ti prozradit pár taktik, které by se ti pâi bojích se skâetími veliteli mohly hodit.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Skâetí elitní bojovníci jsou jeho specialita. Męl s nimi často co do činęní.
			B_LogEntry (TOPIC_OrcElite,"Elitní skâetí válečníci jsou Ingmarovou specialitou."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //Tvoje pouhé tvrzení, že jsi zabil jednoho ze skâetích velitelů, mi nestačí.
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Pokud to nemám brát na lehkou váhu, potâebuji nęjaký hmatatelnęjší důkaz.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen mi poâád nechce vęâit. Žádá důkaz, že elitní válečníci skutečnę útočí na civilizované kraje. No, spíš by mę pâekvapilo, kdyby to bylo naopak."); 
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

	description	 = 	"Je tady ještę jedna vęc, kterou musím ohlednę tęch skâetích velitelů nahlásit.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Je tady ještę jedna vęc, kterou musím ohlednę tęch skâetích velitelů nahlásit.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //Tak povídej.

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld für einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //Mám pro tebe další skâetí prsten.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //Mám pro tebe další skâetí prsteny.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Jsem na tebe hrdý. Jen tak dál!

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //Možná tam ještę nękde nęjaký je.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Brzy je srazíme na kolena.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Vážnę by mę pâekvapilo, kdyby se jich tu potulovalo o mnoho víc.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Jejich prsteny mi samozâejmę můžeš nosit i nadále, ale myslím, že skâeti už náš vzkaz pochopili.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Počkej. Tady máš nęjaké zlato na své vybavení.

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
	description = "Draci jsou mrtví.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Draci jsou mrtví.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //Vędęl jsem, že ti Innos dá sílu porazit draky!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Kde je ruda?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Skâeti ještę poâád obléhají hrad v Hornickém údolí. Garond nemá žádnou šanci opevnęní opustit, dokud obléhání neskončí.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //(zuâivę) Zatracenę!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Jestliže Garond nedokáže tu situaci zvládnout, budu se o to muset postarat sám.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //Pár skâetů mę nezastaví! Mę ne!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //Už jsem informoval své muže. Jsme pâipraveni k odjezdu.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Pojedeme VŠICHNI. Nechám na lodi jen nezbytnou posádku.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //To by męlo stačit na to, abychom s tęmi skâety konečnę zametli!

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
	description = "Potâebuji loë.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Potâebuji loë.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //To hodnę lidí, vojáku.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //(zasmęje se) To slyším skoro každý den, ctihodnosti. Ale...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Nemáš dokonce ani kapitána, o posádce nemluvę.
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //Co ta loë v pâístavu?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Ta je moje a moje také zůstane. Až nadejde čas, odvezeme s ní rudu.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Ale až to bude za námi, můžeš se mę zeptat znovu.
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
	description = "Skâeti vtrhli do hradu v Hornickém údolí!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Skâeti vtrhli do hradu v Hornickém údolí!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //U Innose! Co pâesnę se tam stalo?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //Nęjak se musela otevâít brána.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //Nęjak?! Jak by to bylo možné... Na hradę musí být zrádce!
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
	description = "Na co čekáš?";
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
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //Na co čekáš?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Čekáme na výstroj a proviant. Pak vyrazíme!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Teë, když jsou na hradę skâeti, potâebujeme proviantu ještę víc než pâedtím.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //To ale náš odchod o moc nezdrží.
	};
};

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
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Hm. Dobře že jsi přišel.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Co se stalo?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Tohle jsem našel ve staré kapli.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //Je to magická runa. Myslím, že tě teleportuje rovnou na farmu.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Napadlo mě, že by se ti mohla hodit.
	
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
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Přišel jsi dát Onarovi peníze?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Už jsem ti říkal, že se nemáš snažit o žádné hlouposti.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar zjistil, že sis zase stihl vylepšit záznamy.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Bude teda po tobě chtít taky víc peněz.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //Kolik?
			
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
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Myslel jsem si o tobě, že jsi chytřejší.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //V tom případě pro tebe mám dobré zprávy.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Už není nikdo, kdo by tvrdil, že tě viděl spáchat vraždu.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nikdo už nebude svědčit, že tě viděl krást.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Už není nikdo, kdo by VIDĚL, jak jsi zmlátil jednoho z farmářů.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Vypadá to, že se všechna obvinění proti tobě rozplynula jako pára nad hrncem.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //I takhle je možné se vypořádávat s problémy.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Tak nebo tak, platit už nemusíš.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Příště si ale dávej pozor.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Jedno je jisté: tak jako tak musíš zaplatit pokutu v plné výši.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //No, takže co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Nemám dost peněz!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Kolik že to bylo?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Kolik že to bylo?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Nemám dost peněz!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Kolik že to bylo?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
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
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Kýho čerta - (překvapeně) - to jsi TY, ten nováček, co jde z jednoho maléru do druhého?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Slyšel jsem do Gorna, že jsi pořád naživu, ale že přijdeš sem... no...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Dobře že jsi za mnou přišel, než to začalo být pro tebe ještě horší.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Žoldáci jsou tvrdí hoši a farmáři také nejsou žádná ořezávátka, ale chodit po okolí a zabíjet na potkání? To prostě nejde.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //A to nemluvím o dalších potížích, do kterých ses dostal.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Můžu ti pomoct dostat se z téhle šlamastyky s čistým štítem.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Ale bude tě to něco stát. Onar je pořádný lakomec, ale pokud se má na celou věc zapomenout, musí to být ON, kdo přimhouří oko.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Dobře že jsi přišel. Slyšel jsem, že jsi prý něco ukradl.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //A mlátil farmáře hlava nehlava.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //A KROMĚ TOHO ještě zabil pár ovcí.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //To tady prostě dělat nemůžeš. V takových případech Onar požaduje, abych s viníkem zúčtoval.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //To znamená, že ty zaplatíš a kapsu si namastí on. Na celou věc se tak ale zapomene.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Když se zapleteš do souboje s některým ze žoldnéřů, je to něco jiného.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Ale když zmlátíš farmáře, poběží rovnou za Onarem. A ode mě se bude očekávat, že nějak zakročím.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Nemluvě o tom, že je docela háklivý na to, když mu někdo zabíjí ovce.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Budeš muset zaplatit pokutu. Onar si pokaždé shrábne peníze do vlastní kapsy - ale jinak ta věc urovnat nejde.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar ode mě očekává, že budu chránit jeho farmu. A to zahrnuje i jeho ovce.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Budeš mu muset zaplatit odškodné!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Kolik?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Nemám dost peněz!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Dobrá! Dohlédnu na to, aby Onar své peníze dostal. Můžeš považovat celou věc za vyřízenou.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Nemám dost peněz!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //V tom případě si je co nejrychleji sežeň.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Ale nemysli si, že je můžeš ukrást tady na farmě. Kdyby tě chytili, bylo by to pro tebe ještě horší.
	
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
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Kýho čerta - (překvapeně) - Co tady děláš? Myslel jsem, že jsi mrtvý!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Proč si to myslíš?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn mi řekl, žes to byl ty, kdo strhnul bariéru.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Ano, byl jsem to já.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Nikdy bych neřekl, že někdo může něco takového přežít. Co tě sem přivádí? Nejsi tu jen tak pro nic za nic.
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
	description = "Musím nutně hovořit s paladiny ve městě...";
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
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Potřebuju si nutně promluvit s paladiny z města. Můžeš mi pomoci nějak se k nim dostat?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(nedůvěřivě) Co kuješ s paladiny?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //To je dlouhý příběh...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Já mám čas.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(povzdychneš si) Posílá mě Xardas. Chce, abych získal mocný amulet, Innosovo oko.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Takže pořád ještě držíš s tím nekromantem. Aha. A ten amulet mají paladinové?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //Pokud vím, tak ano.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Můžu ti pomoct dostat se k paladinům. Ale nejdřív se musíš stát jedním z nás.
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
	description = "Jak mi můžeš pomoct dostat se k paladinům?";
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
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //Jak mi můžeš pomoct dostat se k paladinům?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Věř mi. Mám plán. Myslím, že jsi na to ten pravý.
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Já tě dostanu k paladinům a ty mi na oplátku prokážeš jednu službičku. Nejdřív ale vstup do našich řad!
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
	description = "Co přesně tady děláte?";
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
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Co přesně tady děláte?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Je to prosté: postarám se o to, abychom se všichni dostali z tohohle ostrova pryč.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar si nás najal, abychom chránili jeho farmu, a přesně to budeme dělat.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Ale naší odměnou bude víc než jen náš žold. Tím, že pomáháme farmářům, jsme městu přerušili zásobování.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //A čím míň toho budou mít paladinové k jídlu, tím dříve budou ochotni naslouchat, až k nim přijdu s nabídkou k příměří.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Škoda že ses ze všech možných lidí spolčil zrovna s nimi.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //Jak bude ta tvoje nabídka vypadat?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //V zásadě se bude jednat o naši milost a volný průchod na pevninu. Víc se dozvíš, až přijde čas.
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
	description = "Rád bych se k vám přidal!";
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
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Rád bych se k vám přidal!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Doufal jsem, že to řekneš! Každá ruka je tady dobrá.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Ty žoldáci, co jsem najal posledně, dělali jenom trable!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //V zásadě můžeš začít okamžitě. No, ještě tady je pár věcí, kterými musíš projít, ale není to nic zvláštního.
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
	description = "Čím musím 'projít', než se k vám budu moci přidat?";
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
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Čím musím 'projít', než se k vám budu moci přidat?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Zaměstnává nás Onar, zdejší statkář. Můžeš na farmě zůstat, jen když to on schválí.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //A pak tady jsou naši hoši. Mohu tě přijmout jen v případě, že s tím bude souhlasit většina žoldáků.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Ale nechoď za Onarem, dokud to nebude jisté. Je to velmi popudlivý chlapík.
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Mám-li být přijat mezi žoldnéře, musí mi můj vstup do jejich řad nejdříve schválit Onar.");
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
	description = "Jak mám žoldnéře přesvědčit, aby mě přijali?";
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
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Jak mám žoldnéře přesvědčit, aby mě přijali?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Řekl bych, že tím, že se budeš chovat jako žoldnéř.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Promluv si s Torlofem. Většinou postává venku před domem. Ozkouší si tě.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Pokud tou zkouškou projdeš, měl by sis vysloužit velkou část potřebného respektu.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Řekne ti všechno ostatní, co bys měl vědět.
	
	B_LogEntry (TOPIC_BecomeSLD,"Aby mě žoldnéři přijali mezi sebe, musím podstoupit zkoušku, kterou mi zadá Torlof, a vysloužit si respekt ostatních.");
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

	description	 = 	"Co víš o 'kruhu vody'?";
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
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Co je ti známo o kruhu vody?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(směje se) To jsem měl vědět. Ty prostě musíš strkat nos do všeho, co?
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //No tak, řekni mi to.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Jsem do toho zapletenej jenom trochu. Vím, že ten tajnej cech existuje a že za ním stojí mágové vody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Od pádu bariéry už mě ale k vodním mágům nepoutá žádná smlouva jako tenkrát.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Samozřejmě že pomůžu, když to půjde. Ale mám tu dost vlastních problémů a na ostatní věci nemám moc čas.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Jestli se o tom spolku chceš dozvědět víc, promluv si s Cordem. Co já vím, tak patří k nim.
		
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
	description = "Jsem připraven se k vám přidat!";
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
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Jsem připraven se k vám přidat!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Ne, dokud neprojdeš Torlofovou zkouškou.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Tak co, prošel jsi Torlofovou zkouškou?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Ano.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //To je dobře.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Co říkají ostatní žoldnéři?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Nevím, jestli jich mám na své straně dostatek.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //V tom případě si promluv s Torlofem, ten ví o všem, co se tady na farmě šušká.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //Většina z nich stojí za mnou.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Dobrá, v tom případě běž za Onarem. Už jsem s ním o tom mluvil.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Žold si ale musíš vysmlouvat sám.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Teď už potřebuji pouze Onarův souhlas.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Byl jsi za Onarem?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Souhlasil.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //Vítej na palubě, chlapče!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Tady, nejdřív si vezmi nějaké pořádné brnění!
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
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Jsem rád, že jsi mezi námi.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Hned pro tebe mám první úkol.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Má to co do činění s paladiny. Je načase, aby ses za nimi vypravil.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //Stejně jsi měl v plánu tam jít.
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
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Vidím, že ses dal do služby paladinů.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Vstoupil jsi do kláštera? (směje se) Čekal bych všechno, ale tohle ne.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //No, teď už se žoldnéřem stát nemůžeš.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Ale kdo ví, možná bys pro mě mohl jednu nebo dvě věci udělat - nebo já pro tebe.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Uvidíme. Tak nebo tak, přeji ti jen to nejlepší.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Ale nesnaž se mi věšet bulíky na nos, rozumíš?
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
	description = "Jak se teď mohu dostat k paladinům?";
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
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Jak se teď mohu dostat k paladinům?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //Jednoduše. Doneseš jim naši nabídku příměří.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Lorda Hagena, velitele paladinů, znám z dob své služby v královské armádě.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Vím, jakým způsobem přemýšlí - nemá dostatek mužů. Tu nabídku přijme. Přinejmenším tě vyslechne.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Napsal jsem dopis - tady je.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //To by mělo každopádně stačit, aby tě pustili k veliteli paladinů.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee mě posílá, abych lordu Hagenovi předal dar na usmířenou. Tak se mohu dostat mezi paladiny.");
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
	description = "Donesl jsem lordu Hagenovi tvoji nabídku k míru.";
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
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Donesl jsem lordu Hagenovi tvoji nabídku příměří.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //Co říkal?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Řekl, že tobě může zajistit prominutí tvých činů, ale tvým lidem ne.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Ten paličatý blázen. Většina mužů v KRÁLOVSKÉ armádě jsou větší hrdlořezové než moji chlapi.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Co budeš dělat dál?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Musím najít jiný způsob, jak nás odsud dostat. Pokud to bude nutné, ukradneme loď. Budu si to muset promyslet.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Že bych sám vytáhl krk z oprátky a opustil své lidi, to vůbec nepřipadá v úvahu.

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
	description = "Proč tak strašně chceš na pevninu?";
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
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Proč tak strašně chceš na pevninu?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Jak víš, sloužil jsem králi jako generál.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Ale jeho patolízalové mě zradili, protože jsem věděl něco, co jsem vědět neměl.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Vrazili mě do té těžařské kolonie a král to nechal být.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //Měl jsem dost času, abych si to nechal projít hlavou.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Musím se pomstít.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(ohromeně) Králi?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(rozhodně) Králi! A všem jeho pochlebníkům. Budou trpce litovat, co mi udělali.
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
	description = "Vydám se do Hornického údolí.";
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
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Vydám se do Hornického údolí.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Nemyslel jsem si, že bys zůstal tady na farmě nějak dlouho.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Jestli půjdeš zpátky do kolonie, zkus najít Gorna. Paladinové ho drží jako vězně.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn je dobrý chlapík a mně by se tady hodil, takže kdybys měl šanci ho osvobodit, tak vůbec neváhej.
	
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
	description = "Osvobodil jsem Gorna.";
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
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Osvobodil jsem Gorna.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Ano, už mi to řekl. Dobrá práce.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Stojí za víc než Sylvio a jeho chlapci dohromady.
	
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
	description = "Gorn ti o mně řekl? Co se mu stalo?";
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
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Gorn ti o mně řekl?? Co se mu stalo?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Pamatuješ si ho, že?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Nech mě hádat...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Jasně.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Jasně.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Chytili ho paladinové a poslali ho s kolonou trestanců zpátky do Hornického údolí.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Kdyby nebyla cesta do Hornického údolí plná paladinů a skřetů, dávno bych tam poslal pár svých hochů, aby ho osvobodili.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Ale protože to vypadá tak, jako to vypadá, nemělo by to smysl. Chudák.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Nech mě hádat.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Velký, tmavý, sprostý, s velkou sekerou - tenkrát v kolonii spolu s tebou dobyl zpátky náš rudný důl.
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
	description = "Onar teď má díky Bullcovi o pár ovcí míň...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Onar teď má díky Bullcovi o pár ovcí míň.
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Ale no tak, nechoď za mnou s takovými kravinami! Už takhle mám starostí nad hlavu.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Já taky. Zdá se, že Bullco má problémy se mnou. Chce, abych opustil farmu.
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //No a? Stůj si na svém.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Mohl bys mu říct, aby se držel na uzdě, jinak mu ty ovce strhnu ze žoldu.
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
	description = "Přicházím z Hornického údolí...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Vrátil jsem se z Hornického údolí. Na hrad zaútočili draci!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //Takže to je pravda! Lares říkal, že po městě kolují zprávy o dracích. Nemůžu tomu uvěřit...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Co paladinové?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Jsou úplně zdecimovaní.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //Výborně! Možná by lord Hagen mohl znovu zvážit mou nabídku.
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //A jestli ne... (ostře) Pak najdeme jiný způsob, jak se odsud dostat.
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Výborně! Možná to lorda Hagena donutí přesunout se do Hornického údolí se zbytkem svých mužů.
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Čím míň paladinů tady zůstane, tím lépe.
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
	description = "Co takhle nějaké lepší brnění?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Co takhle nějaké lepší brnění?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Splnil jsi svůj úkol.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Mám tady pro tebe nějaké lepší brnění. Tedy pokud máš hotovost.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof dostal od Onara úkol, o který se měl už před časem postarat.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Takže to nejdřív zařiď - pak si můžeme promluvit o lepším brnění!
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
	description = "Koupit si středně těžkou žoldnéřskou zbroj. Ochrana: zbraně 45, šípy 45, cena 500 zlaťáků.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Dej mi to brnění.
	
	if (B_GiveInvItems (other, self, itmi_gold, 500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Tady je. Vážně dobrá zbroj.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Ale není to žádný dárek! Nejdřív chci vidět zlato!
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
	description = "Neměl bys pro mě nějakou lepší zbroj?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Neměl bys pro mě nějakou lepší zbroj?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Samozřejmě.
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
	description = "Koupit těžkou žoldnéřskou zbroj. Ochrana: zbraně 60, šípy 60, cena: 1000 zlaťáků.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Dej mi to těžké brnění.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Tady je. Velice dobrá zbroj. Je stejná, jakou mám i já.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Víš, jak to chodí. Nejdřív peníze!
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
	description = "Nemáš pro mě nic dalšího na práci?";
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
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Nemáš pro mě nic dalšího na práci?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Nikdy nemáš dost, co? Už takhle máš problémů až až. Co dalšího bys ještě chtěl?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Další úkol. Jsem žoldák, zapomněls?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //Dobrá. Něco by tu bylo. Je to přesně pro tebe.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Musím u jednoho soudce z města vyrovnat dluh. Rád bych to samozřejmě vyřídil osobně.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Ale paladinové mě k jeho domu nepustí na vzdálenost, co bys kamenem dohodil.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Celou záležitost musíš provést opatrně. Takže dávej pozor. Půjdeš za soudcem a nabídneš mu svoje služby.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Pokus se získat jeho důvěru a dělej pro něj špinavou práci, dokud na něj něco nenajdeš.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Ta svině už udělala tolik prasáren, že se ten smrad line až k nebesům.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Přines mi něco, s čím bych mohl jeho jméno pošpinit před domobranou. Zbytek života bude hnít v base.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Rozhodně ale nechci, abys ho zabil. To by bylo příliš rychlé. Chci, aby trpěl. Rozumíš?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //Myslíš, že to zvládneš?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee chce, abych našel nějaký inkriminující důkaz proti khorinidskému soudci. Mám mu proto nabídnout své služby a přitom mít oči na stopkách."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Nic takového neudělám.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Bez problémů. Kolik?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Bez problémů. Kolik?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Tvoje odměna závisí na tom, co mi doneseš. Takže se snaž.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Tohle dělat nebudu. Nebudu si hrát před tou sviní na nějakého patolízala.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //Jen se nečerti. Ostatně, byl to právě on, kdo tě nechal zavřít a hodit skrz bariéru. Nebo jsi na to snad už zapomněl?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Dělej, co chceš, ale myslím, že se nakonec rozhodneš správně.
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

	description = "Našel jsem něco na toho soudce.";
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
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Našel jsem něco na toho soudce.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Vážně? A co?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Najal si pár ranařů, aby přepadli místodržícího Khorinidu.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Krátce poté je nechal zatknout a sám shrábl peníze, které ukradli.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Jako důkaz jsem ti přinesl příkaz, který soudce těm rváčům dal.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Ukaž mi ho.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Konečně. To by mělo stačit, aby trpce litoval. Udělal jsi na mě dojem.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Za tohle se rád plácnu přes kapsu. Tady je tvoje odměna.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //A nikomu o tom ani muk, jasné?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //To je vynikající. Ale celá věc se už vyřešila sama. Soudce je mrtvý.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Nějaký idiot ho rozmašíroval. No dobrá. To mi také docela stačí.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Tady máš pár mincí. Za víc mi ta zpráva už nestojí.
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
	description = "Co je s Bennetem?";
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
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //Co je s Bennetem?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Takže už jsi o tom slyšel. Ti bastardi ho zavřeli, jen tak pro nic za nic.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Jako kdybych neměl dost starostí se svými vlastními lidmi - teď abych se staral ještě o paladiny.
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
	description = "Co budeš s tou Bennetovou záležitostí dělat?";
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
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Co budeš s tou Bennetovou záležitostí dělat?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Ještě nevím. Pár chlapců by rádo vtrhlo do města, aby povyráželi lordu Hagenovi všechny zuby, jeden po druhém.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Na podobnou akci naštěstí nemáme dost lidí, nemluvě o tom, že to není můj styl.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //Takže tady budeš jen tak sedět a klidně přihlížet tomu, co se stane?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //To rozhodně ne.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Když dostatečně rychle neprokážu Bennetovu nevinu, Lee za další následky už neponese zodpovědnost. Jeho lidé bez váhání kdykoliv napadnou město a Benneta osvobodí násilím."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares je ještě ve městě a snaží se zjistit, jak bychom odtamtud mohli Benneta dostat.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //Já se mezitím snažím trochu uklidnit svoje lidi. Jenom doufám, že to nebude Laresovi trvat moc dlouho.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Jo, a abych nezapomněl... Buster s tebou chce mluvit. Nechtěl mi říct, o co jde. Možná by ses za ním měl stavit!
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
	description = "Mohl bych ti s tou záležitostí kolem Benneta pomoci?";
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
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Mohl bych ti s tou záležitostí kolem Benneta pomoci?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Jasně, troška rozumu a rozvahy nemůže být na škodu.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos ví, že kolem pobíhá až příliš pitomců.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Běž do města a mrkni se, jestli nenajdeš nějaký způsob, jak odtamtud Benneta dostat.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Ale moc se nezdržuj, nevím, jak dlouho ještě udržím své chlapy na uzdě.
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
	description = "Nějaké novinky o Bennetovi?";
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
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Nějaké novinky o Bennetovi?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Když už nic jiného, tak se zdá, že se ve vězení nedočkal žádné úhony.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Dobrá práce.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Ne, ještě pořád nevíme dost.
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

	description	 = 	"Co se stalo, zatímco jsem tu nebyl?";
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
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Co se stalo, zatímco jsem tu nebyl?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Ten parchant Sylvio se doslechl o dracích v Hornickém údolí a udělal z farmy totální blázinec.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Snažil se kluky přesvědčit, aby s ním šli do Hornického údolí. Sliboval jim slávu, pocty, zlato a další ptákoviny.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Spousta z nich se nechtěla nechat pro Sylvia zabít, ale našlo se pár idiotů, kteří mu na ty kecy skočili.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Nakonec si nechali dát od Benneta výstroj a vyrazili na cestu.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(pohrdavě) No. Nakonec jsem docela rád, že Sylvio odsud z farmy konečně vypadl.
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
	description	 = 	"Mohl bys mě cvičit?";
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
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Můžeš mě učit?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Můžu ti ukázat, jak bojovat s obouručákem.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Ale nemám čas tě učit zároveň základy.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Až se dostaneš na určitou úroveň, vezmu si tě na starost. Do té doby si budeš muset najít jiného učitele.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //Slyšel jsem, že jsi docela dobrý. Vsadím se ale, že bych tě pořád mohl pár věcí naučit.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee mě naučí bojovat s obouručními zbraněmi.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Takže jestli chceš, můžu si tě vzít do parády. Ale bude tě to něco stát.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Kolik?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 zlatých a můžeme si plácnout.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"To je pro mě moc drahé.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Dohodnuto. Tady jsou peníze.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //To je pro mě moc drahé.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Nech si to projít hlavou. Učitele mého kalibru jen tak nenajdeš.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Dohodnuto. Tady jsou peníze.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Dobrá. Můžeš si být jistý, že za to stojím.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee mě naučí bojovat s obouručními zbraněmi.");
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
	description = "Začněme s tréninkem.";
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
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Začněme s tréninkem.
	
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Teď jsi skutečný mistr v boji s obouručními zbraněmi.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Už žádného učitele nepotřebuješ.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Teď jsi skutečný mistr v boji s obouručními zbraněmi.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Už žádného učitele nepotřebuješ.
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

	description	 = 	"Ještěři roznášejí dračí vejce po celé zemi.";
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
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Ještěři roznášejí dračí vejce po celé zemi.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Mělo mě to napadnout. Je načase vypadnout.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //Co s nimi tedy mám dělat?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Rozbij je. Co jiného?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Ze skořápek by možná šlo udělat brnění nebo tak něco.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Vypadají docela pevně. Promluv si o tom s Bennetem.
		B_LogEntry (TOPIC_DRACHENEIER,"S dračím vejcem toho Lee moc nenadělá - poslal mě proto za kovářem Bennetem."); 
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
	description = "Jak to jde na farmě?";
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
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Jak to jde na farmě?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //No, co odešel Sylvio, je tady docela klid.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //To nezní špatně.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Práce bohužel neubylo. Chlapi jsou čím dál tím nespokojenější, protože musejí pracovat i za Sylviovy lidi.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Ale s tím si hlavu nelámej. Já si nějak poradím.
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
	
	description	 = 	"Nenapadá tě, jak bych mohl získat loď paladinů?";
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
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Nenapadá tě, jak bych mohl získat loď paladinů?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //Myslíš, že bych tady ještě byl, kdybych to věděl? Tu hlídají ještě líp než transporty rudy ve Starém táboře.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Musí existovat nějaký způsob, jak se na loď dostat.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Jistě. Dostat se na palubu není nic těžkého.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Koneckonců máme soudce ve své moci. Zkus za ním zajít a vymáčknout z něj dopis, který by tě k tomu opravňoval.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee se domnívá, že nejlepší způsob, jak se dostat na palubu paladinské lodi, je obdržet od soudce plnou moc. Není ale příliš pravděpodobné, že mi něco takového vydá jen tak.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Mám tady falešné oprávnění. S jeho pomocí tě stráže nechají projít.
		
			B_LogEntry (TOPIC_Ship,"Starý dobrý Lee. Má u sebe padělaný dopis, s jehož pomocí se můžu dostat na palubu paladinské lodi.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Ale to není všechno. Na samotnou plavbu budeš potřebovat kapitána, posádku a tak.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Je toho spousta, bez čeho se neobejdeš.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Koho bych měl najmout do posádky?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Neznáš někoho, kdo by mohl loď řídit?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Neznáš někoho, kdo by mohl loď řídit?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Pokud vím, tak Torlof se na moři vyzná. Ví, co je co, a tak.

	B_LogEntry (TOPIC_Captain,"Torlof je starý námořník, možná by chtěl být mým kapitánem.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Koho bych měl najmout do posádky?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //To si musíš rozhodnout sám. Já bych s sebou ale bral jenom toho, komu mohu věřit. Máš dost lidí, kterým můžeš důvěřovat?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Pokud bys potřeboval do posádky nějakého kováře, zkus se zeptat Benneta. Je ten nejlepší, jakého můžeš najít.

	B_LogEntry (TOPIC_Crew,"Ve věci posádky toho pro mě Lee moc udělat nemohl. Ale poradil mi, že bych měl najmout jen lidi, kterým mohu věřit. Mám se zeptat ještě Benneta, mohlo by ho to zajímat.");
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

	description	 = 	"Písemná plná moc fungovala.";
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
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //To povolení zafungovalo. Loď je teď moje. Spolupráce s tím soudcem byla jedna radost.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Vida. To ponižování před tím parchantem se ti nakonec přece jenom vyplatilo.
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
	description	 = 	"Chci tu loď ukrást.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen nötig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Chci tu loď ukrást.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //A jak to chceš provést?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Bude to hračka - půjdu tam, ukážu jim ty papíry, vezmu si loď.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Když říkáš. Vezmi si je. Doufám, že víš, co děláš.
	
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
	description	 = 	"Poplavíš se se mnou?";
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
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Poplavíš se se mnou?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //Děláš si srandu? Jasně že do toho jdu. Mám na pevnině pár nevyřízených účtů.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Kromě toho tě můžu učit boj s jednoručními a obouručními zbraněmi. Mohl bych se ti hodit.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee už se nemůže dočkat, až uvidí pevninu. Nabídl mi veškerou podporu - tak dobrého učitele bojových umění bych nenašel široko daleko.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Loď je momentálně plná, ale pokud se tam najde místo, tak se vrátím.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Dám ti vědět, jestli tě budu potřebovat.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Tak si běž sbalit!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //Tak si běž sbalit!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Cože? Teď hned?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Ano, chci odsud vypadnout, takže jestli máš v plánu jet se mnou, běž do přístavu. Setkáme se na lodi.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //Na tuhle chvíli jsem čekal hezky dlouho. Budu tam.
	
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
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Dám ti vědět, jestli tě budu potřebovat.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Sám musíš vědět, co chceš. Ale dobrých bojovníků nebudeš mít nikdy dost.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(zašklebí se) Leda naprostých pitomců jako Sylvio.

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
	description	 = 	"Přece jenom bys mi k ničemu nebyl!";
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
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Přece jenom bys mi k ničemu nebyl!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Jak je libo, když tak víš, kde mě najít!
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Přece jenom bys mi k něčemu mohl být!";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man natürlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Přece jenom bys mi k něčemu mohl být!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Věděl jsem, že mě budeš potřebovat! Setkáme se na lodi.
		
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
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Víš co, běž do háje. Nejdřív mi řekneš, abych s tebou jel, pak mě zase pošleš pryč.
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Najdi si nějakého jiného pitomce!
	
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




































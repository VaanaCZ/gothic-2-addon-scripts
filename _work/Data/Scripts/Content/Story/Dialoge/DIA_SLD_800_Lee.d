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
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Hm. Dobâe že jsi pâišel.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Co se stalo?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Tohle jsem našel ve staré kapli.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //Je to magická runa. Myslím, že tę teleportuje rovnou na farmu.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Napadlo mę, že by se ti mohla hodit.
	
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
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Pâišel jsi dát Onarovi peníze?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Už jsem ti âíkal, že se nemáš snažit o žádné hlouposti.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar zjistil, že sis zase stihl vylepšit záznamy.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Bude teda po tobę chtít taky víc penęz.
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
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Myslel jsem si o tobę, že jsi chytâejší.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //V tom pâípadę pro tebe mám dobré zprávy.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Už není nikdo, kdo by tvrdil, že tę vidęl spáchat vraždu.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nikdo už nebude svędčit, že tę vidęl krást.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Už není nikdo, kdo by VIDĘL, jak jsi zmlátil jednoho z farmáâů.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Vypadá to, že se všechna obvinęní proti tobę rozplynula jako pára nad hrncem.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //I takhle je možné se vypoâádávat s problémy.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Tak nebo tak, platit už nemusíš.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Pâíštę si ale dávej pozor.
	
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
		Info_AddChoice		(DIA_Lee_PMSchulden,"Nemám dost penęz!",DIA_Lee_PETZMASTER_PayLater);
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
	Info_AddChoice		(DIA_Lee_PMSchulden,"Nemám dost penęz!",DIA_Lee_PETZMASTER_PayLater);
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
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Kýho čerta - (pâekvapenę) - to jsi TY, ten nováček, co jde z jednoho maléru do druhého?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Slyšel jsem do Gorna, že jsi poâád naživu, ale že pâijdeš sem... no...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Dobâe že jsi za mnou pâišel, než to začalo být pro tebe ještę horší.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Žoldáci jsou tvrdí hoši a farmáâi také nejsou žádná oâezávátka, ale chodit po okolí a zabíjet na potkání? To prostę nejde.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //A to nemluvím o dalších potížích, do kterých ses dostal.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Můžu ti pomoct dostat se z téhle šlamastyky s čistým štítem.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Ale bude tę to nęco stát. Onar je poâádný lakomec, ale pokud se má na celou vęc zapomenout, musí to být ON, kdo pâimhouâí oko.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Dobâe že jsi pâišel. Slyšel jsem, že jsi prý nęco ukradl.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //A mlátil farmáâe hlava nehlava.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //A KROMĘ TOHO ještę zabil pár ovcí.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //To tady prostę dęlat nemůžeš. V takových pâípadech Onar požaduje, abych s viníkem zúčtoval.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //To znamená, že ty zaplatíš a kapsu si namastí on. Na celou vęc se tak ale zapomene.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Když se zapleteš do souboje s nękterým ze žoldnéâů, je to nęco jiného.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Ale když zmlátíš farmáâe, pobęží rovnou za Onarem. A ode mę se bude očekávat, že nęjak zakročím.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Nemluvę o tom, že je docela háklivý na to, když mu nękdo zabíjí ovce.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Budeš muset zaplatit pokutu. Onar si pokaždé shrábne peníze do vlastní kapsy - ale jinak ta vęc urovnat nejde.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar ode mę očekává, že budu chránit jeho farmu. A to zahrnuje i jeho ovce.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Budeš mu muset zaplatit odškodné!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Kolik?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Nemám dost penęz!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Dobrá! Dohlédnu na to, aby Onar své peníze dostal. Můžeš považovat celou vęc za vyâízenou.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Nemám dost penęz!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //V tom pâípadę si je co nejrychleji sežeŕ.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Ale nemysli si, že je můžeš ukrást tady na farmę. Kdyby tę chytili, bylo by to pro tebe ještę horší.
	
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
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Kýho čerta - (pâekvapenę) - Co tady dęláš? Myslel jsem, že jsi mrtvý!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Proč si to myslíš?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn mi âekl, žes to byl ty, kdo strhnul bariéru.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Ano, byl jsem to já.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Nikdy bych neâekl, že nękdo může nęco takového pâežít. Co tę sem pâivádí? Nejsi tu jen tak pro nic za nic.
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
	description = "Musím nutnę hovoâit s paladiny ve męstę...";
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
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Potâebuju si nutnę promluvit s paladiny z męsta. Můžeš mi pomoci nęjak se k nim dostat?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(nedůvęâivę) Co kuješ s paladiny?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //To je dlouhý pâíbęh...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Já mám čas.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(povzdychneš si) Posílá mę Xardas. Chce, abych získal mocný amulet, Innosovo oko.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Takže poâád ještę držíš s tím nekromantem. Aha. A ten amulet mají paladinové?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //Pokud vím, tak ano.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Můžu ti pomoct dostat se k paladinům. Ale nejdâív se musíš stát jedním z nás.
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
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Vęâ mi. Mám plán. Myslím, že jsi na to ten pravý.
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Já tę dostanu k paladinům a ty mi na oplátku prokážeš jednu službičku. Nejdâív ale vstup do našich âad!
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
	description = "Co pâesnę tady dęláte?";
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
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Co pâesnę tady dęláte?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Je to prosté: postarám se o to, abychom se všichni dostali z tohohle ostrova pryč.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar si nás najal, abychom chránili jeho farmu, a pâesnę to budeme dęlat.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Ale naší odmęnou bude víc než jen náš žold. Tím, že pomáháme farmáâům, jsme męstu pâerušili zásobování.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //A čím míŕ toho budou mít paladinové k jídlu, tím dâíve budou ochotni naslouchat, až k nim pâijdu s nabídkou k pâímęâí.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Škoda že ses ze všech možných lidí spolčil zrovna s nimi.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //Jak bude ta tvoje nabídka vypadat?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //V zásadę se bude jednat o naši milost a volný průchod na pevninu. Víc se dozvíš, až pâijde čas.
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
	description = "Rád bych se k vám pâidal!";
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
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Rád bych se k vám pâidal!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Doufal jsem, že to âekneš! Každá ruka je tady dobrá.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Ty žoldáci, co jsem najal poslednę, dęlali jenom trable!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //V zásadę můžeš začít okamžitę. No, ještę tady je pár vęcí, kterými musíš projít, ale není to nic zvláštního.
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
	description = "Čím musím 'projít', než se k vám budu moci pâidat?";
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
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Čím musím 'projít', než se k vám budu moci pâidat?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Zamęstnává nás Onar, zdejší statkáâ. Můžeš na farmę zůstat, jen když to on schválí.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //A pak tady jsou naši hoši. Mohu tę pâijmout jen v pâípadę, že s tím bude souhlasit vętšina žoldáků.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Ale nechoë za Onarem, dokud to nebude jisté. Je to velmi popudlivý chlapík.
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Mám-li být pâijat mezi žoldnéâe, musí mi můj vstup do jejich âad nejdâíve schválit Onar.");
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
	description = "Jak mám žoldnéâe pâesvędčit, aby mę pâijali?";
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
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Jak mám žoldnéâe pâesvędčit, aby mę pâijali?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Âekl bych, že tím, že se budeš chovat jako žoldnéâ.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Promluv si s Torlofem. Vętšinou postává venku pâed domem. Ozkouší si tę.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Pokud tou zkouškou projdeš, męl by sis vysloužit velkou část potâebného respektu.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Âekne ti všechno ostatní, co bys męl vędęt.
	
	B_LogEntry (TOPIC_BecomeSLD,"Aby mę žoldnéâi pâijali mezi sebe, musím podstoupit zkoušku, kterou mi zadá Torlof, a vysloužit si respekt ostatních.");
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
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(smęje se) To jsem męl vędęt. Ty prostę musíš strkat nos do všeho, co?
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //No tak, âekni mi to.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Jsem do toho zapletenej jenom trochu. Vím, že ten tajnej cech existuje a že za ním stojí mágové vody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Od pádu bariéry už mę ale k vodním mágům nepoutá žádná smlouva jako tenkrát.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Samozâejmę že pomůžu, když to půjde. Ale mám tu dost vlastních problémů a na ostatní vęci nemám moc čas.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Jestli se o tom spolku chceš dozvędęt víc, promluv si s Cordem. Co já vím, tak patâí k nim.
		
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
	description = "Jsem pâipraven se k vám pâidat!";
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
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Jsem pâipraven se k vám pâidat!
		
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
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //To je dobâe.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Co âíkají ostatní žoldnéâi?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Nevím, jestli jich mám na své stranę dostatek.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //V tom pâípadę si promluv s Torlofem, ten ví o všem, co se tady na farmę šušká.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //Vętšina z nich stojí za mnou.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Dobrá, v tom pâípadę bęž za Onarem. Už jsem s ním o tom mluvil.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Žold si ale musíš vysmlouvat sám.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Teë už potâebuji pouze Onarův souhlas.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Byl jsi za Onarem?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Souhlasil.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //Vítej na palubę, chlapče!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Tady, nejdâív si vezmi nęjaké poâádné brnęní!
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
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Má to co do činęní s paladiny. Je načase, aby ses za nimi vypravil.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //Stejnę jsi męl v plánu tam jít.
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
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Vstoupil jsi do kláštera? (smęje se) Čekal bych všechno, ale tohle ne.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //No, teë už se žoldnéâem stát nemůžeš.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Ale kdo ví, možná bys pro mę mohl jednu nebo dvę vęci udęlat - nebo já pro tebe.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Uvidíme. Tak nebo tak, pâeji ti jen to nejlepší.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Ale nesnaž se mi vęšet bulíky na nos, rozumíš?
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
	description = "Jak se teë mohu dostat k paladinům?";
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
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Jak se teë mohu dostat k paladinům?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //Jednoduše. Doneseš jim naši nabídku pâímęâí.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Lorda Hagena, velitele paladinů, znám z dob své služby v královské armádę.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Vím, jakým způsobem pâemýšlí - nemá dostatek mužů. Tu nabídku pâijme. Pâinejmenším tę vyslechne.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Napsal jsem dopis - tady je.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //To by męlo každopádnę stačit, aby tę pustili k veliteli paladinů.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee mę posílá, abych lordu Hagenovi pâedal dar na usmíâenou. Tak se mohu dostat mezi paladiny.");
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
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Donesl jsem lordu Hagenovi tvoji nabídku pâímęâí.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //Co âíkal?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Âekl, že tobę může zajistit prominutí tvých činů, ale tvým lidem ne.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Ten paličatý blázen. Vętšina mužů v KRÁLOVSKÉ armádę jsou vętší hrdloâezové než moji chlapi.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Co budeš dęlat dál?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Musím najít jiný způsob, jak nás odsud dostat. Pokud to bude nutné, ukradneme loë. Budu si to muset promyslet.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Že bych sám vytáhl krk z oprátky a opustil své lidi, to vůbec nepâipadá v úvahu.

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
	description = "Proč tak strašnę chceš na pevninu?";
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
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Proč tak strašnę chceš na pevninu?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Jak víš, sloužil jsem králi jako generál.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Ale jeho patolízalové mę zradili, protože jsem vędęl nęco, co jsem vędęt nemęl.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Vrazili mę do té tęžaâské kolonie a král to nechal být.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //Męl jsem dost času, abych si to nechal projít hlavou.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Musím se pomstít.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(ohromenę) Králi?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(rozhodnę) Králi! A všem jeho pochlebníkům. Budou trpce litovat, co mi udęlali.
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
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Nemyslel jsem si, že bys zůstal tady na farmę nęjak dlouho.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Jestli půjdeš zpátky do kolonie, zkus najít Gorna. Paladinové ho drží jako vęznę.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn je dobrý chlapík a mnę by se tady hodil, takže kdybys męl šanci ho osvobodit, tak vůbec neváhej.
	
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
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Ano, už mi to âekl. Dobrá práce.
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
	description = "Gorn ti o mnę âekl? Co se mu stalo?";
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
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Gorn ti o mnę âekl?? Co se mu stalo?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Pamatuješ si ho, že?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Nech mę hádat...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Jasnę.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Jasnę.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Chytili ho paladinové a poslali ho s kolonou trestanců zpátky do Hornického údolí.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Kdyby nebyla cesta do Hornického údolí plná paladinů a skâetů, dávno bych tam poslal pár svých hochů, aby ho osvobodili.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Ale protože to vypadá tak, jako to vypadá, nemęlo by to smysl. Chudák.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Nech mę hádat.
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
	description = "Onar teë má díky Bullcovi o pár ovcí míŕ...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Onar teë má díky Bullcovi o pár ovcí míŕ.
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Ale no tak, nechoë za mnou s takovými kravinami! Už takhle mám starostí nad hlavu.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Já taky. Zdá se, že Bullco má problémy se mnou. Chce, abych opustil farmu.
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //No a? Stůj si na svém.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Mohl bys mu âíct, aby se držel na uzdę, jinak mu ty ovce strhnu ze žoldu.
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
	description = "Pâicházím z Hornického údolí...";
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
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //Takže to je pravda! Lares âíkal, že po męstę kolují zprávy o dracích. Nemůžu tomu uvęâit...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Co paladinové?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Jsou úplnę zdecimovaní.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //Výbornę! Možná by lord Hagen mohl znovu zvážit mou nabídku.
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //A jestli ne... (ostâe) Pak najdeme jiný způsob, jak se odsud dostat.
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Výbornę! Možná to lorda Hagena donutí pâesunout se do Hornického údolí se zbytkem svých mužů.
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Čím míŕ paladinů tady zůstane, tím lépe.
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
	description = "Co takhle nęjaké lepší brnęní?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Co takhle nęjaké lepší brnęní?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Splnil jsi svůj úkol.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Mám tady pro tebe nęjaké lepší brnęní. Tedy pokud máš hotovost.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof dostal od Onara úkol, o který se męl už pâed časem postarat.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Takže to nejdâív zaâië - pak si můžeme promluvit o lepším brnęní!
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
	description = "Koupit si stâednę tęžkou žoldnéâskou zbroj. Ochrana: zbranę 45, šípy 45, cena 500 zlaăáků.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Dej mi to brnęní.
	
	if (B_GiveInvItems (other, self, itmi_gold, 500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Tady je. Vážnę dobrá zbroj.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Ale není to žádný dárek! Nejdâív chci vidęt zlato!
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
	description = "Nemęl bys pro mę nęjakou lepší zbroj?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Nemęl bys pro mę nęjakou lepší zbroj?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Samozâejmę.
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
	description = "Koupit tęžkou žoldnéâskou zbroj. Ochrana: zbranę 60, šípy 60, cena: 1000 zlaăáků.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Dej mi to tęžké brnęní.
	
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
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Víš, jak to chodí. Nejdâív peníze!
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
	description = "Nemáš pro mę nic dalšího na práci?";
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
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Nemáš pro mę nic dalšího na práci?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Nikdy nemáš dost, co? Už takhle máš problémů až až. Co dalšího bys ještę chtęl?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Další úkol. Jsem žoldák, zapomnęls?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //Dobrá. Nęco by tu bylo. Je to pâesnę pro tebe.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Musím u jednoho soudce z męsta vyrovnat dluh. Rád bych to samozâejmę vyâídil osobnę.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Ale paladinové mę k jeho domu nepustí na vzdálenost, co bys kamenem dohodil.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Celou záležitost musíš provést opatrnę. Takže dávej pozor. Půjdeš za soudcem a nabídneš mu svoje služby.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Pokus se získat jeho důvęru a dęlej pro nęj špinavou práci, dokud na nęj nęco nenajdeš.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Ta svinę už udęlala tolik prasáren, že se ten smrad line až k nebesům.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Pâines mi nęco, s čím bych mohl jeho jméno pošpinit pâed domobranou. Zbytek života bude hnít v base.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Rozhodnę ale nechci, abys ho zabil. To by bylo pâíliš rychlé. Chci, aby trpęl. Rozumíš?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //Myslíš, že to zvládneš?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee chce, abych našel nęjaký inkriminující důkaz proti khorinidskému soudci. Mám mu proto nabídnout své služby a pâitom mít oči na stopkách."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Nic takového neudęlám.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Bez problémů. Kolik?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Bez problémů. Kolik?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Tvoje odmęna závisí na tom, co mi doneseš. Takže se snaž.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Tohle dęlat nebudu. Nebudu si hrát pâed tou sviní na nęjakého patolízala.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //Jen se nečerti. Ostatnę, byl to právę on, kdo tę nechal zavâít a hodit skrz bariéru. Nebo jsi na to snad už zapomnęl?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Dęlej, co chceš, ale myslím, že se nakonec rozhodneš správnę.
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

	description = "Našel jsem nęco na toho soudce.";
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
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Našel jsem nęco na toho soudce.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Vážnę? A co?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Najal si pár ranaâů, aby pâepadli místodržícího Khorinidu.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Krátce poté je nechal zatknout a sám shrábl peníze, které ukradli.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Jako důkaz jsem ti pâinesl pâíkaz, který soudce tęm rváčům dal.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Ukaž mi ho.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Konečnę. To by męlo stačit, aby trpce litoval. Udęlal jsi na mę dojem.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Za tohle se rád plácnu pâes kapsu. Tady je tvoje odmęna.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //A nikomu o tom ani muk, jasné?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //To je vynikající. Ale celá vęc se už vyâešila sama. Soudce je mrtvý.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Nęjaký idiot ho rozmašíroval. No dobrá. To mi také docela stačí.
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
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Takže už jsi o tom slyšel. Ti bastardi ho zavâeli, jen tak pro nic za nic.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Jako kdybych nemęl dost starostí se svými vlastními lidmi - teë abych se staral ještę o paladiny.
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
	description = "Co budeš s tou Bennetovou záležitostí dęlat?";
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
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Co budeš s tou Bennetovou záležitostí dęlat?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Ještę nevím. Pár chlapců by rádo vtrhlo do męsta, aby povyráželi lordu Hagenovi všechny zuby, jeden po druhém.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Na podobnou akci naštęstí nemáme dost lidí, nemluvę o tom, že to není můj styl.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //Takže tady budeš jen tak sedęt a klidnę pâihlížet tomu, co se stane?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //To rozhodnę ne.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Když dostatečnę rychle neprokážu Bennetovu nevinu, Lee za další následky už neponese zodpovędnost. Jeho lidé bez váhání kdykoliv napadnou męsto a Benneta osvobodí násilím."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares je ještę ve męstę a snaží se zjistit, jak bychom odtamtud mohli Benneta dostat.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //Já se mezitím snažím trochu uklidnit svoje lidi. Jenom doufám, že to nebude Laresovi trvat moc dlouho.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Jo, a abych nezapomnęl... Buster s tebou chce mluvit. Nechtęl mi âíct, o co jde. Možná by ses za ním męl stavit!
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
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Jasnę, troška rozumu a rozvahy nemůže být na škodu.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos ví, že kolem pobíhá až pâíliš pitomců.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Bęž do męsta a mrkni se, jestli nenajdeš nęjaký způsob, jak odtamtud Benneta dostat.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Ale moc se nezdržuj, nevím, jak dlouho ještę udržím své chlapy na uzdę.
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
	description = "Nęjaké novinky o Bennetovi?";
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
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Nęjaké novinky o Bennetovi?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Když už nic jiného, tak se zdá, že se ve vęzení nedočkal žádné úhony.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Dobrá práce.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Ne, ještę poâád nevíme dost.
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
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Ten parchant Sylvio se doslechl o dracích v Hornickém údolí a udęlal z farmy totální blázinec.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Snažil se kluky pâesvędčit, aby s ním šli do Hornického údolí. Sliboval jim slávu, pocty, zlato a další ptákoviny.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Spousta z nich se nechtęla nechat pro Sylvia zabít, ale našlo se pár idiotů, kteâí mu na ty kecy skočili.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Nakonec si nechali dát od Benneta výstroj a vyrazili na cestu.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(pohrdavę) No. Nakonec jsem docela rád, že Sylvio odsud z farmy konečnę vypadl.
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
	description	 = 	"Mohl bys mę cvičit?";
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
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Můžeš mę učit?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Můžu ti ukázat, jak bojovat s obouručákem.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Ale nemám čas tę učit zároveŕ základy.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Až se dostaneš na určitou úroveŕ, vezmu si tę na starost. Do té doby si budeš muset najít jiného učitele.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //Slyšel jsem, že jsi docela dobrý. Vsadím se ale, že bych tę poâád mohl pár vęcí naučit.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee mę naučí bojovat s obouručními zbranęmi.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Takže jestli chceš, můžu si tę vzít do parády. Ale bude tę to nęco stát.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Kolik?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 zlatých a můžeme si plácnout.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"To je pro mę moc drahé.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Dohodnuto. Tady jsou peníze.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //To je pro mę moc drahé.
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
	B_LogEntry (Topic_SoldierTeacher,"Lee mę naučí bojovat s obouručními zbranęmi.");
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
	description = "Začnęme s tréninkem.";
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
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Začnęme s tréninkem.
	
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Teë jsi skutečný mistr v boji s obouručními zbranęmi.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Už žádného učitele nepotâebuješ.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Teë jsi skutečný mistr v boji s obouručními zbranęmi.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Už žádného učitele nepotâebuješ.
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

	description	 = 	"Ještęâi roznášejí dračí vejce po celé zemi.";
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
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Ještęâi roznášejí dračí vejce po celé zemi.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Męlo mę to napadnout. Je načase vypadnout.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //Co s nimi tedy mám dęlat?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Rozbij je. Co jiného?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Ze skoâápek by možná šlo udęlat brnęní nebo tak nęco.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Vypadají docela pevnę. Promluv si o tom s Bennetem.
		B_LogEntry (TOPIC_DRACHENEIER,"S dračím vejcem toho Lee moc nenadęlá - poslal mę proto za kováâem Bennetem."); 
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
	description = "Jak to jde na farmę?";
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
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Jak to jde na farmę?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //No, co odešel Sylvio, je tady docela klid.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //To nezní špatnę.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Práce bohužel neubylo. Chlapi jsou čím dál tím nespokojenęjší, protože musejí pracovat i za Sylviovy lidi.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Ale s tím si hlavu nelámej. Já si nęjak poradím.
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
	
	description	 = 	"Nenapadá tę, jak bych mohl získat loë paladinů?";
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
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Nenapadá tę, jak bych mohl získat loë paladinů?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //Myslíš, že bych tady ještę byl, kdybych to vędęl? Tu hlídají ještę líp než transporty rudy ve Starém táboâe.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Musí existovat nęjaký způsob, jak se na loë dostat.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Jistę. Dostat se na palubu není nic tęžkého.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Koneckonců máme soudce ve své moci. Zkus za ním zajít a vymáčknout z nęj dopis, který by tę k tomu opravŕoval.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee se domnívá, že nejlepší způsob, jak se dostat na palubu paladinské lodi, je obdržet od soudce plnou moc. Není ale pâíliš pravdępodobné, že mi nęco takového vydá jen tak.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Mám tady falešné oprávnęní. S jeho pomocí tę stráže nechají projít.
		
			B_LogEntry (TOPIC_Ship,"Starý dobrý Lee. Má u sebe padęlaný dopis, s jehož pomocí se můžu dostat na palubu paladinské lodi.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Ale to není všechno. Na samotnou plavbu budeš potâebovat kapitána, posádku a tak.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Je toho spousta, bez čeho se neobejdeš.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Koho bych męl najmout do posádky?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Neznáš nękoho, kdo by mohl loë âídit?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Neznáš nękoho, kdo by mohl loë âídit?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Pokud vím, tak Torlof se na moâi vyzná. Ví, co je co, a tak.

	B_LogEntry (TOPIC_Captain,"Torlof je starý námoâník, možná by chtęl být mým kapitánem.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Koho bych męl najmout do posádky?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //To si musíš rozhodnout sám. Já bych s sebou ale bral jenom toho, komu mohu vęâit. Máš dost lidí, kterým můžeš důvęâovat?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Pokud bys potâeboval do posádky nęjakého kováâe, zkus se zeptat Benneta. Je ten nejlepší, jakého můžeš najít.

	B_LogEntry (TOPIC_Crew,"Ve vęci posádky toho pro mę Lee moc udęlat nemohl. Ale poradil mi, že bych męl najmout jen lidi, kterým mohu vęâit. Mám se zeptat ještę Benneta, mohlo by ho to zajímat.");
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
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //To povolení zafungovalo. Loë je teë moje. Spolupráce s tím soudcem byla jedna radost.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Vida. To ponižování pâed tím parchantem se ti nakonec pâece jenom vyplatilo.
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
	description	 = 	"Chci tu loë ukrást.";
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
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Chci tu loë ukrást.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //A jak to chceš provést?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Bude to hračka - půjdu tam, ukážu jim ty papíry, vezmu si loë.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Když âíkáš. Vezmi si je. Doufám, že víš, co dęláš.
	
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
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //Dęláš si srandu? Jasnę že do toho jdu. Mám na pevninę pár nevyâízených účtů.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Kromę toho tę můžu učit boj s jednoručními a obouručními zbranęmi. Mohl bych se ti hodit.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee už se nemůže dočkat, až uvidí pevninu. Nabídl mi veškerou podporu - tak dobrého učitele bojových umęní bych nenašel široko daleko.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Loë je momentálnę plná, ale pokud se tam najde místo, tak se vrátím.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Dám ti vędęt, jestli tę budu potâebovat.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Tak si bęž sbalit!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //Tak si bęž sbalit!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Cože? Teë hned?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Ano, chci odsud vypadnout, takže jestli máš v plánu jet se mnou, bęž do pâístavu. Setkáme se na lodi.
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
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Dám ti vędęt, jestli tę budu potâebovat.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Sám musíš vędęt, co chceš. Ale dobrých bojovníků nebudeš mít nikdy dost.
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
	description	 = 	"Pâece jenom bys mi k ničemu nebyl!";
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
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Pâece jenom bys mi k ničemu nebyl!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Jak je libo, když tak víš, kde mę najít!
	
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
	description	 = 	"Pâece jenom bys mi k nęčemu mohl být!";
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
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Pâece jenom bys mi k nęčemu mohl být!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Vędęl jsem, že mę budeš potâebovat! Setkáme se na lodi.
		
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
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Víš co, bęž do háje. Nejdâív mi âekneš, abych s tebou jel, pak mę zase pošleš pryč.
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Najdi si nęjakého jiného pitomce!
	
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




































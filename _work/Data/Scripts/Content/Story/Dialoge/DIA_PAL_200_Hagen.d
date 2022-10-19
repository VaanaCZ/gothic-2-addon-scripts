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
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Dobrze, ¿e jesteœ. Mo¿esz od razu zap³aciæ grzywnê.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Widzê, ¿e lekcewa¿ysz prawa tego miasta, co?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //Lista twoich wystêpków jeszcze siê powiêkszy³a!
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //Tylko mi tu nie udawaj niewini¹tka!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Zap³acisz maksymaln¹ grzywnê.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //Có¿, wygl¹da na to, ¿e sytuacja siê zmieni³a.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Nie ma ¿adnych œwiadków morderstwa!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Nikt nie chce zeznawaæ, ¿e widzia³ ciê podczas kradzie¿y!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //Nie ma ¿adnych œwiadków twojej bijatyki.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Wszystkie oskar¿enia wobec ciebie zosta³y wycofane.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //Nie wiem, co siê sta³o w mieœcie i NIE CHCÊ tego wiedzieæ.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Po prostu staraj siê na przysz³oœæ unikaæ k³opotów.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //W ka¿dym b¹dŸ razie - postanowi³em darowaæ ci karê.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Staraj siê trzymaæ z dala od podobnych awantur.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Mimo to zap³acisz nale¿ne grzywny.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Wiêc jak bêdzie, p³acisz?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Nie mam tyle pieniêdzy!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Ile to mia³o byæ?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Ile wynosi grzywna?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Nie mam tyle pieniêdzy!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Ile to mia³o byæ?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Hagen_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Twoja reputacja ciê wyprzedza. S³ysza³em, ¿e pogwa³ci³eœ prawa tego miasta.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Wpl¹ta³eœ siê w niez³¹ kaba³ê.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //Morderstwo to powa¿ne przestêpstwo!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Nie wspominaj¹c nawet o twoich pozosta³ych przewinieniach.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Stra¿nicy otrzymali rozkaz natychmiastowego zabijania ka¿dego mordercy.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //Mordercy nie bêd¹ tutaj tolerowani. Ale mo¿esz okazaæ skruchê, p³ac¹c odpowiedni¹ grzywnê.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Oskar¿ono ciê o kradzie¿!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Nie wspominaj¹c nawet o twoich pozosta³ych przewinieniach.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //To pogwa³cenie praw tego miasta. Musisz zap³aciæ grzywnê.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Wda³eœ siê w bijatykê, tym samym ³ami¹c prawo tego miasta.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //A co to za sprawa z owcami?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Pogwa³cenie miejskiego prawa to z³amanie prawa ustanowionego przez Innosa.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Dlatego musisz zap³aciæ za swoje przewinienia.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Zabija³eœ nasze owce! Pocz¹tkowo nie dawa³em temu wiary...
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Dlaczego muszê zajmowaæ siê takimi b³ahostkami?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Musisz zap³aciæ grzywnê!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Ile mam zap³aciæ?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"Nie mam tyle pieniêdzy!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Chcê zap³aciæ grzywnê!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Przychodzê, ¿eby zap³aciæ grzywnê.
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //Œwietnie! Dopilnujê, ¿eby dowiedzieli siê o tym wszyscy mieszkañcy miasta. To poprawi trochê twoj¹ reputacjê.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //Nie mam tyle z³ota!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Zatem postaraj siê szybko je zdobyæ.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //Ale ostrzegam: jeœli pope³nisz jeszcze jakieœ wykroczenia, nie bêdzie dla ciebie litoœci!
	
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
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //S³ysza³em ju¿ o tobie.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar doniós³ mi, ¿e chcia³eœ ze mn¹ rozmawiaæ.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Jesteœ tym obcym, który domaga siê Oka Innosa.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Jestem Lord Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Królewski paladyn, wojownik w s³u¿bie Innosa i namiestnik Khorinis.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //Jestem zajêtym cz³owiekiem, wiêc nie marnuj mojego czasu. Mów od razu, co ciê tu sprowadza.
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
	description	 =  "Przynoszê propozycjê rozejmu od jednego z najemników.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //Przynoszê propozycjê rozejmu od jednego z najemników.
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //Hmmm... Poka¿!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Znam genera³a Lee. Znam te¿ okolicznoœci, w wyniku których trafi³ jako wiêzieñ do Kolonii.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Uwa¿am go za cz³owieka honoru. Jestem sk³onny go u³askawiæ... Ale TYLKO jego.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //Jego ludzie zostan¹ na miejscu. Wiêkszoœæ z nich to pozbawione skrupu³ów ³otry, które trafi³y tu zas³u¿enie.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Oni nie mog¹ liczyæ na moj¹ ³askê.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //Czy to wszystko?
	};
	B_LogEntry (Topic_Frieden,"Lord Hagen mo¿e wybaczyæ Lee, ale nie pozosta³ym najemnikom."); 
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
	description	 =  "Armie ciemnoœci zbieraj¹ siê w pobli¿u miasta, w Górniczej Dolinie.";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Armie ciemnoœci zbieraj¹ siê w pobli¿u miasta, w Górniczej Dolinie.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //W Dolinie? Wys³a³em tam oddzia³ moich ludzi. Doniesiono mi, ¿e prze³êcz jest zajêta przez orków.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Ale pierwsze s³yszê o... armiach ciemnoœci.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //Czy to jakaœ sztuczka, która ma mnie sk³oniæ do zawarcia przymierza z najemnikami?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //Nie.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //A co to niby za armia?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Stado smoków, którym towarzyszy horda równie groŸnych istot.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Smoki? Stare pisma g³osz¹, ¿e ostatnie smoki widziano setki lat temu!
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Dlaczego mia³bym ci uwierzyæ, co?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //Tu nie chodzi o to, czy mi wierzysz, tylko czy mo¿esz sobie pozwoliæ, ¿eby mi NIE wierzyæ.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Dopóki nie przedstawisz mi jakiegoœ dowodu, nie wyœlê tam ¿adnych nowych ludzi.
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
	description	 =  "A wiêc mam ci dostarczyæ dowodów?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //A wiêc mam ci dostarczyæ dowodów?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Dok³adnie tak. ZejdŸ prze³êcz¹ do Górniczej Doliny. Na miejscu poszukaj naszej ekspedycji, a gdy j¹ znajdziesz - porozmawiaj z kapitanem Garondem.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Jeœli ktoœ mo¿e coœ powiedzieæ o tej sytuacji, to w³aœnie on.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Jeœli Garond potwierdzi twoje s³owa, bêdê sk³onny ci zaufaæ.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Czy to znaczy, ¿e przeka¿esz mi Oko Innosa?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //Oko Innosa... niech bêdzie. Przynieœ mi niezbity dowód, a dopilnujê, ¿ebyœ dosta³ ten amulet.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //Mam na to twoje s³owo?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Tak, masz moje s³owo.
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
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //To œwiêty artefakt... Stare przepowiednie ³¹cz¹ go ze smokami.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //Ale g³osz¹ równie¿, ¿e tylko Wybraniec Innosa mo¿e nosiæ ten amulet.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //JA jestem Wybrañcem Innosa.
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Wiêc mo¿e bêdziesz móg³ za³o¿yæ Oko.
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
	description	 =  "Jak mam siê dostaæ na prze³êcz?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Jak mam siê dostaæ na prze³êcz?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Dam ci klucz do bramy prowadz¹cej na prze³êcz. Dalej musisz jednak radziæ sobie sam. Tej drogi pilnuj¹ stada orków.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Niech Innos bêdzie z tob¹.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Lord Hagen chce, abym dostarczy³ mu jakiœ dowód na istnienie armii Z³a. Powinienem siê udaæ do Górniczej Doliny i porozmawiaæ z Kapitanem Garondem.");
	
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
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Szukam metalowego ornamentu. Powinien byæ gdzieœ w kamiennym krêgu przy farmie Lobarta.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Jeœli chodzi ci o to tutaj... Myœleliœmy, ¿e mo¿e to byæ magiczna runa, ale to ca³kowicie bezwartoœciowy przedmiot.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //WeŸ go sobie, do niczego nam siê nie przyda.
	
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
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Wys³ano nas z misj¹ wagi pañstwowej. Otrzymaliœmy rozkaz od samego Króla Rhobara.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //Mówi³em ci ju¿, ¿e wys³aliœmy ekspedycjê do Górniczej Doliny. Po to tu w³aœnie przybyliœmy.
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
	description	 =  "Co twoi ludzie robi¹ w Górniczej Dolinie?";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //Co twoi ludzie robi¹ w Górniczej Dolinie?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Nie widzê powodu, dla którego mia³bym ci to mówiæ!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //By³eœ tam. Sam powinieneœ wiedzieæ.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //No dobrze. Skoro i tak siê tam udajesz, mogê ci chyba powiedzieæ.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //Chodzi o magiczn¹ rudê. Dziêki niej mo¿emy jeszcze wygraæ tê wojnê.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Bez orê¿a wykonanego z tej rudy, królewska armia nie ma ¿adnych szans w starciu z elitarnymi oddzia³ami orków.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //A na tej wyspie znajduj¹ siê ostatnie kopalnie, do których mamy jeszcze dostêp.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Wracamy na kontynent, gdy tylko za³adujemy ca³¹ rudê na statek.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //A wiêc przegrywamy tê wojnê?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //I tak powiedzia³em ci zbyt wiele.
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
	description	 = 	"Szukam jakiegoœ mistrza miecza.";
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
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Szukam jakiegoœ mistrza miecza.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //No to go znalaz³eœ.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Lord Hagen mo¿e mnie nauczyæ walki orê¿em dwurêcznym.");
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
	description = "Zacznijmy (trening walki broniami dwurêcznymi).";
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
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Jesteœ teraz prawdziwym mistrzem miecza. Wiêcej nie mogê ciê nauczyæ.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Niech m¹droœæ mistrza miecza zawsze kieruje twoimi czynami.
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
	description	 = 	"Chcia³bym wst¹piæ do waszego zakonu.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Chcia³bym wst¹piæ do waszego zakonu.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Dobrze, ale najpierw musisz udowodniæ, ¿e posiadasz odwagê, umiejêtnoœci i wiedzê potrzebn¹ s³udze Innosa.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Twoje czyny œwiadcz¹, ¿e jesteœ cz³owiekiem honoru.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Jeœli takie jest twoje ¿yczenie, chêtnie powitam ciê w naszym zakonie.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Nie podj¹³em jeszcze ostatecznej decyzji.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Jestem gotów!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Aby zostaæ wojownikiem Innosa, musisz ca³kowicie poœwiêciæ siê wype³nianiu jego woli.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //W naszym zakonie s³u¿yæ mog¹ tylko najmê¿niejsi i najszlachetniejsi z wojowników.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Jeœli naprawdê chcesz zostaæ jednym z nas, musisz dowieœæ, ¿e jesteœ tego godzien.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Nie podj¹³em jeszcze ostatecznej decyzji.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Zatem rozwa¿ tê sprawê w swoim sercu i wróæ, gdy bêdziesz gotowy.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Jestem gotów!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //Niech tak siê stanie!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //Wielu z tych, którzy wst¹pili na tê œcie¿kê, odda³o ¿ycie w s³u¿bie Innosowi.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //Czy przysiêgasz czciæ swymi czynami pamiêæ po nich i g³osiæ wszem, i wobec chwa³ê Innosa?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //Przysiêgam!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Zatem od tej pory jesteœ cz³onkiem naszego zakonu.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Niniejszym tytu³ujê ciê wojownikiem Innosa.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Dajê ci orê¿ i zbrojê godn¹ rycerza. Noœ je z dum¹!

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

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //Zostaj¹c jednym z nas, otrzymujesz prawo wstêpu do klasztoru.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Albrecht wyuczy ciê naszej magii. IdŸ i porozmawiaj z nim.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //Nasze kwatery w górnym mieœcie s¹ oczywiœcie do twojej dyspozycji.

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
	description	 = 	"Jak mam udowodniæ, ¿e jestem godny, by do was do³¹czyæ?";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Jak mam udowodniæ, ¿e jestem godny, by do was do³¹czyæ?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //Tylko twoje czyny bêd¹ odpowiednim œwiadectwem.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //W imiê Innosa walczymy o wolnoœæ i sprawiedliwoœæ.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Stawiamy czo³a Beliarowi i jego s³ugom, którzy próbuj¹ zniszczyæ œwiêty ³ad Innosa.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Rozumiem.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //Nic nie rozumiesz! Honor jest ca³ym naszym ¿yciem, a nasze ¿ycie nale¿y do Innosa.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Paladyn rusza do boju z imieniem swojego boga na ustach. Wielu z nas z³o¿y³o ¿ycie na o³tarzu odwiecznej walki Dobra ze Z³em.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //Ka¿dy paladyn musi pozostaæ wierny tej tradycji. Jeœli zb³¹dzimy, zbrukamy pamiêæ naszych poleg³ych towarzyszy.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Aby zostaæ paladynem, musisz w pe³ni zdaæ sobie z tego sprawê.
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
	description = "Jak wygl¹da sytuacja?";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Jakieœ wieœci?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Muszê jakoœ uratowaæ tê ekspedycjê.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Musimy coœ zrobiæ w sprawie tych smoków.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //Mo¿e Oko Innosa zdo³a nas jeszcze ocaliæ...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Ja tu chyba oszalejê. Jestem ¿o³nierzem, a nie urzêdnikiem!
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //Przez te wszystkie dokumenty, pisma i zarz¹dzenia zapomnia³em ju¿ chyba, jak siê trzyma miecz w garœci!
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
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //CO TAKIEGO?! Có¿eœ uczyni³?! Bez Oka jesteœmy zgubieni!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Porozmawiaj z Pyrokarem! Musi byæ jakiœ sposób, ¿eby je naprawiæ!
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
	description	 = 	"Przynoszê wieœci od Garonda.";
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
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Przynoszê ci wieœci od Garonda. Proszê, kaza³ mi wrêczyæ ten list.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //Sytuacja jest groŸniejsza, ni¿ przypuszcza³em. Ale mów! Mów, co siê dzieje w Górniczej Dolinie!
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Paladyni zabarykadowali siê w tamtejszym zamku. Oblega ich horda orków.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Wielu ¿o³nierzy poleg³o. Zosta³o te¿ bardzo niewiele rudy.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //Obawiam siê, ¿e bez odpowiedniego wsparcia ci ludzie nie maj¹ szans.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Znajdê jakiœ sposób, ¿eby ich stamt¹d wyci¹gn¹æ. Innos bêdzie ci wdziêczny...
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Bardziej ni¿ jego wdziêcznoœæ przyda mi siê Oko.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Tak, naturalnie. Dotrzymam s³owa. WeŸ ten list. On otworzy przed tob¹ bramy klasztoru.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Porozmawiaj z Pyrokarem - najwy¿szym z Magów Ognia. Poka¿ mu to pismo, a on zaprowadzi ciê do Oka.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //Jeszcze jedno, zanim pójdziesz.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //WeŸ tê runê jako wyraz mojej wdziêcznoœci. W chwilach potrzeby przeniesie ciê ona bezpiecznie do miasta.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Lord Hagen wrêczy³ mi przesy³kê, dziêki której Mistrz Pyrokar dopuœci mnie do Oka Innosa.");

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
	description	 = 	"Muszê z tob¹ porozmawiaæ o Bennecie.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Muszê z tob¹ porozmawiaæ o Bennecie.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Ale to ten najemnik, który zamordowa³ jednego z moich ludzi!
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Sk¹d masz pewnoœæ, ¿e to Bennet jest morderc¹?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"S¹dzê, ¿e Bennet jest niewinny.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Mo¿e Bennet móg³by naprawiæ Oko Innosa.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Mo¿e Bennet móg³by naprawiæ Oko Innosa.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //Choæby nawet móg³ œci¹gn¹æ na ziemiê potêgê samego Innosa...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //...ten cz³owiek zamordowa³ paladyna i zostanie za to stracony.
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Sk¹d masz pewnoœæ, ¿e to Bennet jest morderc¹?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //Mamy naocznego œwiadka.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Jak widzisz, wina tego najemnika nie podlega dyskusji.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Co to za œwiadek?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, sekretarz gubernatora, widzia³ ca³e zajœcie.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Podany przez niego rysopis pasuje jak ula³ do Benneta. Z mojego punktu widzenia, sprawa jest zamkniêta.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Najemnik zostanie powieszony za zdradê stanu.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, sekretarz gubernatora, twierdzi, ¿e by³ œwiadkiem morderstwa."); 

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
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //S¹dzê, ¿e Bennet jest niewinny.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Dowody s¹ jednoznaczne. To on jest sprawc¹.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //A jeœli dowody zosta³y sfa³szowane?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Uwa¿aj, co mówisz! To bardzo powa¿ne oskar¿enie!
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Jeœli nie masz dowodów, które podwa¿aj¹ zeznania mojego œwiadka, lepiej trzymaj jêzyk za zêbami.
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
	description	 = 	"Cornelius k³amie.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Cornelius k³amie.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Sk¹d ta pewnoœæ?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Mam jego pamiêtnik. S¹ tu wszystkie dowody.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //A to pod³a gnida!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //W œwietle nowych dowodów mogê zrobiæ tylko jedno.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //Na mocy powierzonej mi przez Jego Wysokoœæ i Œwi¹tyniê og³aszam...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...¿e wiêzieñ Bennet zostaje oczyszczony ze wszystkich zarzutów i ma zostaæ zwolniony.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Za to Cornelius ma zostaæ pojmany, pod zarzutem krzywoprzysiêstwa.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Oszczêdzê ci k³opotu. Cornelius nie ¿yje.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //Zatem otrzyma³ ju¿ sprawiedliw¹ karê. Dobra robota.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Cornelius uciek³.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Znajdziemy go, prêdzej czy póŸniej. Nie wywinie siê.
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
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Twoje czyny godne s¹ jednego z nas.
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
	description	 = 	"Oko nale¿y do mnie!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //Oko nale¿y do mnie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //Tak, Oko jest twoje!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //I to ty musisz je naprawiæ!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //Zatem musisz byæ Wybrañcem Innosa.
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Zamierzam po³o¿yæ kres zagro¿eniu ze strony smoków.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //IdŸ wiêc, i z pomoc¹ Innosa zniszcz Z³o w zarodku.
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

	description	 = 	"Najlepsi wojownicy orków ruszyli do ataku.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Najlepsi wojownicy orków ruszyli do ataku.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Rozmawia³em z Lordem Hagenem na temat zbli¿aj¹cych siê hord hersztów orków."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Dlaczego tak s¹dzisz?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //Rozmawia³em z jednym z nich. W rozmowie pad³o twoje imiê.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Brednie. Moi ludzie nie donieœli mi o ¿adnym pospolitym ruszeniu orków.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Mo¿e jacyœ ich zwiadowcy zab³¹kali siê do pobliskich lasów.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //To nie byli zwiadowcy. Przy jednym z nich znalaz³em ten pierœcieñ.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Poka¿.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Hmmm... Niepokoj¹ce...
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //To znak ich si³y. A wiêc orkowie porzucili swoje palisady i stanêli do boju w otwartym polu.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Nie widzia³em ich jeszcze zbyt wielu. G³ównie ich przywódców i kilku wojowników.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //Tak? Zatem planuj¹ coœ innego. To ma³o podobne do orków, by ich przywódcy wypuszczali siê w pojedynkê poza swoje osiedla.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Ale to œwietna okazja, by uderzyæ w ich czu³y punkt.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Gdy strac¹ swoich przywódców, morale ca³ej armii os³abnie.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //Mam dla ciebie nowe zadanie, rycerzu. Masz zabiæ wszystkich orkowych przywódców, którzy krêc¹ siê po okolicy.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Tylko przynieœ mi ich pierœcienie! Po takim ciosie szybko siê nie podnios¹.
			
			B_LogEntry (TOPIC_OrcElite,"Na dowód moich s³ów przynios³em Hagenowi orkowy pierœcieñ. Kaza³ sobie dostarczyæ wszystkie pierœcienie, jakie tylko uda mi siê zdobyæ."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Udaj siê najpierw do Ingmara. Doradzi ci, jak skutecznie walczyæ z takim przeciwnikiem.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Elitarni wojownicy orków to jego specjalnoœæ. Czêsto mia³ z nimi do czynienia.
			B_LogEntry (TOPIC_OrcElite,"Elitarni orkowi wojownicy s¹ specjalnoœci¹ Ingmara."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //Twoje s³owo, ¿e pokona³eœ orkowego wodza, to dla mnie za ma³o!
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Jeœli mam ci uwierzyæ, potrzebujê bardziej wiarygodnych dowodów.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen nie chce mi uwierzyæ. Za¿¹da³ dowodów na to, ¿e orkowi wojownicy faktycznie atakuj¹ ludzkie siedziby. Có¿, by³bym zaskoczony, gdyby tego nie zrobi³."); 
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

	description	 = 	"Mam jeszcze coœ do powiedzenia w sprawie orkowych przywódców.";
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
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Mam jeszcze coœ do powiedzenia w sprawie orkowych przywódców.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //S³ucham...

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld für einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //Mam dla ciebie jeszcze jeden pierœcieñ.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //Mam dla ciebie kolejne pierœcienie.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Dobra robota! Tak trzymaæ.

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //W okolicy mo¿e siê krêciæ jeszcze kilku.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Wkrótce rzucimy te bestie na kolana!
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Zdziwi³bym siê, gdyby w okolicy krêci³o siê ich jeszcze wielu.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Jeœli chcesz, mo¿esz nadal przynosiæ mi pierœcienie, ale myœlê, ¿e orkowie dostali ju¿ odpowiedni¹ nauczkê.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Proszê. WeŸ to z³oto i kup za nie lepsze wyposa¿enie.

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
	description = "Wszystkie smoki nie ¿yj¹.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Wszystkie smoki zosta³y zg³adzone.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //Wiedzia³em, ¿e Innos doda ci si³ w walce ze smokami!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Gdzie jest ruda?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Orkowie wci¹¿ oblegaj¹ zamek w Górniczej Dolinie. Garond nie mo¿e opuœciæ twierdzy, póki nie odeprze ich ataku.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //Niech to szlag!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Jeœli Garond nie potrafi uporaæ siê z t¹ sytuacj¹, sam siê tym zajmê!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //¯adna banda orków nie stanie mi na przeszkodzie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //Powiadomi³em ju¿ moich ludzi. Przygotowujemy siê do wyruszenia w drogê.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Zabieram ich wszystkich. Na stra¿y statku pozostan¹ nieliczni wartownicy.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //Pora, by ktoœ wreszcie rozprawi³ siê z tymi orkami!

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
	description = "Potrzebujê okrêtu.";
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
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Potrzebujê okrêtu.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //Nie ty jeden, ¿o³nierzu.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //S³yszê to prawie codziennie, przyjacielu. Ale...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Nie masz nawet kapitana, nie wspominaj¹c ju¿ o za³odze...
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //A co z tym statkiem na przystani?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Ten okrêt nale¿y do mnie. To na nim przewieziemy rudê.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Mogê ci go u¿yczyæ, dopiero gdy wywi¹¿emy siê z zadania.
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
	description = "Orkowie przypuœcili szturm na zamek w Górniczej Dolinie!";
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
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Orkowie przypuœcili szturm na zamek w Górniczej Dolinie!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //Na Innosa! Co tam siê sta³o?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //Wygl¹da na to, ¿e brama by³a otwarta...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //Wygl¹da... Jak to mo¿liwe... W zamku musi byæ zdrajca!
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
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Czekam tylko na wyposa¿enie i ¿ywnoœæ. Zaraz potem ruszamy!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Po szturmie na zamek potrzebujemy jeszcze wiêcej zapasów.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //Ale to tylko nieznacznie opóŸni nasz wymarsz.
	};
};
